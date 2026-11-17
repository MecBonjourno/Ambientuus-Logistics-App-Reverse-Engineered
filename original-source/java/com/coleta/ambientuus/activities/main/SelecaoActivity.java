package com.coleta.ambientuus.activities.main;

import android.accounts.Account;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.BuscaDispositivoActivity;
import com.coleta.ambientuus.activities.ListagemColetasActivity;
import com.coleta.ambientuus.activities.ListagemManifestoActivity;
import com.coleta.ambientuus.activities.TerceirosActivity;
import com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity;
import com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity;
import com.coleta.ambientuus.activities.bombona.LerBombonaActivity;
import com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity;
import com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.MovimentoBombonaTableManager;
import com.coleta.ambientuus.database.managers.TelasTableManager;
import com.coleta.ambientuus.domain.model.ModoSincronizacao;
import com.coleta.ambientuus.domain.model.TipoPesagem;
import com.coleta.ambientuus.dto.Coleta;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.coleta.ambientuus.dto.Telas;
import com.coleta.ambientuus.googleDrive.DriveServiceHelper;
import com.coleta.ambientuus.ui.ProgressDialogHelper;
import com.coleta.ambientuus.utils.PesagemPreferences;
import com.coleta.ambientuus.ws.Repository;
import com.google.api.client.http.ByteArrayContent;
import j$.util.Objects;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes13.dex */
public class SelecaoActivity extends AppCompatActivity {
    private Button btnAtualizarBase;
    private Button btnBaixaBombona;
    private Button btnCarregarBombona;
    private Button btnColetar;
    private Button btnConectarBalanca;
    private Button btnConsultaRotas;
    private Button btnConsultar;
    private Button btnConsultarBombona;
    private Button btnConsultarManifesto;
    private Button btnLerCodBarrasBomb;
    private Button btnTerceiros;
    private ByteArrayContent dbExport;
    private LocationListener locationListener;
    private LocationManager locationManager;
    DatabaseHelper myDB;
    private String[] permissoes = {"android.permission.ACCESS_FINE_LOCATION"};

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_selecao);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.myDB = new DatabaseHelper(this);
        initVariables();
        toggleButtons();
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        initButtons();
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(true) { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                Intent intent = new Intent(SelecaoActivity.this, (Class<?>) MainActivity.class);
                SelecaoActivity.this.startActivity(intent);
                SelecaoActivity.this.finish();
            }
        });
    }

    public void initVariables() {
        this.btnCarregarBombona = (Button) findViewById(R.id.btnCarregaBombona);
        this.btnLerCodBarrasBomb = (Button) findViewById(R.id.btnLerCodBarrasBomb);
        this.btnConectarBalanca = (Button) findViewById(R.id.btnSyncBalancasID);
        this.btnColetar = (Button) findViewById(R.id.btnIniciarColetaID);
        this.btnTerceiros = (Button) findViewById(R.id.btnTerceiros);
        this.btnBaixaBombona = (Button) findViewById(R.id.btnBaixaBombona);
        this.btnConsultarBombona = (Button) findViewById(R.id.btnConsultarBombona);
        this.btnConsultar = (Button) findViewById(R.id.btnConsultarBancoID);
        this.btnConsultarManifesto = (Button) findViewById(R.id.btnConsultarManifesto);
        this.btnAtualizarBase = (Button) findViewById(R.id.btnAtualizarBancoID);
        this.btnConsultaRotas = (Button) findViewById(R.id.btnConsultaRotas);
    }

    public void toggleButtons() {
        TelasTableManager telasTableManager = new TelasTableManager(this.myDB.getDatabase());
        Telas telas = telasTableManager.selectTelas();
        if (telas.getCOLETAR_MANUAL().equals("N")) {
            this.btnColetar.setVisibility(8);
        }
        if (telas.getALOCAR_BOMBONA().equals("N")) {
            this.btnLerCodBarrasBomb.setVisibility(8);
        }
        if (telas.getCARREGAR_VEICULO().equals("N")) {
            this.btnCarregarBombona.setVisibility(8);
        }
        if (telas.getCOLETAR_BLUETOOTH().equals("N")) {
            this.btnConectarBalanca.setVisibility(8);
        }
        if (telas.getCONSULTAR_BOMBONAS().equals("N")) {
            this.btnConsultarBombona.setVisibility(8);
        }
        if (telas.getCONSULTAR_COLETAS().equals("N")) {
            this.btnConsultar.setVisibility(8);
        }
        if (telas.getCONSULTAR_MANIFESTOS().equals("N")) {
            this.btnConsultarManifesto.setVisibility(8);
        }
        if (telas.getDESCARREGAR_VEICULO().equals("N")) {
            this.btnTerceiros.setVisibility(8);
        }
        if (telas.getLIBERAR_BOMBONA().equals("N")) {
            this.btnBaixaBombona.setVisibility(8);
        }
    }

    public void initButtons() {
        this.btnConectarBalanca.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$0(view);
            }
        });
        this.btnColetar.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda8
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$2(view);
            }
        });
        this.btnConsultar.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda9
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$3(view);
            }
        });
        this.btnTerceiros.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda10
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$4(view);
            }
        });
        this.btnAtualizarBase.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda11
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$5(view);
            }
        });
        this.btnLerCodBarrasBomb.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda12
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$6(view);
            }
        });
        this.btnBaixaBombona.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda13
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$7(view);
            }
        });
        this.btnCarregarBombona.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda14
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$8(view);
            }
        });
        this.btnConsultarBombona.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda15
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$9(view);
            }
        });
        this.btnConsultarManifesto.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$10(view);
            }
        });
        this.btnConsultaRotas.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda7
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                SelecaoActivity.this.lambda$initButtons$11(view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$0(View v) {
        Intent intent = new Intent(this, (Class<?>) BuscaDispositivoActivity.class);
        intent.putExtra("EXTRA", true);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$2(View v) {
        PesagemPreferences.verifyPreferences(this, new PesagemPreferences.TipoPesagemCallback() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda2
            @Override // com.coleta.ambientuus.utils.PesagemPreferences.TipoPesagemCallback
            public final void onTipoPesagemSelecionado(TipoPesagem tipoPesagem) {
                SelecaoActivity.this.lambda$initButtons$1(tipoPesagem);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$1(TipoPesagem tipo) {
        Intent intent;
        if (Objects.equals(tipo.getValor(), TipoPesagem.BLUETOOTH.getValor())) {
            intent = new Intent(this, (Class<?>) BuscaDispositivoActivity.class);
            intent.putExtra("EXTRA", true);
        } else {
            intent = new Intent(this, (Class<?>) IniciarColetaExtraActivity.class);
            intent.putExtra("avulsa", true);
        }
        intent.setFlags(603979776);
        intent.putExtra("tipo", tipo.getValor());
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$3(View v) {
        startActivity(new Intent(this, (Class<?>) ListagemColetasActivity.class));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$4(View v) {
        startActivity(new Intent(this, (Class<?>) TerceirosActivity.class));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$5(View v) {
        if (isOnline()) {
            enviaDadosjson();
            createBackup();
        } else {
            showToast(this, "Sem conexão com a internet, tente mais tarde!");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$6(View v) {
        Intent intent = new Intent(this, (Class<?>) LerBombonaActivity.class);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$7(View v) {
        Intent intent = new Intent(this, (Class<?>) BaixaBombonaActivity.class);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$8(View v) {
        Intent intent = new Intent(this, (Class<?>) CarregarBombonaActivity.class);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$9(View v) {
        startActivity(new Intent(this, (Class<?>) TerceirosActivity.ListBombonaViewActivity.class));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$10(View v) {
        startActivity(new Intent(this, (Class<?>) ListagemManifestoActivity.class));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$11(View v) {
        Intent intent = new Intent(this, (Class<?>) ListagemPontoColetaActivity.class);
        intent.setFlags(603979776);
        intent.putExtra("ouvirSync", true);
        startActivity(intent);
    }

    public boolean isOnline() {
        ConnectivityManager manager = (ConnectivityManager) getSystemService("connectivity");
        return manager.getActiveNetworkInfo() != null && manager.getActiveNetworkInfo().isConnectedOrConnecting();
    }

    public void enviaDadosjson() {
        final List<Coleta> listColeta = new ColetaTableManager(this.myDB.getDatabase()).getAllColetasJson();
        final List<MovimentoBombona> listMovto = new MovimentoBombonaTableManager(this.myDB.getDatabase()).getMovtosBombonasJson();
        if (!listColeta.isEmpty() || !listMovto.isEmpty()) {
            try {
                ExecutorService executor = Executors.newSingleThreadExecutor();
                final ProgressDialogHelper dialogHelper = new ProgressDialogHelper();
                dialogHelper.showProgress(this, "Enviando dados", "Por favor aguarde....");
                executor.execute(new Runnable() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda6
                    @Override // java.lang.Runnable
                    public final void run() {
                        SelecaoActivity.this.lambda$enviaDadosjson$13(listColeta, listMovto, dialogHelper);
                    }
                });
                return;
            } catch (Exception e) {
                showToast(this, "Não foi possivel enviar agora, tente novamente mais tarde!");
                return;
            }
        }
        showToast(this, "Sem dados para enviar!");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$enviaDadosjson$13(List listColeta, List listMovto, final ProgressDialogHelper dialogHelper) {
        IOException e;
        try {
        } catch (IOException e2) {
            e = e2;
        }
        try {
            Repository repo = new Repository(getApplicationContext(), ModoSincronizacao.ENVIO, null, null, listColeta, listMovto, this, null);
            if (!listColeta.isEmpty()) {
                dialogHelper.updateMessage("Enviando Coletas");
                repo.enviarColetas();
                EtiquetaTableManager.deleteAll(this.myDB.getDatabase());
            }
            if (!listMovto.isEmpty()) {
                dialogHelper.updateMessage("Enviando Coletas");
                repo.enviarMovimentos();
                MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(this.myDB.getDatabase());
                movimentoBombonaTableManager.updateMovtoEnv();
                movimentoBombonaTableManager.deleteMovtos7days();
            }
            Objects.requireNonNull(dialogHelper);
            runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    ProgressDialogHelper.this.dismissProgress();
                }
            });
        } catch (IOException e3) {
            e = e3;
            e.printStackTrace();
            runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda5
                @Override // java.lang.Runnable
                public final void run() {
                    SelecaoActivity.this.lambda$enviaDadosjson$12(dialogHelper);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$enviaDadosjson$12(ProgressDialogHelper dialogHelper) {
        dialogHelper.dismissProgress();
        showToast(this, "Erro na sincronização");
    }

    public void showToast(Context context, String message) {
        Toast toast = Toast.makeText(context, message, 1);
        toast.show();
    }

    private void createBackup() {
        ProgressDialogHelper dialogHelper = new ProgressDialogHelper();
        dialogHelper.showProgress(this, "Gerando Backup", "Por favor aguarde....");
        SharedPreferences prefs = getSharedPreferences("googleSign", 0);
        String email = prefs.getString("e_mail", null);
        Account account = email != null ? new Account(email, "com.google") : null;
        try {
            DriveServiceHelper driveServiceHelper = new DriveServiceHelper(null, this, account, dialogHelper, this);
            driveServiceHelper.backupDatabase();
            dialogHelper.dismissProgress();
        } catch (RuntimeException e) {
            dialogHelper.dismissProgress();
            new AlertDialog.Builder(this).setTitle("Erro").setMessage("Não foi possivel criar arquivo.").setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.SelecaoActivity$$ExternalSyntheticLambda3
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.dismiss();
                }
            }).setCancelable(false).setIcon(R.drawable.ic_alert_dialog_error).show();
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 1001 && resultCode == -1) {
            Log.d("SelecaoActivity", "Permissão concedida! Tentando novamente o backup...");
            createBackup();
        } else if (requestCode == 1001) {
            Log.e("SelecaoActivity", "Usuário recusou a permissão para acessar o Google Drive.");
        }
    }
}
