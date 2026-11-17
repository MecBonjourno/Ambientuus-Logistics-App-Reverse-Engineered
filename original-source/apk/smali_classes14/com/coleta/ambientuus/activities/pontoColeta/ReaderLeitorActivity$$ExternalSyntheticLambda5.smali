.class public final synthetic Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/camera/core/ImageAnalysis$Analyzer;


# instance fields
.field public final synthetic f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

.field public final synthetic f$1:Lcom/google/mlkit/vision/barcode/BarcodeScanner;


# direct methods
.method public synthetic constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/mlkit/vision/barcode/BarcodeScanner;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda5;->f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda5;->f$1:Lcom/google/mlkit/vision/barcode/BarcodeScanner;

    return-void
.end method


# virtual methods
.method public final analyze(Landroidx/camera/core/ImageProxy;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda5;->f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda5;->f$1:Lcom/google/mlkit/vision/barcode/BarcodeScanner;

    invoke-static {v0, v1, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->$r8$lambda$egzcDHmavXOKkSYcH-zxU12kznM(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/mlkit/vision/barcode/BarcodeScanner;Landroidx/camera/core/ImageProxy;)V

    return-void
.end method

.method public synthetic getDefaultTargetResolution()Landroid/util/Size;
    .locals 1

    .line 0
    invoke-static {p0}, Landroidx/camera/core/ImageAnalysis$Analyzer$-CC;->$default$getDefaultTargetResolution(Landroidx/camera/core/ImageAnalysis$Analyzer;)Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method

.method public synthetic getTargetCoordinateSystem()I
    .locals 1

    .line 0
    invoke-static {p0}, Landroidx/camera/core/ImageAnalysis$Analyzer$-CC;->$default$getTargetCoordinateSystem(Landroidx/camera/core/ImageAnalysis$Analyzer;)I

    move-result v0

    return v0
.end method

.method public synthetic updateTransform(Landroid/graphics/Matrix;)V
    .locals 0

    .line 0
    invoke-static {p0, p1}, Landroidx/camera/core/ImageAnalysis$Analyzer$-CC;->$default$updateTransform(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroid/graphics/Matrix;)V

    return-void
.end method
