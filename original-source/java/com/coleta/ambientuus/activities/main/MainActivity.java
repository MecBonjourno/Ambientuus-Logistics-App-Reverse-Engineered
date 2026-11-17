package com.coleta.ambientuus.activities.main;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.TelaAdmActivity;
import com.coleta.ambientuus.activities.main.MainActivity;
import com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.PlacasTableManager;
import com.coleta.ambientuus.database.managers.RotaTableManager;
import com.coleta.ambientuus.domain.model.ModoSincronizacao;
import com.coleta.ambientuus.domain.model.SyncState;
import com.coleta.ambientuus.dto.BombonaCliente;
import com.coleta.ambientuus.dto.Placas;
import com.coleta.ambientuus.dto.Rota;
import com.coleta.ambientuus.dto.list.BombonaClienteList;
import com.coleta.ambientuus.fragments.DatePickerFragment;
import com.coleta.ambientuus.googleDrive.GoogleSignInHelper;
import com.coleta.ambientuus.ui.MaterialAlertUtil;
import com.coleta.ambientuus.ui.ProgressDialogHelper;
import com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper;
import com.coleta.ambientuus.utils.ConsultaEtiquetaCallback;
import com.coleta.ambientuus.utils.PesagemPreferences;
import com.coleta.ambientuus.utils.SyncStatus;
import com.coleta.ambientuus.utils.TextStyles;
import com.coleta.ambientuus.ws.Repository;
import com.google.android.material.textfield.MaterialAutoCompleteTextView;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import j$.util.Objects;
import j$.util.function.Function$CC;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Function;

/* loaded from: classes13.dex */
public class MainActivity extends BaseActivity implements DatePickerFragment.OnDateSelectedListener {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private static final String TIPO_PESAGEM = "TIPO_PESAGEM";
    private EditText dataColetaSel;
    private final DatePickerFragment datePickerFragment = new DatePickerFragment();
    private AlertDialog dialog;
    private ProgressDialogHelper dialogHelper;
    DatabaseHelper myDB;
    private SharedPreferences preferences;
    private ActivityResultLauncher<Intent> readerLauncherQRCode;
    private EditText senhaAdm;
    private MaterialAutoCompleteTextView spinnerPlaca;
    private MaterialAutoCompleteTextView spinnerRotas;
    private static Integer recebeIdRota = 0;
    private static Integer recebeIdFrotaVeiculo = 0;
    private static Integer recebeIdMotorista = 0;
    private static String dataColeta = null;
    private static int verificaCliques = 0;

