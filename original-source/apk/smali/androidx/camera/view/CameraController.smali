.class public abstract Landroidx/camera/view/CameraController;
.super Ljava/lang/Object;
.source "CameraController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/view/CameraController$OutputSize;,
        Landroidx/camera/view/CameraController$FocusMeteringResultCallback;,
        Landroidx/camera/view/CameraController$UseCases;
    }
.end annotation


# static fields
.field private static final AE_SIZE:F = 0.25f

.field private static final AF_SIZE:F = 0.16666667f

.field private static final CAMERA_NOT_ATTACHED:Ljava/lang/String; = "Use cases not attached to camera."

.field private static final CAMERA_NOT_INITIALIZED:Ljava/lang/String; = "Camera not initialized."

.field public static final COORDINATE_SYSTEM_VIEW_REFERENCED:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final IMAGE_ANALYSIS:I = 0x2

.field public static final IMAGE_CAPTURE:I = 0x1

.field private static final IMAGE_CAPTURE_DISABLED:Ljava/lang/String; = "ImageCapture disabled."

.field private static final NO_OP_SCREEN_FLASH:Landroidx/camera/core/ImageCapture$ScreenFlash;

.field private static final PREVIEW_VIEW_NOT_ATTACHED:Ljava/lang/String; = "PreviewView not attached to CameraController."

.field private static final TAG:Ljava/lang/String; = "CameraController"

.field public static final TAP_TO_FOCUS_FAILED:I = 0x4

.field public static final TAP_TO_FOCUS_FOCUSED:I = 0x2

.field public static final TAP_TO_FOCUS_NOT_FOCUSED:I = 0x3

.field public static final TAP_TO_FOCUS_NOT_STARTED:I = 0x0

.field public static final TAP_TO_FOCUS_STARTED:I = 0x1

.field public static final VIDEO_CAPTURE:I = 0x4

.field private static final VIDEO_CAPTURE_DISABLED:Ljava/lang/String; = "VideoCapture disabled."

.field private static final VIDEO_RECORDING_UNFINISHED:Ljava/lang/String; = "Recording video. Only one recording can be active at a time."


# instance fields
.field mActiveRecording:Landroidx/camera/video/Recording;

.field private mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

.field private mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

.field private mAnalysisExecutor:Ljava/util/concurrent/Executor;

.field private final mAppContext:Landroid/content/Context;

.field mCamera:Landroidx/camera/core/Camera;

.field mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

.field mCameraSelector:Landroidx/camera/core/CameraSelector;

.field final mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

.field private final mEffects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraEffect;",
            ">;"
        }
    .end annotation
.end field

.field private mEnabledUseCases:I

.field private mFocusMeteringResultCallback:Landroidx/camera/view/CameraController$FocusMeteringResultCallback;

.field mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

.field mImageAnalysisResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

.field mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

.field mImageCapture:Landroidx/camera/core/ImageCapture;

.field mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

.field mImageCaptureResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

.field mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

.field private final mInitializationFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mLastKnownRotation:I

.field private final mPendingEnableTorch:Landroidx/camera/view/PendingValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/PendingValue<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingLinearZoom:Landroidx/camera/view/PendingValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/PendingValue<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private final mPendingZoomRatio:Landroidx/camera/view/PendingValue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/PendingValue<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mPinchToZoomEnabled:Z

.field mPreview:Landroidx/camera/core/Preview;

.field private mPreviewDynamicRange:Landroidx/camera/core/DynamicRange;

.field mPreviewResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

.field mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

.field mRecordingMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;",
            "Landroidx/camera/video/Recording;",
            ">;"
        }
    .end annotation
.end field

.field private final mRotationProvider:Landroidx/camera/view/RotationProvider;

.field private final mScreenFlashUiInfoMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;",
            "Landroidx/camera/view/internal/ScreenFlashUiInfo;",
            ">;"
        }
    .end annotation
.end field

.field mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

.field private mTapToFocusAutoCancelDurationNanos:J

.field private mTapToFocusEnabled:Z

.field final mTapToFocusInfoState:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Landroidx/camera/view/TapToFocusInfo;",
            ">;"
        }
    .end annotation
.end field

.field final mTapToFocusState:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mTorchState:Landroidx/camera/view/ForwardingLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/ForwardingLiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mVideoCapture:Landroidx/camera/video/VideoCapture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/video/VideoCapture<",
            "Landroidx/camera/video/Recorder;",
            ">;"
        }
    .end annotation
.end field

.field private mVideoCaptureDynamicRange:Landroidx/camera/core/DynamicRange;

.field private mVideoCaptureMirrorMode:I

.field mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

.field private mVideoCaptureTargetFrameRate:Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mViewPort:Landroidx/camera/core/ViewPort;

