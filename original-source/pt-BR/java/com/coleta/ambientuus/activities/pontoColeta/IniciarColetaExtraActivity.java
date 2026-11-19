package com.coleta.ambientuus.activities.pontoColeta;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.Editable;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.widget.SwitchCompat;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.BuscaDispositivoActivity;
import com.coleta.ambientuus.activities.bombona.LerBombonaActivity$$ExternalSyntheticLambda1;
import com.coleta.ambientuus.activities.main.BaseActivity;
import com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ClienteMTRTableManager;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.TipoResiduoTableManager;
import com.coleta.ambientuus.database.managers.VolumeTableManager;
import com.coleta.ambientuus.dto.ClienteMTR;
import com.coleta.ambientuus.dto.Coleta;
import com.coleta.ambientuus.dto.Manifesto;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.dto.TipoResiduo;
import com.coleta.ambientuus.dto.Volume;
import com.coleta.ambientuus.ui.MaterialAlertUtil;
import com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper;
import com.coleta.ambientuus.utils.BluetoothConnector;
import com.coleta.ambientuus.utils.BluetoothReader;
import com.coleta.ambientuus.utils.ButtonStyles;
import com.google.android.material.textfield.MaterialAutoCompleteTextView;
import com.google.android.material.textfield.TextInputEditText;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import j$.util.Objects;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

/* carregado de: classes14.dex */
public class IniciarColetaExtraActivity extends BaseActivity {
    private Boolean avulsa;
    private Boolean bluetoothConectado;
    private Button btnLerPeso;
    private BluetoothSocket mBTSocket;
    private BluetoothDevice mDevice;
    private UUID mDeviceUUID;
    private PontoColeta pontoColeta;
    private RadioButton radioPeso;
    private RadioButton radioQtd;
    private ActivityResultLauncher<Intent> readerLauncher;
    private ActivityResultLauncher<Intent> readerLauncherEtiqueta;
    private SwitchCompat smManterBombona;
    private SwitchCompat smManterNrMTR;
    private AutoCompleteTextView tieBombona;
    private AutoCompleteTextView tieCliente;
    private TextInputEditText tieEtiquetaExtra;
    private TextInputEditText tieNroMtrDc;
    private TextInputEditText tieObservacao;
    private TextInputEditText tiePeso;
    private MaterialAutoCompleteTextView tieResiduoExtra;
    private String tipoPesagem;
    private List<Volume> volumes;
    private DatabaseHelper databaseHelper = new DatabaseHelper(this);
    private Integer idTipoResiduo = 0;
    private Integer idClienteMTR = 0;
    private int mMaxChars = 1000;