    @Override // com.coleta.ambientuus.activities.main.BaseActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        AppCompatDelegate.setDefaultNightMode(1);
        this.myDB = new DatabaseHelper(this);
        getTelasDisponiveis();
        this.spinnerRotas = (MaterialAutoCompleteTextView) findViewById(R.id.spinnerStaticRotas);
        this.spinnerPlaca = (MaterialAutoCompleteTextView) findViewById(R.id.spinnerStaticPlaca);
        initItem();
        loadPreferences();
        loadSpinnerDataPlaca();
        prepareReader();
        initButtons();
        googleLogin();
    }

    private void getTelasDisponiveis() {
        if (isOnline()) {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda8
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.this.lambda$getTelasDisponiveis$1();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getTelasDisponiveis$1() {
        try {
        } catch (IOException e) {
            e = e;
        }
        try {
            Repository repo = new Repository(this, ModoSincronizacao.COMPLETO, null, null, null, null, null, null);
            repo.sincronizarTelas();
        } catch (IOException e2) {
            e = e2;
            e.printStackTrace();
            runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.this.lambda$getTelasDisponiveis$0();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getTelasDisponiveis$0() {
        this.dialogHelper.dismissProgress();
        showToast(this, "Erro na sincronização");
    }

    private void initItem() {
        this.dataColetaSel = (EditText) findViewById(R.id.tieDtColeta);
        this.dataColetaSel.addTextChangedListener(new TextWatcher() { // from class: com.coleta.ambientuus.activities.main.MainActivity.1
            private String current = "";
            private final Calendar cal = Calendar.getInstance();

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                int mon;
                char c;
                String clean;
                if (!s.toString().equals(this.current)) {
                    String clean2 = s.toString().replaceAll("[^\\d.]", "");
                    String cleanC = this.current.replaceAll("[^\\d.]", "");
                    int cl = clean2.length();
                    int sel = cl;
                    for (int i = 2; i <= cl && i < 6; i += 2) {
                        sel++;
                    }
                    if (clean2.equals(cleanC)) {
                        sel--;
                    }
                    if (clean2.length() < 8) {
                        clean = clean2 + "DDMMYYYY".substring(clean2.length());
                        c = 1;
                    } else {
                        int day = Integer.parseInt(clean2.substring(0, 2));
                        int mon2 = Integer.parseInt(clean2.substring(2, 4));
                        int year = Integer.parseInt(clean2.substring(4, 8));
                        if (mon2 < 1) {
                            mon = 1;
                        } else {
                            mon = 12;
                            if (mon2 <= 12) {
                                mon = mon2;
                            }
                        }
                        this.cal.set(2, mon - 1);
                        int year2 = 1900;
                        if (year >= 1900) {
                            year2 = 2100;
                            if (year <= 2100) {
                                year2 = year;
                            }
                        }
                        this.cal.set(1, year2);
                        c = 1;
                        clean = String.format("%02d%02d%04d", Integer.valueOf(day > this.cal.getActualMaximum(5) ? this.cal.getActualMaximum(5) : day), Integer.valueOf(mon), Integer.valueOf(year2));
                    }
                    String substring = clean.substring(0, 2);
                    String substring2 = clean.substring(2, 4);
                    String substring3 = clean.substring(4, 8);
                    Object[] objArr = new Object[3];
                    objArr[0] = substring;
                    objArr[c] = substring2;
                    objArr[2] = substring3;
                    String clean3 = String.format("%s/%s/%s", objArr);
                    int sel2 = Math.max(sel, 0);
                    this.current = clean3;
                    MainActivity.this.dataColetaSel.setText(this.current);
                    MainActivity.this.dataColetaSel.setSelection(Math.min(sel2, this.current.length()));
                }
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                String dataDigitada = MainActivity.this.dataColetaSel.getText().toString();
                if (dataDigitada.length() == 10) {
                    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
                    formatter.setLenient(false);
                    try {
                        Date data = formatter.parse(dataDigitada);
                        if (data != null) {
                            MainActivity.dataColeta = dataDigitada;
                            MainActivity.this.loadSpinnerDataRota();
                            MainActivity.this.loadSpinnerDataPlaca();
                        }
                    } catch (ParseException e) {
                        Date hoje = new Date();
                        String dataHojeFormatada = formatter.format(hoje);
                        MainActivity.this.dataColetaSel.setText(dataHojeFormatada);
                        MainActivity.this.dataColetaSel.setSelection(dataHojeFormatada.length());
                        MainActivity.dataColeta = dataHojeFormatada;
                        MaterialAlertUtil.exibirErro(MainActivity.this, "Erro", "Data inválida.");
                        try {
                            MainActivity.this.loadSpinnerDataRota();
                            MainActivity.this.loadSpinnerDataPlaca();
                        } catch (ParseException ex) {
                            throw new RuntimeException(ex);
                        }
                    }
                }
            }
        });
        if (!this.dataColetaSel.getText().toString().isEmpty()) {
            try {
                recebeIdRota = 0;
                recebeIdMotorista = 0;
                this.spinnerRotas.setText("");
                recebeIdFrotaVeiculo = 0;
                this.spinnerPlaca.setText("");
                loadSpinnerDataRota();
                loadSpinnerDataPlaca();
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
        }
        this.dataColetaSel.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda9
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z) {
                MainActivity.this.lambda$initItem$2(view, z);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initItem$2(View view, boolean hasFocus) {
        if (hasFocus) {
            this.datePickerFragment.show(getSupportFragmentManager(), "datePicker");
        }
    }

    private void loadPreferences() {
        setDataAtual();
        this.dataColetaSel.setText(dataColeta);
        this.preferences = getSharedPreferences("ArquivoPreferencia", 0);
        if (this.preferences.contains("dataColeta")) {
            dataColeta = this.preferences.getString("dataColeta", "");
            this.dataColetaSel.setText(dataColeta);
            if (this.preferences.contains("recebeIdRota")) {
                recebeIdMotorista = Integer.valueOf(this.preferences.getInt("recebeIdMotorista", 0));
                recebeIdRota = Integer.valueOf(this.preferences.getInt("recebeIdRota", 0));
                recebeIdFrotaVeiculo = Integer.valueOf(this.preferences.getInt("recebeIdFrotaVeiculo", 0));
                this.spinnerRotas.setText(this.preferences.getString("spinnerRotas", ""));
                this.spinnerPlaca.setText(this.preferences.getString("spinnerPlaca", ""));
            }
        }
    }

    private void prepareReader() {
        this.readerLauncherQRCode = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda15
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                MainActivity.this.lambda$prepareReader$3((ActivityResult) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$prepareReader$3(ActivityResult result) {
        if (result.getResultCode() == 200) {
            Intent data = result.getData();
            Objects.requireNonNull(data, "Erro ao retornar codigo de Barras");
            String codigoBarras = data.getStringExtra("codigoBarras");
            searchQRCodeEtiqueta(codigoBarras);
        }
    }

    private void searchQRCodeEtiqueta(String codBarras) {
        Repository repo = new Repository(getApplicationContext(), ModoSincronizacao.CONSULTA, recebeIdRota, dataColeta, null, null, null, codBarras);
        repo.consultarEtiquetas(new ConsultaEtiquetaCallback() { // from class: com.coleta.ambientuus.activities.main.MainActivity.2
            @Override // com.coleta.ambientuus.utils.ConsultaEtiquetaCallback
            public void onSucesso(BombonaClienteList lista) {
                if (!lista.getBombonaClienteList().isEmpty()) {
                    BombonaCliente bombonaCliente = lista.getBombonaClienteList().get(0);
                    MainActivity.this.createPopupEtiquetaCliente(bombonaCliente);
                } else {
                    MaterialAlertUtil.exibirErro(MainActivity.this, "Erro ao consultar QR Code", "Não encontrado dados para o QR Code bipado.");
                }
            }

            @Override // com.coleta.ambientuus.utils.ConsultaEtiquetaCallback
            public void onErro(Throwable t) {
                MaterialAlertUtil.exibirErro(MainActivity.this, "Erro ao consultar QR Code", t.getMessage());
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void createPopupEtiquetaCliente(BombonaCliente bombonaCliente) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        View popupView = getLayoutInflater().inflate(R.layout.popup_etiqueta_cliente, (ViewGroup) null);
        String nomeCliente = bombonaCliente.getCodCliente() + " - " + bombonaCliente.getNomeCliente();
        String tipoDoc = bombonaCliente.getNumeroManifesto().indexOf("DC") > 0 ? "" : "Manifesto: ";
        ((TextView) popupView.findViewById(R.id.tvPopupEtiquetaCliente)).setText(TextStyles.getTextWithBoldPrefix("Cliente: ", nomeCliente));
        ((TextView) popupView.findViewById(R.id.tvPopupEtiquetaData)).setText(TextStyles.getTextWithBoldPrefix("Data coleta: ", bombonaCliente.getDataColeta()));
        ((TextView) popupView.findViewById(R.id.tvPopupEtiquetaQuantidade)).setText(TextStyles.getTextWithBoldPrefix("Quantidade: ", bombonaCliente.getQuantidade()));
        ((TextView) popupView.findViewById(R.id.tvPopupEtiquetaPeso)).setText(TextStyles.getTextWithBoldPrefix("Peso Líquido: ", bombonaCliente.getPeso()));
        ((TextView) popupView.findViewById(R.id.tvPopupEtiquetaManifesto)).setText(TextStyles.getTextWithBoldPrefix(tipoDoc, bombonaCliente.getNumeroManifesto()));
        ((TextView) popupView.findViewById(R.id.tvPopupEtiquetaEtiquetas)).setText(TextStyles.getTextWithBoldPrefix("Etiquetas: ", bombonaCliente.getEtiquetas()));
        builder.setView(popupView);
        final AlertDialog dialog = builder.create();
        ((Window) Objects.requireNonNull(dialog.getWindow())).setBackgroundDrawableResource(android.R.color.transparent);
        dialog.show();
        popupView.findViewById(R.id.fecharPopUpEtiquetaCliente).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda6
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                AlertDialog.this.dismiss();
            }
        });
    }

    private void initButtons() {
        findViewById(R.id.btnMostraDatePicker).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda12
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MainActivity.this.lambda$initButtons$5(view);
            }
        });
        verificaCliques = 0;
        findViewById(R.id.btnMenuColetasID).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda13
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MainActivity.this.lambda$initButtons$6(view);
            }
        });
        findViewById(R.id.btnLeituraQRCode).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda14
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MainActivity.this.lambda$initButtons$7(view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$5(View v) {
        this.datePickerFragment.show(getSupportFragmentManager(), "datePicker");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$6(View v) {
        if (recebeIdMotorista.intValue() == 0 && recebeIdRota.intValue() == 0) {
            verificaCliques++;
            if (verificaCliques >= 7) {
                verificaCliques = 0;
                createDialogSenha();
            }
        }
        if (recebeIdMotorista.intValue() == 0) {
            showToast(this, "Selecione um Motorista!");
            return;
        }
        if (recebeIdRota.intValue() == 0) {
            showToast(this, "Selecione uma rota!");
            return;
        }
        if (recebeIdFrotaVeiculo.intValue() == 0) {
            showToast(this, "Selecione uma placa!");
            return;
        }
        verificaCliques = 0;
        SharedPreferences.Editor editor = this.preferences.edit();
        editor.putInt("recebeIdMotorista", recebeIdMotorista.intValue());
        editor.putInt("recebeIdRota", recebeIdRota.intValue());
        editor.putInt("recebeIdFrotaVeiculo", recebeIdFrotaVeiculo.intValue());
        editor.putString("spinnerRotas", this.spinnerRotas.getText().toString());
        editor.putString("spinnerPlaca", this.spinnerPlaca.getText().toString());
        editor.putString("dataColeta", dataColeta);
        editor.putInt("id_rota", recebeIdRota.intValue());
        editor.putInt("id_frota_veiculo", recebeIdFrotaVeiculo.intValue());
        editor.apply();
        Intent intent = new Intent(this, (Class<?>) SelecaoActivity.class);
        startActivity(intent);
        getDataBackground();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$7(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity.3
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(MainActivity.this, (Class<?>) ReaderLeitorActivity.class);
                MainActivity.this.readerLauncherQRCode.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(MainActivity.this, "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    public void getDataBackground() {
        if (isOnline()) {
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.this.lambda$getDataBackground$9();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getDataBackground$9() {
        try {
            Repository repo = new Repository(getApplicationContext(), ModoSincronizacao.POR_ROTA, recebeIdRota, dataColeta, null, null, null, null);
            SyncStatus.setStatus(SyncState.LOADING);
            repo.sincronizarManifesto();
            repo.sincronizarPontosColetas(getApplicationContext());
        } catch (IOException e) {
            e.printStackTrace();
            runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda7
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.this.lambda$getDataBackground$8();
                }
            });
            SyncStatus.setStatus(SyncState.ERROR);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getDataBackground$8() {
        showToast(this, "Erro na sincronização");
    }

    private void googleLogin() {
        boolean isLoggedIn = getSharedPreferences("googleSign", 0).getBoolean("isLoggedIn", false);
        if (!isLoggedIn) {
            GoogleSignInHelper googleSignInHelper = new GoogleSignInHelper(this);
            googleSignInHelper.setCallback(new AnonymousClass4());
            googleSignInHelper.signIn(this);
        }
    }

    /* renamed from: com.coleta.ambientuus.activities.main.MainActivity$4, reason: invalid class name */
    class AnonymousClass4 implements GoogleSignInHelper.GoogleSignInCallback {
        AnonymousClass4() {
        }

        @Override // com.coleta.ambientuus.googleDrive.GoogleSignInHelper.GoogleSignInCallback
        public void onSuccess(final String id, final String displayName, final String idToken) {
            MainActivity.this.runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$4$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.AnonymousClass4.this.lambda$onSuccess$0(id, displayName, idToken);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onSuccess$0(String id, String displayName, String idToken) {
            Toast.makeText(MainActivity.this, "Logado com " + id, 0).show();
            SharedPreferences sharedPreferences = MainActivity.this.getSharedPreferences("googleSign", 0);
            SharedPreferences.Editor editor = sharedPreferences.edit();
            editor.putBoolean("isLoggedIn", true);
            editor.putString("name", displayName);
            editor.putString("e_mail", id);
            editor.putString("ID", idToken);
            editor.apply();
        }

        @Override // com.coleta.ambientuus.googleDrive.GoogleSignInHelper.GoogleSignInCallback
        public void onError(final String error) {
            MainActivity.this.runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$4$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.AnonymousClass4.this.lambda$onError$1(error);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onError$1(String error) {
            Toast.makeText(MainActivity.this, error, 1).show();
        }

        @Override // com.coleta.ambientuus.googleDrive.GoogleSignInHelper.GoogleSignInCallback
        public void onCancelled() {
            MainActivity.this.runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$4$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.AnonymousClass4.this.lambda$onCancelled$2();
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onCancelled$2() {
            Toast.makeText(MainActivity.this, "Login Cancelado", 0).show();
        }
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.menuSincronizacao) {
            sincronizarApp();
        }
        return super.onOptionsItemSelected(item);
    }

    public boolean isOnline() {
        ConnectivityManager cm = (ConnectivityManager) getSystemService("connectivity");
        NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
        return activeNetwork != null && activeNetwork.isConnectedOrConnecting();
    }

    private Repository getRepository() {
        return new Repository(getApplicationContext(), ModoSincronizacao.COMPLETO, null, null, null, null, null, null);
    }

    public void sincronizarApp() {
        if (isOnline()) {
            this.dialogHelper = new ProgressDialogHelper();
            this.dialogHelper.showProgress(this, "Buscando dados", "Por favor aguarde....");
            PesagemPreferences.deleteTipoPesagem(this);
            this.myDB.deleteDataVolumeRotaMotoristaCliente();
            ExecutorService executor = Executors.newSingleThreadExecutor();
            executor.execute(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.this.lambda$sincronizarApp$12();
                }
            });
            return;
        }
        showToast(this, "Sem conexão com a internet para fazer a sincronização, tente mais tarde!");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$sincronizarApp$12() {
        try {
            Repository repo = getRepository();
            repo.sincronizarVolumes();
            repo.sincronizarTerceiros();
            repo.sincronizarRotas();
            repo.sincronizarPlacas();
            repo.sincronizarBombonas();
            repo.sincronizarClientes();
            repo.sincronizarTipoResiduo();
            runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda18
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.this.lambda$sincronizarApp$10();
                }
            });
        } catch (IOException e) {
            e.printStackTrace();
            runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    MainActivity.this.lambda$sincronizarApp$11();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$sincronizarApp$10() {
        this.dialogHelper.dismissProgress();
        showToast(this, "Sincronização finalizada com sucesso!");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$sincronizarApp$11() {
        this.dialogHelper.dismissProgress();
        showToast(this, "Erro na sincronização");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadSpinnerDataRota() throws ParseException {
        this.myDB = new DatabaseHelper(getApplicationContext());
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
        Date date = formatter.parse(dataColeta);
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int dayOfWeek = c.get(7) - 1;
        final List<Rota> labels = new RotaTableManager(this.myDB.getDatabase()).getAllRotasDia(String.valueOf(dayOfWeek));
        final SearchableSpinnerDialogHelper<Rota> helper = new SearchableSpinnerDialogHelper<>();
        this.spinnerRotas.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda17
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z) {
                MainActivity.this.lambda$loadSpinnerDataRota$14(helper, labels, view, z);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$loadSpinnerDataRota$14(SearchableSpinnerDialogHelper helper, List labels, View view, boolean hasFocus) {
        if (hasFocus) {
            helper.showDialog(this, labels, "Selecione a Rota", new Function() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda10
                @Override // java.util.function.Function
                public /* synthetic */ Function andThen(Function function) {
                    return Function$CC.$default$andThen(this, function);
                }

                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    return ((Rota) obj).getDescricao();
                }

                @Override // java.util.function.Function
                public /* synthetic */ Function compose(Function function) {
                    return Function$CC.$default$compose(this, function);
                }
            }, this.spinnerRotas, this.spinnerRotas.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda11
                @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
                public final void onItemSelected(Object obj) {
                    MainActivity.this.lambda$loadSpinnerDataRota$13((Rota) obj);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$loadSpinnerDataRota$13(Rota selectedRota) {
        recebeIdRota = Integer.valueOf(selectedRota.getId_rota());
        recebeIdMotorista = Integer.valueOf(selectedRota.getId_motorista());
        loadSpinnerDataPlaca();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadSpinnerDataPlaca() {
        this.myDB = new DatabaseHelper(getApplicationContext());
        final List<Placas> labelPlaca = new PlacasTableManager(this.myDB.getDatabase()).getAllPlacas();
        final SearchableSpinnerDialogHelper<Placas> helper = new SearchableSpinnerDialogHelper<>();
        this.spinnerPlaca.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda16
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z) {
                MainActivity.this.lambda$loadSpinnerDataPlaca$16(helper, labelPlaca, view, z);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$loadSpinnerDataPlaca$16(SearchableSpinnerDialogHelper helper, List labelPlaca, View view, boolean hasFocus) {
        if (hasFocus) {
            helper.showDialog(this, labelPlaca, "Selecione a Placa", new Function() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda4
                @Override // java.util.function.Function
                public /* synthetic */ Function andThen(Function function) {
                    return Function$CC.$default$andThen(this, function);
                }

                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    return ((Placas) obj).getPlaca_veiculo();
                }

                @Override // java.util.function.Function
                public /* synthetic */ Function compose(Function function) {
                    return Function$CC.$default$compose(this, function);
                }
            }, this.spinnerPlaca, this.spinnerPlaca.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity$$ExternalSyntheticLambda5
                @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
                public final void onItemSelected(Object obj) {
                    MainActivity.recebeIdFrotaVeiculo = ((Placas) obj).getId_frota_veiculo();
                }
            });
        }
    }

    public String setDataAtual() {
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy", Locale.getDefault());
        return dateFormat.format(dataAtual);
    }

    public void showToast(Context context, String message) {
        Toast toast = Toast.makeText(context, message, 1);
        toast.show();
    }

    public void createDialogSenha() {
        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(this);
        View senhaPopupView = getLayoutInflater().inflate(R.layout.popup, (ViewGroup) null);
        this.senhaAdm = (EditText) senhaPopupView.findViewById(R.id.textSenhaAdm);
        Button cancelarSenha = (Button) senhaPopupView.findViewById(R.id.buttonCancelarLogin);
        Button confirmaSenha = (Button) senhaPopupView.findViewById(R.id.buttonConfirmarLogin);
        dialogBuilder.setView(senhaPopupView);
        this.dialog = dialogBuilder.create();
        this.dialog.show();
        cancelarSenha.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                MainActivity.this.dialog.dismiss();
            }
        });
        confirmaSenha.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.main.MainActivity.6
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                String verificaSenha = String.valueOf(MainActivity.this.senhaAdm.getText());
                if (verificaSenha.equals("@tenas66")) {
                    Intent intent = new Intent(MainActivity.this, (Class<?>) TelaAdmActivity.class);
                    MainActivity.this.startActivity(intent);
                } else {
                    MainActivity.this.dialog.dismiss();
                }
            }
        });
    }

    @Override // com.coleta.ambientuus.fragments.DatePickerFragment.OnDateSelectedListener
    public void onDateSelected(String year, String month, String day) {
        String data = day + DomExceptionUtils.SEPARATOR + month + DomExceptionUtils.SEPARATOR + year;
        dataColeta = data;
        recebeIdRota = 0;
        recebeIdMotorista = 0;
        this.spinnerRotas.setText("");
        recebeIdFrotaVeiculo = 0;
        this.spinnerPlaca.setText("");
        this.dataColetaSel.setText(data);
    }
}
