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
import com.coleta.ambientuus.adapters.CarregarBombonaAdapter;
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
public class CarregarBombonaActivity extends AppCompatActivity {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private CarregarBombonaAdapter adapter;
    private Button btnDigitarBombona;
    private Button btnLerBombona;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_carregar_bombona);
        boolean z = true;
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.btnLerBombona = (Button) findViewById(R.id.btnLerCarregarBombona);
        this.btnDigitarBombona = (Button) findViewById(R.id.btnDigitarCarregarBombona);
        Bundle extras = getIntent().getExtras();
        if (extras != null && extras.getString("lido") != null) {
            Intent intent = new Intent(this, (Class<?>) LeitorBombonaActivity.class);
            intent.putExtra("ORIGEM", "TR");
            startActivity(intent);
        }
        habilitaRecycleView();
        this.btnLerBombona.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                Dexter.withActivity(CarregarBombonaActivity.this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity.1.1
                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionGranted(PermissionGrantedResponse response) {
                        Intent intent2 = new Intent(CarregarBombonaActivity.this, (Class<?>) LeitorBombonaActivity.class);
                        intent2.putExtra("ORIGEM", "TR");
                        CarregarBombonaActivity.this.startActivity(intent2);
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionDenied(PermissionDeniedResponse response) {
                        Toast toast = Toast.makeText(CarregarBombonaActivity.this, "Precisa da permissao da camera", 1);
                        toast.show();
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                    }
                }).check();
            }
        });
        this.btnDigitarBombona.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                CarregarBombonaActivity.this.lambda$onCreate$0(view);
            }
        });
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // da classe: com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity.2
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                CarregarBombonaActivity.this.startActivity(new Intent(CarregarBombonaActivity.this, (Class<?>) SelecaoActivity.class));
                CarregarBombonaActivity.this.finish();
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
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
                CarregarBombonaActivity.this.verificaBombona(input.getText().toString(), dialog);
            }
        });
        builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity.4
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
            String validaBombona = new MovimentoBombonaTableManager(myDb.getDatabase()).validaBombona(codBarras, "TR");
            if (validaBombona == null) {
                SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
                int spinner_id_rota = preferences.getInt("id_rota", 0);
                int spinner_id_frota_veiculo = preferences.getInt("id_frota_veiculo", 0);
                MovimentoBombona movimentoBombona = new MovimentoBombona(codBarras, 0, "TR", null, String.valueOf(spinner_id_rota), Integer.valueOf(spinner_id_frota_veiculo));
                MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(myDb.getDatabase());
                movimentoBombonaTableManager.insert(movimentoBombona);
                Toast toast = Toast.makeText(this, "Bombona Carregada!", 1);
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
            alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.bombona.CarregarBombonaActivity.5
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
        ArrayList<String> arrayBombonasLidas = new BombonaTableManager(myDb.getDatabase()).selectBombonasCarregadas();
        RecyclerView listagemCodigo = (RecyclerView) findViewById(R.id.rvBombonasCarregadas);
        listagemCodigo.setHasFixedSize(true);
        listagemCodigo.setLayoutManager(new LinearLayoutManager(this));
        this.adapter = new CarregarBombonaAdapter(arrayBombonasLidas);
        return listagemCodigo;
    }

    public void habilitaRecycleView() {
        preparaRecyclerView().setAdapter(this.adapter);
    }

    public void refazRecycleView() {
        preparaRecyclerView().swapAdapter(this.adapter, true);
    }
}
