.class public abstract Lme/dm7/barcodescanner/core/BarcodeScannerView;
.super Landroid/widget/FrameLayout;
.source "BarcodeScannerView.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# instance fields
.field private mCamera:Landroid/hardware/Camera;

.field private mFramingRectInPreview:Landroid/graphics/Rect;

.field private mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

.field private mViewFinderView:Lme/dm7/barcodescanner/core/ViewFinderView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 19
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 20
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->setupLayout()V

    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attributeSet"    # Landroid/util/AttributeSet;

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->setupLayout()V

    .line 26
    return-void
.end method


# virtual methods
.method public getFlash()Z
    .locals 4

    .line 107
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-static {v0}, Lme/dm7/barcodescanner/core/CameraUtils;->isFlashSupported(Landroid/hardware/Camera;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 108
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 109
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v2

    const-string v3, "torch"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    const/4 v1, 0x1

    return v1

    .line 112
    :cond_0
    return v1

    .line 115
    .end local v0    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_1
    return v1
.end method

.method public declared-synchronized getFramingRectInPreview(II)Landroid/graphics/Rect;
    .locals 5
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    monitor-enter p0

    .line 68
    :try_start_0
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mFramingRectInPreview:Landroid/graphics/Rect;

    if-nez v0, :cond_2

    .line 69
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mViewFinderView:Lme/dm7/barcodescanner/core/ViewFinderView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/core/ViewFinderView;->getFramingRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 70
    .local v0, "framingRect":Landroid/graphics/Rect;
    iget-object v1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mViewFinderView:Lme/dm7/barcodescanner/core/ViewFinderView;

    invoke-virtual {v1}, Lme/dm7/barcodescanner/core/ViewFinderView;->getWidth()I

    move-result v1

    .line 71
    .local v1, "viewFinderViewWidth":I
    iget-object v2, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mViewFinderView:Lme/dm7/barcodescanner/core/ViewFinderView;

    invoke-virtual {v2}, Lme/dm7/barcodescanner/core/ViewFinderView;->getHeight()I

    move-result v2

    .line 72
    .local v2, "viewFinderViewHeight":I
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    if-nez v2, :cond_0

    goto :goto_0

    .line 76
    :cond_0
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 77
    .local v3, "rect":Landroid/graphics/Rect;
    iget v4, v3, Landroid/graphics/Rect;->left:I

    mul-int/2addr v4, p1

    div-int/2addr v4, v1

    iput v4, v3, Landroid/graphics/Rect;->left:I

    .line 78
    iget v4, v3, Landroid/graphics/Rect;->right:I

    mul-int/2addr v4, p1

    div-int/2addr v4, v1

    iput v4, v3, Landroid/graphics/Rect;->right:I

    .line 79
    iget v4, v3, Landroid/graphics/Rect;->top:I

    mul-int/2addr v4, p2

    div-int/2addr v4, v2

    iput v4, v3, Landroid/graphics/Rect;->top:I

    .line 80
    iget v4, v3, Landroid/graphics/Rect;->bottom:I

    mul-int/2addr v4, p2

    div-int/2addr v4, v2

    iput v4, v3, Landroid/graphics/Rect;->bottom:I

    .line 82
    iput-object v3, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mFramingRectInPreview:Landroid/graphics/Rect;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 73
    .end local v3    # "rect":Landroid/graphics/Rect;
    .end local p0    # "this":Lme/dm7/barcodescanner/core/BarcodeScannerView;
    :cond_1
    :goto_0
    monitor-exit p0

    const/4 v3, 0x0

    return-object v3

    .line 84
    .end local v0    # "framingRect":Landroid/graphics/Rect;
    .end local v1    # "viewFinderViewWidth":I
    .end local v2    # "viewFinderViewHeight":I
    :cond_2
    :goto_1
    :try_start_1
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mFramingRectInPreview:Landroid/graphics/Rect;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    .line 67
    .end local p1    # "previewWidth":I
    .end local p2    # "previewHeight":I
    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public setAutoFocus(Z)V
    .locals 1
    .param p1, "state"    # Z

    .line 131
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    if-eqz v0, :cond_0

    .line 132
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    invoke-virtual {v0, p1}, Lme/dm7/barcodescanner/core/CameraPreview;->setAutoFocus(Z)V

    .line 134
    :cond_0
    return-void
.end method

.method public setFlash(Z)V
    .locals 3
    .param p1, "flag"    # Z

    .line 88
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-static {v0}, Lme/dm7/barcodescanner/core/CameraUtils;->isFlashSupported(Landroid/hardware/Camera;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 90
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 91
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    if-eqz p1, :cond_1

    .line 92
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "torch"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    return-void

    .line 95
    :cond_0
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_0

    .line 97
    :cond_1
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "off"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 98
    return-void

    .line 100
    :cond_2
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 102
    :goto_0
    iget-object v1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 104
    .end local v0    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_3
    return-void
.end method

.method public setupLayout()V
    .locals 2

    .line 29
    new-instance v0, Lme/dm7/barcodescanner/core/CameraPreview;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lme/dm7/barcodescanner/core/CameraPreview;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    .line 30
    new-instance v0, Lme/dm7/barcodescanner/core/ViewFinderView;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lme/dm7/barcodescanner/core/ViewFinderView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mViewFinderView:Lme/dm7/barcodescanner/core/ViewFinderView;

    .line 32
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 33
    .local v0, "relativeLayout":Landroid/widget/RelativeLayout;
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setGravity(I)V

    .line 34
    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 35
    iget-object v1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 36
    invoke-virtual {p0, v0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->addView(Landroid/view/View;)V

    .line 38
    iget-object v1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mViewFinderView:Lme/dm7/barcodescanner/core/ViewFinderView;

    invoke-virtual {p0, v1}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->addView(Landroid/view/View;)V

    .line 39
    return-void
.end method

.method public startCamera()V
    .locals 1

    .line 55
    invoke-static {}, Lme/dm7/barcodescanner/core/CameraUtils;->getCameraInstance()Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {p0, v0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->startCamera(Landroid/hardware/Camera;)V

    .line 56
    return-void
.end method

.method public startCamera(I)V
    .locals 1
    .param p1, "cameraId"    # I

    .line 42
    invoke-static {p1}, Lme/dm7/barcodescanner/core/CameraUtils;->getCameraInstance(I)Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {p0, v0}, Lme/dm7/barcodescanner/core/BarcodeScannerView;->startCamera(Landroid/hardware/Camera;)V

    .line 43
    return-void
.end method

.method public startCamera(Landroid/hardware/Camera;)V
    .locals 2
    .param p1, "camera"    # Landroid/hardware/Camera;

    .line 46
    iput-object p1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    .line 47
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 48
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mViewFinderView:Lme/dm7/barcodescanner/core/ViewFinderView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/core/ViewFinderView;->setupViewFinder()V

    .line 49
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    iget-object v1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1, p0}, Lme/dm7/barcodescanner/core/CameraPreview;->setCamera(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V

    .line 50
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/core/CameraPreview;->initCameraPreview()V

    .line 52
    :cond_0
    return-void
.end method

.method public stopCamera()V
    .locals 2

    .line 59
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/core/CameraPreview;->stopCameraPreview()V

    .line 61
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mPreview:Lme/dm7/barcodescanner/core/CameraPreview;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lme/dm7/barcodescanner/core/CameraPreview;->setCamera(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V

    .line 62
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 63
    iput-object v1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    .line 65
    :cond_0
    return-void
.end method

.method public toggleFlash()V
    .locals 3

    .line 119
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-static {v0}, Lme/dm7/barcodescanner/core/CameraUtils;->isFlashSupported(Landroid/hardware/Camera;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 120
    iget-object v0, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 121
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFlashMode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "torch"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 122
    const-string v1, "off"

    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    goto :goto_0

    .line 124
    :cond_0
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 126
    :goto_0
    iget-object v1, p0, Lme/dm7/barcodescanner/core/BarcodeScannerView;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 128
    .end local v0    # "parameters":Landroid/hardware/Camera$Parameters;
    :cond_1
    return-void
.end method
