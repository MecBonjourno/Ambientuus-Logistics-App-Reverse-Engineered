package com.coleta.ambientuus.activities.pontoColeta;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.BuscaDispositivoActivity;
import com.coleta.ambientuus.activities.main.BaseActivity;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.domain.model.TipoPesagem;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.dto.model.EtiquetaIntervalo;
import com.coleta.ambientuus.ui.MaterialAlertUtil;
import com.coleta.ambientuus.utils.ButtonStyles;
import com.coleta.ambientuus.utils.PesagemPreferences;
import com.coleta.ambientuus.utils.TextStyles;
import com.google.android.material.textfield.TextInputEditText;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import j$.util.Objects;

/* carregado de: classes14.dex */
public class PontoColetaEtiquetaActivity extends BaseActivity {
    private Button btnIniciarPesagem;
    private Button btnSalvarCapaColeta;
    private DatabaseHelper databaseHelper;
    private EtiquetaTableManager etiquetaTableManager;
    private PontoColeta pontoColeta;
    private long qtdEtiqueta;
    private long qtdFinal;
    private long qtdInicial;
    private ActivityResultLauncher<Intent> readerLauncherEtiquetaFinal;
    private ActivityResultLauncher<Intent> readerLauncherEtiquetaInicial;
    private TextInputEditText textEtiquetaFinal;
    private TextInputEditText textEtiquetaInicial;
    private TextView tvQuantidade;
    private String valFinal;
    private String valInicial;

