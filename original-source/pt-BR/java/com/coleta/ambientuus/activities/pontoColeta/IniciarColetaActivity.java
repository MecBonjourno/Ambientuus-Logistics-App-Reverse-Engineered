package com.coleta.ambientuus.activities.pontoColeta;

import android.app.ProgressDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Editable;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.widget.SwitchCompat;
import androidx.core.app.ActivityCompat;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.BuscaDispositivoActivity;
import com.coleta.ambientuus.activities.main.BaseActivity;
import com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.database.managers.TipoResiduoTableManager;
import com.coleta.ambientuus.database.managers.VolumeTableManager;
import com.coleta.ambientuus.dto.Coleta;
import com.coleta.ambientuus.dto.Manifesto;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.dto.TipoResiduo;
import com.coleta.ambientuus.dto.Volume;
import com.coleta.ambientuus.dto.model.EtiquetaIntervalo;
import com.coleta.ambientuus.ui.MaterialAlertUtil;
import com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper;
import com.coleta.ambientuus.utils.ButtonStyles;
import com.coleta.ambientuus.utils.TextStyles;
import com.google.android.material.textfield.MaterialAutoCompleteTextView;
import com.google.android.material.textfield.TextInputEditText;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import j$.util.Objects;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

/* carregado de: classes14.dex */
public class IniciarColetaActivity extends BaseActivity {
    private Boolean bluetoothConectado;
    private Button btnLerPeso;
    private long etiquetaAtual;
    private EtiquetaIntervalo etiquetaIntervalo;
    private BluetoothSocket mBTSocket;
    private BluetoothDevice mDevice;
    private UUID mDeviceUUID;
    private PontoColeta pontoColeta;
    private ProgressDialog progressDialog;
    private long qtdEtiquetas;
    private RadioButton radioPeso;
    private RadioButton radioQtd;
    private ActivityResultLauncher<Intent> readerLauncher;
    private ActivityResultLauncher<Intent> readerLauncherEtiqueta;
    private SwitchCompat smColetaExtra;
    private SwitchCompat smManterBombona;
    private SwitchCompat smManterNrMTR;
    private AutoCompleteTextView tieBombona;
    private MaterialAutoCompleteTextView tieBombonaExtra;
    private TextInputEditText tieEtiquetaExtra;
    private TextInputEditText tieNroMtrDc;
    private TextInputEditText tieObservacao;
    private TextInputEditText tiePeso;
    private MaterialAutoCompleteTextView tieResiduoExtra;
    private String tipoPesagem;
    private List<Volume> volumes;
    private DatabaseHelper databaseHelper = new DatabaseHelper(this);
    private Integer idTipoResiduo = 0;
    private int mMaxChars = 1000;
    private ReadInput mReadThread = null;
    private boolean mIsUserInitiatedDisconnect = false;
    private boolean mIsBluetoothConnected = false;
    private boolean bStop = false;