    @Override // com.coleta.ambientuus.activities.main.BaseActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle saveInstanceState) {
        super.onCreate(saveInstanceState);
        setContentView(R.layout.activity_ponto_coleta_coletar_extra);
        this.pontoColeta = (PontoColeta) getIntent().getParcelableExtra("ponto");
        this.tipoPesagem = getIntent().getStringExtra("tipo");
        this.avulsa = Boolean.valueOf(getIntent().getBooleanExtra("avulsa", false));
        initFields();
        initDefaultData();
        loadDataBombona();
        loadDataTipoResiduo();
        initTipoColeta();
        initReader();
        initButtons();
        existsScale();
    }

    private void initFields() {
        this.tieCliente = (AutoCompleteTextView) findViewById(R.id.tieCliente);
        if (this.pontoColeta != null) {
            findViewById(R.id.clCliente).setVisibility(8);
        } else {
            loadSpinnerCliente();
        }
        this.tieNroMtrDc = (TextInputEditText) findViewById(R.id.tieNroMtrDc);
        this.smManterNrMTR = (SwitchCompat) findViewById(R.id.smManterNrMTR);
        this.tiePeso = (TextInputEditText) findViewById(R.id.tiePeso);
        this.radioQtd = (RadioButton) findViewById(R.id.radio_qtd);
        this.radioPeso = (RadioButton) findViewById(R.id.radio_peso);
        this.tieBombona = (AutoCompleteTextView) findViewById(R.id.tieBombona);
        this.smManterBombona = (SwitchCompat) findViewById(R.id.smManterBombona);
        this.tieObservacao = (TextInputEditText) findViewById(R.id.tieObservacao);
        this.tieEtiquetaExtra = (TextInputEditText) findViewById(R.id.tieEtiquetaExtra);
        this.tieResiduoExtra = (MaterialAutoCompleteTextView) findViewById(R.id.tieResiduoExtra);
    }

    public void initDefaultData() {
    }

    private void loadSpinnerCliente() {
        final List<ClienteMTR> lables = new ClienteMTRTableManager(this.databaseHelper.getDatabase()).getAllClientesMTR();
        final SearchableSpinnerDialogHelper<ClienteMTR> helper = new SearchableSpinnerDialogHelper<>();
        this.tieCliente.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda7
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaExtraActivity.this.lambda$loadSpinnerCliente$1(helper, lables, view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadSpinnerCliente$1(SearchableSpinnerDialogHelper helper, List lables, View v) {
        helper.showDialog(this, lables, "Selecione o Cliente", new LerBombonaActivity$$ExternalSyntheticLambda1(), this.tieCliente, this.tieCliente.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda6
            @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
            public final void onItemSelected(Object obj) {
                IniciarColetaExtraActivity.this.lambda$loadSpinnerCliente$0((ClienteMTR) obj);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadSpinnerCliente$0(ClienteMTR selectedMotorista) {
        this.idClienteMTR = Integer.valueOf(Integer.parseInt(selectedMotorista.getId_pessoa()));
    }

    public void loadDataTipoResiduo() {
        final List<TipoResiduo> tipoResiduos = new TipoResiduoTableManager(this.databaseHelper.getDatabase()).getAllTipoResiduo();
        final SearchableSpinnerDialogHelper<TipoResiduo> helper = new SearchableSpinnerDialogHelper<>();
        this.tieResiduoExtra.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaExtraActivity.this.lambda$loadDataTipoResiduo$3(helper, tipoResiduos, view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadDataTipoResiduo$3(SearchableSpinnerDialogHelper helper, List tipoResiduos, View v) {
        helper.showDialog(this, tipoResiduos, "Selecione o Tipo de Resíduo", new IniciarColetaActivity$$ExternalSyntheticLambda11(), this.tieResiduoExtra, this.tieResiduoExtra.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda5
            @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
            public final void onItemSelected(Object obj) {
                IniciarColetaExtraActivity.this.lambda$loadDataTipoResiduo$2((TipoResiduo) obj);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$loadDataTipoResiduo$2(TipoResiduo selectedItem) {
        this.idTipoResiduo = selectedItem.getId_tipo_residuo();
    }

    private void loadDataBombona() {
        this.volumes = new VolumeTableManager(this.databaseHelper.getDatabase()).getAllVolumes();
        ArrayAdapter<Volume> dataAdapter = new ArrayAdapter<>(this, android.R.layout.simple_dropdown_item_1line, this.volumes);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        this.tieBombona.setAdapter(dataAdapter);
    }

    private void initTipoColeta() {
        TextView tvTipoColeta = (TextView) findViewById(R.id.tvTipoColeta);
        String tipoPesagemTexto = this.tipoPesagem.substring(0, 1).toUpperCase() + this.tipoPesagem.substring(1).toLowerCase();
        tvTipoColeta.setText(tipoPesagemTexto);
    }

    private void initReader() {
        this.readerLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda2
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                IniciarColetaExtraActivity.this.lambda$initReader$4((ActivityResult) obj);
            }
        });
        this.readerLauncherEtiqueta = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda3
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                IniciarColetaExtraActivity.this.lambda$initReader$5((ActivityResult) obj);
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
        btnLerMTRDC.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda9
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaExtraActivity.this.lambda$initButtons$6(view);
            }
        });
        this.btnLerPeso = (Button) findViewById(R.id.btnLerPeso);
        this.btnLerPeso.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda10
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaExtraActivity.this.lambda$initButtons$7(view);
            }
        });
        Button btnLimpar = (Button) findViewById(R.id.btnLimpar);
        btnLimpar.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda11
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaExtraActivity.this.lambda$initButtons$8(view);
            }
        });
        Button btnFinalizar = (Button) findViewById(R.id.btnFinalizar);
        btnFinalizar.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda12
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaExtraActivity.this.lambda$initButtons$9(view);
            }
        });
        Button btnLerEtiquetaExtra = (Button) findViewById(R.id.btnLerEtiquetaExtra);
        btnLerEtiquetaExtra.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                IniciarColetaExtraActivity.this.lambda$initButtons$10(view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$6(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity.1
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(IniciarColetaExtraActivity.this, (Class<?>) ReaderLeitorActivity.class);
                IniciarColetaExtraActivity.this.readerLauncher.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(IniciarColetaExtraActivity.this, "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    /* renomeado de: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$2, motivo: nome de classe inválido */
    class AnonymousClass2 implements BluetoothReader.OnReadListener {
        AnonymousClass2() {
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public /* sintético */ void lambda$onRead$0(String valor) {
            IniciarColetaExtraActivity.this.tiePeso.setText(valor);
        }

        @Override // com.coleta.ambientuus.utils.BluetoothReader.OnReadListener
        public void onRead(final String valor) {
            IniciarColetaExtraActivity.this.runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$2$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    IniciarColetaExtraActivity.AnonymousClass2.this.lambda$onRead$0(valor);
                }
            });
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public /* sintético */ void lambda$onError$1(Exception e) {
            Toast.makeText(IniciarColetaExtraActivity.this, "Erro: " + e.getMessage(), 0).show();
        }

        @Override // com.coleta.ambientuus.utils.BluetoothReader.OnReadListener
        public void onError(final Exception e) {
            IniciarColetaExtraActivity.this.runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$2$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    IniciarColetaExtraActivity.AnonymousClass2.this.lambda$onError$1(e);
                }
            });
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$7(View v) {
        BluetoothReader reader = new BluetoothReader(this.mBTSocket);
        reader.startReading(new AnonymousClass2());
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$8(View v) {
        clearFields();
        initDefaultData();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$9(View v) {
        if (saveColeta()) {
            finalizeColeta(false);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$10(View v) {
        Intent intent = new Intent(this, (Class<?>) ReaderLeitorActivity.class);
        this.readerLauncherEtiqueta.launch(intent);
    }

    public void existsScale() {
        Intent intent = getIntent();
        Bundle b = intent.getExtras();
        if (intent.hasExtra(BuscaDispositivoActivity.DEVICE_EXTRA)) {
            this.bluetoothConectado = Boolean.valueOf(b.getBoolean("CONECTADO"));
            this.mDevice = (BluetoothDevice) b.getParcelable(BuscaDispositivoActivity.DEVICE_EXTRA);
            this.mDeviceUUID = UUID.fromString(b.getString(BuscaDispositivoActivity.DEVICE_UUID));
            this.mMaxChars = b.getInt(BuscaDispositivoActivity.BUFFER_SIZE);
            this.btnLerPeso.setVisibility(4);
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
        this.tieEtiquetaExtra.setText("");
        this.tieResiduoExtra.setText("");
    }

    public Coleta createColeta() {
        Integer idColetaLogradouro;
        Integer idDiaColeta;
        Integer idClienteSelecionado;
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        String hoje = dateFormat.format(dataAtual);
        SharedPreferences preferences = getSharedPreferences(BaseActivity.ARQUIVO_PREFERENCIA, 0);
        int idRota = preferences.getInt("id_rota", 0);
        String peso = this.tiePeso.getText().toString();
        Volume volume = getSelectedBombona();
        if (this.pontoColeta != null) {
            Integer idClienteSelecionado2 = this.pontoColeta.getIdCliente();
            Integer idColetaLogradouro2 = this.pontoColeta.getIdColetaLogradouro();
            Integer idDiaColeta2 = this.pontoColeta.getIdDiaColeta();
            idColetaLogradouro = idColetaLogradouro2;
            idDiaColeta = idDiaColeta2;
            idClienteSelecionado = idClienteSelecionado2;
        } else {
            Integer idClienteSelecionado3 = this.idClienteMTR;
            idColetaLogradouro = null;
            idDiaColeta = null;
            idClienteSelecionado = idClienteSelecionado3;
        }
        String peso2 = ((Editable) Objects.requireNonNull(this.tieNroMtrDc.getText())).toString();
        Coleta coleta = new Coleta(peso, peso2, hoje, Integer.valueOf(idRota), Integer.valueOf(volume != null ? Integer.parseInt(volume.getId_volume()) : 0), "N", "N", ExifInterface.LATITUDE_SOUTH, this.tieObservacao.getText().toString(), "N", idClienteSelecionado, this.radioQtd.isChecked() ? "QTD" : "LT", null, null, null, null, this.tieEtiquetaExtra.getText().toString(), this.idTipoResiduo.intValue() == 0 ? null : this.idTipoResiduo, null, idColetaLogradouro, idDiaColeta);
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
            showConfirm("Verifique", "Peso máximo permitido 100 Kg.", new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    IniciarColetaExtraActivity.this.lambda$validarCampos$11();
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
        MaterialAlertUtil.mostrarConfirmacao(this, titulo, msg, "Ok", null, new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity$$ExternalSyntheticLambda8
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                IniciarColetaExtraActivity.lambda$showConfirm$12(acao, dialogInterface, i);
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

    private boolean saveColeta() {
        Coleta coleta = createColeta();
        if (!validarCampos(coleta)) {
            return false;
        }
        new ColetaTableManager(this.databaseHelper.getWritableDatabase()).insert(coleta);
        return true;
    }

    public void finalizeColeta(Boolean pendente) {
        Intent intent = new Intent(this, (Class<?>) ListagemPontoColetaActivity.class);
        intent.setFlags(603979776);
        startActivity(intent);
        finish();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        if (this.bluetoothConectado.booleanValue() && this.mBTSocket == null) {
            BluetoothConnector.connectToDevice(this, this.mDevice, this.mDeviceUUID, new BluetoothConnector.BluetoothConnectionCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.IniciarColetaExtraActivity.3
                @Override // com.coleta.ambientuus.utils.BluetoothConnector.BluetoothConnectionCallback
                public void onConnected(BluetoothSocket socket) {
                    IniciarColetaExtraActivity.this.mBTSocket = socket;
                    Toast.makeText(IniciarColetaExtraActivity.this.getApplicationContext(), "Conectado com sucesso", 0).show();
                }

                @Override // com.coleta.ambientuus.utils.BluetoothConnector.BluetoothConnectionCallback
                public void onError(String message) {
                    Toast.makeText(IniciarColetaExtraActivity.this.getApplicationContext(), message, 1).show();
                }
            });
        }
        super.onResume();
    }
}
