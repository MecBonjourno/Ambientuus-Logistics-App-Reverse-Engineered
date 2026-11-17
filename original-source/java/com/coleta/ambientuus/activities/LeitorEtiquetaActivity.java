package com.coleta.ambientuus.activities;

import android.content.Intent;
import android.os.Bundle;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AppCompatActivity;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.fragments.EtiquetasFragment;
import com.google.zxing.Result;
import me.dm7.barcodescanner.zxing.ZXingScannerView;

/* loaded from: classes3.dex */
public class LeitorEtiquetaActivity extends AppCompatActivity implements ZXingScannerView.ResultHandler {
    private ZXingScannerView scannerView;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.reader_leitor_etiqueta);
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.scannerView = (ZXingScannerView) findViewById(R.id.zxscanEtiqueta);
        this.scannerView.setResultHandler(this);
        this.scannerView.startCamera();
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(true) { // from class: com.coleta.ambientuus.activities.LeitorEtiquetaActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                LeitorEtiquetaActivity.this.scannerView.stopCamera();
                LeitorEtiquetaActivity.this.finish();
            }
        });
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        this.scannerView.stopCamera();
        super.onDestroy();
    }

    @Override // me.dm7.barcodescanner.zxing.ZXingScannerView.ResultHandler
    public void handleResult(Result result) {
        String texto = result.getText();
        this.scannerView.stopCamera();
        Intent intent = new Intent(this, (Class<?>) EtiquetasFragment.class);
        intent.putExtra("codigoEtiqueta", texto);
        setResult(200, intent);
        finish();
    }
}
