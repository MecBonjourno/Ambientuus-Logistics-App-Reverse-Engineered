.class public Lme/dm7/barcodescanner/zxing/ZXingScannerView;
.super Lme/dm7/barcodescanner/core/BarcodeScannerView;
.source "ZXingScannerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;
    }
.end annotation


# static fields
.field public static final ALL_FORMATS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mFormats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation
.end field

.field private mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private mResultHandler:Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    .line 38
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->UPC_A:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->UPC_E:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->EAN_8:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->RSS_14:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->CODE_93:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->CODE_128:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->ITF:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->CODABAR:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->DATA_MATRIX:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->PDF_417:Lcom/google/zxing/BarcodeFormat;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 54
    invoke-direct {p0, p1}, Lme/dm7/barcodescanner/core/BarcodeScannerView;-><init>(Landroid/content/Context;)V

    .line 55
    invoke-direct {p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->initMultiFormatReader()V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .line 59
    invoke-direct {p0, p1, p2}, Lme/dm7/barcodescanner/core/BarcodeScannerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    invoke-direct {p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->initMultiFormatReader()V

    .line 61
    return-void
.end method

.method private initMultiFormatReader()V
    .locals 3

    .line 80
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/google/zxing/DecodeHintType;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 81
    .local v0, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    sget-object v1, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->getFormats()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    new-instance v1, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v1}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v1, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    .line 83
    iget-object v1, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v1, v0}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 84
    return-void
.end method


