.class public Lme/dm7/barcodescanner/core/CameraPreview;
.super Landroid/view/SurfaceView;
.source "CameraPreview.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# static fields
.field private static final TAG:Ljava/lang/String; = "CameraPreview"


# instance fields
.field autoFocusCB:Landroid/hardware/Camera$AutoFocusCallback;

.field private doAutoFocus:Ljava/lang/Runnable;

.field private mAutoFocus:Z

.field private mAutoFocusHandler:Landroid/os/Handler;

.field private mCamera:Landroid/hardware/Camera;

.field private mPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

.field private mPreviewing:Z

.field private mSurfaceCreated:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 30
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewing:Z

    .line 25
    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocus:Z

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mSurfaceCreated:Z

    .line 252
    new-instance v0, Lme/dm7/barcodescanner/core/CameraPreview$1;

    invoke-direct {v0, p0}, Lme/dm7/barcodescanner/core/CameraPreview$1;-><init>(Lme/dm7/barcodescanner/core/CameraPreview;)V

    iput-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->doAutoFocus:Ljava/lang/Runnable;

    .line 261
    new-instance v0, Lme/dm7/barcodescanner/core/CameraPreview$2;

    invoke-direct {v0, p0}, Lme/dm7/barcodescanner/core/CameraPreview$2;-><init>(Lme/dm7/barcodescanner/core/CameraPreview;)V

    iput-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->autoFocusCB:Landroid/hardware/Camera$AutoFocusCallback;

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewing:Z

    .line 25
    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocus:Z

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mSurfaceCreated:Z

    .line 252
    new-instance v0, Lme/dm7/barcodescanner/core/CameraPreview$1;

    invoke-direct {v0, p0}, Lme/dm7/barcodescanner/core/CameraPreview$1;-><init>(Lme/dm7/barcodescanner/core/CameraPreview;)V

    iput-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->doAutoFocus:Ljava/lang/Runnable;

    .line 261
    new-instance v0, Lme/dm7/barcodescanner/core/CameraPreview$2;

    invoke-direct {v0, p0}, Lme/dm7/barcodescanner/core/CameraPreview$2;-><init>(Lme/dm7/barcodescanner/core/CameraPreview;)V

    iput-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->autoFocusCB:Landroid/hardware/Camera$AutoFocusCallback;

    .line 35
    return-void
.end method

.method static synthetic access$000(Lme/dm7/barcodescanner/core/CameraPreview;)Landroid/hardware/Camera;
    .locals 1
    .param p0, "x0"    # Lme/dm7/barcodescanner/core/CameraPreview;

    .line 19
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    return-object v0
.end method

.method static synthetic access$100(Lme/dm7/barcodescanner/core/CameraPreview;)Z
    .locals 1
    .param p0, "x0"    # Lme/dm7/barcodescanner/core/CameraPreview;

    .line 19
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewing:Z

    return v0
.end method

.method static synthetic access$200(Lme/dm7/barcodescanner/core/CameraPreview;)Z
    .locals 1
    .param p0, "x0"    # Lme/dm7/barcodescanner/core/CameraPreview;

    .line 19
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocus:Z

    return v0
.end method

.method static synthetic access$300(Lme/dm7/barcodescanner/core/CameraPreview;)Z
    .locals 1
    .param p0, "x0"    # Lme/dm7/barcodescanner/core/CameraPreview;

    .line 19
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mSurfaceCreated:Z

    return v0
.end method

