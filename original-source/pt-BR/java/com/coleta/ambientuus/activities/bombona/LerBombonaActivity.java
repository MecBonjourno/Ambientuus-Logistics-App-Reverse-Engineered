package com.coleta.ambientuus.activities.bombona;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AppCompatActivity;
import androidx.exifinterface.media.ExifInterface;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.main.SelecaoActivity;
import com.coleta.ambientuus.adapters.LerBombonaAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.database.managers.ClienteMTRTableManager;
import com.coleta.ambientuus.database.managers.MovimentoBombonaTableManager;
import com.coleta.ambientuus.dto.ClienteMTR;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes14.dex */
public class LerBombonaActivity extends AppCompatActivity {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private LerBombonaAdapter adapter;
    private Button btnDigitarAlocarBombona;
    private Button btnLerBombona;
    private TextView spinnerClienteBombona;
    private Integer spinnerClienteBombonaSel;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_ler_bombona);
        boolean z = true;
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.btnLerBombona = (Button) findViewById(R.id.btnLerAlocarBombona);
        this.btnDigitarAlocarBombona = (Button) findViewById(R.id.btnDigitarAlocarBombona);
        this.spinnerClienteBombona = (TextView) findViewById(R.id.spinnerClienteBombona);
        loadSpinnerCliente();
        this.spinnerClienteBombonaSel = 0;
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            this.spinnerClienteBombonaSel = Integer.valueOf(extras.getInt("IdPessoaClienteSelecionado"));
            this.spinnerClienteBombona.setText(extras.getString("ClienteSelectinado"));
            if (extras.getString("lido") != null) {
                Intent intent = new Intent(this, (Class<?>) LeitorBombonaActivity.class);
                intent.putExtra("ORIGEM", ExifInterface.GPS_MEASUREMENT_IN_PROGRESS);
                intent.putExtra("PositionClienteSelectinado", this.spinnerClienteBombonaSel);
                startActivity(intent);
            }
        }
        habilitaRecycleView();
        this.btnLerBombona.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (LerBombonaActivity.this.spinnerClienteBombonaSel.intValue() == 0) {
                    Toast toast = Toast.makeText(LerBombonaActivity.this, "Selecione um cliente para destinar a Bombona", 1);
                    toast.show();
                } else {
                    Dexter.withActivity(LerBombonaActivity.this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity.1.1
                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionGranted(PermissionGrantedResponse response) {
                            Intent intent2 = new Intent(LerBombonaActivity.this, (Class<?>) LeitorBombonaActivity.class);
                            intent2.putExtra("ORIGEM", ExifInterface.GPS_MEASUREMENT_IN_PROGRESS);
                            intent2.putExtra("ClienteSelectinado", LerBombonaActivity.this.spinnerClienteBombona.getText());
                            intent2.putExtra("IdPessoaClienteSelecionado", LerBombonaActivity.this.spinnerClienteBombonaSel);
                            LerBombonaActivity.this.startActivity(intent2);
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionDenied(PermissionDeniedResponse response) {
                            Toast toast2 = Toast.makeText(LerBombonaActivity.this, "Precisa da permissao da camera", 1);
                            toast2.show();
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                        }
                    }).check();
                }
            }
        });
        this.btnDigitarAlocarBombona.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity$$ExternalSyntheticLambda3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                LerBombonaActivity.this.lambda$onCreate$0(view);
            }
        });
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity.2
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                LerBombonaActivity.this.startActivity(new Intent(LerBombonaActivity.this, (Class<?>) SelecaoActivity.class));
                LerBombonaActivity.this.finish();
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$onCreate$0(View view) {
        digitarBombona();
    }

    public void digitarBombona() {
        final InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Código de Barras Bombona");
        final EditText input = new EditText(this);
        input.setInputType(1);
        builder.setView(input);
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
                LerBombonaActivity.this.verificaBombona(input.getText().toString(), dialog);
            }
        });
        builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
                dialog.dismiss();
            }
        });
        builder.show();
        input.requestFocus();
        imm.toggleSoftInput(2, 1);
    }

    public void verificaBombona(String codBarras, DialogInterface dialog) {
        DatabaseHelper myDb = new DatabaseHelper(this);
        String erroCad = new BombonaTableManager(myDb.getDatabase()).validaCadastroBombona(codBarras);
        String erroMensagem = "";
        if (this.spinnerClienteBombonaSel.intValue() != 0) {
            if (erroCad == null) {
                String validaBombona = new MovimentoBombonaTableManager(myDb.getDatabase()).validaBombona(codBarras, ExifInterface.GPS_MEASUREMENT_IN_PROGRESS);
                if (validaBombona == null) {
                    SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
                    int spinner_id_rota = preferences.getInt("id_rota", 0);
                    int spinner_id_frota_veiculo = preferences.getInt("id_frota_veiculo", 0);
                    MovimentoBombona movimentoBombona = new MovimentoBombona(codBarras, this.spinnerClienteBombonaSel, ExifInterface.GPS_MEASUREMENT_IN_PROGRESS, null, String.valueOf(spinner_id_rota), Integer.valueOf(spinner_id_frota_veiculo));
                    MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(myDb.getDatabase());
                    movimentoBombonaTableManager.insert(movimentoBombona);
                    Toast toast = Toast.makeText(this, "Bombona Alocada!", 1);
                    toast.show();
                    refazRecycleView();
                } else {
                    erroMensagem = validaBombona;
                }
            } else {
                erroMensagem = erroCad;
            }
        } else {
            erroMensagem = "Selecione um cliente para destinar a Bombona";
        }
        if (!erroMensagem.isEmpty()) {
            AlertDialog alertDialog = new AlertDialog.Builder(this).create();
            alertDialog.setTitle("Erro");
            alertDialog.setMessage(erroMensagem);
            alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity.5
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog2, int which) {
                    dialog2.dismiss();
                }
            });
            alertDialog.show();
            return;
        }
        dialog.dismiss();
    }

    private RecyclerView preparaRecyclerView() {
        DatabaseHelper myDb = new DatabaseHelper(getApplicationContext());
        ArrayList<String> arrayBombonasLidas = new BombonaTableManager(myDb.getDatabase()).selectBombonasAlocadas();
        RecyclerView listagemCodigo = (RecyclerView) findViewById(R.id.rvBombonasAlocadas);
        listagemCodigo.setHasFixedSize(true);
        listagemCodigo.setLayoutManager(new LinearLayoutManager(this));
        this.adapter = new LerBombonaAdapter(arrayBombonasLidas);
        return listagemCodigo;
    }

    public void habilitaRecycleView() {
        preparaRecyclerView().setAdapter(this.adapter);
    }

    public void refazRecycleView() {
        preparaRecyclerView().swapAdapter(this.adapter, true);
    }

    private void loadSpinnerCliente() {
        DatabaseHelper db = new DatabaseHelper(getApplicationContext());
        final List<ClienteMTR> labels = new ClienteMTRTableManager(db.getDatabase()).getAllClientesMTR();
        final SearchableSpinnerDialogHelper<ClienteMTR> helper = new SearchableSpinnerDialogHelper<>();
        this.spinnerClienteBombona.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                LerBombonaActivity.this.lambda$loadSpinnerCliente$2(helper, labels, view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadSpinnerCliente$2(SearchableSpinnerDialogHelper helper, List labels, View v) {
        helper.showDialog(this, labels, "Selecione o Cliente", new LerBombonaActivity$$ExternalSyntheticLambda1(), this.spinnerClienteBombona, this.spinnerClienteBombona.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // da classe: com.coleta.ambientuus.activities.bombona.LerBombonaActivity$$ExternalSyntheticLambda2
            @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
            public final void onItemSelected(Object obj) {
                LerBombonaActivity.this.lambda$loadSpinnerCliente$1((ClienteMTR) obj);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadSpinnerCliente$1(ClienteMTR selectedCliente) {
        this.spinnerClienteBombonaSel = Integer.valueOf(selectedCliente.getId_pessoa());
    }
}
