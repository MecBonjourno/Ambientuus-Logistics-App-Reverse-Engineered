package com.coleta.ambientuus.activities;

import android.content.Context;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.coleta.ambientuus.R;
import com.google.zxing.Result;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import me.dm7.barcodescanner.zxing.ZXingScannerView;

/* loaded from: classes3.dex */
public class LeitormtrActivity extends AppCompatActivity implements ZXingScannerView.ResultHandler {
    private Boolean bluetoothDesconectado = false;
    private String codBarrasBombona = null;
    private String letras;
    private ZXingScannerView scannerView;
    private TextView txtResult;
    private String var1;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.reader_leitormtr);
        getSupportActionBar().hide();
        this.scannerView = (ZXingScannerView) findViewById(R.id.zxscan);
        this.txtResult = (TextView) findViewById(R.id.txt_result);
        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        if (extras != null) {
            this.bluetoothDesconectado = Boolean.valueOf(extras.getBoolean("naoconectado"));
            if (extras.containsKey("codigoBarrasBombona")) {
                this.codBarrasBombona = extras.getString("codigoBarrasBombona");
            }
        }
        Dexter.withActivity(this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.LeitormtrActivity.1
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                LeitormtrActivity.this.scannerView.setResultHandler(LeitormtrActivity.this);
                LeitormtrActivity.this.scannerView.startCamera();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                LeitormtrActivity.this.showToast(LeitormtrActivity.this, "Precisa da permissao da camera!");
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        this.scannerView.stopCamera();
        super.onDestroy();
    }

    @Override // me.dm7.barcodescanner.zxing.ZXingScannerView.ResultHandler
    public void handleResult(Result rawResult) {
        if (!this.bluetoothDesconectado.booleanValue()) {
            this.txtResult.setText(rawResult.getText());
            this.scannerView.startCamera();
            startActivity(new Intent(this, (Class<?>) BuscaDispositivoActivity.class));
        } else {
            this.scannerView.startCamera();
            this.letras = rawResult.getText();
            processaresultado();
        }
    }

    public void processaresultado() {
        if (this.letras.length() > 10) {
            this.var1 = this.letras.substring(0, 10);
        } else {
            this.var1 = this.letras;
        }
        if (this.var1.length() == 10) {
            Intent intent = new Intent(this, (Class<?>) ColetarActivity.class);
            intent.putExtra("valorDoLeitor", this.var1);
            if (this.codBarrasBombona != null) {
                intent.putExtra("codigoBarrasBombona", this.codBarrasBombona);
            }
            MediaPlayer mediaPlayer = MediaPlayer.create(this, R.raw.beep_ok);
            mediaPlayer.start();
            setResult(123, intent);
            finish();
            return;
        }
        showToast(this, "ERRO AO LER CODIGO DE BARRAS ");
        Intent intent2 = new Intent(this, (Class<?>) ColetarActivity.class);
        intent2.putExtra("valorDoLeitor", "");
        if (this.codBarrasBombona != null) {
            intent2.putExtra("codigoBarrasBombona", this.codBarrasBombona);
        }
        MediaPlayer mediaPlayer2 = MediaPlayer.create(this, R.raw.beep_erro);
        mediaPlayer2.start();
        setResult(123, intent2);
        finish();
    }

    public void showToast(Context context, String message) {
        Toast toast = Toast.makeText(context, message, 1);
        toast.show();
    }
}