    @Override // com.coleta.ambientuus.activities.main.BaseActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle saveInstanceState) {
        super.onCreate(saveInstanceState);
        setContentView(R.layout.activity_ponto_coleta_capa_etiqueta);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.pontoColeta = (PontoColeta) getIntent().getParcelableExtra("ponto");
        this.qtdEtiqueta = 0L;
        this.databaseHelper = new DatabaseHelper(this);
        this.etiquetaTableManager = new EtiquetaTableManager(this.databaseHelper.getDatabase());
        initEdits();
        initText();
        prepareReader();
        initButton();
        initData();
    }

    private void initEdits() {
        this.textEtiquetaInicial = (TextInputEditText) findViewById(R.id.textEtiquetaInicial);
        this.textEtiquetaInicial.setOnFocusChangeListener(new View.OnFocusChangeListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z) {
                PontoColetaEtiquetaActivity.this.lambda$initEdits$0(view, z);
            }
        });
        this.textEtiquetaFinal = (TextInputEditText) findViewById(R.id.textEtiquetaFinal);
        this.textEtiquetaFinal.setOnFocusChangeListener(new View.OnFocusChangeListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z) {
                PontoColetaEtiquetaActivity.this.lambda$initEdits$1(view, z);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initEdits$0(View v, boolean hasFocus) {
        if (!hasFocus) {
            if (!this.textEtiquetaInicial.getText().toString().isEmpty()) {
                enableButtons();
                updateQuantity();
            } else {
                this.textEtiquetaFinal.setText("");
                updateQuantity();
                disableButton();
            }
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initEdits$1(View v, boolean hasFocus) {
        if (!hasFocus) {
            updateQuantity();
        }
    }

    private void initText() {
        this.tvQuantidade = (TextView) findViewById(R.id.tvQuantidade);
    }

    private void prepareReader() {
        this.readerLauncherEtiquetaInicial = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda7
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                PontoColetaEtiquetaActivity.this.lambda$prepareReader$2((ActivityResult) obj);
            }
        });
        this.readerLauncherEtiquetaFinal = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda8
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                PontoColetaEtiquetaActivity.this.lambda$prepareReader$3((ActivityResult) obj);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$prepareReader$2(ActivityResult result) {
        if (result.getResultCode() == 200) {
            Intent data = result.getData();
            Objects.requireNonNull(data, "Erro ao retornar codigo de Barras");
            String codigoBarras = data.getStringExtra("codigoBarras");
            this.textEtiquetaInicial.setText(codigoBarras);
            enableButtons();
            updateQuantity();
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$prepareReader$3(ActivityResult result) {
        if (result.getResultCode() == 200) {
            Intent data = result.getData();
            Objects.requireNonNull(data, "Erro ao retornar codigo de Barras");
            String codigoBarras = data.getStringExtra("codigoBarras");
            this.textEtiquetaFinal.setText(codigoBarras);
            enableButtons();
            updateQuantity();
        }
    }

    private void initButton() {
        this.btnIniciarPesagem = (Button) findViewById(R.id.btnIniciarPesagem);
        this.btnIniciarPesagem.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                PontoColetaEtiquetaActivity.this.lambda$initButton$5(view);
            }
        });
        this.btnSalvarCapaColeta = (Button) findViewById(R.id.btnSalvarCapaColeta);
        this.btnSalvarCapaColeta.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda4
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                PontoColetaEtiquetaActivity.this.lambda$initButton$6(view);
            }
        });
        Button btnLerEtiquetaInicio = (Button) findViewById(R.id.btnLerEtiquetaInicio);
        btnLerEtiquetaInicio.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda5
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                PontoColetaEtiquetaActivity.this.lambda$initButton$7(view);
            }
        });
        Button btnLerEtiquetaFinal = (Button) findViewById(R.id.btnLerEtiquetaFinal);
        btnLerEtiquetaFinal.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda6
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                PontoColetaEtiquetaActivity.this.lambda$initButton$8(view);
            }
        });
        disableButton();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButton$5(View v) {
        if (verifyEtiquetaInicialFinal() && insertEtiqueta()) {
            PesagemPreferences.verifyPreferences(this, new PesagemPreferences.TipoPesagemCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity$$ExternalSyntheticLambda2
                @Override // com.coleta.ambientuus.utils.PesagemPreferences.TipoPesagemCallback
                public final void onTipoPesagemSelecionado(TipoPesagem tipoPesagem) {
                    PontoColetaEtiquetaActivity.this.lambda$initButton$4(tipoPesagem);
                }
            });
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButton$4(TipoPesagem tipo) {
        Intent intent;
        if (Objects.equals(tipo.getValor(), TipoPesagem.BLUETOOTH.getValor())) {
            intent = new Intent(this, (Class<?>) BuscaDispositivoActivity.class);
        } else {
            intent = new Intent(this, (Class<?>) IniciarColetaActivity.class);
        }
        intent.setFlags(603979776);
        intent.putExtra("ponto", this.pontoColeta);
        intent.putExtra("tipo", tipo.getValor());
        startActivity(intent);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButton$6(View v) {
        if (verifyEtiquetaInicialFinal() && insertEtiqueta()) {
            PontoColetaTableManager pontoColetaTableManager = new PontoColetaTableManager(this.databaseHelper.getDatabase());
            pontoColetaTableManager.updateStatus(this.pontoColeta.getId(), PontoColetaTableManager.STATUS_EDITAVEL);
            Intent intent = new Intent(this, (Class<?>) ListagemPontoColetaActivity.class);
            intent.setFlags(603979776);
            startActivity(intent);
            finish();
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButton$7(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity.1
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(PontoColetaEtiquetaActivity.this, (Class<?>) ReaderLeitorActivity.class);
                PontoColetaEtiquetaActivity.this.readerLauncherEtiquetaInicial.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(PontoColetaEtiquetaActivity.this, "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButton$8(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.PontoColetaEtiquetaActivity.2
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(PontoColetaEtiquetaActivity.this, (Class<?>) ReaderLeitorActivity.class);
                PontoColetaEtiquetaActivity.this.readerLauncherEtiquetaFinal.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(PontoColetaEtiquetaActivity.this, "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    private void initData() {
        EtiquetaIntervalo etiquetaIntervalo = this.etiquetaTableManager.buscarIntervaloEtiquetas(this.pontoColeta.getIdManifesto().intValue());
        if (etiquetaIntervalo != null && etiquetaIntervalo.getPrimeira() != 0) {
            this.textEtiquetaInicial.setText(String.valueOf(etiquetaIntervalo.getPrimeira()));
            if (etiquetaIntervalo.getPrimeira() != etiquetaIntervalo.getUltima()) {
                this.textEtiquetaFinal.setText(String.valueOf(etiquetaIntervalo.getUltima()));
            }
            this.textEtiquetaInicial.setEnabled(false);
            this.textEtiquetaFinal.setEnabled(false);
            enableButtons();
            updateQuantity();
        }
    }

    private void disableButton() {
        this.btnIniciarPesagem.setEnabled(false);
        ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnIniciarPesagem, this);
        this.btnSalvarCapaColeta.setEnabled(false);
        ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnSalvarCapaColeta, this);
    }

    private void enableButtons() {
        this.btnIniciarPesagem.setEnabled(true);
        ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnIniciarPesagem, this);
        this.btnSalvarCapaColeta.setEnabled(true);
        ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnSalvarCapaColeta, this);
    }

    private void getEtiquetasValues() {
        this.valInicial = this.textEtiquetaInicial.getText().toString();
        this.valFinal = this.textEtiquetaFinal.getText().toString();
        this.qtdInicial = this.valInicial.isEmpty() ? 0L : Long.parseLong(this.valInicial);
        this.qtdFinal = this.valFinal.isEmpty() ? this.qtdInicial : Long.parseLong(this.valFinal);
    }

    private void updateQuantity() {
        if (verifyEtiquetaInicialFinal()) {
            this.qtdEtiqueta = this.qtdFinal - this.qtdInicial;
            if (this.qtdInicial == 0 && this.qtdFinal == 0) {
                this.tvQuantidade.setText(TextStyles.getTextWithBoldSufix("Quantidade: ", "0"));
            } else {
                this.tvQuantidade.setText(TextStyles.getTextWithBoldSufix("Quantidade: ", String.valueOf(this.qtdEtiqueta + 1)));
            }
        }
    }

    private boolean verifyEtiquetaInicialFinal() {
        getEtiquetasValues();
        if (this.qtdFinal < this.qtdInicial) {
            MaterialAlertUtil.exibirErro(this, "Erro", "A numeração da etiqueta final não pode ser menor que a inicial.");
            return false;
        }
        return true;
    }

    public boolean insertEtiqueta() {
        String valInicial = ((Editable) Objects.requireNonNull(this.textEtiquetaInicial.getText())).toString();
        long qtdInicial = valInicial.isEmpty() ? 0L : Long.parseLong(valInicial);
        return this.etiquetaTableManager.executeRangeInsert(this.pontoColeta.getIdManifesto().intValue(), this.qtdEtiqueta, qtdInicial, this);
    }
}
