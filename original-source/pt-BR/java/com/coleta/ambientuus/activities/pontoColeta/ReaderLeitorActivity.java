package com.coleta.ambientuus.activities.pontoColeta;

import android.content.Intent;
import android.graphics.Matrix;
import android.os.Bundle;
import android.util.Log;
import android.util.Size;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageProxy;
import androidx.camera.core.Preview;
import androidx.camera.lifecycle.ProcessCameraProvider;
import androidx.camera.view.PreviewView;
import androidx.core.content.ContextCompat;
import com.coleta.ambientuus.R;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.mlkit.vision.barcode.BarcodeScanner;
import com.google.mlkit.vision.barcode.BarcodeScannerOptions;
import com.google.mlkit.vision.barcode.BarcodeScanning;
import com.google.mlkit.vision.barcode.common.Barcode;
import com.google.mlkit.vision.common.InputImage;
import j$.util.Objects;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* carregado de: classes14.dex */
public class ReaderLeitorActivity extends AppCompatActivity {
    private ExecutorService cameraExecutor;
    private boolean codigoLido = false;
    private PreviewView previewView;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.reader);
        ((ActionBar) Objects.requireNonNull(getSupportActionBar())).hide();
        this.previewView = (PreviewView) findViewById(R.id.previewView);
        this.cameraExecutor = Executors.newSingleThreadExecutor();
        startCamera();
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(true) { // da classe: com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                ReaderLeitorActivity.this.finish();
            }
        });
    }

    private void startCamera() {
        final ListenableFuture<ProcessCameraProvider> cameraProviderFuture = ProcessCameraProvider.getInstance(this);
        cameraProviderFuture.addListener(new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                ReaderLeitorActivity.this.lambda$startCamera$0(cameraProviderFuture);
            }
        }, ContextCompat.getMainExecutor(this));
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public /* sintético */ void lambda$startCamera$0(ListenableFuture cameraProviderFuture) {
        try {
            ProcessCameraProvider cameraProvider = (ProcessCameraProvider) cameraProviderFuture.get();
            bindPreview(cameraProvider);
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }
    }

    private void bindPreview(ProcessCameraProvider cameraProvider) {
        Preview preview = new Preview.Builder().build();
        CameraSelector cameraSelector = CameraSelector.DEFAULT_BACK_CAMERA;
        ImageAnalysis imageAnalysis = new ImageAnalysis.Builder().setBackpressureStrategy(0).build();
        BarcodeScannerOptions options = new BarcodeScannerOptions.Builder().setBarcodeFormats(256, 1, 32, 2, 64).build();
        final BarcodeScanner scanner = BarcodeScanning.getClient(options);
        imageAnalysis.setAnalyzer(this.cameraExecutor, new ImageAnalysis.Analyzer() { // da classe: com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity$$ExternalSyntheticLambda5
            @Override // androidx.camera.core.ImageAnalysis.Analyzer
            public final void analyze(ImageProxy imageProxy) {
                ReaderLeitorActivity.this.lambda$bindPreview$4(scanner, imageProxy);
            }

            @Override // androidx.camera.core.ImageAnalysis.Analyzer
            public /* sintético */ Size getDefaultTargetResolution() {
                return ImageAnalysis.Analyzer.CC.$default$getDefaultTargetResolution(this);
            }

            @Override // androidx.camera.core.ImageAnalysis.Analyzer
            public /* sintético */ int getTargetCoordinateSystem() {
                return ImageAnalysis.Analyzer.CC.$default$getTargetCoordinateSystem(this);
            }

            @Override // androidx.camera.core.ImageAnalysis.Analyzer
            public /* sintético */ void updateTransform(Matrix matrix) {
                ImageAnalysis.Analyzer.CC.$default$updateTransform(this, matrix);
            }
        });
        cameraProvider.unbindAll();
        cameraProvider.bindToLifecycle(this, cameraSelector, preview, imageAnalysis);
        preview.setSurfaceProvider(this.previewView.getSurfaceProvider());
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$bindPreview$4(BarcodeScanner scanner, final ImageProxy imageProxy) {
        if (this.codigoLido) {
            imageProxy.close();
        } else {
            InputImage image = InputImage.fromMediaImage(imageProxy.getImage(), imageProxy.getImageInfo().getRotationDegrees());
            scanner.process(image).addOnSuccessListener(new OnSuccessListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity$$ExternalSyntheticLambda2
                @Override // com.google.android.gms.tasks.OnSuccessListener
                public final void onSuccess(Object obj) {
                    ReaderLeitorActivity.this.lambda$bindPreview$1((List) obj);
                }
            }).addOnFailureListener(new OnFailureListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity$$ExternalSyntheticLambda3
                @Override // com.google.android.gms.tasks.OnFailureListener
                public final void onFailure(Exception exc) {
                    Log.e("Leitor", "Erro na leitura: " + exc.getMessage());
                }
            }).addOnCompleteListener(new OnCompleteListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity$$ExternalSyntheticLambda4
                @Override // com.google.android.gms.tasks.OnCompleteListener
                public final void onComplete(Task task) {
                    ImageProxy.this.close();
                }
            });
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$bindPreview$1(List barcodes) {
        Iterator it = barcodes.iterator();
        while (it.hasNext()) {
            Barcode barcode = (Barcode) it.next();
            String valor = barcode.getRawValue();
            if (valor != null && !this.codigoLido) {
                this.codigoLido = true;
                retornarCodigo(valor);
                return;
            }
        }
    }

    private void retornarCodigo(final String codigo) {
        runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.activities.pontoColeta.ReaderLeitorActivity$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ReaderLeitorActivity.this.lambda$retornarCodigo$5(codigo);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$retornarCodigo$5(String codigo) {
        Intent intent = new Intent();
        intent.putExtra("codigoBarras", codigo);
        setResult(200, intent);
        finish();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        this.cameraExecutor.shutdown();
    }
}
