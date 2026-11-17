.class public Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "ReaderLeitorActivity.java"


# instance fields
.field private cameraExecutor:Ljava/util/concurrent/ExecutorService;

.field private codigoLido:Z

.field private previewView:Landroidx/camera/view/PreviewView;


# direct methods
.method public static synthetic $r8$lambda$Epvnu911liBhuFWvPPgKEtQiDX0(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->lambda$bindPreview$1(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic $r8$lambda$egzcDHmavXOKkSYcH-zxU12kznM(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/mlkit/vision/barcode/BarcodeScanner;Landroidx/camera/core/ImageProxy;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->lambda$bindPreview$4(Lcom/google/mlkit/vision/barcode/BarcodeScanner;Landroidx/camera/core/ImageProxy;)V

    return-void
.end method

.method public static synthetic $r8$lambda$rgaEXwlv3Y6NHwu9wCYk9CoAD4A(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->lambda$startCamera$0(Lcom/google/common/util/concurrent/ListenableFuture;)V

    return-void
.end method

.method public static synthetic $r8$lambda$tmfrwXcoRYjXgXob8pmGGm4DxbQ(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->lambda$retornarCodigo$5(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->codigoLido:Z

    return-void
.end method

.method private bindPreview(Landroidx/camera/lifecycle/ProcessCameraProvider;)V
    .locals 10
    .param p1, "cameraProvider"    # Landroidx/camera/lifecycle/ProcessCameraProvider;

    .line 74
    new-instance v0, Landroidx/camera/core/Preview$Builder;

    invoke-direct {v0}, Landroidx/camera/core/Preview$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/camera/core/Preview$Builder;->build()Landroidx/camera/core/Preview;

    move-result-object v0

    .line 75
    .local v0, "preview":Landroidx/camera/core/Preview;
    sget-object v1, Landroidx/camera/core/CameraSelector;->DEFAULT_BACK_CAMERA:Landroidx/camera/core/CameraSelector;

    .line 77
    .local v1, "cameraSelector":Landroidx/camera/core/CameraSelector;
    new-instance v2, Landroidx/camera/core/ImageAnalysis$Builder;

    invoke-direct {v2}, Landroidx/camera/core/ImageAnalysis$Builder;-><init>()V

    .line 78
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroidx/camera/core/ImageAnalysis$Builder;->setBackpressureStrategy(I)Landroidx/camera/core/ImageAnalysis$Builder;

    move-result-object v2

    .line 79
    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis$Builder;->build()Landroidx/camera/core/ImageAnalysis;

    move-result-object v2

    .line 81
    .local v2, "imageAnalysis":Landroidx/camera/core/ImageAnalysis;
    new-instance v4, Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions$Builder;

    invoke-direct {v4}, Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions$Builder;-><init>()V

    const/16 v5, 0x40

    const/4 v6, 0x1

    const/16 v7, 0x20

    const/4 v8, 0x2

    filled-new-array {v6, v7, v8, v5}, [I

    move-result-object v5

    .line 82
    const/16 v7, 0x100

    invoke-virtual {v4, v7, v5}, Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions$Builder;->setBarcodeFormats(I[I)Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions$Builder;

    move-result-object v4

    .line 88
    invoke-virtual {v4}, Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions$Builder;->build()Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions;

    move-result-object v4

    .line 90
    .local v4, "options":Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions;
    invoke-static {v4}, Lcom/google/mlkit/vision/barcode/BarcodeScanning;->getClient(Lcom/google/mlkit/vision/barcode/BarcodeScannerOptions;)Lcom/google/mlkit/vision/barcode/BarcodeScanner;

    move-result-object v5

    .line 92
    .local v5, "scanner":Lcom/google/mlkit/vision/barcode/BarcodeScanner;
    iget-object v7, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->cameraExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda5;

    invoke-direct {v9, p0, v5}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda5;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/mlkit/vision/barcode/BarcodeScanner;)V

    invoke-virtual {v2, v7, v9}, Landroidx/camera/core/ImageAnalysis;->setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 120
    invoke-virtual {p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->unbindAll()V

    .line 121
    new-array v7, v8, [Landroidx/camera/core/UseCase;

    aput-object v0, v7, v3

    aput-object v2, v7, v6

    invoke-virtual {p1, p0, v1, v7}, Landroidx/camera/lifecycle/ProcessCameraProvider;->bindToLifecycle(Landroidx/lifecycle/LifecycleOwner;Landroidx/camera/core/CameraSelector;[Landroidx/camera/core/UseCase;)Landroidx/camera/core/Camera;

    .line 122
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->previewView:Landroidx/camera/view/PreviewView;

    invoke-virtual {v3}, Landroidx/camera/view/PreviewView;->getSurfaceProvider()Landroidx/camera/core/Preview$SurfaceProvider;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 123
    return-void
.end method

.method private synthetic lambda$bindPreview$1(Ljava/util/List;)V
    .locals 4
    .param p1, "barcodes"    # Ljava/util/List;

    .line 106
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/mlkit/vision/barcode/common/Barcode;

    .line 107
    .local v1, "barcode":Lcom/google/mlkit/vision/barcode/common/Barcode;
    invoke-virtual {v1}, Lcom/google/mlkit/vision/barcode/common/Barcode;->getRawValue()Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "valor":Ljava/lang/String;
    if-eqz v2, :cond_0

    iget-boolean v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->codigoLido:Z

    if-nez v3, :cond_0

    .line 109
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->codigoLido:Z

    .line 110
    invoke-direct {p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->retornarCodigo(Ljava/lang/String;)V

    .line 111
    goto :goto_1

    .line 113
    .end local v1    # "barcode":Lcom/google/mlkit/vision/barcode/common/Barcode;
    .end local v2    # "valor":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 114
    :cond_1
    :goto_1
    return-void
.end method

.method static synthetic lambda$bindPreview$2(Ljava/lang/Exception;)V
    .locals 2
    .param p0, "e"    # Ljava/lang/Exception;

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Erro na leitura: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Leitor"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method static synthetic lambda$bindPreview$3(Landroidx/camera/core/ImageProxy;Lcom/google/android/gms/tasks/Task;)V
    .locals 0
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "task"    # Lcom/google/android/gms/tasks/Task;

    .line 117
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->close()V

    return-void
.end method

.method private synthetic lambda$bindPreview$4(Lcom/google/mlkit/vision/barcode/BarcodeScanner;Landroidx/camera/core/ImageProxy;)V
    .locals 3
    .param p1, "scanner"    # Lcom/google/mlkit/vision/barcode/BarcodeScanner;
    .param p2, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 93
    iget-boolean v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->codigoLido:Z

    if-eqz v0, :cond_0

    .line 94
    invoke-interface {p2}, Landroidx/camera/core/ImageProxy;->close()V

    .line 95
    return-void

    .line 99
    :cond_0
    nop

    .line 100
    invoke-interface {p2}, Landroidx/camera/core/ImageProxy;->getImage()Landroid/media/Image;

    move-result-object v0

    .line 101
    invoke-interface {p2}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/ImageInfo;->getRotationDegrees()I

    move-result v1

    .line 99
    invoke-static {v0, v1}, Lcom/google/mlkit/vision/common/InputImage;->fromMediaImage(Landroid/media/Image;I)Lcom/google/mlkit/vision/common/InputImage;

    move-result-object v0

    .line 104
    .local v0, "image":Lcom/google/mlkit/vision/common/InputImage;
    invoke-interface {p1, v0}, Lcom/google/mlkit/vision/barcode/BarcodeScanner;->process(Lcom/google/mlkit/vision/common/InputImage;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;)V

    .line 105
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda3;-><init>()V

    .line 115
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/ImageProxy;)V

    .line 117
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    .line 118
    return-void
.end method

.method private synthetic lambda$retornarCodigo$5(Ljava/lang/String;)V
    .locals 2
    .param p1, "codigo"    # Ljava/lang/String;

    .line 127
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 128
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "codigoBarras"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    const/16 v1, 0xc8

    invoke-virtual {p0, v1, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->setResult(ILandroid/content/Intent;)V

    .line 130
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->finish()V

    .line 131
    return-void
.end method

.method private synthetic lambda$startCamera$0(Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 1
    .param p1, "cameraProviderFuture"    # Lcom/google/common/util/concurrent/ListenableFuture;

    .line 64
    :try_start_0
    invoke-interface {p1}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/lifecycle/ProcessCameraProvider;

    .line 65
    .local v0, "cameraProvider":Landroidx/camera/lifecycle/ProcessCameraProvider;
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->bindPreview(Landroidx/camera/lifecycle/ProcessCameraProvider;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .end local v0    # "cameraProvider":Landroidx/camera/lifecycle/ProcessCameraProvider;
    goto :goto_1

    .line 66
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 69
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method private retornarCodigo(Ljava/lang/String;)V
    .locals 1
    .param p1, "codigo"    # Ljava/lang/String;

    .line 126
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 132
    return-void
.end method

.method private startCamera()V
    .locals 3

    .line 59
    nop

    .line 60
    invoke-static {p0}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 62
    .local v0, "cameraProviderFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/lifecycle/ProcessCameraProvider;>;"
    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 69
    invoke-static {p0}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 62
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 70
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 41
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 42
    sget v0, Lcom/coleta/ambientuus/R$layout;->reader:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->setContentView(I)V

    .line 43
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/app/ActionBar;

    invoke-virtual {v0}, Landroidx/appcompat/app/ActionBar;->hide()V

    .line 45
    sget v0, Lcom/coleta/ambientuus/R$id;->previewView:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/camera/view/PreviewView;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->previewView:Landroidx/camera/view/PreviewView;

    .line 46
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->cameraExecutor:Ljava/util/concurrent/ExecutorService;

    .line 48
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->startCamera()V

    .line 50
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$1;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Z)V

    invoke-virtual {v0, p0, v1}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 56
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 136
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 137
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->cameraExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 138
    return-void
.end method
