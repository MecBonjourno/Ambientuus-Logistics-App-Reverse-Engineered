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
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.main.SelecaoActivity;
import com.coleta.ambientuus.adapters.BaixaBombonaAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.database.managers.MovimentoBombonaTableManager;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import java.util.ArrayList;

/* carregado de: classes14.dex */
public class BaixaBombonaActivity extends AppCompatActivity {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private BaixaBombonaAdapter adapter;
    private Button btnDigitarBombonaBaixa;
    private Button btnLerBombonaBaixa;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_baixa_bombona);
        boolean z = true;
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.btnLerBombonaBaixa = (Button) findViewById(R.id.btnLerBombonaBaixa);
        this.btnDigitarBombonaBaixa = (Button) findViewById(R.id.btnDigitarBombonaBaixa);
        Bundle extras = getIntent().getExtras();
        if (extras != null && extras.getString("lido") != null) {
            Intent intent = new Intent(this, (Class<?>) LeitorBombonaActivity.class);
            intent.putExtra("ORIGEM", "B");
            startActivity(intent);
        }
        habilitaRecycleView();
        this.btnLerBombonaBaixa.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Dexter.withActivity(BaixaBombonaActivity.this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity.1.1
                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionGranted(PermissionGrantedResponse response) {
                        Intent intent2 = new Intent(BaixaBombonaActivity.this, (Class<?>) LeitorBombonaActivity.class);
                        intent2.putExtra("ORIGEM", "B");
                        BaixaBombonaActivity.this.startActivity(intent2);
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionDenied(PermissionDeniedResponse response) {
                        Toast toast = Toast.makeText(BaixaBombonaActivity.this, "Precisa da permissao da camera", 1);
                        toast.show();
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                    }
                }).check();
            }
        });
        this.btnDigitarBombonaBaixa.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                BaixaBombonaActivity.this.lambda$onCreate$0(view);
            }
        });
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // da classe: com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity.2
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                Intent intent2 = new Intent(BaixaBombonaActivity.this, (Class<?>) SelecaoActivity.class);
                BaixaBombonaActivity.this.startActivity(intent2);
                BaixaBombonaActivity.this.finish();
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
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
                BaixaBombonaActivity.this.verificaBombona(input.getText().toString(), dialog);
            }
        });
        builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity.4
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
        if (erroCad == null) {
            String validaBombona = new MovimentoBombonaTableManager(myDb.getDatabase()).validaBombona(codBarras, "B");
            if (validaBombona == null) {
                SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
                int spinner_id_rota = preferences.getInt("id_rota", 0);
                int spinner_id_frota_veiculo = preferences.getInt("id_frota_veiculo", 0);
                MovimentoBombona movimentoBombona = new MovimentoBombona(codBarras, 0, "B", null, String.valueOf(spinner_id_rota), Integer.valueOf(spinner_id_frota_veiculo));
                MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(myDb.getDatabase());
                movimentoBombonaTableManager.insert(movimentoBombona);
                Toast toast = Toast.makeText(this, "Bombona Baixada!", 1);
                toast.show();
                refazRecycleView();
            } else {
                erroMensagem = validaBombona;
            }
        } else {
            erroMensagem = erroCad;
        }
        if (!erroMensagem.isEmpty()) {
            AlertDialog alertDialog = new AlertDialog.Builder(this).create();
            alertDialog.setTitle("Erro");
            alertDialog.setMessage(erroMensagem);
            alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.BaixaBombonaActivity.5
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
        ArrayList<String> arrayBombonasLidas = new BombonaTableManager(myDb.getDatabase()).selectBombonasBaixadas();
        RecyclerView listagemCodigo = (RecyclerView) findViewById(R.id.rvBombonasBaixadas);
        listagemCodigo.setHasFixedSize(true);
        listagemCodigo.setLayoutManager(new LinearLayoutManager(this));
        this.adapter = new BaixaBombonaAdapter(arrayBombonasLidas);
        return listagemCodigo;
    }

    public void habilitaRecycleView() {
        preparaRecyclerView().setAdapter(this.adapter);
    }

    public void refazRecycleView() {
        preparaRecyclerView().swapAdapter(this.adapter, true);
    }
}