# virtual methods
.method public buildLuminanceSource([BII)Lcom/google/zxing/PlanarYUVLuminanceSource;
    .locals 12
    .param p1, "data"    # [B
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 134
    invoke-virtual {p0, p2, p3}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->getFramingRectInPreview(II)Landroid/graphics/Rect;

    move-result-object v1

    .line 135
    .local v1, "rect":Landroid/graphics/Rect;
    if-nez v1, :cond_0

    .line 136
    const/4 v0, 0x0

    return-object v0

    .line 139
    :cond_0
    const/4 v2, 0x0

    .line 142
    .local v2, "source":Lcom/google/zxing/PlanarYUVLuminanceSource;
    :try_start_0
    new-instance v3, Lcom/google/zxing/PlanarYUVLuminanceSource;

    iget v7, v1, Landroid/graphics/Rect;->left:I

    iget v8, v1, Landroid/graphics/Rect;->top:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v9

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v11, 0x0

    move-object v4, p1

    move v5, p2

    move v6, p3

    .end local p1    # "data":[B
    .end local p2    # "width":I
    .end local p3    # "height":I
    .local v4, "data":[B
    .local v5, "width":I
    .local v6, "height":I
    :try_start_1
    invoke-direct/range {v3 .. v11}, Lcom/google/zxing/PlanarYUVLuminanceSource;-><init>([BIIIIIIZ)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v2, v3

    .line 145
    goto :goto_0

    .line 144
    :catch_0
    move-exception v0

    goto :goto_0

    .end local v4    # "data":[B
    .end local v5    # "width":I
    .end local v6    # "height":I
    .restart local p1    # "data":[B
    .restart local p2    # "width":I
    .restart local p3    # "height":I
    :catch_1
    move-exception v0

    move-object v4, p1

    move v5, p2

    move v6, p3

    .line 147
    .end local p1    # "data":[B
    .end local p2    # "width":I
    .end local p3    # "height":I
    .restart local v4    # "data":[B
    .restart local v5    # "width":I
    .restart local v6    # "height":I
    :goto_0
    return-object v2
.end method

.method public getFormats()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mFormats:Ljava/util/List;

    if-nez v0, :cond_0

    .line 74
    sget-object v0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->ALL_FORMATS:Ljava/util/List;

    return-object v0

    .line 76
    :cond_0
    iget-object v0, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mFormats:Ljava/util/List;

    return-object v0
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 10
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .line 88
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 89
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v1

    .line 90
    .local v1, "size":Landroid/hardware/Camera$Size;
    iget v2, v1, Landroid/hardware/Camera$Size;->width:I

    .line 91
    .local v2, "width":I
    iget v3, v1, Landroid/hardware/Camera$Size;->height:I

    .line 93
    .local v3, "height":I
    invoke-virtual {p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lme/dm7/barcodescanner/core/DisplayUtils;->getScreenOrientation(Landroid/content/Context;)I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    .line 94
    array-length v4, p1

    new-array v4, v4, [B

    .line 95
    .local v4, "rotatedData":[B
    const/4 v6, 0x0

    .local v6, "y":I
    :goto_0
    if-ge v6, v3, :cond_1

    .line 96
    const/4 v7, 0x0

    .local v7, "x":I
    :goto_1
    if-ge v7, v2, :cond_0

    .line 97
    mul-int v8, v7, v3

    add-int/2addr v8, v3

    sub-int/2addr v8, v6

    sub-int/2addr v8, v5

    mul-int v9, v6, v2

    add-int/2addr v9, v7

    aget-byte v9, p1, v9

    aput-byte v9, v4, v8

    .line 96
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 95
    .end local v7    # "x":I
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 99
    .end local v6    # "y":I
    :cond_1
    move v5, v2

    .line 100
    .local v5, "tmp":I
    move v2, v3

    .line 101
    move v3, v5

    .line 102
    move-object p1, v4

    .line 105
    .end local v4    # "rotatedData":[B
    .end local v5    # "tmp":I
    :cond_2
    const/4 v4, 0x0

    .line 106
    .local v4, "rawResult":Lcom/google/zxing/Result;
    invoke-virtual {p0, p1, v2, v3}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->buildLuminanceSource([BII)Lcom/google/zxing/PlanarYUVLuminanceSource;

    move-result-object v5

    .line 108
    .local v5, "source":Lcom/google/zxing/PlanarYUVLuminanceSource;
    if-eqz v5, :cond_3

    .line 109
    new-instance v6, Lcom/google/zxing/BinaryBitmap;

    new-instance v7, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v7, v5}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {v6, v7}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    .line 111
    .local v6, "bitmap":Lcom/google/zxing/BinaryBitmap;
    :try_start_0
    iget-object v7, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7, v6}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;

    move-result-object v7
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v4, v7

    .line 119
    :goto_2
    iget-object v7, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v7}, Lcom/google/zxing/MultiFormatReader;->reset()V

    .line 120
    goto :goto_3

    .line 119
    :catchall_0
    move-exception v7

    iget-object v8, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v8}, Lcom/google/zxing/MultiFormatReader;->reset()V

    throw v7

    .line 116
    :catch_0
    move-exception v7

    goto :goto_2

    .line 114
    :catch_1
    move-exception v7

    goto :goto_2

    .line 112
    :catch_2
    move-exception v7

    goto :goto_2

    .line 123
    .end local v6    # "bitmap":Lcom/google/zxing/BinaryBitmap;
    :cond_3
    :goto_3
    if-eqz v4, :cond_4

    .line 124
    invoke-virtual {p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 125
    iget-object v6, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mResultHandler:Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;

    if-eqz v6, :cond_5

    .line 126
    iget-object v6, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mResultHandler:Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;

    invoke-interface {v6, v4}, Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;->handleResult(Lcom/google/zxing/Result;)V

    goto :goto_4

    .line 129
    :cond_4
    invoke-virtual {p2, p0}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 131
    :cond_5
    :goto_4
    return-void
.end method

.method public setFormats(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;)V"
        }
    .end annotation

    .line 64
    .local p1, "formats":Ljava/util/List;, "Ljava/util/List<Lcom/google/zxing/BarcodeFormat;>;"
    iput-object p1, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mFormats:Ljava/util/List;

    .line 65
    invoke-direct {p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->initMultiFormatReader()V

    .line 66
    return-void
.end method

.method public setResultHandler(Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;)V
    .locals 0
    .param p1, "resultHandler"    # Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;

    .line 69
    iput-object p1, p0, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->mResultHandler:Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;

    .line 70
    return-void
.end method
