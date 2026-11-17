package com.coleta.ambientuus.activities;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.app.ActivityCompat;
import androidx.exifinterface.media.ExifInterface;
import androidx.fragment.app.FragmentManager;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.ColetarActivity;
import com.coleta.ambientuus.activities.bombona.LeitorBombonaActivity;
import com.coleta.ambientuus.activities.main.SelecaoActivity;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.database.managers.ClienteMTRTableManager;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.ManifestoTableManager;
import com.coleta.ambientuus.database.managers.MovimentoBombonaTableManager;
import com.coleta.ambientuus.database.managers.VolumeTableManager;
import com.coleta.ambientuus.dto.ClienteMTR;
import com.coleta.ambientuus.dto.Coleta;
import com.coleta.ambientuus.dto.Etiqueta;
import com.coleta.ambientuus.dto.Manifesto;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.coleta.ambientuus.dto.Volume;
import com.coleta.ambientuus.fragments.EtiquetasManifestoFragment;
import com.coleta.ambientuus.fragments.ManifestosClienteFragment;
import com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper;
import com.google.zxing.Result;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import j$.util.Objects;
import j$.util.function.Function$CC;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.function.Function;
import me.dm7.barcodescanner.zxing.ZXingScannerView;

/* loaded from: classes3.dex */
public class ColetarActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener, ZXingScannerView.ResultHandler {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private static final String TAG = "BlueTest5-MainActivity";
    Button btnAdd;
    private Button btnLimparCamposColeta;
    private Integer capacidadeBombona;
    private CheckBox chbClienteAusente;
    private CheckBox chbColetaExtra;
    private CheckBox chbColetaSemResiduo;
    private Coleta coleta;
    EditText etNrMTR;
    private EditText etObservacao;
    EditText etPeso;
    private ActivityResultLauncher<Intent> leitorBombonaLauncher;
    private ActivityResultLauncher<Intent> leitorEtiquetaLauncher;
    private ActivityResultLauncher<Intent> leitorMTRLauncher;
    private String letras;
    ConstraintLayout llConteudo;
    private BluetoothSocket mBTSocket;
    private Button mBtnSendReq;
    private BluetoothDevice mDevice;
    private UUID mDeviceUUID;
    private TextView mostrarHoraData;
    DatabaseHelper myDB;
    private ProgressDialog progressDialog;
    private Integer recebeIdClienteMTR;
    private Integer recebeIdVolume;
    private ZXingScannerView scannerView;
    int setaIdRotaStatico;
    private TextView spinnerSelectCl;
    private Spinner spinnerVolume;
    private Switch swManterBombona;
    private Switch swManterEtiqueta;
    private Switch swManterMTR;
    private Switch swQtdLitro;
    private EditText tvCodBarrasBombonaLer;
    private EditText tvCodBarrasEtiquetaLer;
    private TextView tvRecPeso;
    private TextWatcher twCodBombona;
    private TextWatcher twCodEtiqueta;
    private String var1;
    private String resChbClAusente = "N";
    private String resChbColSemResiduo = "N";
    private String resChbColExtra = "N";
    private int mMaxChars = 1000;
    private ReadInput mReadThread = null;
    private boolean mIsUserInitiatedDisconnect = false;
    private boolean bluetoothConectado = false;
    private boolean mIsBluetoothConnected = false;
    private boolean bStop = false;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_coletar);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.myDB = new DatabaseHelper(this);
        initVariables();
        loadSpinnerCliente();
        loadSpinnerDataVolume();
        recuperarData();
        prepareReader();
        SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
        this.setaIdRotaStatico = preferences.getInt("id_rota", 0);
        existsScale();
        initFields();
        initButtons();
        this.scannerView.stopCamera();
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(true) { // from class: com.coleta.ambientuus.activities.ColetarActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                ColetarActivity.this.startActivity(new Intent(ColetarActivity.this, (Class<?>) SelecaoActivity.class));
                ColetarActivity.this.finish();
            }
        });
    }

    public void initVariables() {
        this.mostrarHoraData = (TextView) findViewById(R.id.txtDataHoraID);
        this.btnLimparCamposColeta = (Button) findViewById(R.id.btnLimparCamposPesoMtrID);
        this.mBtnSendReq = (Button) findViewById(R.id.btnRecPesoID);
        this.etPeso = (EditText) findViewById(R.id.txtEditPesoID);
        this.etPeso.setMovementMethod(new ScrollingMovementMethod());
        this.tvRecPeso = (TextView) findViewById(R.id.txtEditPesoBTID);
        this.tvRecPeso.setMovementMethod(new ScrollingMovementMethod());
        this.etNrMTR = (EditText) findViewById(R.id.txtEditNumeroMtrID);
        this.btnAdd = (Button) findViewById(R.id.btnAdicionarBaseID);
        this.chbClienteAusente = (CheckBox) findViewById(R.id.checkBoxCLAusente);
        this.chbColetaSemResiduo = (CheckBox) findViewById(R.id.checkBoxColSresiduo);
        this.chbColetaExtra = (CheckBox) findViewById(R.id.checkBoxColExtra);
        this.etObservacao = (EditText) findViewById(R.id.editTextObservacao);
        this.swManterEtiqueta = (Switch) findViewById(R.id.switchManterEtiqueta);
        this.swManterMTR = (Switch) findViewById(R.id.switchManterMTR);
        this.swManterBombona = (Switch) findViewById(R.id.switchManterBombona);
        this.swQtdLitro = (Switch) findViewById(R.id.switchQtdLitro);
        this.spinnerVolume = (Spinner) findViewById(R.id.spinnerVolume);
        this.spinnerVolume.setOnItemSelectedListener(this);
        this.scannerView = (ZXingScannerView) findViewById(R.id.zxscan);
        this.llConteudo = (ConstraintLayout) findViewById(R.id.layout_resultbotao);
        this.spinnerSelectCl = (TextView) findViewById(R.id.spinnerSelecionaCliente);
        this.tvCodBarrasBombonaLer = (EditText) findViewById(R.id.edtBombona);
        this.tvCodBarrasBombonaLer.setText((CharSequence) null);
        this.tvCodBarrasEtiquetaLer = (EditText) findViewById(R.id.edtEtiqueta);
    }

    public void clearData() {
        boolean manterMTR = this.swManterMTR.isChecked();
        boolean manterBombona = this.swManterBombona.isChecked();
        boolean manterEtique = this.swManterEtiqueta.isChecked();
        if (!manterMTR) {
            this.etNrMTR.setText("");
            this.spinnerSelectCl.setText("Selecione");
            this.recebeIdClienteMTR = 0;
            this.swQtdLitro.setChecked(false);
        }
        if (!manterBombona) {
            this.spinnerVolume.setSelection(0);
            this.recebeIdVolume = 0;
        }
        if (!manterEtique) {
            this.tvCodBarrasEtiquetaLer.setText("");
        }
        if (!manterMTR || !manterBombona) {
            this.etPeso.setText("");
            this.tvRecPeso.setText("");
            this.etObservacao.setText("");
            recuperarData();
            this.chbClienteAusente.setChecked(false);
            this.chbColetaSemResiduo.setChecked(false);
            this.chbColetaExtra.setChecked(false);
            this.resChbClAusente = "N";
            this.resChbColSemResiduo = "N";
            this.resChbColExtra = "N";
        }
        this.tvCodBarrasBombonaLer.setText((CharSequence) null);
        this.spinnerSelectCl.setEnabled(true);
        this.spinnerSelectCl.setClickable(true);
        this.spinnerVolume.setEnabled(true);
        this.spinnerVolume.setClickable(true);
    }

    public void prepareReader() {
        this.leitorMTRLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda5
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                ColetarActivity.this.lambda$prepareReader$0((ActivityResult) obj);
            }
        });
        this.leitorBombonaLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda6
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                ColetarActivity.this.lambda$prepareReader$1((ActivityResult) obj);
            }
        });
        this.leitorEtiquetaLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda7
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                ColetarActivity.this.lambda$prepareReader$2((ActivityResult) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$prepareReader$0(ActivityResult result) {
        Intent data;
        if (result.getResultCode() == 123 && (data = result.getData()) != null && data.getExtras().containsKey("valorDoLeitor")) {
            String retornoLeitor = data.getExtras().getString("valorDoLeitor");
            this.etNrMTR.setText(retornoLeitor);
            this.tvCodBarrasEtiquetaLer.setText((CharSequence) null);
            this.recebeIdClienteMTR = 0;
            this.spinnerSelectCl.setText("Selecione");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$prepareReader$1(ActivityResult result) {
        Intent data;
        if (result.getResultCode() == 123 && (data = result.getData()) != null) {
            this.tvCodBarrasBombonaLer.setText(data.getStringExtra("codigoBarrasBombona"));
            if (data.hasExtra("codigoBarrasBombona")) {
                onBombonaSelect(data.getStringExtra("codigoBarrasBombona"));
                this.capacidadeBombona = new BombonaTableManager(this.myDB.getDatabase()).selectCapacidadeBombonas(data.getStringExtra("codigoBarrasBombona"));
            }
            Integer idVolumeBombona = Integer.valueOf(data.getIntExtra("idVolumeBombona", 0));
            if (!this.swManterBombona.isChecked() && this.capacidadeBombona != null) {
                setSpinnerVolumeID(this.capacidadeBombona.toString());
            } else if (this.swManterBombona.isChecked() && idVolumeBombona.intValue() != 0) {
                setSpinnerVolumeID(idVolumeBombona.toString());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$prepareReader$2(ActivityResult result) {
        Intent data;
        if (result.getResultCode() == 124 && (data = result.getData()) != null) {
            String retornoLeitor = data.getExtras().getString("codigoBarrasEtiqueta");
            this.tvCodBarrasEtiquetaLer.setText(retornoLeitor);
        }
    }

    public void existsScale() {
        Intent intent = getIntent();
        Bundle b = intent.getExtras();
        if (intent.hasExtra(BuscaDispositivoActivity.DEVICE_EXTRA)) {
            this.bluetoothConectado = b.getBoolean("CONECTADO");
            this.mDevice = (BluetoothDevice) b.getParcelable(BuscaDispositivoActivity.DEVICE_EXTRA);
            this.mDeviceUUID = UUID.fromString(b.getString(BuscaDispositivoActivity.DEVICE_UUID));
            this.mMaxChars = b.getInt(BuscaDispositivoActivity.BUFFER_SIZE);
            this.etPeso.setVisibility(4);
            return;
        }
        this.bluetoothConectado = false;
        this.tvRecPeso.setVisibility(4);
        this.mBtnSendReq.setVisibility(4);
    }

    /* renamed from: com.coleta.ambientuus.activities.ColetarActivity$2, reason: invalid class name */
    class AnonymousClass2 implements TextWatcher {
        final Handler handler = new Handler();
        Runnable runnable = null;

        AnonymousClass2() {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            if (this.runnable != null) {
                this.handler.removeCallbacks(this.runnable);
            }
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(final Editable s) {
            this.runnable = new Runnable() { // from class: com.coleta.ambientuus.activities.ColetarActivity$2$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ColetarActivity.AnonymousClass2.this.lambda$afterTextChanged$0(s);
                }
            };
            this.handler.postDelayed(this.runnable, 800L);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$afterTextChanged$0(Editable s) {
            String textoFinal = s.toString();
            if (!textoFinal.isEmpty()) {
                ColetarActivity.this.onBombonaSelect(textoFinal);
            }
        }
    }

    private void initFields() {
        this.twCodBombona = new AnonymousClass2();
        this.tvCodBarrasBombonaLer.addTextChangedListener(this.twCodBombona);
        this.twCodEtiqueta = new AnonymousClass3();
        this.tvCodBarrasEtiquetaLer.addTextChangedListener(this.twCodEtiqueta);
    }

    /* renamed from: com.coleta.ambientuus.activities.ColetarActivity$3, reason: invalid class name */
    class AnonymousClass3 implements TextWatcher {
        final Handler handler = new Handler();
        Runnable runnable = null;

        AnonymousClass3() {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            if (this.runnable != null) {
                this.handler.removeCallbacks(this.runnable);
            }
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(final Editable s) {
            this.runnable = new Runnable() { // from class: com.coleta.ambientuus.activities.ColetarActivity$3$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ColetarActivity.AnonymousClass3.this.lambda$afterTextChanged$0(s);
                }
            };
            this.handler.postDelayed(this.runnable, 800L);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$afterTextChanged$0(Editable s) {
            String textoFinal = s.toString();
            if (!textoFinal.isEmpty()) {
                ColetarActivity.this.onEtiquetaSelect(textoFinal);
            }
        }
    }

    public void initButtons() {
        findViewById(R.id.btnAbrirCameraLeitorID).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda15
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$3(view);
            }
        });
        this.btnAdd.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda16
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$4(view);
            }
        });
        this.btnLimparCamposColeta.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda17
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$5(view);
            }
        });
        this.mBtnSendReq.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda18
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$6(view);
            }
        });
        findViewById(R.id.btnScanBombona).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$7(view);
            }
        });
        findViewById(R.id.btnScanEtiqueta).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$8(view);
            }
        });
        findViewById(R.id.btnListagemEtiquetaMTR).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$10(view);
            }
        });
        findViewById(R.id.btnBuscarMTR).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda4
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$initButtons$11(view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$3(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity.4
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                if (!ColetarActivity.this.bluetoothConectado) {
                    Intent intent = new Intent(ColetarActivity.this, (Class<?>) LeitormtrActivity.class);
                    intent.putExtra("naoconectado", true);
                    if (!ColetarActivity.this.tvCodBarrasBombonaLer.getText().toString().isEmpty()) {
                        intent.putExtra("codigoBarrasBombona", ColetarActivity.this.tvCodBarrasBombonaLer.getText().toString());
                    }
                    ColetarActivity.this.leitorMTRLauncher.launch(intent);
                    return;
                }
                ColetarActivity.this.btnAdd.setVisibility(4);
                ColetarActivity.this.btnLimparCamposColeta.setVisibility(4);
                ColetarActivity.this.scannerView.setResultHandler(ColetarActivity.this);
                ColetarActivity.this.scannerView.startCamera();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                ColetarActivity.this.showToast(ColetarActivity.this, "Precisa da permissao da camera");
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
        if (this.bluetoothConectado) {
            this.llConteudo.setVisibility(4);
            this.scannerView.setVisibility(0);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$4(View v) {
        processarColeta();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$5(View v) {
        if (this.bluetoothConectado) {
            this.bStop = false;
            this.mReadThread = new ReadInput();
        }
        clearDataTotal();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$6(View v) {
        if (this.bluetoothConectado) {
            this.bStop = false;
            this.mReadThread = new ReadInput();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$7(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity.5
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(ColetarActivity.this, (Class<?>) LeitorBombonaActivity.class);
                intent.putExtra("ORIGEM", "C");
                intent.putExtra("idVolumeBombona", ColetarActivity.this.spinnerVolume.getSelectedItemPosition());
                ColetarActivity.this.leitorBombonaLauncher.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(ColetarActivity.this, "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$8(View v) {
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity.6
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(ColetarActivity.this, (Class<?>) LeitorBombonaActivity.class);
                intent.putExtra("ORIGEM", "ET");
                ColetarActivity.this.leitorEtiquetaLauncher.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(ColetarActivity.this, "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$10(View v) {
        String nroManifesto = this.etNrMTR.getText().toString();
        if (!nroManifesto.isEmpty()) {
            Manifesto manifesto = new ManifestoTableManager(new DatabaseHelper(v.getContext()).getDatabase()).selectManifestoCod(nroManifesto);
            if (manifesto != null) {
                ArrayList<Etiqueta> etiquetas = new EtiquetaTableManager(new DatabaseHelper(v.getContext()).getDatabase()).selectEtiquetaManifesto(manifesto.getId_manifesto());
                EtiquetasManifestoFragment bottomSheet = new EtiquetasManifestoFragment(etiquetas);
                bottomSheet.setOnItemSelecionadoListener(new EtiquetasManifestoFragment.OnItemSelecionadoListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda10
                    @Override // com.coleta.ambientuus.fragments.EtiquetasManifestoFragment.OnItemSelecionadoListener
                    public final void onItemSelecionado(String str) {
                        ColetarActivity.this.lambda$initButtons$9(str);
                    }
                });
                FragmentManager fm = getSupportFragmentManager();
                bottomSheet.show(fm, "EtiquetasManifestoBottomSheet");
                return;
            }
            mostrarAlerta("Atenção", "Manifesto informado não encontrado na base do aplicativo");
            return;
        }
        mostrarAlerta("Atenção", "Informe o Número de MTR antes de selecionar as etiquetas!");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$9(String item) {
        this.tvCodBarrasEtiquetaLer.setText(item);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButtons$11(View v) {
        openManifestosCliente(null);
    }

    public void clearDataTotal() {
        this.etNrMTR.setText("");
        this.etPeso.setText("");
        this.tvRecPeso.setText("");
        this.etObservacao.setText("");
        recuperarData();
        this.chbClienteAusente.setChecked(false);
        this.chbColetaSemResiduo.setChecked(false);
        this.chbColetaExtra.setChecked(false);
        this.spinnerVolume.setSelection(0);
        this.spinnerSelectCl.setText("Selecione");
        this.recebeIdClienteMTR = 0;
        this.resChbClAusente = "N";
        this.resChbColSemResiduo = "N";
        this.resChbColExtra = "N";
        this.recebeIdVolume = 0;
        this.swManterBombona.setChecked(false);
        this.swManterMTR.setChecked(false);
        this.swQtdLitro.setChecked(false);
        this.tvCodBarrasBombonaLer.setText((CharSequence) null);
        this.tvCodBarrasEtiquetaLer.setText((CharSequence) null);
        this.swManterEtiqueta.setChecked(false);
        this.spinnerSelectCl.setEnabled(true);
        this.spinnerSelectCl.setClickable(true);
        this.spinnerVolume.setEnabled(true);
        this.spinnerVolume.setClickable(true);
    }

    public void onCheckboxClicked(View view) {
        if (view.getId() == R.id.checkBoxCLAusente) {
            if (this.chbClienteAusente.isChecked()) {
                this.chbColetaExtra.setChecked(false);
                this.chbColetaSemResiduo.setChecked(false);
                this.resChbClAusente = ExifInterface.LATITUDE_SOUTH;
                this.resChbColSemResiduo = "N";
                this.resChbColExtra = "N";
                return;
            }
            this.chbColetaExtra.setChecked(false);
            this.chbColetaSemResiduo.setChecked(false);
            this.resChbClAusente = "N";
            this.resChbColSemResiduo = "N";
            this.resChbColExtra = "N";
            return;
        }
        if (view.getId() == R.id.checkBoxColExtra) {
            if (this.chbColetaExtra.isChecked()) {
                this.chbClienteAusente.setChecked(false);
                this.chbColetaSemResiduo.setChecked(false);
                this.resChbClAusente = "N";
                this.resChbColSemResiduo = "N";
                this.resChbColExtra = ExifInterface.LATITUDE_SOUTH;
                return;
            }
            this.chbClienteAusente.setChecked(false);
            this.chbColetaSemResiduo.setChecked(false);
            this.resChbClAusente = "N";
            this.resChbColSemResiduo = "N";
            this.resChbColExtra = "N";
            return;
        }
        if (view.getId() == R.id.checkBoxColSresiduo) {
            if (this.chbColetaSemResiduo.isChecked()) {
                this.chbClienteAusente.setChecked(false);
                this.chbColetaExtra.setChecked(false);
                this.resChbClAusente = "N";
                this.resChbColSemResiduo = ExifInterface.LATITUDE_SOUTH;
                this.resChbColExtra = "N";
                return;
            }
            this.chbClienteAusente.setChecked(false);
            this.chbColetaExtra.setChecked(false);
            this.resChbClAusente = "N";
            this.resChbColSemResiduo = "N";
            this.resChbColExtra = "N";
        }
    }

    @Override // me.dm7.barcodescanner.zxing.ZXingScannerView.ResultHandler
    public void handleResult(Result rawResult) {
        this.btnAdd.setVisibility(0);
        this.btnLimparCamposColeta.setVisibility(0);
        this.scannerView.stopCamera();
        this.llConteudo.setVisibility(0);
        this.scannerView.setVisibility(4);
        this.letras = rawResult.getText();
        processaresultado();
    }

    public void processaresultado() {
        if (this.letras.length() > 10) {
            this.var1 = this.letras.substring(0, 10);
        } else {
            this.var1 = this.letras;
        }
        if (this.var1.length() == 10) {
            this.etNrMTR.setText(this.var1);
        } else {
            this.etNrMTR.setText("");
            showToast(this, " ERRO AO LER CODIGO DE BARRAS ");
        }
    }

    public void AddData() {
        SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
        String idRotaPref = String.valueOf(preferences.getInt("id_rota", 0));
        Integer idFrotaVeiculoPref = Integer.valueOf(preferences.getInt("id_frota_veiculo", 0));
        String erroMensagem = "";
        if (isCodigoBarraValido(this.coleta.getCod_bombona())) {
            erroMensagem = processaComCodigoBarra(idRotaPref, idFrotaVeiculoPref);
        } else {
            salvaDadosSemCodigoBarra();
        }
        showToast(this, erroMensagem.isEmpty() ? "Dados incluídos com sucesso!" : erroMensagem);
    }

    private boolean isCodigoBarraValido(String codBarra) {
        return (codBarra == null || codBarra.isEmpty()) ? false : true;
    }

    private String processaComCodigoBarra(String idRotaPref, Integer idFrotaVeiculoPref) {
        String erroCad = new BombonaTableManager(this.myDB.getDatabase()).validaCadastroBombona(this.coleta.getCod_bombona());
        if (erroCad != null) {
            return erroCad;
        }
        String erroValida = new MovimentoBombonaTableManager(this.myDB.getDatabase()).validaBombona(this.coleta.getCod_bombona(), "C");
        if (erroValida != null) {
            return erroValida;
        }
        String idColeta = new ColetaTableManager(this.myDB.getWritableDatabase()).insert(this.coleta);
        if (!"NULL".equals(idColeta)) {
            MovimentoBombona movimentoBombona = new MovimentoBombona(this.coleta.getCod_bombona(), this.coleta.getId_cliente_mtr(), "C", idColeta, idRotaPref, idFrotaVeiculoPref);
            MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(this.myDB.getDatabase());
            movimentoBombonaTableManager.insert(movimentoBombona);
            return "";
        }
        return "";
    }

    private void salvaDadosSemCodigoBarra() {
        new ColetaTableManager(this.myDB.getWritableDatabase()).insert(this.coleta);
    }

    public void recuperarData() {
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String hoje = dateFormat.format(dataAtual);
        this.mostrarHoraData.setText(hoje);
    }

    private void loadSpinnerDataVolume() {
        List<Volume> volumes = new VolumeTableManager(this.myDB.getDatabase()).getAllVolumes();
        volumes.add(0, new Volume("0", "SELECIONE A BOMBONA", Float.valueOf(0.0f)));
        ArrayAdapter<Volume> dataAdapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, volumes);
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        this.spinnerVolume.setAdapter((SpinnerAdapter) dataAdapter);
    }

    private void setSpinnerVolumeID(String idVolume) {
        ArrayAdapter<Volume> adapter = (ArrayAdapter) this.spinnerVolume.getAdapter();
        for (int i = 0; i < adapter.getCount(); i++) {
            Volume v = adapter.getItem(i);
            if (v != null && v.getId_volume().equals(idVolume)) {
                this.spinnerVolume.setSelection(i);
                return;
            }
        }
    }

    private void loadSpinnerCliente() {
        final List<ClienteMTR> lables = new ClienteMTRTableManager(this.myDB.getDatabase()).getAllClientesMTR();
        final SearchableSpinnerDialogHelper<ClienteMTR> helper = new SearchableSpinnerDialogHelper<>();
        this.spinnerSelectCl.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda9
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ColetarActivity.this.lambda$loadSpinnerCliente$13(helper, lables, view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$loadSpinnerCliente$13(SearchableSpinnerDialogHelper helper, List lables, final View v) {
        helper.showDialog(this, lables, "Selecione o Cliente", new Function() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda12
            @Override // java.util.function.Function
            public /* synthetic */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return ((ClienteMTR) obj).getRazao_social();
            }

            @Override // java.util.function.Function
            public /* synthetic */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, this.spinnerSelectCl, this.spinnerSelectCl.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda13
            @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
            public final void onItemSelected(Object obj) {
                ColetarActivity.this.lambda$loadSpinnerCliente$12(v, (ClienteMTR) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$loadSpinnerCliente$12(View v, ClienteMTR selectedMotorista) {
        this.recebeIdClienteMTR = Integer.valueOf(Integer.parseInt(selectedMotorista.getId_pessoa()));
        this.etNrMTR.setText((CharSequence) null);
        ArrayList<Manifesto> manifestos = new ManifestoTableManager(new DatabaseHelper(v.getContext()).getDatabase()).selectManifestosCliente(String.valueOf(this.recebeIdClienteMTR));
        if (!manifestos.isEmpty()) {
            if (manifestos.size() > 1) {
                openManifestosCliente(manifestos);
            } else {
                Manifesto manifesto = manifestos.get(0);
                this.etNrMTR.setText(manifesto.getNumero_manifesto());
            }
        }
    }

    public void openManifestosCliente(ArrayList<Manifesto> manifestosCliente) {
        ArrayList<Manifesto> manifestos = manifestosCliente;
        if (manifestosCliente == null) {
            manifestos = new ManifestoTableManager(new DatabaseHelper(getApplicationContext()).getDatabase()).selectManifestosCliente(String.valueOf(this.recebeIdClienteMTR));
        }
        ManifestosClienteFragment bottomSheet = new ManifestosClienteFragment(manifestos);
        bottomSheet.setOnItemSelecionadoListener(new ManifestosClienteFragment.OnItemSelecionadoListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda8
            @Override // com.coleta.ambientuus.fragments.ManifestosClienteFragment.OnItemSelecionadoListener
            public final void onItemSelecionado(String str) {
                ColetarActivity.this.lambda$openManifestosCliente$14(str);
            }
        });
        FragmentManager fm = getSupportFragmentManager();
        bottomSheet.show(fm, "ManifestosClienteBottomSheet");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$openManifestosCliente$14(String item) {
        this.etNrMTR.setText(item);
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
        if (parent.getId() == R.id.spinnerVolume) {
            int itemId = Integer.parseInt(((Volume) this.spinnerVolume.getSelectedItem()).getId_volume());
            this.recebeIdVolume = Integer.valueOf(itemId);
            if (this.spinnerVolume.getSelectedItemPosition() != 0 && this.etNrMTR.getText().toString() == null) {
                Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity.7
                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionGranted(PermissionGrantedResponse response) {
                        if (!ColetarActivity.this.bluetoothConectado) {
                            Intent intent = new Intent(ColetarActivity.this, (Class<?>) LeitormtrActivity.class);
                            intent.putExtra("naoconectado", true);
                            ColetarActivity.this.startActivity(intent);
                        } else if (ColetarActivity.this.bluetoothConectado) {
                            ColetarActivity.this.scannerView.setResultHandler(ColetarActivity.this);
                            ColetarActivity.this.scannerView.startCamera();
                        }
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionDenied(PermissionDeniedResponse response) {
                        ColetarActivity.this.showToast(ColetarActivity.this, "Precisa da permissao da camera");
                    }

                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                    }
                }).check();
                if (this.bluetoothConectado) {
                    this.llConteudo.setVisibility(4);
                    this.scannerView.setVisibility(0);
                }
            }
        }
    }

    @Override // android.widget.AdapterView.OnItemSelectedListener
    public void onNothingSelected(AdapterView<?> arg0) {
    }

    private class ReadInput implements Runnable {
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
                InputStream inputStream = ColetarActivity.this.mBTSocket.getInputStream();
                while (!ColetarActivity.this.bStop) {
                    byte[] buffer = new byte[150];
                    if (inputStream.available() > 0) {
                        inputStream.read(buffer);
                        final String strInput = new String(buffer, 0, 150);
                        ColetarActivity.this.tvRecPeso.post(new Runnable() { // from class: com.coleta.ambientuus.activities.ColetarActivity.ReadInput.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ColetarActivity.this.tvRecPeso.setText("");
                                ColetarActivity.this.tvRecPeso.append(strInput.replace(".", ",").replaceAll("[^\\d,]", " "), 33, 38);
                                ColetarActivity.this.bStop = true;
                                int txtLength = ColetarActivity.this.tvRecPeso.getEditableText().length();
                                if (txtLength > ColetarActivity.this.mMaxChars) {
                                    ColetarActivity.this.tvRecPeso.getEditableText().delete(0, txtLength - ColetarActivity.this.mMaxChars);
                                }
                            }
                        });
                    }
                    Thread.sleep(1000L);
                    ColetarActivity.this.mBTSocket.getOutputStream().write(4);
                }
            } catch (IOException e) {
                System.out.println("IOException");
                e.printStackTrace();
            } catch (InterruptedException e2) {
                System.out.println("InterruptedException");
                e2.printStackTrace();
            }
        }

        public void stop() {
            ColetarActivity.this.bStop = true;
        }
    }

    private class DisConnectBT extends AsyncTask<Void, Void, Void> {
        private DisConnectBT() {
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... params) {
            if (ColetarActivity.this.mReadThread != null) {
                ColetarActivity.this.mReadThread.stop();
                while (ColetarActivity.this.mReadThread.isRunning()) {
                }
                ColetarActivity.this.mReadThread = null;
            }
            try {
                ColetarActivity.this.mBTSocket.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Void result) {
            super.onPostExecute((DisConnectBT) result);
            ColetarActivity.this.mIsBluetoothConnected = false;
            if (ColetarActivity.this.mIsUserInitiatedDisconnect) {
                ColetarActivity.this.finish();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void msg(String s) {
        Toast.makeText(getApplicationContext(), s, 0).show();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        if (this.bluetoothConectado && this.mBTSocket != null && this.mIsBluetoothConnected) {
            new DisConnectBT().execute(new Void[0]);
        }
        super.onPause();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        if (this.bluetoothConectado && (this.mBTSocket == null || !this.mIsBluetoothConnected)) {
            new ConnectBT().execute(new Void[0]);
        }
        super.onResume();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
    }

    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
    }

    private class ConnectBT extends AsyncTask<Void, Void, Void> {
        private boolean mConnectSuccessful;

        private ConnectBT() {
            this.mConnectSuccessful = true;
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            ColetarActivity.this.progressDialog = ProgressDialog.show(ColetarActivity.this, "Espere", "Estamos conectando");
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Void doInBackground(Void... devices) {
            if (ColetarActivity.this.mBTSocket == null || !ColetarActivity.this.mIsBluetoothConnected) {
                Dexter.withActivity(ColetarActivity.this).withPermission("android.permission.BLUETOOTH_CONNECT").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity.ConnectBT.1
                    @Override // com.karumi.dexter.listener.single.PermissionListener
                    public void onPermissionGranted(PermissionGrantedResponse response) {
                        try {
                        } catch (IOException e) {
                            ColetarActivity.this.runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.ColetarActivity.ConnectBT.1.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    Toast.makeText(ColetarActivity.this, e.getMessage().toString(), 1).show();
                                }
                            });
                            ConnectBT.this.mConnectSuccessful = false;
                        }
                        if (ActivityCompat.checkSelfPermission(ColetarActivity.this, "android.permission.BLUETOOTH_CONNECT") != 0) {
                            return;
                        }
                        ColetarActivity.this.mBTSocket = ColetarActivity.this.mDevice.createInsecureRfcommSocketToServiceRecord(ColetarActivity.this.mDeviceUUID);
                        BluetoothAdapter.getDefaultAdapter().cancelDiscovery();
                        try {
                            ColetarActivity.this.mBTSocket.connect();
                        } catch (IOException e2) {
                            ColetarActivity.this.runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.activities.ColetarActivity.ConnectBT.1.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    Toast.makeText(ColetarActivity.this, e2.getMessage().toString(), 1).show();
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

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Void result) {
            super.onPostExecute((ConnectBT) result);
            if (!this.mConnectSuccessful) {
                ColetarActivity.this.showToast(ColetarActivity.this, "Não foi possivel conectar");
                ColetarActivity.this.finish();
            } else {
                ColetarActivity.this.msg("Conectado");
                ColetarActivity.this.mIsBluetoothConnected = true;
                ColetarActivity.this.mReadThread = ColetarActivity.this.new ReadInput();
            }
            ColetarActivity.this.progressDialog.dismiss();
        }
    }

    public void showToast(Context context, String message) {
        Toast toast = Toast.makeText(context, message, 1);
        toast.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onBombonaSelect(String codBombonaSel) {
        Cursor info = new BombonaTableManager(this.myDB.getDatabase()).getInfoBombona(codBombonaSel);
        this.spinnerSelectCl.setText("Selecione");
        this.spinnerVolume.setSelection(0);
        this.spinnerSelectCl.setEnabled(true);
        this.spinnerSelectCl.setClickable(true);
        this.spinnerVolume.setEnabled(true);
        this.spinnerVolume.setClickable(true);
        if (info.getCount() > 0) {
            ArrayAdapter<Volume> dataAdapterVol = (ArrayAdapter) this.spinnerVolume.getAdapter();
            String idCliente = null;
            String nomeCliente = null;
            String idVolume = null;
            String descVolume = null;
            while (info.moveToNext()) {
                idCliente = String.valueOf(info.getInt(0));
                nomeCliente = info.getString(1);
                idVolume = info.getString(2);
                descVolume = info.getString(3);
            }
            if (idCliente != null && !idCliente.equals("0")) {
                this.spinnerSelectCl.setText(nomeCliente);
                this.spinnerSelectCl.setEnabled(false);
                this.spinnerSelectCl.setClickable(false);
            }
            if (descVolume != null) {
                Volume volumeBombona = new Volume(idVolume, descVolume, Float.valueOf(0.0f));
                int pos = dataAdapterVol.getPosition(volumeBombona);
                if (pos >= 0) {
                    this.spinnerVolume.setSelection(pos);
                    this.spinnerVolume.setEnabled(false);
                    this.spinnerVolume.setClickable(false);
                } else {
                    Log.w("SPINNER_VOLUME", "Volume não encontrado no adapter: " + volumeBombona.getDescricao());
                    this.spinnerVolume.setSelection(0);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onEtiquetaSelect(String etiqueta) {
        EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(this.myDB.getDatabase());
        ClienteMTRTableManager clienteMTRTableManager = new ClienteMTRTableManager(this.myDB.getDatabase());
        Manifesto manifesto = etiquetaTableManager.retornaManifestoEtiqueta(etiqueta);
        this.etNrMTR.setText((CharSequence) null);
        this.recebeIdClienteMTR = 0;
        this.spinnerSelectCl.setText("Selecione");
        if (manifesto != null) {
            this.etNrMTR.setText(manifesto.getNumero_manifesto());
            ClienteMTR cliente = clienteMTRTableManager.getClienteMTR(manifesto.getId_pessoa());
            if (!cliente.getRazao_social().isEmpty()) {
                this.recebeIdClienteMTR = manifesto.getId_pessoa();
                this.spinnerSelectCl.setText(cliente.getRazao_social());
            }
        }
    }

    private void processarColeta() {
        this.coleta = new Coleta(this.bluetoothConectado ? this.tvRecPeso.getText().toString() : this.etPeso.getText().toString(), this.etNrMTR.getText().toString(), this.mostrarHoraData.getText().toString(), Integer.valueOf(this.setaIdRotaStatico), Integer.valueOf((this.recebeIdVolume == null || this.recebeIdVolume.intValue() == 0) ? 0 : Integer.valueOf(String.valueOf(this.recebeIdVolume)).intValue()), this.resChbClAusente, this.resChbColSemResiduo, this.resChbColExtra, this.etObservacao.getText().toString(), "N", Integer.valueOf((this.recebeIdClienteMTR == null || this.recebeIdClienteMTR.intValue() == 0) ? 0 : this.recebeIdClienteMTR.intValue()), this.swQtdLitro.isChecked() ? "LT" : "QTD", this.tvCodBarrasBombonaLer.getText().toString(), null, null, null, this.tvCodBarrasEtiquetaLer.getText().toString(), null, null, null, null);
        if (this.coleta.getPeso().isEmpty()) {
            this.coleta.setPeso("0,00");
        }
        if (validarBombona(this.coleta.getCod_bombona())) {
            float peso = Float.parseFloat(this.coleta.getPeso().replace(",", "."));
            if (peso > 100.0f) {
                mostrarAlerta("Verifique", "Peso máximo permitido 100 Kg.", new Runnable() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda14
                    @Override // java.lang.Runnable
                    public final void run() {
                        ColetarActivity.this.lambda$processarColeta$15();
                    }
                });
                return;
            }
            if (!validarCampos(this.coleta.getNumero_mtr(), this.coleta.getPeso(), this.coleta.getObservacao(), this.coleta.getId_volume(), this.coleta.getCliente_ausente(), this.coleta.getColeta_sem_residuo(), this.coleta.getColeta_extra(), this.coleta.getCod_Etiqueta())) {
                return;
            }
            AddData();
            clearData();
            if (this.bluetoothConectado) {
                this.bStop = false;
                this.mReadThread = new ReadInput();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$processarColeta$15() {
        this.etPeso.setText("0,00");
    }

    private boolean validarBombona(String codigo) {
        String erro;
        if (codigo == null || codigo.isEmpty() || (erro = new BombonaTableManager(this.myDB.getDatabase()).validaCadastroBombona(codigo)) == null || erro.isEmpty()) {
            return true;
        }
        mostrarAlerta("Erro", erro);
        return false;
    }

    private boolean validarCampos(String nrMTR, String peso, String obs, int idVolume, String ausente, String semResiduo, String extra, String codEtiqueta) {
        boolean mtrValido = nrMTR.length() == 10;
        boolean pesoZero = peso.equals("0,00") || peso.equals(" 0,00") || peso.equals("0");
        boolean temVolume = idVolume != 0;
        if (!ausente.equals(ExifInterface.LATITUDE_SOUTH) && !semResiduo.equals(ExifInterface.LATITUDE_SOUTH)) {
            if (extra.equals(ExifInterface.LATITUDE_SOUTH)) {
                if (!mtrValido) {
                    mostrarToast("Verifique o tamanho do MTR/DC (10)");
                    return false;
                }
                if (peso.isEmpty()) {
                    mostrarToast("Informe o Peso");
                    return false;
                }
                if (obs.isEmpty()) {
                    mostrarToast("Preencha o campo Observação");
                    return false;
                }
                if (temVolume) {
                    return true;
                }
                mostrarToast("Selecione uma bombona");
                return false;
            }
            if (codEtiqueta.isEmpty()) {
                mostrarToast("Informe uma etiqueta");
                return false;
            }
            EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(this.myDB.getDatabase());
            Manifesto manifestoEtiqueta = etiquetaTableManager.retornaManifestoEtiqueta(codEtiqueta);
            if (manifestoEtiqueta != null && !Objects.equals(manifestoEtiqueta.getNumero_manifesto(), nrMTR)) {
                mostrarToast("Etiqueta informada não pertence a esse manifesto");
                return false;
            }
            if (!peso.isEmpty() && mtrValido && temVolume) {
                return true;
            }
            if (!mtrValido) {
                mostrarToast("Verifique o tamanho do MTR/DC (10)");
            } else if (peso.isEmpty()) {
                mostrarToast("Informe o peso");
            } else {
                mostrarToast("Selecione uma Bombona");
            }
            return false;
        }
        if (mtrValido && pesoZero) {
            return true;
        }
        if (!mtrValido) {
            mostrarToast("Verifique o tamanho do MTR/DC (10)");
        } else {
            mostrarToast("Peso deve ser 0,00");
        }
        return false;
    }

    private void mostrarAlerta(String titulo, String msg) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle(titulo);
        alertDialog.setMessage(msg);
        alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        });
        alertDialog.show();
    }

    private void mostrarAlerta(String titulo, String msg, final Runnable acao) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle(titulo);
        alertDialog.setMessage(msg);
        alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.ColetarActivity$$ExternalSyntheticLambda11
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                ColetarActivity.lambda$mostrarAlerta$17(acao, dialogInterface, i);
            }
        });
        alertDialog.show();
    }

    static /* synthetic */ void lambda$mostrarAlerta$17(Runnable acao, DialogInterface dialog, int which) {
        acao.run();
        dialog.dismiss();
    }

    private void mostrarToast(String mensagem) {
        showToast(this, mensagem);
    }
}