.method static synthetic access$400(Lme/dm7/barcodescanner/core/CameraPreview;)V
    .locals 0
    .param p0, "x0"    # Lme/dm7/barcodescanner/core/CameraPreview;

    .line 19
    invoke-direct {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->scheduleAutoFocus()V

    return-void
.end method

.method private adjustViewSize(Landroid/hardware/Camera$Size;)V
    .locals 5
    .param p1, "cameraSize"    # Landroid/hardware/Camera$Size;

    .line 129
    new-instance v0, Landroid/graphics/Point;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    invoke-direct {p0, v0}, Lme/dm7/barcodescanner/core/CameraPreview;->convertSizeToLandscapeOrientation(Landroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v0

    .line 130
    .local v0, "previewSize":Landroid/graphics/Point;
    iget v1, p1, Landroid/hardware/Camera$Size;->width:I

    int-to-float v1, v1

    iget v2, p1, Landroid/hardware/Camera$Size;->height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    .line 131
    .local v1, "cameraRatio":F
    iget v2, v0, Landroid/graphics/Point;->x:I

    int-to-float v2, v2

    iget v3, v0, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    .line 133
    .local v2, "screenRatio":F
    cmpl-float v3, v2, v1

    if-lez v3, :cond_0

    .line 134
    iget v3, v0, Landroid/graphics/Point;->y:I

    int-to-float v3, v3

    mul-float/2addr v3, v1

    float-to-int v3, v3

    iget v4, v0, Landroid/graphics/Point;->y:I

    invoke-direct {p0, v3, v4}, Lme/dm7/barcodescanner/core/CameraPreview;->setViewSize(II)V

    goto :goto_0

    .line 136
    :cond_0
    iget v3, v0, Landroid/graphics/Point;->x:I

    iget v4, v0, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    div-float/2addr v4, v1

    float-to-int v4, v4

    invoke-direct {p0, v3, v4}, Lme/dm7/barcodescanner/core/CameraPreview;->setViewSize(II)V

    .line 138
    :goto_0
    return-void
.end method

.method private convertSizeToLandscapeOrientation(Landroid/graphics/Point;)Landroid/graphics/Point;
    .locals 3
    .param p1, "size"    # Landroid/graphics/Point;

    .line 141
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getDisplayOrientation()I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    if-nez v0, :cond_0

    .line 142
    return-object p1

    .line 144
    :cond_0
    new-instance v0, Landroid/graphics/Point;

    iget v1, p1, Landroid/graphics/Point;->y:I

    iget v2, p1, Landroid/graphics/Point;->x:I

    invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V

    return-object v0
.end method

.method private getOptimalPreviewSize()Landroid/hardware/Camera$Size;
    .locals 21

    .line 186
    move-object/from16 v0, p0

    iget-object v1, v0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 187
    return-object v2

    .line 190
    :cond_0
    iget-object v1, v0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v1

    .line 191
    .local v1, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    invoke-virtual {v0}, Lme/dm7/barcodescanner/core/CameraPreview;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lme/dm7/barcodescanner/core/DisplayUtils;->getScreenResolution(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v3

    .line 192
    .local v3, "screenResolution":Landroid/graphics/Point;
    iget v4, v3, Landroid/graphics/Point;->x:I

    .line 193
    .local v4, "w":I
    iget v5, v3, Landroid/graphics/Point;->y:I

    .line 194
    .local v5, "h":I
    invoke-virtual {v0}, Lme/dm7/barcodescanner/core/CameraPreview;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lme/dm7/barcodescanner/core/DisplayUtils;->getScreenOrientation(Landroid/content/Context;)I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_1

    .line 195
    iget v4, v3, Landroid/graphics/Point;->y:I

    .line 196
    iget v5, v3, Landroid/graphics/Point;->x:I

    .line 200
    :cond_1
    const-wide v6, 0x3fb999999999999aL    # 0.1

    .line 201
    .local v6, "ASPECT_TOLERANCE":D
    int-to-double v8, v4

    int-to-double v10, v5

    div-double/2addr v8, v10

    .line 202
    .local v8, "targetRatio":D
    if-nez v1, :cond_2

    return-object v2

    .line 204
    :cond_2
    const/4 v2, 0x0

    .line 205
    .local v2, "optimalSize":Landroid/hardware/Camera$Size;
    const-wide v10, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 207
    .local v10, "minDiff":D
    move v12, v5

    .line 210
    .local v12, "targetHeight":I
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_5

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/hardware/Camera$Size;

    .line 211
    .local v14, "size":Landroid/hardware/Camera$Size;
    iget v15, v14, Landroid/hardware/Camera$Size;->width:I

    move-object/from16 v16, v1

    .end local v1    # "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    .local v16, "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    int-to-double v0, v15

    iget v15, v14, Landroid/hardware/Camera$Size;->height:I

    move-wide/from16 v17, v0

    int-to-double v0, v15

    div-double v0, v17, v0

    .line 212
    .local v0, "ratio":D
    sub-double v17, v0, v8

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->abs(D)D

    move-result-wide v17

    const-wide v19, 0x3fb999999999999aL    # 0.1

    cmpl-double v15, v17, v19

    if-lez v15, :cond_3

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    goto :goto_0

    .line 213
    :cond_3
    iget v15, v14, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v15, v12

    invoke-static {v15}, Ljava/lang/Math;->abs(I)I

    move-result v15

    move-wide/from16 v17, v0

    .end local v0    # "ratio":D
    .local v17, "ratio":D
    int-to-double v0, v15

    cmpg-double v0, v0, v10

    if-gez v0, :cond_4

    .line 214
    move-object v0, v14

    .line 215
    .end local v2    # "optimalSize":Landroid/hardware/Camera$Size;
    .local v0, "optimalSize":Landroid/hardware/Camera$Size;
    iget v1, v14, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v1, v12

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-double v1, v1

    move-wide v10, v1

    move-object v2, v0

    .line 217
    .end local v0    # "optimalSize":Landroid/hardware/Camera$Size;
    .end local v14    # "size":Landroid/hardware/Camera$Size;
    .end local v17    # "ratio":D
    .restart local v2    # "optimalSize":Landroid/hardware/Camera$Size;
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    goto :goto_0

    .line 210
    .end local v16    # "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    .restart local v1    # "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    :cond_5
    move-object/from16 v16, v1

    .line 220
    .end local v1    # "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    .end local v13    # "i$":Ljava/util/Iterator;
    .restart local v16    # "sizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    if-nez v2, :cond_8

    .line 221
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 222
    .end local v10    # "minDiff":D
    .local v0, "minDiff":D
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/hardware/Camera$Size;

    .line 223
    .local v11, "size":Landroid/hardware/Camera$Size;
    iget v13, v11, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v13, v12

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v13

    int-to-double v13, v13

    cmpg-double v13, v13, v0

    if-gez v13, :cond_6

    .line 224
    move-object v2, v11

    .line 225
    iget v13, v11, Landroid/hardware/Camera$Size;->height:I

    sub-int/2addr v13, v12

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v13

    int-to-double v0, v13

    .line 227
    .end local v11    # "size":Landroid/hardware/Camera$Size;
    :cond_6
    goto :goto_1

    .line 222
    :cond_7
    move-wide v10, v0

    .line 229
    .end local v0    # "minDiff":D
    .local v10, "minDiff":D
    :cond_8
    return-object v2
.end method

.method private scheduleAutoFocus()V
    .locals 4

    .line 268
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocusHandler:Landroid/os/Handler;

    iget-object v1, p0, Lme/dm7/barcodescanner/core/CameraPreview;->doAutoFocus:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 269
    return-void
.end method

.method private setViewSize(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 149
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 150
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getDisplayOrientation()I

    move-result v1

    rem-int/lit16 v1, v1, 0xb4

    if-nez v1, :cond_0

    .line 151
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 152
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_0

    .line 154
    :cond_0
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 155
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 157
    :goto_0
    invoke-virtual {p0, v0}, Lme/dm7/barcodescanner/core/CameraPreview;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    return-void
.end method


# virtual methods
.method public getDisplayOrientation()I
    .locals 7

    .line 161
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 162
    .local v0, "info":Landroid/hardware/Camera$CameraInfo;
    const/4 v1, 0x0

    invoke-static {v1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 163
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "window"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .line 164
    .local v1, "wm":Landroid/view/WindowManager;
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 166
    .local v2, "display":Landroid/view/Display;
    invoke-virtual {v2}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 167
    .local v3, "rotation":I
    const/4 v4, 0x0

    .line 168
    .local v4, "degrees":I
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 172
    :pswitch_0
    const/16 v4, 0x10e

    goto :goto_0

    .line 171
    :pswitch_1
    const/16 v4, 0xb4

    goto :goto_0

    .line 170
    :pswitch_2
    const/16 v4, 0x5a

    goto :goto_0

    .line 169
    :pswitch_3
    const/4 v4, 0x0

    .line 176
    :goto_0
    iget v5, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 177
    iget v5, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v5, v4

    rem-int/lit16 v5, v5, 0x168

    .line 178
    .local v5, "result":I
    rsub-int v6, v5, 0x168

    rem-int/lit16 v6, v6, 0x168

    .end local v5    # "result":I
    .local v6, "result":I
    goto :goto_1

    .line 180
    .end local v6    # "result":I
    :cond_0
    iget v5, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v5, v4

    add-int/lit16 v5, v5, 0x168

    rem-int/lit16 v6, v5, 0x168

    .line 182
    .restart local v6    # "result":I
    :goto_1
    return v6

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public initCameraPreview()V
    .locals 2

    .line 44
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    .line 45
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 46
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 47
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewing:Z

    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->requestLayout()V

    goto :goto_0

    .line 50
    :cond_0
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->showCameraPreview()V

    .line 53
    :cond_1
    :goto_0
    return-void
.end method

.method public safeAutoFocus()V
    .locals 2

    .line 99
    :try_start_0
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lme/dm7/barcodescanner/core/CameraPreview;->autoFocusCB:Landroid/hardware/Camera$AutoFocusCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 103
    .local v0, "re":Ljava/lang/RuntimeException;
    invoke-direct {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->scheduleAutoFocus()V

    .line 105
    .end local v0    # "re":Ljava/lang/RuntimeException;
    :goto_0
    return-void
.end method

.method public setAutoFocus(Z)V
    .locals 2
    .param p1, "state"    # Z

    .line 233
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewing:Z

    if-eqz v0, :cond_3

    .line 234
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocus:Z

    if-ne p1, v0, :cond_0

    .line 235
    return-void

    .line 237
    :cond_0
    iput-boolean p1, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocus:Z

    .line 238
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocus:Z

    const-string v1, "CameraPreview"

    if-eqz v0, :cond_2

    .line 239
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mSurfaceCreated:Z

    if-eqz v0, :cond_1

    .line 240
    const-string v0, "Starting autofocus"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->safeAutoFocus()V

    goto :goto_0

    .line 243
    :cond_1
    invoke-direct {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->scheduleAutoFocus()V

    goto :goto_0

    .line 246
    :cond_2
    const-string v0, "Cancelling autofocus"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 250
    :cond_3
    :goto_0
    return-void
.end method

.method public setCamera(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V
    .locals 1
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "previewCallback"    # Landroid/hardware/Camera$PreviewCallback;

    .line 38
    iput-object p1, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    .line 39
    iput-object p2, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocusHandler:Landroid/os/Handler;

    .line 41
    return-void
.end method

.method public setupCameraParameters()V
    .locals 4

    .line 121
    invoke-direct {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getOptimalPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 122
    .local v0, "optimalSize":Landroid/hardware/Camera$Size;
    iget-object v1, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 123
    .local v1, "parameters":Landroid/hardware/Camera$Parameters;
    iget v2, v0, Landroid/hardware/Camera$Size;->width:I

    iget v3, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-virtual {v1, v2, v3}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 124
    iget-object v2, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v2, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 125
    invoke-direct {p0, v0}, Lme/dm7/barcodescanner/core/CameraPreview;->adjustViewSize(Landroid/hardware/Camera$Size;)V

    .line 126
    return-void
.end method

.method public showCameraPreview()V
    .locals 3

    .line 76
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_2

    .line 78
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewing:Z

    .line 79
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->setupCameraParameters()V

    .line 80
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 81
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->getDisplayOrientation()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 82
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    iget-object v1, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 83
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 84
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mAutoFocus:Z

    if-eqz v0, :cond_1

    .line 85
    iget-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mSurfaceCreated:Z

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->safeAutoFocus()V

    goto :goto_0

    .line 88
    :cond_0
    invoke-direct {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->scheduleAutoFocus()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :cond_1
    :goto_0
    goto :goto_1

    .line 91
    :catch_0
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "CameraPreview"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 95
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    :goto_1
    return-void
.end method

.method public stopCameraPreview()V
    .locals 3

    .line 108
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 110
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mPreviewing:Z

    .line 111
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 112
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 113
    iget-object v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mCamera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    goto :goto_0

    .line 114
    :catch_0
    move-exception v0

    .line 115
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "CameraPreview"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 1
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;
    .param p2, "i"    # I
    .param p3, "i2"    # I
    .param p4, "i3"    # I

    .line 62
    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    if-nez v0, :cond_0

    .line 63
    return-void

    .line 65
    :cond_0
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->stopCameraPreview()V

    .line 66
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->showCameraPreview()V

    .line 67
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mSurfaceCreated:Z

    .line 58
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lme/dm7/barcodescanner/core/CameraPreview;->mSurfaceCreated:Z

    .line 72
    invoke-virtual {p0}, Lme/dm7/barcodescanner/core/CameraPreview;->stopCameraPreview()V

    .line 73
    return-void
.end method
