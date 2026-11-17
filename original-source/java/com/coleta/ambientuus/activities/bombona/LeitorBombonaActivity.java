package com.coleta.ambientuus.activities.bombona;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AppCompatActivity;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.ColetarActivity;
import com.coleta.ambientuus.activities.TerceirosActivity;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.database.managers.MovimentoBombonaTableManager;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.google.zxing.Result;
import me.dm7.barcodescanner.zxing.ZXingScannerView;

/* loaded from: classes14.dex */
public class LeitorBombonaActivity extends AppCompatActivity implements ZXingScannerView.ResultHandler {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private String clienteSelectinado;
    private Integer idClienteSel;
    private Integer idVolumeBombona;
    private String origem;
    private ZXingScannerView scannerView;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.reader_leitor_bombona);
        boolean z = true;
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            this.clienteSelectinado = extras.getString("ClienteSelectinado");
            this.idClienteSel = Integer.valueOf(extras.getInt("IdPessoaClienteSelecionado"));
            this.origem = extras.getString("ORIGEM");
            if (this.origem.startsWith("C")) {
                this.idVolumeBombona = Integer.valueOf(extras.getInt("idVolumeBombona"));
            }
        }
        this.scannerView = (ZXingScannerView) findViewById(R.id.zxscanBombona);
        this.scannerView.setResultHandler(this);
        this.scannerView.startCamera();
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // from class: com.coleta.ambientuus.activities.bombona.LeitorBombonaActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                if (LeitorBombonaActivity.this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
                    Intent intent = new Intent(LeitorBombonaActivity.this, (Class<?>) LerBombonaActivity.class);
                    intent.putExtra("ClienteSelectinado", LeitorBombonaActivity.this.clienteSelectinado);
                    intent.putExtra("IdPessoaClienteSelecionado", LeitorBombonaActivity.this.idClienteSel);
                    LeitorBombonaActivity.this.startActivity(intent);
                } else if (LeitorBombonaActivity.this.origem.startsWith("TR")) {
                    LeitorBombonaActivity.this.startActivity(new Intent(LeitorBombonaActivity.this, (Class<?>) CarregarBombonaActivity.class));
                } else if (LeitorBombonaActivity.this.origem.startsWith("B")) {
                    LeitorBombonaActivity.this.startActivity(new Intent(LeitorBombonaActivity.this, (Class<?>) BaixaBombonaActivity.class));
                } else if (LeitorBombonaActivity.this.origem.startsWith("TC")) {
                    Intent intent2 = new Intent(LeitorBombonaActivity.this, (Class<?>) TerceirosActivity.class);
                    intent2.putExtra("ClienteSelectinado", LeitorBombonaActivity.this.clienteSelectinado);
                    intent2.putExtra("IdPessoaClienteSelecionado", LeitorBombonaActivity.this.idClienteSel);
                    LeitorBombonaActivity.this.startActivity(intent2);
                } else if (LeitorBombonaActivity.this.origem.startsWith("L")) {
                    LeitorBombonaActivity.this.startActivity(new Intent(LeitorBombonaActivity.this, (Class<?>) TerceirosActivity.ListBombonaViewActivity.class));
                }
                LeitorBombonaActivity.this.finish();
            }
        });
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        this.scannerView.stopCamera();
        super.onDestroy();
    }

    @Override // me.dm7.barcodescanner.zxing.ZXingScannerView.ResultHandler
    public void handleResult(Result rawResult) {
        String texto = rawResult.getText();
        this.scannerView.stopCamera();
        if (this.origem.startsWith("TR") || this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS) || this.origem.startsWith("B") || this.origem.startsWith("TC")) {
            insereMovimento(texto);
            return;
        }
        if (!this.origem.startsWith("C")) {
            if (this.origem.startsWith("L")) {
                MediaPlayer mediaPlayer = MediaPlayer.create(this, R.raw.beep_ok);
                mediaPlayer.start();
                Intent intent = new Intent(this, (Class<?>) TerceirosActivity.ListBombonaViewActivity.class);
                intent.putExtra("codigoBarrasBombona", texto);
                startActivity(intent);
                return;
            }
            if (this.origem.startsWith("ET")) {
                MediaPlayer mediaPlayer2 = MediaPlayer.create(this, R.raw.beep_ok);
                mediaPlayer2.start();
                Intent intent2 = new Intent(this, (Class<?>) ColetarActivity.class);
                intent2.putExtra("codigoBarrasEtiqueta", texto);
                setResult(124, intent2);
                finish();
                return;
            }
            return;
        }
        DatabaseHelper myDb = new DatabaseHelper(this);
        String validaBombona = new MovimentoBombonaTableManager(myDb.getDatabase()).validaBombona(texto, "C");
        if (validaBombona != null) {
            MediaPlayer mediaPlayer3 = MediaPlayer.create(this, R.raw.beep_erro);
            mediaPlayer3.start();
            AlertDialog alertDialog = new AlertDialog.Builder(this).create();
            alertDialog.setTitle("Erro");
            alertDialog.setMessage(validaBombona);
            alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.bombona.LeitorBombonaActivity.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                    Intent intent3 = new Intent(LeitorBombonaActivity.this, (Class<?>) ColetarActivity.class);
                    LeitorBombonaActivity.this.setResult(123, intent3);
                    LeitorBombonaActivity.this.finish();
                }
            });
            alertDialog.show();
            return;
        }
        MediaPlayer mediaPlayer4 = MediaPlayer.create(this, R.raw.beep_ok);
        mediaPlayer4.start();
        Intent intent3 = new Intent(this, (Class<?>) ColetarActivity.class);
        intent3.putExtra("codigoBarrasBombona", texto);
        intent3.putExtra("idVolumeBombona", this.idVolumeBombona);
        setResult(123, intent3);
        finish();
    }

    private void insereMovimento(String codBarras) {
        String erroMensagem;
        String str;
        DatabaseHelper myDb = new DatabaseHelper(this);
        String erroCad = new BombonaTableManager(myDb.getDatabase()).validaCadastroBombona(codBarras);
        String erroMensagem2 = "";
        String str2 = "B";
        if (this.origem.startsWith("TR") || this.origem.startsWith("B") || ((this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS) && this.idClienteSel.intValue() != 0) || (this.origem.startsWith("TC") && this.idClienteSel.intValue() != 0))) {
            if (erroCad == null) {
                String validaBombona = new MovimentoBombonaTableManager(myDb.getDatabase()).validaBombona(codBarras, this.origem);
                if (validaBombona == null) {
                    MediaPlayer mediaPlayer = MediaPlayer.create(this, R.raw.beep_ok);
                    mediaPlayer.start();
                    SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
                    int spinner_id_rota = preferences.getInt("id_rota", 0);
                    int spinner_id_frota_veiculo = preferences.getInt("id_frota_veiculo", 0);
                    Integer valueOf = Integer.valueOf((this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS) || this.origem.startsWith("TC")) ? this.idClienteSel.intValue() : 0);
                    if (this.origem.startsWith("TR")) {
                        str2 = "TR";
                    } else if (this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
                        str2 = ExifInterface.GPS_MEASUREMENT_IN_PROGRESS;
                    } else if (this.origem.startsWith("TC")) {
                        str2 = "TC";
                    }
                    MovimentoBombona movimentoBombona = new MovimentoBombona(codBarras, valueOf, str2, null, String.valueOf(spinner_id_rota), Integer.valueOf(spinner_id_frota_veiculo));
                    MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(myDb.getDatabase());
                    movimentoBombonaTableManager.insert(movimentoBombona);
                    if (this.origem.startsWith("TR")) {
                        str = "Bombona Carregada!";
                    } else if (this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
                        str = "Bombona Alocada!";
                    } else {
                        str = this.origem.startsWith("TC") ? "Bombona Alocada em Terceiro!" : "Bombona Baixada!";
                    }
                    Toast toast = Toast.makeText(this, str, 1);
                    toast.show();
                    reiniciaLeitor();
                } else {
                    erroMensagem2 = validaBombona;
                }
                erroMensagem = erroMensagem2;
            } else {
                erroMensagem = erroCad;
            }
        } else {
            erroMensagem = "Selecione um cliente para destinar a Bombona";
        }
        if (!erroMensagem.isEmpty()) {
            MediaPlayer mediaPlayer2 = MediaPlayer.create(this, R.raw.beep_erro);
            mediaPlayer2.start();
            AlertDialog alertDialog = new AlertDialog.Builder(this).create();
            alertDialog.setTitle("Erro");
            alertDialog.setMessage(erroMensagem);
            alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.bombona.LeitorBombonaActivity.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                    LeitorBombonaActivity.this.reiniciaLeitor();
                }
            });
            alertDialog.show();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void reiniciaLeitor() {
        Class cls;
        if (this.origem.startsWith("TR")) {
            cls = CarregarBombonaActivity.class;
        } else if (this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
            cls = LerBombonaActivity.class;
        } else {
            cls = this.origem.startsWith("TC") ? TerceirosActivity.class : BaixaBombonaActivity.class;
        }
        Intent intent = new Intent(this, (Class<?>) cls);
        if (this.origem.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS) || this.origem.startsWith("TC")) {
            intent.putExtra("ClienteSelectinado", this.clienteSelectinado);
            intent.putExtra("IdPessoaClienteSelecionado", this.idClienteSel);
        }
        intent.putExtra("lido", "s");
        startActivity(intent);
    }
}