    @Override // com.coleta.ambientuus.activities.main.BaseActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle saveInstanceState) {
        super.onCreate(saveInstanceState);
        setContentView(R.layout.activity_ponto_coleta_coletar);
        this.pontoColeta = (PontoColeta) getIntent().getParcelableExtra("ponto");
        this.tipoPesagem = getIntent().getStringExtra("tipo");
        initFields();
        initDefaultData();
        loadDataBombona();
        updateDataEtiqueta();
        initTipoColeta();
        initReader();
        initButtons();
        existsScale();
    }

    private void initFields() {
        this.tieNroMtrDc = (TextInputEditText) findViewById(R.id.tieNroMtrDc);
        this.smManterNrMTR = (SwitchCompat) findViewById(R.id.smManterNrMTR);
        this.tiePeso = (TextInputEditText) findViewById(R.id.tiePeso);
        this.radioQtd = (RadioButton) findViewById(R.id.radio_qtd);
        this.radioPeso = (RadioButton) findViewById(R.id.radio_peso);
        this.tieBombona = (AutoCompleteTextView) findViewById(R.id.tieBombona);
        this.smManterBombona = (SwitchCompat) findViewById(R.id.smManterBombona);
        this.tieObservacao = (TextInputEditText) findViewById(R.id.tieObservacao);
        this.smColetaExtra = (SwitchCompat) findViewById(R.id.smColetaExtra);
        this.smColetaExtra.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda3
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                IniciarColetaActivity.this.lambda$initFields$0(compoundButton, z);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initFields$0(CompoundButton v, boolean isChecked) {
        if (isChecked) {
            prepareColetaExtra();
            return;
        }
        changeColetaExtraVisibility(8);
        this.tieEtiquetaExtra = null;
        this.tieBombonaExtra = null;
        this.idTipoResiduo = 0;
    }

    public void initDefaultData() {
        if ("N".equals(this.pontoColeta.getClienteEmiteMtr())) {
            this.tieNroMtrDc.setText(this.pontoColeta.getNumeroManifesto());
            if (!this.pontoColeta.getNumeroManifesto().isEmpty()) {
                this.smManterNrMTR.setChecked(true);
            }
        }
        if (Objects.equals(this.pontoColeta.getColetaExtra(), ExifInterface.LATITUDE_SOUTH)) {
            this.smColetaExtra.setChecked(true);
        }
    }

    private void prepareColetaExtra() {
        changeColetaExtraVisibility(0);
        this.tieEtiquetaExtra = (TextInputEditText) findViewById(R.id.tieEtiquetaExtra);
        this.tieResiduoExtra = (MaterialAutoCompleteTextView) findViewById(R.id.tieResiduoExtra);
        this.tieBombonaExtra = (MaterialAutoCompleteTextView) findViewById(R.id.tieBombonaExtra);
        loadDataTipoResiduo();
        loadDataBombonaExtra();
        Button btnLerEtiquetaExtra = (Button) findViewById(R.id.btnLerEtiquetaExtra);
        btnLerEtiquetaExtra.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaActivity.this.lambda$prepareColetaExtra$1(view);
            }
        });
        if (this.etiquetaAtual != 0) {
            this.tieEtiquetaExtra.setEnabled(false);
            btnLerEtiquetaExtra.setEnabled(false);
            ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(btnLerEtiquetaExtra, this);
            findViewById(R.id.coletaExtraEtiqueta).setVisibility(8);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$prepareColetaExtra$1(View v) {
        Intent intent = new Intent(this, (Class<?>) ReaderLeitorActivity.class);
        this.readerLauncherEtiqueta.launch(intent);
    }

    public void loadDataTipoResiduo() {
        final List<TipoResiduo> tipoResiduos = new TipoResiduoTableManager(this.databaseHelper.getDatabase()).getAllTipoResiduo();
        final SearchableSpinnerDialogHelper<TipoResiduo> helper = new SearchableSpinnerDialogHelper<>();
        this.tieResiduoExtra.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda4
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaActivity.this.lambda$loadDataTipoResiduo$3(helper, tipoResiduos, view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadDataTipoResiduo$3(SearchableSpinnerDialogHelper helper, List tipoResiduos, View v) {
        helper.showDialog(this, tipoResiduos, "Selecione o Tipo de Resíduo", new IniciarColetaActivity$$ExternalSyntheticLambda11(), this.tieResiduoExtra, this.tieResiduoExtra.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda12
            @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
            public final void onItemSelected(Object obj) {
                IniciarColetaActivity.this.lambda$loadDataTipoResiduo$2((TipoResiduo) obj);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadDataTipoResiduo$2(TipoResiduo selectedItem) {
        this.idTipoResiduo = selectedItem.getId_tipo_residuo();
    }

    public void changeColetaExtraVisibility(int TYPE) {
        findViewById(R.id.coletaExtra).setVisibility(TYPE);
    }

    private void loadDataBombona() {
        this.volumes = new VolumeTableManager(this.databaseHelper.getDatabase()).getAllVolumes();
        ArrayAdapter<Volume> dataAdapter = new ArrayAdapter<>(this, android.R.layout.simple_dropdown_item_1line, this.volumes);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        this.tieBombona.setAdapter(dataAdapter);
    }

    private void loadDataBombonaExtra() {
        ArrayAdapter<Volume> dataAdapter = new ArrayAdapter<>(this, android.R.layout.simple_dropdown_item_1line, this.volumes);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        this.tieBombonaExtra.setAdapter(dataAdapter);
    }

    private void getInfoEtiqueta() {
        EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(this.databaseHelper.getDatabase());
        this.etiquetaIntervalo = etiquetaTableManager.buscarIntervaloEtiquetas(this.pontoColeta.getIdManifesto().intValue());
        this.qtdEtiquetas = (this.etiquetaIntervalo.getUltima() - this.etiquetaIntervalo.getPrimeira()) + 1;
        this.etiquetaAtual = etiquetaTableManager.buscaUltimaEtiqueta(this.pontoColeta.getIdManifesto().intValue(), this.pontoColeta.getIdColetaLogradouro().intValue()).longValue();
        this.etiquetaAtual = this.etiquetaAtual == 0 ? this.etiquetaIntervalo.getPrimeira() : this.etiquetaAtual + 1;
    }

    private void initEtiquetaText() {
        TextView tvEtiquetaQtd = (TextView) findViewById(R.id.tvEtiquetaQtd);
        long etiquetaAtualVer = this.etiquetaAtual + 1;
        long qtdEtiquetaAtual = etiquetaAtualVer - this.etiquetaIntervalo.getPrimeira();
        tvEtiquetaQtd.setText(TextStyles.getTextWithBoldSufix("Etiqueta ", qtdEtiquetaAtual + " de " + this.qtdEtiquetas));
    }

    private void disableEtiqueta() {
        if (this.etiquetaAtual != 0 && this.tieEtiquetaExtra != null) {
            this.tieEtiquetaExtra.setEnabled(false);
        }
    }

    public void validateEtiqueta() {
        Log.i("TESTE", String.valueOf(this.etiquetaAtual));
        Log.i("TESTE", String.valueOf(this.etiquetaIntervalo.getUltima()));
        if (this.etiquetaAtual > this.etiquetaIntervalo.getUltima()) {
            finalizeColeta(false);
        }
    }

    public void updateDataEtiqueta() {
        getInfoEtiqueta();
        initEtiquetaText();
        disableEtiqueta();
        validateEtiqueta();
    }

    private void initTipoColeta() {
        TextView tvTipoColeta = (TextView) findViewById(R.id.tvTipoColeta);
        String tipoPesagemTexto = this.tipoPesagem.substring(0, 1).toUpperCase() + this.tipoPesagem.substring(1).toLowerCase();
        tvTipoColeta.setText(tipoPesagemTexto);
    }

    private void initReader() {
        this.readerLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda13
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                IniciarColetaActivity.this.lambda$initReader$4((ActivityResult) obj);
            }
        });
        this.readerLauncherEtiqueta = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda1
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                IniciarColetaActivity.this.lambda$initReader$5((ActivityResult) obj);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initReader$4(ActivityResult result) {
        if (result.getResultCode() == 200) {
            Intent data = result.getData();
            Objects.requireNonNull(data, "Erro ao retornar codigo de Barras");
            String codigoBarras = data.getStringExtra("codigoBarras");
            if (codigoBarras != null && codigoBarras.length() > 10) {
                codigoBarras = codigoBarras.substring(0, 10);
            }
            this.tieNroMtrDc.setText(codigoBarras);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initReader$5(ActivityResult result) {
        if (result.getResultCode() == 200) {
            Intent data = result.getData();
            Objects.requireNonNull(data, "Erro ao retornar codigo de Barras");
            String codigoBarras = data.getStringExtra("codigoBarras");
            this.tieEtiquetaExtra.setText(codigoBarras);
        }
    }

    private void initButtons() {
        Button btnLerMTRDC = (Button) findViewById(R.id.btnLerMTRDC);
        ButtonStyles.aplicarEstiloFullWidthColoredButton(btnLerMTRDC, this);
        btnLerMTRDC.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda6
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaActivity.this.lambda$initButtons$6(view);
            }
        });
        this.btnLerPeso = (Button) findViewById(R.id.btnLerPeso);
        this.btnLerPeso.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda7
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaActivity.this.lambda$initButtons$7(view);
            }
        });
        Button btnLimpar = (Button) findViewById(R.id.btnLimpar);
        btnLimpar.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda8
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaActivity.this.lambda$initButtons$8(view);
            }
        });
        Button btnLancar = (Button) findViewById(R.id.btnLancar);
        btnLancar.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda9
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaActivity.this.lambda$initButtons$9(view);
            }
        });
        Button btnFinalizar = (Button) findViewById(R.id.btnFinalizar);
        btnFinalizar.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda10
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaActivity.this.lambda$initButtons$10(view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$6(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity.1
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(IniciarColetaActivity.this, (Class<?>) ReaderLeitorActivity.class);
                IniciarColetaActivity.this.readerLauncher.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(IniciarColetaActivity.this, "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$7(View v) {
        if (this.bluetoothConectado.booleanValue()) {
            this.bStop = false;
            this.mReadThread = new ReadInput();
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$8(View v) {
        clearFields();
        initDefaultData();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$9(View v) {
        saveColeta();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$10(View v) {
        boolean finaliza = true;
        if (getSelectedBombona() != null || !this.tieObservacao.getText().toString().isEmpty()) {
            finaliza = saveColeta();
        }
        if (finaliza) {
            finalizeColeta(Boolean.valueOf(this.etiquetaAtual <= this.etiquetaIntervalo.getUltima()));
        }
    }

    public void existsScale() {
        Intent intent = getIntent();
        Bundle b = intent.getExtras();
        if (intent.hasExtra(BuscaDispositivoActivity.DEVICE_EXTRA)) {
            this.bluetoothConectado = Boolean.valueOf(b.getBoolean("CONECTADO"));
            this.mDevice = (BluetoothDevice) b.getParcelable(BuscaDispositivoActivity.DEVICE_EXTRA);
            this.mDeviceUUID = UUID.fromString(b.getString(BuscaDispositivoActivity.DEVICE_UUID));
            this.mMaxChars = b.getInt(BuscaDispositivoActivity.BUFFER_SIZE);
            this.btnLerPeso.setVisibility(0);
            return;
        }
        this.bluetoothConectado = false;
        this.btnLerPeso.setVisibility(4);
    }

    public void clearFields() {
        if (!this.smManterNrMTR.isChecked()) {
            this.tieNroMtrDc.setText("");
        }
        this.tiePeso.setText("");
        if (!this.smManterBombona.isChecked()) {
            this.tieBombona.setText("");
        }
        this.tieObservacao.setText("");
        if (this.smColetaExtra.isChecked()) {
            SwitchCompat smManterBombonaExtra = (SwitchCompat) findViewById(R.id.smManterBombonaExtra);
            if (!smManterBombonaExtra.isChecked()) {
                this.tieBombonaExtra.setText("");
            }
            this.tieResiduoExtra.setText("");
        }
    }

    public Coleta createColeta() {
        String etiquetaColeta;
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        String hoje = dateFormat.format(dataAtual);
        SharedPreferences preferences = getSharedPreferences(BaseActivity.ARQUIVO_PREFERENCIA, 0);
        int idRota = preferences.getInt("id_rota", 0);
        String peso = this.tiePeso.getText().toString();
        String etiquetaColeta2 = String.valueOf(this.etiquetaAtual);
        if (this.etiquetaAtual != 0) {
            etiquetaColeta = etiquetaColeta2;
        } else {
            String etiquetaColeta3 = this.tieEtiquetaExtra.getText().toString();
            etiquetaColeta = etiquetaColeta3;
        }
        Volume volume = getSelectedBombona();
        Volume volumeExtra = getSelectedBombonaExtra();
        Coleta coleta = new Coleta(peso, ((Editable) Objects.requireNonNull(this.tieNroMtrDc.getText())).toString(), hoje, Integer.valueOf(idRota), Integer.valueOf(volume == null ? 0 : Integer.parseInt(volume.getId_volume())), "N", "N", this.smColetaExtra.isChecked() ? ExifInterface.LATITUDE_SOUTH : "N", this.tieObservacao.getText().toString(), "N", this.pontoColeta.getIdCliente(), this.radioQtd.isChecked() ? "QTD" : "LT", null, null, null, null, etiquetaColeta, this.idTipoResiduo.intValue() == 0 ? null : this.idTipoResiduo, Integer.valueOf(volumeExtra != null ? Integer.parseInt(volumeExtra.getId_volume()) : 0), this.pontoColeta.getIdColetaLogradouro(), this.pontoColeta.getIdDiaColeta());
        return coleta;
    }

    public Volume getSelectedBombona() {
        if (this.tieBombona.getAdapter() != null) {
            for (int i = 0; i < this.tieBombona.getAdapter().getCount(); i++) {
                Volume vol = (Volume) this.tieBombona.getAdapter().getItem(i);
                if (vol.toString().equals(this.tieBombona.getText().toString())) {
                    return vol;
                }
            }
        }
        for (Volume volume : this.volumes) {
            if (volume.toString().equals(this.tieBombona.getText().toString())) {
                return volume;
            }
        }
        return null;
    }

    public Volume getSelectedBombonaExtra() {
        if (this.tieBombonaExtra != null) {
            if (this.tieBombonaExtra.getAdapter() != null) {
                for (int i = 0; i < this.tieBombonaExtra.getAdapter().getCount(); i++) {
                    Volume vol = (Volume) this.tieBombonaExtra.getAdapter().getItem(i);
                    if (vol.toString().equals(this.tieBombonaExtra.getText().toString())) {
                        return vol;
                    }
                }
            }
            for (Volume volume : this.volumes) {
                if (volume.toString().equals(this.tieBombonaExtra.getText().toString())) {
                    return volume;
                }
            }
            return null;
        }
        return null;
    }

    private boolean validarCampos(Coleta coleta) {
        String nrMTR = coleta.getNumero_mtr();
        String peso = coleta.getPeso();
        coleta.getObservacao();
        int idVolume = coleta.getId_volume();
        String extra = coleta.getColeta_extra();
        String codEtiqueta = coleta.getCod_Etiqueta();
        boolean mtrValido = nrMTR.length() == 10;
        boolean temVolume = idVolume != 0;
        if (peso.isEmpty()) {
            showMessage("Informe o Peso");
            return false;
        }
        float pesof = Float.parseFloat(peso.replace(",", "."));
        if (pesof > 100.0f) {
            showConfirm("Verifique", "Peso máximo permitido 100 Kg.", new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    IniciarColetaActivity.this.lambda$validarCampos$11();
                }
            });
            return false;
        }
        if (extra.equals(ExifInterface.LATITUDE_SOUTH)) {
            if (!mtrValido) {
                showMessage("Verifique o tamanho do MTR/DC (10)");
                return false;
            }
            if (temVolume) {
                return true;
            }
            showMessage("Selecione uma bombona");
            return false;
        }
        if (codEtiqueta.isEmpty()) {
            showMessage("Informe uma etiqueta");
            return false;
        }
        EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(this.databaseHelper.getDatabase());
        Manifesto manifestoEtiqueta = etiquetaTableManager.retornaManifestoEtiqueta(codEtiqueta);
        if (manifestoEtiqueta != null && !Objects.equals(manifestoEtiqueta.getNumero_manifesto(), nrMTR)) {
            showMessage("Etiqueta informada não pertence a esse manifesto");
            return false;
        }
        if (!peso.isEmpty() && mtrValido && temVolume) {
            return true;
        }
        if (!mtrValido) {
            showMessage("Verifique o tamanho do MTR/DC (10)");
        } else if (peso.isEmpty()) {
            showMessage("Informe o peso");
        } else {
            showMessage("Selecione uma Bombona");
        }
        return false;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$validarCampos$11() {
        this.tiePeso.setText("0,00");
    }

    private void showConfirm(String titulo, String msg, final Runnable acao) {
        MaterialAlertUtil.mostrarConfirmacao(this, titulo, msg, "Ok", null, new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$$ExternalSyntheticLambda5
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                IniciarColetaActivity.lambda$showConfirm$12(acao, dialogInterface, i);
            }
        }, null);
    }

    static /* sintético */ void lambda$showConfirm$12(Runnable acao, DialogInterface dialog, int which) {
        acao.run();
        dialog.dismiss();
    }

    public void showMessage(String message) {
        MaterialAlertUtil.exibirInformacao(this, "Atenção", message);
    }

    private void updateStatusPontoColeta() {
        new PontoColetaTableManager(this.databaseHelper.getDatabase()).updateStatus(this.pontoColeta.getId(), PontoColetaTableManager.STATUS_COLETADO);
    }

    public void updateStatusPontoColetaLastEtiqueta() {
        if (this.etiquetaAtual == this.etiquetaIntervalo.getUltima()) {
            updateStatusPontoColeta();
        }
    }

    private boolean saveColeta() {
        Coleta coleta = createColeta();
        if (!validarCampos(coleta)) {
            return false;
        }
        new ColetaTableManager(this.databaseHelper.getWritableDatabase()).insert(coleta);
        updateStatusPontoColetaLastEtiqueta();
        clearFields();
        initDefaultData();
        updateDataEtiqueta();
        return true;
    }

    public void finalizeColeta(Boolean pendente) {
        Intent intent = new Intent(this, (Class<?>) CapaPontoColetaActivity.class);
        intent.setFlags(268468224);
        intent.putExtra("ponto", this.pontoColeta);
        intent.putExtra("pendente", pendente);
        intent.putExtra("finaliza", true);
        startActivity(intent);
        finish();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        if (this.bluetoothConectado.booleanValue() && this.mBTSocket != null && this.mIsBluetoothConnected) {
            new DisConnectBT().execute(new Void[0]);
        }
        super.onPause();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        if (this.bluetoothConectado.booleanValue() && (this.mBTSocket == null || !this.mIsBluetoothConnected)) {
            new ConnectBT().execute(new Void[0]);
        }
        super.onResume();
    }

    private class ConnectBT extends AsyncTask<Void, Void, Void> {
        private boolean mConnectSuccessful;

        private ConnectBT() {
            this.mConnectSuccessful = true;
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            IniciarColetaActivity.this.progressDialog = ProgressDialog.show(IniciarColetaActivity.this, "Espere", "Estamos conectando");
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... devices) {
            if (IniciarColetaActivity.this.mBTSocket == null || !IniciarColetaActivity.this.mIsBluetoothConnected) {
                Dexter.withActivity(IniciarColetaActivity.this).withPermission("android.permission.BLUETOOTH_CONNECT").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity.ConnectBT.1
                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionGranted(PermissionGrantedResponse response) {
                        try {
                        } catch (IOException e) {
                            IniciarColetaActivity.this.runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity.ConnectBT.1.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    Toast.makeText(IniciarColetaActivity.this, e.getMessage().toString(), 1).show();
                                }
                            });
                            ConnectBT.this.mConnectSuccessful = false;
                        }
                        if (ActivityCompat.checkSelfPermission(IniciarColetaActivity.this, "android.permission.BLUETOOTH_CONNECT") != 0) {
                            return;
                        }
                        IniciarColetaActivity.this.mBTSocket = IniciarColetaActivity.this.mDevice.createInsecureRfcommSocketToServiceRecord(IniciarColetaActivity.this.mDeviceUUID);
                        BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                        try {
                            IniciarColetaActivity.this.mBTSocket.connect();
                        } catch (IOException e2) {
                            IniciarColetaActivity.this.runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity.ConnectBT.1.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    Toast.makeText(IniciarColetaActivity.this, e2.getMessage().toString(), 1).show();
                                }
                            });
                            ConnectBT.this.mConnectSuccessful = false;
                        }
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionDenied(PermissionDeniedResponse response) {
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                    }
                }).check();
                return null;
            }
            return null;
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Void result) {
            super.onPostExecute((ConnectBT) result);
            if (!this.mConnectSuccessful) {
                IniciarColetaActivity.this.showToast(IniciarColetaActivity.this, "Não foi possivel conectar");
                IniciarColetaActivity.this.finish();
            } else {
                IniciarColetaActivity.this.msg("Conectado");
                IniciarColetaActivity.this.mIsBluetoothConnected = true;
                IniciarColetaActivity.this.mReadThread = IniciarColetaActivity.this.new ReadInput();
            }
            IniciarColetaActivity.this.progressDialog.dismiss();
        }
    }

    private class DisConnectBT extends AsyncTask<Void, Void, Void> {
        private DisConnectBT() {
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... params) {
            if (IniciarColetaActivity.this.mReadThread != null) {
                IniciarColetaActivity.this.mReadThread.stop();
                while (IniciarColetaActivity.this.mReadThread.isRunning()) {
                }
                IniciarColetaActivity.this.mReadThread = null;
            }
            try {
                IniciarColetaActivity.this.mBTSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }

        /* JADX INFO: modificadores de acesso alterados de: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Void result) {
            super.onPostExecute((DisConnectBT) result);
            IniciarColetaActivity.this.mIsBluetoothConnected = false;
            if (IniciarColetaActivity.this.mIsUserInitiatedDisconnect) {
                IniciarColetaActivity.this.finish();
            }
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    class ReadInput implements Runnable {
        private Thread t = new Thread(this, "Input Thread");

        public ReadInput() {
            this.t.start();
        }

        public boolean isRunning() {
            return this.t.isAlive();
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                InputStream inputStream = IniciarColetaActivity.this.mBTSocket.getInputStream();
                while (!IniciarColetaActivity.this.bStop) {
                    byte[] buffer = new byte[150];
                    if (inputStream.available() > 0) {
                        inputStream.read(buffer);
                        final String strInput = new String(buffer, 0, 150);
                        IniciarColetaActivity.this.tiePeso.post(new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity$ReadInput$$ExternalSyntheticLambda0
                            @Override // java.lang.Runnable
                            public final void run() {
                                IniciarColetaActivity.ReadInput.this.lambda$run$0(strInput);
                            }
                        });
                    }
                    Thread.sleep(1000L);
                    IniciarColetaActivity.this.mBTSocket.getOutputStream().write(4);
                }
            } catch (IOException e) {
                System.out.println("IOException");
                e.printStackTrace();
            } catch (InterruptedException e2) {
                System.out.println("InterruptedException");
                e2.printStackTrace();
            }
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public /* sintético */ void lambda$run$0(String strInput) {
            IniciarColetaActivity.this.tiePeso.setText("");
            String sanatizedInput = strInput.replace(".", ",").replaceAll("[^\\d,]", " ").substring(33, 38);
            IniciarColetaActivity.this.tiePeso.setText(sanatizedInput);
            IniciarColetaActivity.this.bStop = true;
            int txtLength = IniciarColetaActivity.this.tiePeso.getEditableText().length();
            if (txtLength > IniciarColetaActivity.this.mMaxChars) {
                IniciarColetaActivity.this.tiePeso.getEditableText().delete(0, txtLength - IniciarColetaActivity.this.mMaxChars);
            }
        }

        public void stop() {
            IniciarColetaActivity.this.bStop = true;
        }
    }

    public void showToast(Context context, String message) {
        Toast toast = Toast.makeText(context, message, 1);
        toast.show();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public void msg(String s) {
        Toast.makeText(getApplicationContext(), s, 0).show();
    }
}