.field private final mZoomState:Landroidx/camera/view/ForwardingLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/view/ForwardingLiveData<",
            "Landroidx/camera/core/ZoomState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 239
    new-instance v0, Landroidx/camera/view/CameraController$1;

    invoke-direct {v0}, Landroidx/camera/view/CameraController$1;-><init>()V

    sput-object v0, Landroidx/camera/view/CameraController;->NO_OP_SCREEN_FLASH:Landroidx/camera/core/ImageCapture$ScreenFlash;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 359
    invoke-static {p1}, Landroidx/camera/lifecycle/ProcessCameraProvider;->getInstance(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda7;

    invoke-direct {v1}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda7;-><init>()V

    .line 360
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 359
    invoke-static {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/Futures;->transform(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Landroidx/camera/view/CameraController;-><init>(Landroid/content/Context;Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 361
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/view/ProcessCameraProviderWrapper;",
            ">;)V"
        }
    .end annotation

    .line 364
    .local p2, "cameraProviderFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/view/ProcessCameraProviderWrapper;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 253
    sget-object v0, Landroidx/camera/core/CameraSelector;->DEFAULT_BACK_CAMERA:Landroidx/camera/core/CameraSelector;

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 256
    const/4 v0, 0x3

    iput v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    .line 289
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    .line 291
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mRecordingMap:Ljava/util/Map;

    .line 293
    sget-object v1, Landroidx/camera/video/Recorder;->DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    .line 295
    const/4 v1, 0x0

    iput v1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureMirrorMode:I

    .line 298
    sget-object v2, Landroidx/camera/core/DynamicRange;->UNSPECIFIED:Landroidx/camera/core/DynamicRange;

    iput-object v2, p0, Landroidx/camera/view/CameraController;->mVideoCaptureDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 300
    sget-object v2, Landroidx/camera/core/DynamicRange;->UNSPECIFIED:Landroidx/camera/core/DynamicRange;

    iput-object v2, p0, Landroidx/camera/view/CameraController;->mPreviewDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 302
    sget-object v2, Landroidx/camera/core/impl/StreamSpec;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    iput-object v2, p0, Landroidx/camera/view/CameraController;->mVideoCaptureTargetFrameRate:Landroid/util/Range;

    .line 327
    const/4 v2, -0x1

    iput v2, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    .line 329
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    .line 330
    iput-boolean v2, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    .line 333
    new-instance v2, Landroidx/camera/view/ForwardingLiveData;

    invoke-direct {v2}, Landroidx/camera/view/ForwardingLiveData;-><init>()V

    iput-object v2, p0, Landroidx/camera/view/CameraController;->mZoomState:Landroidx/camera/view/ForwardingLiveData;

    .line 334
    new-instance v2, Landroidx/camera/view/ForwardingLiveData;

    invoke-direct {v2}, Landroidx/camera/view/ForwardingLiveData;-><init>()V

    iput-object v2, p0, Landroidx/camera/view/CameraController;->mTorchState:Landroidx/camera/view/ForwardingLiveData;

    .line 335
    new-instance v2, Landroidx/lifecycle/MutableLiveData;

    new-instance v3, Landroidx/camera/view/TapToFocusInfo;

    invoke-direct {v3, v1, v0}, Landroidx/camera/view/TapToFocusInfo;-><init>(ILandroid/graphics/PointF;)V

    invoke-direct {v2, v3}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Landroidx/camera/view/CameraController;->mTapToFocusInfoState:Landroidx/lifecycle/MutableLiveData;

    .line 337
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mTapToFocusInfoState:Landroidx/lifecycle/MutableLiveData;

    new-instance v2, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda4;-><init>()V

    invoke-static {v1, v2}, Landroidx/camera/core/impl/utils/LiveDataUtil;->map(Landroidx/lifecycle/LiveData;Landroidx/arch/core/util/Function;)Landroidx/lifecycle/LiveData;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mTapToFocusState:Landroidx/lifecycle/LiveData;

    .line 340
    new-instance v1, Landroidx/camera/view/PendingValue;

    invoke-direct {v1}, Landroidx/camera/view/PendingValue;-><init>()V

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mPendingEnableTorch:Landroidx/camera/view/PendingValue;

    .line 342
    new-instance v1, Landroidx/camera/view/PendingValue;

    invoke-direct {v1}, Landroidx/camera/view/PendingValue;-><init>()V

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mPendingLinearZoom:Landroidx/camera/view/PendingValue;

    .line 344
    new-instance v1, Landroidx/camera/view/PendingValue;

    invoke-direct {v1}, Landroidx/camera/view/PendingValue;-><init>()V

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mPendingZoomRatio:Landroidx/camera/view/PendingValue;

    .line 346
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    .line 352
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mScreenFlashUiInfoMap:Ljava/util/Map;

    .line 355
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1388

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v1

    iput-wide v1, p0, Landroidx/camera/view/CameraController;->mTapToFocusAutoCancelDurationNanos:J

    .line 365
    invoke-static {p1}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    .line 366
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->createPreview()Landroidx/camera/core/Preview;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    .line 367
    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->createImageCapture(Ljava/lang/Integer;)Landroidx/camera/core/ImageCapture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    .line 368
    invoke-direct {p0, v0, v0, v0}, Landroidx/camera/view/CameraController;->createImageAnalysis(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Landroidx/camera/core/ImageAnalysis;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 369
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->createVideoCapture()Landroidx/camera/video/VideoCapture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    .line 372
    new-instance v0, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda5;-><init>(Landroidx/camera/view/CameraController;)V

    .line 379
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    .line 372
    invoke-static {p2, v0, v1}, Landroidx/camera/core/impl/utils/futures/Futures;->transform(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mInitializationFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 384
    new-instance v0, Landroidx/camera/view/RotationProvider;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/camera/view/RotationProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mRotationProvider:Landroidx/camera/view/RotationProvider;

    .line 385
    new-instance v0, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda6;-><init>(Landroidx/camera/view/CameraController;)V

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

    .line 391
    return-void
.end method

.method private checkAudioPermissionGranted()V
    .locals 3

    .line 1693
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    const-string v1, "android.permission.RECORD_AUDIO"

    invoke-static {v0, v1}, Landroidx/core/content/PermissionChecker;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 1695
    .local v0, "permissionState":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1699
    return-void

    .line 1696
    :cond_0
    new-instance v1, Ljava/lang/SecurityException;

    const-string v2, "Attempted to start recording with audio, but application does not have RECORD_AUDIO permission granted."

    invoke-direct {v1, v2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private configureResolution(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/core/resolutionselector/ResolutionSelector;Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 2
    .param p2, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .param p3, "outputSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/ImageOutputConfig$Builder<",
            "*>;",
            "Landroidx/camera/core/resolutionselector/ResolutionSelector;",
            "Landroidx/camera/view/CameraController$OutputSize;",
            ")V"
        }
    .end annotation

    .line 514
    .local p1, "builder":Landroidx/camera/core/impl/ImageOutputConfig$Builder;, "Landroidx/camera/core/impl/ImageOutputConfig$Builder<*>;"
    if-eqz p2, :cond_0

    .line 515
    invoke-interface {p1, p2}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Ljava/lang/Object;

    goto :goto_0

    .line 516
    :cond_0
    if-eqz p3, :cond_1

    .line 517
    invoke-direct {p0, p1, p3}, Landroidx/camera/view/CameraController;->setTargetOutputSize(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/view/CameraController$OutputSize;)V

    goto :goto_0

    .line 518
    :cond_1
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    if-eqz v0, :cond_2

    .line 521
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->getViewportAspectRatioStrategy(Landroidx/camera/core/ViewPort;)Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    move-result-object v0

    .line 522
    .local v0, "aspectRatioStrategy":Landroidx/camera/core/resolutionselector/AspectRatioStrategy;
    if-eqz v0, :cond_2

    .line 523
    new-instance v1, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    invoke-direct {v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;-><init>()V

    .line 524
    invoke-virtual {v1, v0}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->setAspectRatioStrategy(Landroidx/camera/core/resolutionselector/AspectRatioStrategy;)Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;

    move-result-object v1

    .line 525
    invoke-virtual {v1}, Landroidx/camera/core/resolutionselector/ResolutionSelector$Builder;->build()Landroidx/camera/core/resolutionselector/ResolutionSelector;

    move-result-object v1

    .line 523
    invoke-interface {p1, v1}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)Ljava/lang/Object;

    .line 528
    .end local v0    # "aspectRatioStrategy":Landroidx/camera/core/resolutionselector/AspectRatioStrategy;
    :cond_2
    :goto_0
    return-void
.end method

.method private createFocusMeteringAction(Landroidx/camera/core/MeteringPointFactory;Landroid/graphics/PointF;)Landroidx/camera/core/FocusMeteringAction;
    .locals 7
    .param p1, "meteringPointFactory"    # Landroidx/camera/core/MeteringPointFactory;
    .param p2, "tapPoint"    # Landroid/graphics/PointF;

    .line 2277
    iget v0, p2, Landroid/graphics/PointF;->x:F

    iget v1, p2, Landroid/graphics/PointF;->y:F

    const v2, 0x3e2aaaab

    invoke-virtual {p1, v0, v1, v2}, Landroidx/camera/core/MeteringPointFactory;->createPoint(FFF)Landroidx/camera/core/MeteringPoint;

    move-result-object v0

    .line 2278
    .local v0, "afPoint":Landroidx/camera/core/MeteringPoint;
    iget v1, p2, Landroid/graphics/PointF;->x:F

    iget v2, p2, Landroid/graphics/PointF;->y:F

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-virtual {p1, v1, v2, v3}, Landroidx/camera/core/MeteringPointFactory;->createPoint(FFF)Landroidx/camera/core/MeteringPoint;

    move-result-object v1

    .line 2279
    .local v1, "aePoint":Landroidx/camera/core/MeteringPoint;
    new-instance v2, Landroidx/camera/core/FocusMeteringAction$Builder;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Landroidx/camera/core/FocusMeteringAction$Builder;-><init>(Landroidx/camera/core/MeteringPoint;I)V

    .line 2281
    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Landroidx/camera/core/FocusMeteringAction$Builder;->addPoint(Landroidx/camera/core/MeteringPoint;I)Landroidx/camera/core/FocusMeteringAction$Builder;

    move-result-object v2

    .line 2282
    .local v2, "focusMeteringActionBuilder":Landroidx/camera/core/FocusMeteringAction$Builder;
    iget-wide v3, p0, Landroidx/camera/view/CameraController;->mTapToFocusAutoCancelDurationNanos:J

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_0

    .line 2283
    iget-wide v3, p0, Landroidx/camera/view/CameraController;->mTapToFocusAutoCancelDurationNanos:J

    sget-object v5, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Landroidx/camera/core/FocusMeteringAction$Builder;->setAutoCancelDuration(JLjava/util/concurrent/TimeUnit;)Landroidx/camera/core/FocusMeteringAction$Builder;

    move-result-object v2

    goto :goto_0

    .line 2286
    :cond_0
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction$Builder;->disableAutoCancel()Landroidx/camera/core/FocusMeteringAction$Builder;

    move-result-object v2

    .line 2288
    :goto_0
    invoke-virtual {v2}, Landroidx/camera/core/FocusMeteringAction$Builder;->build()Landroidx/camera/core/FocusMeteringAction;

    move-result-object v3

    return-object v3
.end method

.method private createImageAnalysis(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Landroidx/camera/core/ImageAnalysis;
    .locals 3
    .param p1, "strategy"    # Ljava/lang/Integer;
    .param p2, "imageQueueDepth"    # Ljava/lang/Integer;
    .param p3, "outputFormat"    # Ljava/lang/Integer;

    .line 1507
    new-instance v0, Landroidx/camera/core/ImageAnalysis$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageAnalysis$Builder;-><init>()V

    .line 1508
    .local v0, "builder":Landroidx/camera/core/ImageAnalysis$Builder;
    if-eqz p1, :cond_0

    .line 1509
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;->setBackpressureStrategy(I)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1511
    :cond_0
    if-eqz p2, :cond_1

    .line 1512
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;->setImageQueueDepth(I)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1514
    :cond_1
    if-eqz p3, :cond_2

    .line 1515
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;->setOutputImageFormat(I)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1517
    :cond_2
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysisResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->configureResolution(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/core/resolutionselector/ResolutionSelector;Landroidx/camera/view/CameraController$OutputSize;)V

    .line 1518
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_3

    .line 1519
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;->setBackgroundExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1521
    :cond_3
    iget v1, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_4

    .line 1522
    iget v1, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageAnalysis$Builder;->setTargetRotation(I)Landroidx/camera/core/ImageAnalysis$Builder;

    .line 1525
    :cond_4
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis$Builder;->build()Landroidx/camera/core/ImageAnalysis;

    move-result-object v1

    return-object v1
.end method

.method private createImageCapture(Ljava/lang/Integer;)Landroidx/camera/core/ImageCapture;
    .locals 3
    .param p1, "imageCaptureMode"    # Ljava/lang/Integer;

    .line 1129
    new-instance v0, Landroidx/camera/core/ImageCapture$Builder;

    invoke-direct {v0}, Landroidx/camera/core/ImageCapture$Builder;-><init>()V

    .line 1130
    .local v0, "builder":Landroidx/camera/core/ImageCapture$Builder;
    if-eqz p1, :cond_0

    .line 1131
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Builder;->setCaptureMode(I)Landroidx/camera/core/ImageCapture$Builder;

    .line 1133
    :cond_0
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCaptureResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->configureResolution(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/core/resolutionselector/ResolutionSelector;Landroidx/camera/view/CameraController$OutputSize;)V

    .line 1134
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    if-eqz v1, :cond_1

    .line 1135
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Builder;->setIoExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/core/ImageCapture$Builder;

    .line 1137
    :cond_1
    iget v1, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 1138
    iget v1, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Builder;->setTargetRotation(I)Landroidx/camera/core/ImageCapture$Builder;

    .line 1141
    :cond_2
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Builder;->build()Landroidx/camera/core/ImageCapture;

    move-result-object v1

    return-object v1
.end method

.method private createPreview()Landroidx/camera/core/Preview;
    .locals 3

    .line 746
    new-instance v0, Landroidx/camera/core/Preview$Builder;

    invoke-direct {v0}, Landroidx/camera/core/Preview$Builder;-><init>()V

    .line 747
    .local v0, "builder":Landroidx/camera/core/Preview$Builder;
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mPreviewResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->configureResolution(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/core/resolutionselector/ResolutionSelector;Landroidx/camera/view/CameraController$OutputSize;)V

    .line 748
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mPreviewDynamicRange:Landroidx/camera/core/DynamicRange;

    invoke-virtual {v0, v1}, Landroidx/camera/core/Preview$Builder;->setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/core/Preview$Builder;

    .line 749
    invoke-virtual {v0}, Landroidx/camera/core/Preview$Builder;->build()Landroidx/camera/core/Preview;

    move-result-object v1

    return-object v1
.end method

.method private createVideoCapture()Landroidx/camera/video/VideoCapture;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/camera/video/VideoCapture<",
            "Landroidx/camera/video/Recorder;",
            ">;"
        }
    .end annotation

    .line 1949
    new-instance v0, Landroidx/camera/video/Recorder$Builder;

    invoke-direct {v0}, Landroidx/camera/video/Recorder$Builder;-><init>()V

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$Builder;->setQualitySelector(Landroidx/camera/video/QualitySelector;)Landroidx/camera/video/Recorder$Builder;

    move-result-object v0

    .line 1951
    .local v0, "videoRecorderBuilder":Landroidx/camera/video/Recorder$Builder;
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    const/4 v2, -0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    sget-object v3, Landroidx/camera/video/Recorder;->DEFAULT_QUALITY_SELECTOR:Landroidx/camera/video/QualitySelector;

    if-ne v1, v3, :cond_0

    .line 1953
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    invoke-direct {p0, v1}, Landroidx/camera/view/CameraController;->getViewportAspectRatioInt(Landroidx/camera/core/ViewPort;)I

    move-result v1

    .line 1954
    .local v1, "aspectRatioInt":I
    if-eq v1, v2, :cond_0

    .line 1955
    invoke-virtual {v0, v1}, Landroidx/camera/video/Recorder$Builder;->setAspectRatio(I)Landroidx/camera/video/Recorder$Builder;

    .line 1959
    .end local v1    # "aspectRatioInt":I
    :cond_0
    new-instance v1, Landroidx/camera/video/VideoCapture$Builder;

    .line 1960
    invoke-virtual {v0}, Landroidx/camera/video/Recorder$Builder;->build()Landroidx/camera/video/Recorder;

    move-result-object v3

    invoke-direct {v1, v3}, Landroidx/camera/video/VideoCapture$Builder;-><init>(Landroidx/camera/video/VideoOutput;)V

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mVideoCaptureTargetFrameRate:Landroid/util/Range;

    .line 1961
    invoke-virtual {v1, v3}, Landroidx/camera/video/VideoCapture$Builder;->setTargetFrameRate(Landroid/util/Range;)Landroidx/camera/video/VideoCapture$Builder;

    move-result-object v1

    iget v3, p0, Landroidx/camera/view/CameraController;->mVideoCaptureMirrorMode:I

    .line 1962
    invoke-virtual {v1, v3}, Landroidx/camera/video/VideoCapture$Builder;->setMirrorMode(I)Landroidx/camera/video/VideoCapture$Builder;

    move-result-object v1

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mVideoCaptureDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 1963
    invoke-virtual {v1, v3}, Landroidx/camera/video/VideoCapture$Builder;->setDynamicRange(Landroidx/camera/core/DynamicRange;)Landroidx/camera/video/VideoCapture$Builder;

    move-result-object v1

    .line 1964
    .local v1, "builder":Landroidx/camera/video/VideoCapture$Builder;, "Landroidx/camera/video/VideoCapture$Builder<Landroidx/camera/video/Recorder;>;"
    iget v3, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    if-eq v3, v2, :cond_1

    .line 1965
    iget v2, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    invoke-virtual {v1, v2}, Landroidx/camera/video/VideoCapture$Builder;->setTargetRotation(I)Landroidx/camera/video/VideoCapture$Builder;

    .line 1967
    :cond_1
    invoke-virtual {v1}, Landroidx/camera/video/VideoCapture$Builder;->build()Landroidx/camera/video/VideoCapture;

    move-result-object v2

    return-object v2
.end method

.method private deactivateRecording(Landroidx/camera/video/Recording;)V
    .locals 1
    .param p1, "recording"    # Landroidx/camera/video/Recording;

    .line 1764
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    if-ne v0, p1, :cond_0

    .line 1765
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    .line 1767
    :cond_0
    return-void
.end method

.method private getReadableSelectorString(Landroidx/camera/core/CameraSelector;)Ljava/lang/String;
    .locals 4
    .param p1, "selector"    # Landroidx/camera/core/CameraSelector;

    .line 2023
    if-nez p1, :cond_0

    .line 2024
    const-string v0, "null"

    return-object v0

    .line 2026
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CameraSelector{"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2028
    .local v0, "description":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v1

    .line 2029
    .local v1, "lensFacing":Ljava/lang/Integer;
    if-eqz v1, :cond_1

    .line 2030
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 2041
    const-string v2, "lensFacing=UNKNOWN("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2042
    goto :goto_0

    .line 2038
    :pswitch_0
    const-string v2, "lensFacing=EXTERNAL"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2039
    goto :goto_0

    .line 2032
    :pswitch_1
    const-string v2, "lensFacing=BACK"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2033
    goto :goto_0

    .line 2035
    :pswitch_2
    const-string v2, "lensFacing=FRONT"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2036
    goto :goto_0

    .line 2045
    :cond_1
    const-string v2, "lensFacing=NOT_SPECIFIED"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2048
    :goto_0
    const-string/jumbo v2, "}"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2049
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getViewportAspectRatioInt(Landroidx/camera/core/ViewPort;)I
    .locals 10
    .param p1, "viewPort"    # Landroidx/camera/core/ViewPort;

    .line 1987
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move v1, v0

    goto :goto_0

    .line 1988
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/ViewPort;->getRotation()I

    move-result v1

    .line 1987
    invoke-static {v1}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->surfaceRotationToDegrees(I)I

    move-result v1

    .line 1989
    .local v1, "surfaceRotationDegrees":I
    :goto_0
    const/4 v2, 0x0

    .line 1990
    .local v2, "sensorRotationDegrees":I
    const/4 v3, 0x1

    .line 1992
    .local v3, "isOppositeFacing":Z
    const/4 v4, 0x1

    :try_start_0
    iget-object v5, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v5, :cond_2

    .line 1993
    iget-object v5, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    iget-object v6, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    invoke-interface {v5, v6}, Landroidx/camera/view/ProcessCameraProviderWrapper;->getCameraInfo(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraInfo;

    move-result-object v5

    .line 1994
    .local v5, "cameraInfo":Landroidx/camera/core/CameraInfo;
    invoke-interface {v5}, Landroidx/camera/core/CameraInfo;->getSensorRotationDegrees()I

    move-result v6

    move v2, v6

    .line 1995
    invoke-interface {v5}, Landroidx/camera/core/CameraInfo;->getLensFacing()I

    move-result v6
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne v6, v4, :cond_1

    move v6, v4

    goto :goto_1

    :cond_1
    move v6, v0

    :goto_1
    move v3, v6

    .line 2000
    .end local v5    # "cameraInfo":Landroidx/camera/core/CameraInfo;
    :cond_2
    goto :goto_2

    .line 1997
    :catch_0
    move-exception v5

    .line 1998
    .local v5, "e":Ljava/lang/IllegalArgumentException;
    iget-object v6, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    invoke-direct {p0, v6}, Landroidx/camera/view/CameraController;->getReadableSelectorString(Landroidx/camera/core/CameraSelector;)Ljava/lang/String;

    move-result-object v6

    .line 1999
    .local v6, "readableSelector":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to retrieve CameraInfo for selector: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "CameraController"

    invoke-static {v8, v7, v5}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2001
    .end local v5    # "e":Ljava/lang/IllegalArgumentException;
    .end local v6    # "readableSelector":Ljava/lang/String;
    :goto_2
    invoke-static {v1, v2, v3}, Landroidx/camera/core/impl/utils/CameraOrientationUtil;->getRelativeImageRotation(IIZ)I

    move-result v5

    .line 2003
    .local v5, "relativeRotation":I
    invoke-virtual {p1}, Landroidx/camera/core/ViewPort;->getAspectRatio()Landroid/util/Rational;

    move-result-object v6

    .line 2004
    .local v6, "aspectRatio":Landroid/util/Rational;
    const/16 v7, 0x5a

    if-eq v5, v7, :cond_3

    const/16 v7, 0x10e

    if-ne v5, v7, :cond_4

    .line 2005
    :cond_3
    new-instance v7, Landroid/util/Rational;

    invoke-virtual {v6}, Landroid/util/Rational;->getDenominator()I

    move-result v8

    .line 2006
    invoke-virtual {v6}, Landroid/util/Rational;->getNumerator()I

    move-result v9

    invoke-direct {v7, v8, v9}, Landroid/util/Rational;-><init>(II)V

    move-object v6, v7

    .line 2009
    :cond_4
    sget-object v7, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_4_3:Landroid/util/Rational;

    invoke-virtual {v6, v7}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 2010
    return v0

    .line 2011
    :cond_5
    sget-object v0, Landroidx/camera/core/impl/utils/AspectRatioUtil;->ASPECT_RATIO_16_9:Landroid/util/Rational;

    invoke-virtual {v6, v0}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 2012
    return v4

    .line 2014
    :cond_6
    const/4 v0, -0x1

    return v0
.end method

.method private getViewportAspectRatioStrategy(Landroidx/camera/core/ViewPort;)Landroidx/camera/core/resolutionselector/AspectRatioStrategy;
    .locals 3
    .param p1, "viewPort"    # Landroidx/camera/core/ViewPort;

    .line 1972
    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;->getViewportAspectRatioInt(Landroidx/camera/core/ViewPort;)I

    move-result v0

    .line 1973
    .local v0, "aspectRatioInt":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 1974
    new-instance v1, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Landroidx/camera/core/resolutionselector/AspectRatioStrategy;-><init>(II)V

    return-object v1

    .line 1976
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private isCameraAttached()Z
    .locals 1

    .line 435
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isCameraInitialized()Z
    .locals 1

    .line 427
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z
    .locals 2
    .param p1, "currentSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .param p2, "newSize"    # Landroidx/camera/view/CameraController$OutputSize;

    .line 553
    const/4 v0, 0x1

    if-ne p1, p2, :cond_0

    .line 554
    return v0

    .line 556
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isPreviewViewAttached()Z
    .locals 1

    .line 431
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isUseCaseEnabled(I)Z
    .locals 1
    .param p1, "useCaseMask"    # I

    .line 500
    iget v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private prepareRecording(Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;
    .locals 3
    .param p1, "options"    # Landroidx/camera/video/OutputOptions;

    .line 1714
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v0}, Landroidx/camera/video/VideoCapture;->getOutput()Landroidx/camera/video/VideoOutput;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recorder;

    .line 1715
    .local v0, "recorder":Landroidx/camera/video/Recorder;
    instance-of v1, p1, Landroidx/camera/video/FileOutputOptions;

    if-eqz v1, :cond_0

    .line 1716
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    move-object v2, p1

    check-cast v2, Landroidx/camera/video/FileOutputOptions;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/video/Recorder;->prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileOutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    return-object v1

    .line 1717
    :cond_0
    instance-of v1, p1, Landroidx/camera/video/FileDescriptorOutputOptions;

    if-eqz v1, :cond_2

    .line 1718
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_1

    .line 1723
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    move-object v2, p1

    check-cast v2, Landroidx/camera/video/FileDescriptorOutputOptions;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/video/Recorder;->prepareRecording(Landroid/content/Context;Landroidx/camera/video/FileDescriptorOutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    return-object v1

    .line 1719
    :cond_1
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "File descriptors are not supported on pre-Android O (API 26) devices."

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1724
    :cond_2
    instance-of v1, p1, Landroidx/camera/video/MediaStoreOutputOptions;

    if-eqz v1, :cond_3

    .line 1725
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    move-object v2, p1

    check-cast v2, Landroidx/camera/video/MediaStoreOutputOptions;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/video/Recorder;->prepareRecording(Landroid/content/Context;Landroidx/camera/video/MediaStoreOutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    return-object v1

    .line 1727
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Unsupported OutputOptions type."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private restartCameraIfAnalyzerResolutionChanged(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/camera/core/ImageAnalysis$Analyzer;)V
    .locals 5
    .param p1, "oldAnalyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;
    .param p2, "newAnalyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 1222
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object v1, v0

    goto :goto_0

    .line 1223
    :cond_0
    invoke-interface {p1}, Landroidx/camera/core/ImageAnalysis$Analyzer;->getDefaultTargetResolution()Landroid/util/Size;

    move-result-object v1

    :goto_0
    nop

    .line 1224
    .local v1, "oldResolution":Landroid/util/Size;
    if-nez p2, :cond_1

    goto :goto_1

    .line 1225
    :cond_1
    invoke-interface {p2}, Landroidx/camera/core/ImageAnalysis$Analyzer;->getDefaultTargetResolution()Landroid/util/Size;

    move-result-object v0

    :goto_1
    nop

    .line 1226
    .local v0, "newResolution":Landroid/util/Size;
    invoke-static {v1, v0}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1228
    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1229
    invoke-virtual {v3}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v4}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1228
    invoke-direct {p0, v2, v3, v4}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 1230
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1232
    :cond_2
    return-void
.end method

.method private setActiveRecording(Landroidx/camera/video/Recording;Landroidx/core/util/Consumer;)V
    .locals 1
    .param p1, "recording"    # Landroidx/camera/video/Recording;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/Recording;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)V"
        }
    .end annotation

    .line 1773
    .local p2, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRecordingMap:Ljava/util/Map;

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1774
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    .line 1775
    return-void
.end method

.method private setTargetOutputSize(Landroidx/camera/core/impl/ImageOutputConfig$Builder;Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 2
    .param p2, "outputSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/ImageOutputConfig$Builder<",
            "*>;",
            "Landroidx/camera/view/CameraController$OutputSize;",
            ")V"
        }
    .end annotation

    .line 535
    .local p1, "builder":Landroidx/camera/core/impl/ImageOutputConfig$Builder;, "Landroidx/camera/core/impl/ImageOutputConfig$Builder<*>;"
    if-nez p2, :cond_0

    .line 536
    return-void

    .line 538
    :cond_0
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getResolution()Landroid/util/Size;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 539
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getResolution()Landroid/util/Size;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setTargetResolution(Landroid/util/Size;)Ljava/lang/Object;

    goto :goto_0

    .line 540
    :cond_1
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getAspectRatio()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    .line 541
    invoke-virtual {p2}, Landroidx/camera/view/CameraController$OutputSize;->getAspectRatio()I

    move-result v0

    invoke-interface {p1, v0}, Landroidx/camera/core/impl/ImageOutputConfig$Builder;->setTargetAspectRatio(I)Ljava/lang/Object;

    goto :goto_0

    .line 543
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid target surface size. "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CameraController"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    :goto_0
    return-void
.end method

.method private speedUpZoomBy2X(F)F
    .locals 3
    .param p1, "scaleFactor"    # F

    .line 2225
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v0

    const/high16 v2, 0x40000000    # 2.0f

    if-lez v1, :cond_0

    .line 2226
    sub-float v1, p1, v0

    mul-float/2addr v1, v2

    add-float/2addr v1, v0

    return v1

    .line 2228
    :cond_0
    sub-float v1, v0, p1

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    return v0
.end method

.method private startListeningToRotationEvents()V
    .locals 3

    .line 603
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRotationProvider:Landroidx/camera/view/RotationProvider;

    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/view/RotationProvider;->addListener(Ljava/util/concurrent/Executor;Landroidx/camera/view/RotationProvider$Listener;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 604
    const-string v0, "CameraController"

    const-string v1, "The device cannot detect rotation changes."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    :cond_0
    return-void
.end method

.method private startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 4
    .param p1, "outputOptions"    # Landroidx/camera/video/OutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/OutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1673
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1674
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const-string v1, "Camera not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1675
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isVideoCaptureEnabled()Z

    move-result v0

    const-string v1, "VideoCapture disabled."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1676
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isRecording()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Recording video. Only one recording can be active at a time."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1678
    nop

    .line 1679
    invoke-direct {p0, p4}, Landroidx/camera/view/CameraController;->wrapListenerToDeactivateRecordingOnFinalized(Landroidx/core/util/Consumer;)Landroidx/core/util/Consumer;

    move-result-object v0

    .line 1680
    .local v0, "wrappedListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;->prepareRecording(Landroidx/camera/video/OutputOptions;)Landroidx/camera/video/PendingRecording;

    move-result-object v1

    .line 1681
    .local v1, "pendingRecording":Landroidx/camera/video/PendingRecording;
    invoke-virtual {p2}, Landroidx/camera/view/video/AudioConfig;->getAudioEnabled()Z

    move-result v2

    .line 1682
    .local v2, "isAudioEnabled":Z
    if-eqz v2, :cond_0

    .line 1683
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->checkAudioPermissionGranted()V

    .line 1684
    invoke-virtual {v1}, Landroidx/camera/video/PendingRecording;->withAudioEnabled()Landroidx/camera/video/PendingRecording;

    .line 1686
    :cond_0
    invoke-virtual {v1, p3, v0}, Landroidx/camera/video/PendingRecording;->start(Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v3

    .line 1687
    .local v3, "recording":Landroidx/camera/video/Recording;
    invoke-direct {p0, v3, v0}, Landroidx/camera/view/CameraController;->setActiveRecording(Landroidx/camera/video/Recording;Landroidx/core/util/Consumer;)V

    .line 1689
    return-object v3
.end method

.method private stopListeningToRotationEvents()V
    .locals 2

    .line 609
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRotationProvider:Landroidx/camera/view/RotationProvider;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mDeviceRotationListener:Landroidx/camera/view/RotationProvider$Listener;

    invoke-virtual {v0, v1}, Landroidx/camera/view/RotationProvider;->removeListener(Landroidx/camera/view/RotationProvider$Listener;)V

    .line 610
    return-void
.end method

.method private stopRecording()V
    .locals 1

    .line 1787
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1789
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    if-eqz v0, :cond_0

    .line 1790
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    invoke-virtual {v0}, Landroidx/camera/video/Recording;->stop()V

    .line 1791
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->deactivateRecording(Landroidx/camera/video/Recording;)V

    .line 1793
    :cond_0
    return-void
.end method

.method private throwExceptionForInvalidScreenFlashCapture()V
    .locals 2

    .line 957
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getImageCaptureFlashMode()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 958
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getScreenFlashUiInfoByPriority()Landroidx/camera/view/internal/ScreenFlashUiInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 959
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getScreenFlashUiInfoByPriority()Landroidx/camera/view/internal/ScreenFlashUiInfo;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/view/internal/ScreenFlashUiInfo;->getScreenFlash()Landroidx/camera/core/ImageCapture$ScreenFlash;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 962
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No window set in PreviewView despite setting FLASH_MODE_SCREEN"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 965
    :cond_1
    :goto_0
    return-void
.end method

.method private unbindAllAndRecreate()V
    .locals 3

    .line 2068
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindPreviewAndRecreate()V

    .line 2069
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getImageCaptureMode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(Ljava/lang/Integer;)V

    .line 2070
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 2071
    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 2070
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 2072
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindVideoAndRecreate()V

    .line 2073
    return-void
.end method

.method private unbindAllUseCases()V
    .locals 4

    .line 2054
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2055
    return-void

    .line 2060
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x4

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 2061
    return-void
.end method

.method private unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 4
    .param p1, "strategy"    # Ljava/lang/Integer;
    .param p2, "imageQueueDepth"    # Ljava/lang/Integer;
    .param p3, "outputFormat"    # Ljava/lang/Integer;

    .line 1494
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1495
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1496
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1498
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/view/CameraController;->createImageAnalysis(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Landroidx/camera/core/ImageAnalysis;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1499
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-eqz v0, :cond_1

    .line 1500
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/ImageAnalysis;->setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 1502
    :cond_1
    return-void
.end method

.method private unbindImageCaptureAndRecreate(Ljava/lang/Integer;)V
    .locals 4
    .param p1, "imageCaptureMode"    # Ljava/lang/Integer;

    .line 1119
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1120
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1122
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getFlashMode()I

    move-result v0

    .line 1123
    .local v0, "flashMode":I
    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;->createImageCapture(Ljava/lang/Integer;)Landroidx/camera/core/ImageCapture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    .line 1124
    invoke-virtual {p0, v0}, Landroidx/camera/view/CameraController;->setImageCaptureFlashMode(I)V

    .line 1125
    return-void
.end method

.method private unbindPreviewAndRecreate()V
    .locals 4

    .line 736
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 737
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 739
    :cond_0
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->createPreview()Landroidx/camera/core/Preview;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    .line 740
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    if-eqz v0, :cond_1

    .line 741
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    invoke-virtual {v0, v1}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 743
    :cond_1
    return-void
.end method

.method private unbindVideoAndRecreate()V
    .locals 4

    .line 1941
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1942
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x1

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 1944
    :cond_0
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->createVideoCapture()Landroidx/camera/video/VideoCapture;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    .line 1945
    return-void
.end method

.method private wrapListenerToDeactivateRecordingOnFinalized(Landroidx/core/util/Consumer;)Landroidx/core/util/Consumer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;"
        }
    .end annotation

    .line 1733
    .local p1, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v0

    .line 1735
    .local v0, "mainExecutor":Ljava/util/concurrent/Executor;
    new-instance v1, Landroidx/camera/view/CameraController$2;

    invoke-direct {v1, p0, v0, p1}, Landroidx/camera/view/CameraController$2;-><init>(Landroidx/camera/view/CameraController;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    return-object v1
.end method


# virtual methods
.method attachPreviewSurface(Landroidx/camera/core/Preview$SurfaceProvider;Landroidx/camera/core/ViewPort;)V
    .locals 2
    .param p1, "surfaceProvider"    # Landroidx/camera/core/Preview$SurfaceProvider;
    .param p2, "viewPort"    # Landroidx/camera/core/ViewPort;

    .line 570
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 571
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    if-eq v0, p1, :cond_0

    .line 572
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    .line 573
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    invoke-virtual {v0, p1}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 575
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    if-eqz v0, :cond_2

    invoke-direct {p0, p2}, Landroidx/camera/view/CameraController;->getViewportAspectRatioStrategy(Landroidx/camera/core/ViewPort;)Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 576
    invoke-direct {p0, v1}, Landroidx/camera/view/CameraController;->getViewportAspectRatioStrategy(Landroidx/camera/core/ViewPort;)Landroidx/camera/core/resolutionselector/AspectRatioStrategy;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 577
    .local v0, "shouldUpdateAspectRatio":Z
    :goto_1
    iput-object p2, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 578
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->startListeningToRotationEvents()V

    .line 579
    if-eqz v0, :cond_3

    .line 580
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindAllAndRecreate()V

    .line 582
    :cond_3
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 583
    return-void
.end method

.method public clearEffects()V
    .locals 1

    .line 2680
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2681
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 2683
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbindAll()V

    .line 2685
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 2686
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 2687
    return-void
.end method

.method public clearImageAnalysisAnalyzer()V
    .locals 3

    .line 1211
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1212
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 1213
    .local v0, "oldAnalyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    .line 1214
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 1215
    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->clearAnalyzer()V

    .line 1216
    invoke-direct {p0, v0, v1}, Landroidx/camera/view/CameraController;->restartCameraIfAnalyzerResolutionChanged(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 1217
    return-void
.end method

.method clearPreviewSurface()V
    .locals 4

    .line 590
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 591
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 593
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v1, 0x4

    new-array v1, v1, [Landroidx/camera/core/UseCase;

    const/4 v2, 0x0

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v3, v1, v2

    invoke-interface {v0, v1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 595
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/Preview;->setSurfaceProvider(Landroidx/camera/core/Preview$SurfaceProvider;)V

    .line 596
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    .line 597
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mSurfaceProvider:Landroidx/camera/core/Preview$SurfaceProvider;

    .line 598
    iput-object v1, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    .line 599
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->stopListeningToRotationEvents()V

    .line 600
    return-void
.end method

.method protected createUseCaseGroup()Landroidx/camera/core/UseCaseGroup;
    .locals 3

    .line 2735
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "CameraController"

    if-nez v0, :cond_0

    .line 2736
    const-string v0, "Camera not initialized."

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2737
    return-object v1

    .line 2739
    :cond_0
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isPreviewViewAttached()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2741
    const-string v0, "PreviewView not attached to CameraController."

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2742
    return-object v1

    .line 2747
    :cond_1
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindAllUseCases()V

    .line 2749
    new-instance v0, Landroidx/camera/core/UseCaseGroup$Builder;

    invoke-direct {v0}, Landroidx/camera/core/UseCaseGroup$Builder;-><init>()V

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    move-result-object v0

    .line 2751
    .local v0, "builder":Landroidx/camera/core/UseCaseGroup$Builder;
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageCaptureEnabled()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2752
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    .line 2755
    :cond_2
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageAnalysisEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2756
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    .line 2759
    :cond_3
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isVideoCaptureEnabled()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2760
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->addUseCase(Landroidx/camera/core/UseCase;)Landroidx/camera/core/UseCaseGroup$Builder;

    .line 2763
    :cond_4
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mViewPort:Landroidx/camera/core/ViewPort;

    invoke-virtual {v0, v1}, Landroidx/camera/core/UseCaseGroup$Builder;->setViewPort(Landroidx/camera/core/ViewPort;)Landroidx/camera/core/UseCaseGroup$Builder;

    .line 2764
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/CameraEffect;

    .line 2765
    .local v2, "effect":Landroidx/camera/core/CameraEffect;
    invoke-virtual {v0, v2}, Landroidx/camera/core/UseCaseGroup$Builder;->addEffect(Landroidx/camera/core/CameraEffect;)Landroidx/camera/core/UseCaseGroup$Builder;

    .line 2766
    .end local v2    # "effect":Landroidx/camera/core/CameraEffect;
    goto :goto_0

    .line 2767
    :cond_5
    invoke-virtual {v0}, Landroidx/camera/core/UseCaseGroup$Builder;->build()Landroidx/camera/core/UseCaseGroup;

    move-result-object v1

    return-object v1
.end method

.method deactivateRecordingByListener(Landroidx/core/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)V"
        }
    .end annotation

    .line 1753
    .local p1, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mRecordingMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/Recording;

    .line 1754
    .local v0, "recording":Landroidx/camera/video/Recording;
    if-eqz v0, :cond_0

    .line 1755
    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->deactivateRecording(Landroidx/camera/video/Recording;)V

    .line 1757
    :cond_0
    return-void
.end method

.method public enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "torchEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 2630
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2631
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2632
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingEnableTorch:Landroidx/camera/view/PendingValue;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->setValue(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 2634
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraControl;->enableTorch(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public getCameraControl()Landroidx/camera/core/CameraControl;
    .locals 1

    .line 2544
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2545
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getCameraInfo()Landroidx/camera/core/CameraInfo;
    .locals 1

    .line 2525
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2526
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getCameraSelector()Landroidx/camera/core/CameraSelector;
    .locals 1

    .line 2167
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2168
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    return-object v0
.end method

.method public getImageAnalysisBackgroundExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 1430
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1431
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getImageAnalysisBackpressureStrategy()I
    .locals 1

    .line 1245
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1246
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    return v0
.end method

.method public getImageAnalysisImageQueueDepth()I
    .locals 1

    .line 1307
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1308
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v0

    return v0
.end method

.method public getImageAnalysisOutputImageFormat()I
    .locals 1

    .line 1484
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1485
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v0

    return v0
.end method

.method public getImageAnalysisResolutionSelector()Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 1

    .line 1395
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1396
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysisResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    return-object v0
.end method

.method public getImageAnalysisTargetSize()Landroidx/camera/view/CameraController$OutputSize;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1353
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1354
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    return-object v0
.end method

.method public getImageCaptureFlashMode()I
    .locals 1

    .line 780
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 781
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getFlashMode()I

    move-result v0

    return v0
.end method

.method public getImageCaptureIoExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 1110
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1111
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getImageCaptureMode()I
    .locals 1

    .line 997
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 998
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v0

    return v0
.end method

.method public getImageCaptureResolutionSelector()Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 1

    .line 1077
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1078
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    return-object v0
.end method

.method public getImageCaptureTargetSize()Landroidx/camera/view/CameraController$OutputSize;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1038
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1039
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    return-object v0
.end method

.method public getInitializationFuture()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 415
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mInitializationFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    return-object v0
.end method

.method public getPreviewDynamicRange()Landroidx/camera/core/DynamicRange;
    .locals 1

    .line 727
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 728
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreviewDynamicRange:Landroidx/camera/core/DynamicRange;

    return-object v0
.end method

.method public getPreviewResolutionSelector()Landroidx/camera/core/resolutionselector/ResolutionSelector;
    .locals 1

    .line 688
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 689
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreviewResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    return-object v0
.end method

.method public getPreviewTargetSize()Landroidx/camera/view/CameraController$OutputSize;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 650
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 651
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    return-object v0
.end method

.method public getScreenFlashUiInfoByPriority()Landroidx/camera/view/internal/ScreenFlashUiInfo;
    .locals 2

    .line 867
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mScreenFlashUiInfoMap:Ljava/util/Map;

    sget-object v1, Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;->SCREEN_FLASH_VIEW:Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 868
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mScreenFlashUiInfoMap:Ljava/util/Map;

    sget-object v1, Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;->SCREEN_FLASH_VIEW:Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/view/internal/ScreenFlashUiInfo;

    return-object v0

    .line 870
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mScreenFlashUiInfoMap:Ljava/util/Map;

    sget-object v1, Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;->PREVIEW_VIEW:Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 871
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mScreenFlashUiInfoMap:Ljava/util/Map;

    sget-object v1, Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;->PREVIEW_VIEW:Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/view/internal/ScreenFlashUiInfo;

    return-object v0

    .line 873
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTapToFocusInfoState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/view/TapToFocusInfo;",
            ">;"
        }
    .end annotation

    .line 2465
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2466
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusInfoState:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method public getTapToFocusState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2390
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2391
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusState:Landroidx/lifecycle/LiveData;

    return-object v0
.end method

.method public getTorchState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 2612
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2613
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTorchState:Landroidx/camera/view/ForwardingLiveData;

    return-object v0
.end method

.method public getVideoCaptureDynamicRange()Landroidx/camera/core/DynamicRange;
    .locals 1

    .line 1900
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1901
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCaptureDynamicRange:Landroidx/camera/core/DynamicRange;

    return-object v0
.end method

.method public getVideoCaptureMirrorMode()I
    .locals 1

    .line 1863
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1864
    iget v0, p0, Landroidx/camera/view/CameraController;->mVideoCaptureMirrorMode:I

    return v0
.end method

.method public getVideoCaptureQualitySelector()Landroidx/camera/video/QualitySelector;
    .locals 1

    .line 1836
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1837
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    return-object v0
.end method

.method public getVideoCaptureTargetFrameRate()Landroid/util/Range;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1932
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1933
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCaptureTargetFrameRate:Landroid/util/Range;

    return-object v0
.end method

.method public getZoomState()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/camera/core/ZoomState;",
            ">;"
        }
    .end annotation

    .line 2506
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2507
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mZoomState:Landroidx/camera/view/ForwardingLiveData;

    return-object v0
.end method

.method public hasCamera(Landroidx/camera/core/CameraSelector;)Z
    .locals 3
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 2142
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2143
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2145
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_0

    .line 2151
    :try_start_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0, p1}, Landroidx/camera/view/ProcessCameraProviderWrapper;->hasCamera(Landroidx/camera/core/CameraSelector;)Z

    move-result v0
    :try_end_0
    .catch Landroidx/camera/core/CameraInfoUnavailableException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 2152
    :catch_0
    move-exception v0

    .line 2153
    .local v0, "e":Landroidx/camera/core/CameraInfoUnavailableException;
    const-string v1, "CameraController"

    const-string v2, "Failed to check camera availability"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2154
    const/4 v1, 0x0

    return v1

    .line 2146
    .end local v0    # "e":Landroidx/camera/core/CameraInfoUnavailableException;
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Camera not initialized. Please wait for the initialization future to finish. See #getInitializationFuture()."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isImageAnalysisEnabled()Z
    .locals 1

    .line 1155
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1156
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->isUseCaseEnabled(I)Z

    move-result v0

    return v0
.end method

.method public isImageCaptureEnabled()Z
    .locals 1

    .line 766
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 767
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->isUseCaseEnabled(I)Z

    move-result v0

    return v0
.end method

.method public isPinchToZoomEnabled()Z
    .locals 1

    .line 2180
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2181
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    return v0
.end method

.method public isRecording()Z
    .locals 1

    .line 1800
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1801
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/view/CameraController;->mActiveRecording:Landroidx/camera/video/Recording;

    invoke-virtual {v0}, Landroidx/camera/video/Recording;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isTapToFocusEnabled()Z
    .locals 1

    .line 2300
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2301
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    return v0
.end method

.method public isVideoCaptureEnabled()Z
    .locals 1

    .line 1553
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1554
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->isUseCaseEnabled(I)Z

    move-result v0

    return v0
.end method

.method synthetic lambda$new$0$androidx-camera-view-CameraController(Landroidx/camera/view/ProcessCameraProviderWrapper;)Ljava/lang/Void;
    .locals 1
    .param p1, "provider"    # Landroidx/camera/view/ProcessCameraProviderWrapper;

    .line 375
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    .line 376
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindAllAndRecreate()V

    .line 377
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 378
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$new$1$androidx-camera-view-CameraController(I)V
    .locals 1
    .param p1, "rotation"    # I

    .line 386
    iput p1, p0, Landroidx/camera/view/CameraController;->mLastKnownRotation:I

    .line 387
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageAnalysis;->setTargetRotation(I)V

    .line 388
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageCapture;->setTargetRotation(I)V

    .line 389
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    invoke-virtual {v0, p1}, Landroidx/camera/video/VideoCapture;->setTargetRotation(I)V

    .line 390
    return-void
.end method

.method synthetic lambda$setCameraSelector$3$androidx-camera-view-CameraController(Landroidx/camera/core/CameraSelector;)V
    .locals 0
    .param p1, "oldCameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 2113
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    return-void
.end method

.method synthetic lambda$setEnabledUseCases$2$androidx-camera-view-CameraController(II)V
    .locals 2
    .param p1, "oldEnabledUseCases"    # I
    .param p2, "enabledUseCases"    # I

    .line 483
    iput p1, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    .line 484
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "setEnabledUseCases: failed to enable use cases properly for enabledUseCases = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 486
    invoke-static {p2}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", restoring back previous values "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 487
    invoke-static {p1}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 484
    const-string v1, "CameraController"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    return-void
.end method

.method onPinchToZoom(F)V
    .locals 4
    .param p1, "pinchToZoomScale"    # F

    .line 2203
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    const-string v1, "CameraController"

    if-nez v0, :cond_0

    .line 2204
    const-string v0, "Use cases not attached to camera."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2205
    return-void

    .line 2207
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    if-nez v0, :cond_1

    .line 2208
    const-string v0, "Pinch to zoom disabled."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2209
    return-void

    .line 2211
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Pinch to zoom with scale: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2213
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getZoomState()Landroidx/lifecycle/LiveData;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/ZoomState;

    .line 2214
    .local v0, "zoomState":Landroidx/camera/core/ZoomState;
    if-nez v0, :cond_2

    .line 2215
    return-void

    .line 2217
    :cond_2
    invoke-interface {v0}, Landroidx/camera/core/ZoomState;->getZoomRatio()F

    move-result v1

    invoke-direct {p0, p1}, Landroidx/camera/view/CameraController;->speedUpZoomBy2X(F)F

    move-result v2

    mul-float/2addr v1, v2

    .line 2219
    .local v1, "clampedRatio":F
    invoke-interface {v0}, Landroidx/camera/core/ZoomState;->getMinZoomRatio()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 2220
    invoke-interface {v0}, Landroidx/camera/core/ZoomState;->getMaxZoomRatio()F

    move-result v3

    .line 2219
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 2221
    invoke-virtual {p0, v1}, Landroidx/camera/view/CameraController;->setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;

    .line 2222
    return-void
.end method

.method onTapToFocus(Landroidx/camera/core/MeteringPointFactory;FF)V
    .locals 8
    .param p1, "meteringPointFactory"    # Landroidx/camera/core/MeteringPointFactory;
    .param p2, "x"    # F
    .param p3, "y"    # F

    .line 2237
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    const-string v1, "CameraController"

    if-nez v0, :cond_0

    .line 2238
    const-string v0, "Use cases not attached to camera."

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 2239
    return-void

    .line 2241
    :cond_0
    iget-boolean v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    if-nez v0, :cond_1

    .line 2242
    const-string v0, "Tap to focus disabled. "

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2243
    return-void

    .line 2246
    :cond_1
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p2, p3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 2247
    .local v0, "tapPoint":Landroid/graphics/PointF;
    invoke-direct {p0, p1, v0}, Landroidx/camera/view/CameraController;->createFocusMeteringAction(Landroidx/camera/core/MeteringPointFactory;Landroid/graphics/PointF;)Landroidx/camera/core/FocusMeteringAction;

    move-result-object v2

    .line 2250
    .local v2, "focusMeteringAction":Landroidx/camera/core/FocusMeteringAction;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tap to focus started: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2254
    iget-object v3, p0, Landroidx/camera/view/CameraController;->mFocusMeteringResultCallback:Landroidx/camera/view/CameraController$FocusMeteringResultCallback;

    if-eqz v3, :cond_2

    .line 2255
    iget-object v3, p0, Landroidx/camera/view/CameraController;->mFocusMeteringResultCallback:Landroidx/camera/view/CameraController$FocusMeteringResultCallback;

    invoke-virtual {v3}, Landroidx/camera/view/CameraController$FocusMeteringResultCallback;->close()V

    .line 2258
    :cond_2
    iget-object v3, p0, Landroidx/camera/view/CameraController;->mTapToFocusInfoState:Landroidx/lifecycle/MutableLiveData;

    new-instance v4, Landroidx/camera/view/TapToFocusInfo;

    const/4 v5, 0x1

    invoke-direct {v4, v5, v0}, Landroidx/camera/view/TapToFocusInfo;-><init>(ILandroid/graphics/PointF;)V

    invoke-virtual {v3, v4}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 2260
    new-instance v3, Landroidx/camera/view/CameraController$FocusMeteringResultCallback;

    iget-object v4, p0, Landroidx/camera/view/CameraController;->mTapToFocusInfoState:Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v3, v0, v4}, Landroidx/camera/view/CameraController$FocusMeteringResultCallback;-><init>(Landroid/graphics/PointF;Landroidx/lifecycle/MutableLiveData;)V

    .line 2262
    .local v3, "focusMeteringResultCallback":Landroidx/camera/view/CameraController$FocusMeteringResultCallback;
    iput-object v3, p0, Landroidx/camera/view/CameraController;->mFocusMeteringResultCallback:Landroidx/camera/view/CameraController$FocusMeteringResultCallback;

    .line 2263
    iget-object v4, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v4}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v4

    invoke-interface {v4, v2}, Landroidx/camera/core/CameraControl;->startFocusAndMetering(Landroidx/camera/core/FocusMeteringAction;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v4

    .line 2264
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v5

    .line 2263
    invoke-static {v4, v3, v5}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 2266
    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v5, p0, Landroidx/camera/view/CameraController;->mTapToFocusAutoCancelDurationNanos:J

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    .line 2267
    .local v4, "cancelDuration":J
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Tap to focus auto cancel duration: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ms"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2269
    const-wide/16 v6, 0x0

    cmp-long v1, v4, v6

    if-lez v1, :cond_3

    .line 2270
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v1, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2271
    invoke-static {v3}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda3;

    invoke-direct {v6, v3}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/view/CameraController$FocusMeteringResultCallback;)V

    .line 2270
    invoke-virtual {v1, v6, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 2273
    :cond_3
    return-void
.end method

.method public setCameraSelector(Landroidx/camera/core/CameraSelector;)V
    .locals 7
    .param p1, "cameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 2095
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2096
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    if-ne v0, p1, :cond_0

    .line 2097
    return-void

    .line 2100
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v0

    .line 2101
    .local v0, "lensFacing":Ljava/lang/Integer;
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture;->getFlashMode()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    if-eqz v0, :cond_2

    .line 2102
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 2103
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Not a front camera despite setting FLASH_MODE_SCREEN"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 2106
    :cond_2
    :goto_0
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 2107
    .local v1, "oldCameraSelector":Landroidx/camera/core/CameraSelector;
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 2109
    iget-object v3, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-nez v3, :cond_3

    .line 2110
    return-void

    .line 2112
    :cond_3
    iget-object v3, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    const/4 v4, 0x4

    new-array v4, v4, [Landroidx/camera/core/UseCase;

    const/4 v5, 0x0

    iget-object v6, p0, Landroidx/camera/view/CameraController;->mPreview:Landroidx/camera/core/Preview;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    iget-object v6, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    iget-object v6, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    aput-object v6, v4, v5

    iget-object v5, p0, Landroidx/camera/view/CameraController;->mVideoCapture:Landroidx/camera/video/VideoCapture;

    aput-object v5, v4, v2

    invoke-interface {v3, v4}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbind([Landroidx/camera/core/UseCase;)V

    .line 2113
    new-instance v2, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0, v1}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda9;-><init>(Landroidx/camera/view/CameraController;Landroidx/camera/core/CameraSelector;)V

    invoke-virtual {p0, v2}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates(Ljava/lang/Runnable;)V

    .line 2114
    return-void
.end method

.method public setEffects(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/camera/core/CameraEffect;",
            ">;)V"
        }
    .end annotation

    .line 2659
    .local p1, "effects":Ljava/util/Set;, "Ljava/util/Set<Landroidx/camera/core/CameraEffect;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2660
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-static {v0, p1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2662
    return-void

    .line 2664
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    if-eqz v0, :cond_1

    .line 2666
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraProvider:Landroidx/camera/view/ProcessCameraProviderWrapper;

    invoke-interface {v0}, Landroidx/camera/view/ProcessCameraProviderWrapper;->unbindAll()V

    .line 2668
    :cond_1
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 2669
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mEffects:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 2670
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 2671
    return-void
.end method

.method public setEnabledUseCases(I)V
    .locals 2
    .param p1, "enabledUseCases"    # I

    .line 473
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 474
    iget v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    if-ne p1, v0, :cond_0

    .line 475
    return-void

    .line 477
    :cond_0
    iget v0, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    .line 478
    .local v0, "oldEnabledUseCases":I
    iput p1, p0, Landroidx/camera/view/CameraController;->mEnabledUseCases:I

    .line 479
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isVideoCaptureEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 480
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->stopRecording()V

    .line 482
    :cond_1
    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0, v0, p1}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda8;-><init>(Landroidx/camera/view/CameraController;II)V

    invoke-virtual {p0, v1}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates(Ljava/lang/Runnable;)V

    .line 490
    return-void
.end method

.method public setImageAnalysisAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "analyzer"    # Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 1187
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1188
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-ne v0, p2, :cond_0

    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    if-ne v0, p1, :cond_0

    .line 1189
    return-void

    .line 1191
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 1192
    .local v0, "oldAnalyzer":Landroidx/camera/core/ImageAnalysis$Analyzer;
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mAnalysisExecutor:Ljava/util/concurrent/Executor;

    .line 1193
    iput-object p2, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    .line 1194
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v1, p1, p2}, Landroidx/camera/core/ImageAnalysis;->setAnalyzer(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 1195
    invoke-direct {p0, v0, p2}, Landroidx/camera/view/CameraController;->restartCameraIfAnalyzerResolutionChanged(Landroidx/camera/core/ImageAnalysis$Analyzer;Landroidx/camera/core/ImageAnalysis$Analyzer;)V

    .line 1196
    return-void
.end method

.method public setImageAnalysisBackgroundExecutor(Ljava/util/concurrent/Executor;)V
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 1413
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1414
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    if-ne v0, p1, :cond_0

    .line 1415
    return-void

    .line 1417
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mAnalysisBackgroundExecutor:Ljava/util/concurrent/Executor;

    .line 1418
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1419
    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1418
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 1420
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1421
    return-void
.end method

.method public setImageAnalysisBackpressureStrategy(I)V
    .locals 3
    .param p1, "strategy"    # I

    .line 1266
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1267
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 1268
    return-void

    .line 1271
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1272
    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1271
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 1273
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1274
    return-void
.end method

.method public setImageAnalysisImageQueueDepth(I)V
    .locals 3
    .param p1, "depth"    # I

    .line 1291
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1292
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 1293
    return-void

    .line 1295
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1296
    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1295
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 1297
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1298
    return-void
.end method

.method public setImageAnalysisOutputImageFormat(I)V
    .locals 3
    .param p1, "imageAnalysisOutputImageFormat"    # I

    .line 1460
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1461
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 1463
    return-void

    .line 1465
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1466
    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1465
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 1467
    return-void
.end method

.method public setImageAnalysisResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)V
    .locals 3
    .param p1, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 1374
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1375
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysisResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    if-ne v0, p1, :cond_0

    .line 1376
    return-void

    .line 1378
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageAnalysisResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 1379
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1380
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1381
    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1382
    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1379
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 1383
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1384
    return-void
.end method

.method public setImageAnalysisTargetSize(Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 3
    .param p1, "targetSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1332
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1333
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, p1}, Landroidx/camera/view/CameraController;->isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1334
    return-void

    .line 1336
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageAnalysisTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    .line 1337
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1338
    invoke-virtual {v0}, Landroidx/camera/core/ImageAnalysis;->getBackpressureStrategy()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1339
    invoke-virtual {v1}, Landroidx/camera/core/ImageAnalysis;->getImageQueueDepth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageAnalysis:Landroidx/camera/core/ImageAnalysis;

    .line 1340
    invoke-virtual {v2}, Landroidx/camera/core/ImageAnalysis;->getOutputImageFormat()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1337
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/view/CameraController;->unbindImageAnalysisAndRecreate(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 1341
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1342
    return-void
.end method

.method public setImageCaptureFlashMode(I)V
    .locals 3
    .param p1, "flashMode"    # I

    .line 805
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 807
    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    .line 808
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v0

    .line 809
    .local v0, "lensFacing":Ljava/lang/Integer;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 810
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Not a front camera despite setting FLASH_MODE_SCREEN"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 814
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->updateScreenFlashToImageCapture()V

    .line 817
    .end local v0    # "lensFacing":Ljava/lang/Integer;
    :cond_2
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1}, Landroidx/camera/core/ImageCapture;->setFlashMode(I)V

    .line 818
    return-void
.end method

.method public setImageCaptureIoExecutor(Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 1096
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1097
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    if-ne v0, p1, :cond_0

    .line 1098
    return-void

    .line 1100
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageCaptureIoExecutor:Ljava/util/concurrent/Executor;

    .line 1101
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getImageCaptureMode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(Ljava/lang/Integer;)V

    .line 1102
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1103
    return-void
.end method

.method public setImageCaptureMode(I)V
    .locals 1
    .param p1, "captureMode"    # I

    .line 982
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 983
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture;->getCaptureMode()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 984
    return-void

    .line 986
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(Ljava/lang/Integer;)V

    .line 987
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 988
    return-void
.end method

.method public setImageCaptureResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)V
    .locals 1
    .param p1, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 1059
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1060
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    if-ne v0, p1, :cond_0

    .line 1061
    return-void

    .line 1063
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageCaptureResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 1064
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getImageCaptureMode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(Ljava/lang/Integer;)V

    .line 1065
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1066
    return-void
.end method

.method public setImageCaptureTargetSize(Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 1
    .param p1, "targetSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1020
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1021
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, p1}, Landroidx/camera/view/CameraController;->isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1022
    return-void

    .line 1024
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mImageCaptureTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    .line 1025
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getImageCaptureMode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/view/CameraController;->unbindImageCaptureAndRecreate(Ljava/lang/Integer;)V

    .line 1026
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1027
    return-void
.end method

.method public setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "linearZoom"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 2594
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2595
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2596
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingLinearZoom:Landroidx/camera/view/PendingValue;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->setValue(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 2598
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraControl;->setLinearZoom(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method public setPinchToZoomEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 2194
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2195
    iput-boolean p1, p0, Landroidx/camera/view/CameraController;->mPinchToZoomEnabled:Z

    .line 2196
    return-void
.end method

.method public setPreviewDynamicRange(Landroidx/camera/core/DynamicRange;)V
    .locals 0
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 713
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 714
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mPreviewDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 715
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindPreviewAndRecreate()V

    .line 716
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 717
    return-void
.end method

.method public setPreviewResolutionSelector(Landroidx/camera/core/resolutionselector/ResolutionSelector;)V
    .locals 1
    .param p1, "resolutionSelector"    # Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 670
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 671
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreviewResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    if-ne v0, p1, :cond_0

    .line 672
    return-void

    .line 674
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mPreviewResolutionSelector:Landroidx/camera/core/resolutionselector/ResolutionSelector;

    .line 675
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindPreviewAndRecreate()V

    .line 676
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 677
    return-void
.end method

.method public setPreviewTargetSize(Landroidx/camera/view/CameraController$OutputSize;)V
    .locals 1
    .param p1, "targetSize"    # Landroidx/camera/view/CameraController$OutputSize;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 632
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 633
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    invoke-direct {p0, v0, p1}, Landroidx/camera/view/CameraController;->isOutputSizeEqual(Landroidx/camera/view/CameraController$OutputSize;Landroidx/camera/view/CameraController$OutputSize;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 634
    return-void

    .line 636
    :cond_0
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mPreviewTargetSize:Landroidx/camera/view/CameraController$OutputSize;

    .line 637
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindPreviewAndRecreate()V

    .line 638
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 639
    return-void
.end method

.method public setScreenFlashUiInfo(Landroidx/camera/view/internal/ScreenFlashUiInfo;)V
    .locals 3
    .param p1, "screenFlashUiInfo"    # Landroidx/camera/view/internal/ScreenFlashUiInfo;

    .line 826
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getScreenFlashUiInfoByPriority()Landroidx/camera/view/internal/ScreenFlashUiInfo;

    move-result-object v0

    .line 827
    .local v0, "previousInfo":Landroidx/camera/view/internal/ScreenFlashUiInfo;
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mScreenFlashUiInfoMap:Ljava/util/Map;

    invoke-virtual {p1}, Landroidx/camera/view/internal/ScreenFlashUiInfo;->getProviderType()Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 828
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getScreenFlashUiInfoByPriority()Landroidx/camera/view/internal/ScreenFlashUiInfo;

    move-result-object v1

    .line 829
    .local v1, "prioritizedInfo":Landroidx/camera/view/internal/ScreenFlashUiInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroidx/camera/view/internal/ScreenFlashUiInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 830
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->updateScreenFlashToImageCapture()V

    .line 832
    :cond_0
    return-void
.end method

.method public setTapToFocusAutoCancelDuration(JLjava/util/concurrent/TimeUnit;)V
    .locals 3
    .param p1, "duration"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    .line 2485
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Tap-to-focus auto-cancellation duration must be at least 0"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 2489
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/camera/view/CameraController;->mTapToFocusAutoCancelDurationNanos:J

    .line 2490
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "setTapToFocusAutoCancelDuration: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/view/CameraController;->mTapToFocusAutoCancelDurationNanos:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ns set!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CameraController"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2492
    return-void
.end method

.method public setTapToFocusEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 2313
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2314
    iput-boolean p1, p0, Landroidx/camera/view/CameraController;->mTapToFocusEnabled:Z

    .line 2315
    return-void
.end method

.method public setVideoCaptureDynamicRange(Landroidx/camera/core/DynamicRange;)V
    .locals 0
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 1889
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1890
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureDynamicRange:Landroidx/camera/core/DynamicRange;

    .line 1891
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindVideoAndRecreate()V

    .line 1892
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1893
    return-void
.end method

.method public setVideoCaptureMirrorMode(I)V
    .locals 0
    .param p1, "mirrorMode"    # I

    .line 1851
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1852
    iput p1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureMirrorMode:I

    .line 1853
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindVideoAndRecreate()V

    .line 1854
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1855
    return-void
.end method

.method public setVideoCaptureQualitySelector(Landroidx/camera/video/QualitySelector;)V
    .locals 0
    .param p1, "qualitySelector"    # Landroidx/camera/video/QualitySelector;

    .line 1821
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1822
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureQualitySelector:Landroidx/camera/video/QualitySelector;

    .line 1823
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindVideoAndRecreate()V

    .line 1824
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1825
    return-void
.end method

.method public setVideoCaptureTargetFrameRate(Landroid/util/Range;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1921
    .local p1, "targetFrameRate":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1922
    iput-object p1, p0, Landroidx/camera/view/CameraController;->mVideoCaptureTargetFrameRate:Landroid/util/Range;

    .line 1923
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->unbindVideoAndRecreate()V

    .line 1924
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates()V

    .line 1925
    return-void
.end method

.method public setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "zoomRatio"    # F
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(F)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 2567
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 2568
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2569
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingZoomRatio:Landroidx/camera/view/PendingValue;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->setValue(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 2571
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v0}, Landroidx/camera/core/Camera;->getCameraControl()Landroidx/camera/core/CameraControl;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/CameraControl;->setZoomRatio(F)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method abstract startCamera()Landroidx/camera/core/Camera;
.end method

.method startCameraAndTrackStates()V
    .locals 1

    .line 2697
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/camera/view/CameraController;->startCameraAndTrackStates(Ljava/lang/Runnable;)V

    .line 2698
    return-void
.end method

.method startCameraAndTrackStates(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "restoreStateRunnable"    # Ljava/lang/Runnable;

    .line 2708
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->startCamera()Landroidx/camera/core/Camera;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2715
    nop

    .line 2716
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraAttached()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2717
    const-string v0, "CameraController"

    const-string v1, "Use cases not attached to camera."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2718
    return-void

    .line 2720
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mZoomState:Landroidx/camera/view/ForwardingLiveData;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/CameraInfo;->getZoomState()Landroidx/lifecycle/LiveData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/ForwardingLiveData;->setSource(Landroidx/lifecycle/LiveData;)V

    .line 2721
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mTorchState:Landroidx/camera/view/ForwardingLiveData;

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCamera:Landroidx/camera/core/Camera;

    invoke-interface {v1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v1

    invoke-interface {v1}, Landroidx/camera/core/CameraInfo;->getTorchState()Landroidx/lifecycle/LiveData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/view/ForwardingLiveData;->setSource(Landroidx/lifecycle/LiveData;)V

    .line 2722
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingEnableTorch:Landroidx/camera/view/PendingValue;

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/view/CameraController;)V

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->propagateIfHasValue(Landroidx/arch/core/util/Function;)V

    .line 2723
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingLinearZoom:Landroidx/camera/view/PendingValue;

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/view/CameraController;)V

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->propagateIfHasValue(Landroidx/arch/core/util/Function;)V

    .line 2724
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mPendingZoomRatio:Landroidx/camera/view/PendingValue;

    new-instance v1, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/view/CameraController$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/view/CameraController;)V

    invoke-virtual {v0, v1}, Landroidx/camera/view/PendingValue;->propagateIfHasValue(Landroidx/arch/core/util/Function;)V

    .line 2725
    return-void

    .line 2709
    :catch_0
    move-exception v0

    .line 2711
    .local v0, "exception":Ljava/lang/RuntimeException;
    if-eqz p1, :cond_1

    .line 2712
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 2714
    :cond_1
    throw v0
.end method

.method public startRecording(Landroidx/camera/video/FileDescriptorOutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 1
    .param p1, "outputOptions"    # Landroidx/camera/video/FileDescriptorOutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/FileDescriptorOutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1628
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/view/CameraController;->startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v0

    return-object v0
.end method

.method public startRecording(Landroidx/camera/video/FileOutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 1
    .param p1, "outputOptions"    # Landroidx/camera/video/FileOutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/FileOutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1589
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/view/CameraController;->startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v0

    return-object v0
.end method

.method public startRecording(Landroidx/camera/video/MediaStoreOutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;
    .locals 1
    .param p1, "outputOptions"    # Landroidx/camera/video/MediaStoreOutputOptions;
    .param p2, "audioConfig"    # Landroidx/camera/view/video/AudioConfig;
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/MediaStoreOutputOptions;",
            "Landroidx/camera/view/video/AudioConfig;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/camera/video/VideoRecordEvent;",
            ">;)",
            "Landroidx/camera/video/Recording;"
        }
    .end annotation

    .line 1663
    .local p4, "listener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Landroidx/camera/video/VideoRecordEvent;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/camera/view/CameraController;->startRecordingInternal(Landroidx/camera/video/OutputOptions;Landroidx/camera/view/video/AudioConfig;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)Landroidx/camera/video/Recording;

    move-result-object v0

    return-object v0
.end method

.method public takePicture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V
    .locals 2
    .param p1, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "imageSavedCallback"    # Landroidx/camera/core/ImageCapture$OnImageSavedCallback;

    .line 904
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 905
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const-string v1, "Camera not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 906
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageCaptureEnabled()Z

    move-result v0

    const-string v1, "ImageCapture disabled."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 908
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->throwExceptionForInvalidScreenFlashCapture()V

    .line 910
    invoke-virtual {p0, p1}, Landroidx/camera/view/CameraController;->updateMirroringFlagInOutputFileOptions(Landroidx/camera/core/ImageCapture$OutputFileOptions;)V

    .line 911
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/camera/core/ImageCapture;->takePicture(Landroidx/camera/core/ImageCapture$OutputFileOptions;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageSavedCallback;)V

    .line 912
    return-void
.end method

.method public takePicture(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;

    .line 947
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 948
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->isCameraInitialized()Z

    move-result v0

    const-string v1, "Camera not initialized."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 949
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->isImageCaptureEnabled()Z

    move-result v0

    const-string v1, "ImageCapture disabled."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 951
    invoke-direct {p0}, Landroidx/camera/view/CameraController;->throwExceptionForInvalidScreenFlashCapture()V

    .line 953
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0, p1, p2}, Landroidx/camera/core/ImageCapture;->takePicture(Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageCapture$OnImageCapturedCallback;)V

    .line 954
    return-void
.end method

.method updateMirroringFlagInOutputFileOptions(Landroidx/camera/core/ImageCapture$OutputFileOptions;)V
    .locals 2
    .param p1, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 924
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    invoke-virtual {v0}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 925
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedHorizontalSet()Z

    move-result v0

    if-nez v0, :cond_1

    .line 926
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/view/CameraController;->mCameraSelector:Landroidx/camera/core/CameraSelector;

    .line 927
    invoke-virtual {v1}, Landroidx/camera/core/CameraSelector;->getLensFacing()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 926
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/camera/core/ImageCapture$Metadata;->setReversedHorizontal(Z)V

    .line 929
    :cond_1
    return-void
.end method

.method updatePreviewViewTransform(Landroid/graphics/Matrix;)V
    .locals 2
    .param p1, "matrix"    # Landroid/graphics/Matrix;

    .line 1531
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 1532
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    if-nez v0, :cond_0

    .line 1533
    return-void

    .line 1535
    :cond_0
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    invoke-interface {v0}, Landroidx/camera/core/ImageAnalysis$Analyzer;->getTargetCoordinateSystem()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1537
    iget-object v0, p0, Landroidx/camera/view/CameraController;->mAnalysisAnalyzer:Landroidx/camera/core/ImageAnalysis$Analyzer;

    invoke-interface {v0, p1}, Landroidx/camera/core/ImageAnalysis$Analyzer;->updateTransform(Landroid/graphics/Matrix;)V

    .line 1539
    :cond_1
    return-void
.end method

.method public updateScreenFlashToImageCapture()V
    .locals 4

    .line 840
    invoke-virtual {p0}, Landroidx/camera/view/CameraController;->getScreenFlashUiInfoByPriority()Landroidx/camera/view/internal/ScreenFlashUiInfo;

    move-result-object v0

    .line 842
    .local v0, "screenFlashUiInfo":Landroidx/camera/view/internal/ScreenFlashUiInfo;
    const-string v1, "CameraController"

    if-nez v0, :cond_0

    .line 845
    const-string v2, "No ScreenFlash instance set yet, need to wait for controller to be set to either ScreenFlashView or PreviewView"

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 847
    iget-object v1, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    sget-object v2, Landroidx/camera/view/CameraController;->NO_OP_SCREEN_FLASH:Landroidx/camera/core/ImageCapture$ScreenFlash;

    invoke-virtual {v1, v2}, Landroidx/camera/core/ImageCapture;->setScreenFlash(Landroidx/camera/core/ImageCapture$ScreenFlash;)V

    .line 848
    return-void

    .line 851
    :cond_0
    iget-object v2, p0, Landroidx/camera/view/CameraController;->mImageCapture:Landroidx/camera/core/ImageCapture;

    invoke-virtual {v0}, Landroidx/camera/view/internal/ScreenFlashUiInfo;->getScreenFlash()Landroidx/camera/core/ImageCapture$ScreenFlash;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroidx/camera/core/ImageCapture;->setScreenFlash(Landroidx/camera/core/ImageCapture$ScreenFlash;)V

    .line 852
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Set ScreenFlash instance to ImageCapture, provided by "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 853
    invoke-virtual {v0}, Landroidx/camera/view/internal/ScreenFlashUiInfo;->getProviderType()Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/view/internal/ScreenFlashUiInfo$ProviderType;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 852
    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 854
    return-void
.end method
