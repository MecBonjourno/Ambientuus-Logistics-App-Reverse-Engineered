.class final Landroidx/camera/camera2/internal/ProcessingCaptureSession;
.super Ljava/lang/Object;
.source "ProcessingCaptureSession.java"

# interfaces
.implements Landroidx/camera/camera2/internal/CaptureSessionInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;,
        Landroidx/camera/camera2/internal/ProcessingCaptureSession$SessionProcessorCaptureCallback;,
        Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ProcessingCaptureSession"

.field private static final TIMEOUT_GET_SURFACE_IN_MS:J = 0x1388L

.field private static sHeldProcessorSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation
.end field

.field private static sNextInstanceId:I


# instance fields
.field private final mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

.field private final mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

.field final mExecutor:Ljava/util/concurrent/Executor;

.field private mInstanceId:I

.field private mOutputSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mPendingCaptureConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation
.end field

.field private mProcessorSessionConfig:Landroidx/camera/core/impl/SessionConfig;

.field private mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

.field private mRequestProcessor:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

.field private final mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

.field private mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

.field private mSessionOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

.field private final mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

.field private final mSessionProcessorCaptureCallback:Landroidx/camera/camera2/internal/ProcessingCaptureSession$SessionProcessorCaptureCallback;

.field private mStillCaptureOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->sHeldProcessorSurfaces:Ljava/util/List;

    .line 120
    const/4 v0, 0x0

    sput v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->sNextInstanceId:I

    return-void
.end method

.method constructor <init>(Landroidx/camera/core/impl/SessionProcessor;Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V
    .locals 3
    .param p1, "sessionProcessor"    # Landroidx/camera/core/impl/SessionProcessor;
    .param p2, "camera2CameraInfoImpl"    # Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    .param p3, "dynamicRangesCompat"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .param p4, "executor"    # Ljava/util/concurrent/Executor;
    .param p5, "scheduledExecutorService"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p6, "captureRequestConfigurator"    # Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mOutputSurfaces:Ljava/util/List;

    .line 103
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    .line 106
    new-instance v0, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    invoke-direct {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;-><init>()V

    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    .line 107
    new-instance v0, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    invoke-direct {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;-><init>()V

    .line 108
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mStillCaptureOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    .line 121
    const/4 v0, 0x0

    iput v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    .line 128
    new-instance v1, Landroidx/camera/camera2/internal/CaptureSession;

    const-class v2, Landroidx/camera/camera2/internal/compat/quirk/CaptureSessionShouldUseMrirQuirk;

    .line 129
    invoke-static {v2}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-direct {v1, p3, v0, p6}, Landroidx/camera/camera2/internal/CaptureSession;-><init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;ZLandroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    .line 131
    iput-object p1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    .line 132
    iput-object p2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 133
    iput-object p4, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mExecutor:Ljava/util/concurrent/Executor;

    .line 134
    iput-object p5, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 135
    sget-object v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->UNINITIALIZED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    .line 136
    new-instance v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$SessionProcessorCaptureCallback;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$SessionProcessorCaptureCallback;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessorCaptureCallback:Landroidx/camera/camera2/internal/ProcessingCaptureSession$SessionProcessorCaptureCallback;

    .line 138
    sget v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->sNextInstanceId:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->sNextInstanceId:I

    iput v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "New ProcessingCaptureSession (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method private static cancelRequests(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;)V"
        }
    .end annotation

    .line 306
    .local p0, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CaptureConfig;

    .line 308
    .local v1, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-virtual {v1}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 309
    .local v3, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-virtual {v1}, Landroidx/camera/core/impl/CaptureConfig;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCancelled(I)V

    .line 310
    .end local v3    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_1

    .line 311
    .end local v1    # "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    :cond_0
    goto :goto_0

    .line 312
    :cond_1
    return-void
.end method

.method private static getSessionProcessorSurfaceList(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionProcessorSurface;",
            ">;"
        }
    .end annotation

    .line 513
    .local p0, "deferrableSurfaceList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 514
    .local v0, "outputSurfaceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/camera/core/impl/SessionProcessorSurface;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/DeferrableSurface;

    .line 515
    .local v2, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    instance-of v3, v2, Landroidx/camera/core/impl/SessionProcessorSurface;

    const-string v4, "Surface must be SessionProcessorSurface"

    invoke-static {v3, v4}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 517
    move-object v3, v2

    check-cast v3, Landroidx/camera/core/impl/SessionProcessorSurface;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 518
    .end local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_0

    .line 519
    :cond_0
    return-object v0
.end method

.method private static hasPreviewSurface(Landroidx/camera/core/impl/CaptureConfig;)Z
    .locals 3
    .param p0, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 662
    invoke-virtual {p0}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    .line 663
    .local v1, "surface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-static {v1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->isPreview(Landroidx/camera/core/impl/DeferrableSurface;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {v1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->isStreamSharing(Landroidx/camera/core/impl/DeferrableSurface;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 666
    .end local v1    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_0
    goto :goto_0

    .line 664
    .restart local v1    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_1
    :goto_1
    const/4 v0, 0x1

    return v0

    .line 667
    .end local v1    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method private static isImageAnalysis(Landroidx/camera/core/impl/DeferrableSurface;)Z
    .locals 2
    .param p0, "dSurface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 692
    invoke-virtual {p0}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroidx/camera/core/ImageAnalysis;

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isImageCapture(Landroidx/camera/core/impl/DeferrableSurface;)Z
    .locals 2
    .param p0, "dSurface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 688
    invoke-virtual {p0}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroidx/camera/core/ImageCapture;

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isPreview(Landroidx/camera/core/impl/DeferrableSurface;)Z
    .locals 2
    .param p0, "dSurface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 684
    invoke-virtual {p0}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroidx/camera/core/Preview;

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static isStreamSharing(Landroidx/camera/core/impl/DeferrableSurface;)Z
    .locals 2
    .param p0, "dSurface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 696
    invoke-virtual {p0}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroidx/camera/core/streamsharing/StreamSharing;

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isTemplateTypeForStillCapture(I)Z
    .locals 1
    .param p1, "templateType"    # I

    .line 404
    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method static synthetic lambda$open$1(Landroidx/camera/core/impl/DeferrableSurface;)V
    .locals 1
    .param p0, "surface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 260
    sget-object v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->sHeldProcessorSurfaces:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 261
    return-void
.end method

.method private updateParameters(Landroidx/camera/camera2/interop/CaptureRequestOptions;Landroidx/camera/camera2/interop/CaptureRequestOptions;)V
    .locals 3
    .param p1, "sessionOptions"    # Landroidx/camera/camera2/interop/CaptureRequestOptions;
    .param p2, "stillCaptureOptions"    # Landroidx/camera/camera2/interop/CaptureRequestOptions;

    .line 677
    new-instance v0, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 678
    .local v0, "builder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    invoke-virtual {v0, p1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->insertAllOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 679
    invoke-virtual {v0, p2}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->insertAllOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 680
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    invoke-virtual {v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v2

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/SessionProcessor;->setParameters(Landroidx/camera/core/impl/Config;)V

    .line 681
    return-void
.end method


# virtual methods
.method public cancelIssuedCaptureRequests()V
    .locals 5

    .line 563
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cancelIssuedCaptureRequests (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 565
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CaptureConfig;

    .line 567
    .local v1, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-virtual {v1}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 568
    .local v3, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-virtual {v1}, Landroidx/camera/core/impl/CaptureConfig;->getId()I

    move-result v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCancelled(I)V

    .line 569
    .end local v3    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_1

    .line 570
    .end local v1    # "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    :cond_0
    goto :goto_0

    .line 571
    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    .line 573
    :cond_2
    return-void
.end method

.method public close()V
    .locals 3

    .line 580
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "close (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 582
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    sget-object v2, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->ON_CAPTURE_SESSION_STARTED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    if-ne v0, v2, :cond_1

    .line 583
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "== onCaptureSessionEnd (id = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 584
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    invoke-interface {v0}, Landroidx/camera/core/impl/SessionProcessor;->onCaptureSessionEnd()V

    .line 585
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mRequestProcessor:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    if-eqz v0, :cond_0

    .line 586
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mRequestProcessor:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->close()V

    .line 588
    :cond_0
    sget-object v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->ON_CAPTURE_SESSION_ENDED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    .line 591
    :cond_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSession;->close()V

    .line 592
    return-void
.end method

.method public getCaptureConfigs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 555
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 1

    .line 547
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    return-object v0
.end method

.method public isInOpenState()Z
    .locals 1

    .line 652
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSession;->isInOpenState()Z

    move-result v0

    return v0
.end method

.method public issueCaptureRequests(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;)V"
        }
    .end annotation

    .line 370
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 371
    return-void

    .line 374
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "issueCaptureRequests (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") + state ="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->ordinal()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_2

    .line 396
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Run issueCaptureRequests in wrong state, state = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 398
    invoke-static {p1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->cancelRequests(Ljava/util/List;)V

    goto :goto_2

    .line 386
    :pswitch_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CaptureConfig;

    .line 387
    .local v1, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-virtual {v1}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v2

    invoke-direct {p0, v2}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->isTemplateTypeForStillCapture(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 388
    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->issueStillCaptureRequest(Landroidx/camera/core/impl/CaptureConfig;)V

    goto :goto_1

    .line 390
    :cond_1
    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->issueTriggerRequest(Landroidx/camera/core/impl/CaptureConfig;)V

    .line 392
    .end local v1    # "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    :goto_1
    goto :goto_0

    .line 393
    :cond_2
    goto :goto_2

    .line 378
    :pswitch_2
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 379
    invoke-static {p1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->cancelRequests(Ljava/util/List;)V

    .line 380
    const-string v0, "cancel the request because are pending un-submitted request"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    goto :goto_2

    .line 383
    :cond_3
    iput-object p1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    .line 384
    nop

    .line 401
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method issueStillCaptureRequest(Landroidx/camera/core/impl/CaptureConfig;)V
    .locals 8
    .param p1, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 409
    nop

    .line 411
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 410
    invoke-static {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v0

    .line 413
    .local v0, "builder":Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/CaptureConfig;->OPTION_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 415
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_ORIENTATION:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 416
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v2

    sget-object v3, Landroidx/camera/core/impl/CaptureConfig;->OPTION_ROTATION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v2, v3}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 415
    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    .line 420
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/CaptureConfig;->OPTION_JPEG_QUALITY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v1, v2}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 422
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->JPEG_QUALITY:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 423
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v2

    sget-object v3, Landroidx/camera/core/impl/CaptureConfig;->OPTION_JPEG_QUALITY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v2, v3}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 424
    invoke-virtual {v2}, Ljava/lang/Integer;->byteValue()B

    move-result v2

    .line 423
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    .line 422
    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    .line 427
    :cond_1
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mStillCaptureOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    .line 428
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mStillCaptureOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    invoke-direct {p0, v1, v2}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->updateParameters(Landroidx/camera/camera2/interop/CaptureRequestOptions;Landroidx/camera/camera2/interop/CaptureRequestOptions;)V

    .line 429
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->isPostviewEnabled()Z

    move-result v2

    .line 430
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v3

    new-instance v4, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;

    .line 431
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getId()I

    move-result v5

    .line 432
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;-><init>(ILjava/util/List;Landroidx/camera/camera2/internal/ProcessingCaptureSession$1;)V

    .line 429
    invoke-interface {v1, v2, v3, v4}, Landroidx/camera/core/impl/SessionProcessor;->startCapture(ZLandroidx/camera/core/impl/TagBundle;Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;)I

    .line 433
    return-void
.end method

.method issueTriggerRequest(Landroidx/camera/core/impl/CaptureConfig;)V
    .locals 8
    .param p1, "captureConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 319
    const-string v0, "ProcessingCaptureSession"

    const-string v1, "issueTriggerRequest"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    nop

    .line 322
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v0

    .line 321
    invoke-static {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v0

    .line 322
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v0

    .line 324
    .local v0, "options":Landroidx/camera/camera2/interop/CaptureRequestOptions;
    const/4 v1, 0x0

    .line 325
    .local v1, "hasTriggerParameters":Z
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions;->listOptions()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/Config$Option;

    .line 327
    .local v3, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    invoke-virtual {v3}, Landroidx/camera/core/impl/Config$Option;->getToken()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/camera2/CaptureRequest$Key;

    .line 328
    .local v4, "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CaptureRequest$Key;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_PRECAPTURE_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 329
    invoke-virtual {v4, v5}, Landroid/hardware/camera2/CaptureRequest$Key;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_1

    .line 333
    .end local v3    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v4    # "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    :cond_0
    goto :goto_0

    .line 330
    .restart local v3    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .restart local v4    # "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    :cond_1
    :goto_1
    const/4 v1, 0x1

    .line 331
    nop

    .line 335
    .end local v3    # "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    .end local v4    # "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<Ljava/lang/Object;>;"
    :cond_2
    if-nez v1, :cond_3

    .line 336
    const/4 v2, 0x1

    new-array v2, v2, [Landroidx/camera/core/impl/CaptureConfig;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->cancelRequests(Ljava/util/List;)V

    .line 337
    return-void

    .line 339
    :cond_3
    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v3

    new-instance v4, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;

    .line 340
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getId()I

    move-result v5

    .line 341
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;-><init>(ILjava/util/List;Landroidx/camera/camera2/internal/ProcessingCaptureSession$1;)V

    .line 339
    invoke-interface {v2, v0, v3, v4}, Landroidx/camera/core/impl/SessionProcessor;->startTrigger(Landroidx/camera/core/impl/Config;Landroidx/camera/core/impl/TagBundle;Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;)I

    .line 342
    return-void
.end method

.method synthetic lambda$open$0$androidx-camera-camera2-internal-ProcessingCaptureSession(Landroidx/camera/core/impl/DeferrableSurface;)V
    .locals 1
    .param p1, "postviewDeferrableSurface"    # Landroidx/camera/core/impl/DeferrableSurface;

    .line 249
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mOutputSurfaces:Ljava/util/List;

    invoke-static {v0}, Landroidx/camera/core/impl/DeferrableSurfaces;->decrementAll(Ljava/util/List;)V

    .line 250
    if-eqz p1, :cond_0

    .line 251
    invoke-virtual {p1}, Landroidx/camera/core/impl/DeferrableSurface;->decrementUseCount()V

    .line 253
    :cond_0
    return-void
.end method

.method synthetic lambda$open$2$androidx-camera-camera2-internal-ProcessingCaptureSession(Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 11
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p2, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p3, "opener"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;
    .param p4, "surfaceList"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "-- getSurfaces done, start init (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "ProcessingCaptureSession"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    sget-object v3, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->DE_INITIALIZED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    if-ne v0, v3, :cond_0

    .line 160
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SessionProcessorCaptureSession is closed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 167
    :cond_0
    const/4 v0, 0x0

    invoke-interface {p4, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 168
    nop

    .line 169
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v1

    invoke-interface {p4, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/impl/DeferrableSurface;

    .line 170
    .local v0, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    new-instance v1, Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;

    const-string v2, "Surface closed"

    invoke-direct {v1, v2, v0}, Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;-><init>(Ljava/lang/String;Landroidx/camera/core/impl/DeferrableSurface;)V

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    return-object v1

    .line 175
    .end local v0    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_1
    const/4 v0, 0x0

    .line 176
    .local v0, "previewOutputSurface":Landroidx/camera/core/impl/OutputSurface;
    const/4 v3, 0x0

    .line 177
    .local v3, "captureOutputSurface":Landroidx/camera/core/impl/OutputSurface;
    const/4 v4, 0x0

    .line 178
    .local v4, "analysisOutputSurface":Landroidx/camera/core/impl/OutputSurface;
    const/4 v5, 0x0

    .line 180
    .local v5, "postviewOutputSurface":Landroidx/camera/core/impl/OutputSurface;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_6

    .line 181
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/DeferrableSurface;

    .line 182
    .local v7, "dSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-static {v7}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->isPreview(Landroidx/camera/core/impl/DeferrableSurface;)Z

    move-result v8

    if-nez v8, :cond_4

    invoke-static {v7}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->isStreamSharing(Landroidx/camera/core/impl/DeferrableSurface;)Z

    move-result v8

    if-eqz v8, :cond_2

    goto :goto_1

    .line 187
    :cond_2
    invoke-static {v7}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->isImageCapture(Landroidx/camera/core/impl/DeferrableSurface;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 188
    nop

    .line 189
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v8

    invoke-interface {v8}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/Surface;

    .line 190
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v9

    .line 191
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedStreamFormat()I

    move-result v10

    .line 188
    invoke-static {v8, v9, v10}, Landroidx/camera/core/impl/OutputSurface;->create(Landroid/view/Surface;Landroid/util/Size;I)Landroidx/camera/core/impl/OutputSurface;

    move-result-object v3

    goto :goto_2

    .line 192
    :cond_3
    invoke-static {v7}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->isImageAnalysis(Landroidx/camera/core/impl/DeferrableSurface;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 193
    nop

    .line 194
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v8

    invoke-interface {v8}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/Surface;

    .line 195
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v9

    .line 196
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedStreamFormat()I

    move-result v10

    .line 193
    invoke-static {v8, v9, v10}, Landroidx/camera/core/impl/OutputSurface;->create(Landroid/view/Surface;Landroid/util/Size;I)Landroidx/camera/core/impl/OutputSurface;

    move-result-object v4

    goto :goto_2

    .line 183
    :cond_4
    :goto_1
    nop

    .line 184
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v8

    invoke-interface {v8}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/Surface;

    .line 185
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v9

    .line 186
    invoke-virtual {v7}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedStreamFormat()I

    move-result v10

    .line 183
    invoke-static {v8, v9, v10}, Landroidx/camera/core/impl/OutputSurface;->create(Landroid/view/Surface;Landroid/util/Size;I)Landroidx/camera/core/impl/OutputSurface;

    move-result-object v0

    .line 180
    .end local v7    # "dSurface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_5
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 201
    .end local v6    # "i":I
    :cond_6
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getPostviewOutputConfig()Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    move-result-object v6

    if-eqz v6, :cond_7

    .line 202
    nop

    .line 203
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getPostviewOutputConfig()Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v6

    .line 204
    .local v6, "postviewDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    nop

    .line 205
    invoke-virtual {v6}, Landroidx/camera/core/impl/DeferrableSurface;->getSurface()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v7

    invoke-interface {v7}, Lcom/google/common/util/concurrent/ListenableFuture;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/Surface;

    .line 206
    invoke-virtual {v6}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v8

    .line 207
    invoke-virtual {v6}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedStreamFormat()I

    move-result v9

    .line 204
    invoke-static {v7, v8, v9}, Landroidx/camera/core/impl/OutputSurface;->create(Landroid/view/Surface;Landroid/util/Size;I)Landroidx/camera/core/impl/OutputSurface;

    move-result-object v5

    goto :goto_3

    .line 210
    .end local v6    # "postviewDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_7
    const/4 v6, 0x0

    .line 213
    .restart local v6    # "postviewDeferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    :goto_3
    sget-object v7, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->SESSION_INITIALIZED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    iput-object v7, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    .line 215
    :try_start_0
    new-instance v7, Ljava/util/ArrayList;

    iget-object v8, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mOutputSurfaces:Ljava/util/List;

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 217
    .local v7, "surfacesToIncrement":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    if-eqz v6, :cond_8

    .line 218
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_8
    invoke-static {v7}, Landroidx/camera/core/impl/DeferrableSurfaces;->incrementAll(Ljava/util/List;)V
    :try_end_0
    .catch Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    .end local v7    # "surfacesToIncrement":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/DeferrableSurface;>;"
    nop

    .line 224
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "== initSession (id="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    :try_start_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    iget-object v7, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 228
    invoke-static {v0, v3, v4, v5}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;->create(Landroidx/camera/core/impl/OutputSurface;Landroidx/camera/core/impl/OutputSurface;Landroidx/camera/core/impl/OutputSurface;Landroidx/camera/core/impl/OutputSurface;)Landroidx/camera/core/impl/OutputSurfaceConfiguration;

    move-result-object v8

    .line 226
    invoke-interface {v1, v7, v8}, Landroidx/camera/core/impl/SessionProcessor;->initSession(Landroidx/camera/core/CameraInfo;Landroidx/camera/core/impl/OutputSurfaceConfiguration;)Landroidx/camera/core/impl/SessionConfig;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorSessionConfig:Landroidx/camera/core/impl/SessionConfig;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 243
    nop

    .line 247
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/DeferrableSurface;

    invoke-virtual {v1}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    new-instance v2, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, v6}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/internal/ProcessingCaptureSession;Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 253
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v7

    .line 248
    invoke-interface {v1, v2, v7}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 257
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/DeferrableSurface;

    .line 258
    .local v2, "surface":Landroidx/camera/core/impl/DeferrableSurface;
    sget-object v7, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->sHeldProcessorSurfaces:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    invoke-virtual {v2}, Landroidx/camera/core/impl/DeferrableSurface;->getTerminationFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v7

    new-instance v8, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda4;

    invoke-direct {v8, v2}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/core/impl/DeferrableSurface;)V

    iget-object v9, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-interface {v7, v8, v9}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 262
    .end local v2    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_4

    .line 264
    :cond_9
    new-instance v1, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;

    invoke-direct {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;-><init>()V

    .line 266
    .local v1, "validatingBuilder":Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
    invoke-virtual {v1, p1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->add(Landroidx/camera/core/impl/SessionConfig;)V

    .line 267
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->clearSurfaces()V

    .line 268
    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->add(Landroidx/camera/core/impl/SessionConfig;)V

    .line 269
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->isValid()Z

    move-result v2

    const-string v7, "Cannot transform the SessionConfig"

    invoke-static {v2, v7}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 271
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;->build()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v2

    .line 272
    .local v2, "transformedConfig":Landroidx/camera/core/impl/SessionConfig;
    iget-object v7, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    .line 274
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/hardware/camera2/CameraDevice;

    .line 273
    invoke-virtual {v7, v2, v8, p3}, Landroidx/camera/camera2/internal/CaptureSession;->open(Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v7

    .line 276
    .local v7, "openSessionFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v8, Landroidx/camera/camera2/internal/ProcessingCaptureSession$1;

    invoke-direct {v8, p0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$1;-><init>(Landroidx/camera/camera2/internal/ProcessingCaptureSession;)V

    iget-object v9, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mExecutor:Ljava/util/concurrent/Executor;

    invoke-static {v7, v8, v9}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 292
    return-object v7

    .line 235
    .end local v1    # "validatingBuilder":Landroidx/camera/core/impl/SessionConfig$ValidatingBuilder;
    .end local v2    # "transformedConfig":Landroidx/camera/core/impl/SessionConfig;
    .end local v7    # "openSessionFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    :catchall_0
    move-exception v1

    .line 236
    .local v1, "e":Ljava/lang/Throwable;
    const-string v7, "initSession failed"

    invoke-static {v2, v7, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 238
    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mOutputSurfaces:Ljava/util/List;

    invoke-static {v2}, Landroidx/camera/core/impl/DeferrableSurfaces;->decrementAll(Ljava/util/List;)V

    .line 239
    if-eqz v6, :cond_a

    .line 240
    invoke-virtual {v6}, Landroidx/camera/core/impl/DeferrableSurface;->decrementUseCount()V

    .line 242
    :cond_a
    throw v1

    .line 221
    .end local v1    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    .line 222
    .local v1, "e":Landroidx/camera/core/impl/DeferrableSurface$SurfaceClosedException;
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    return-object v2
.end method

.method synthetic lambda$open$3$androidx-camera-camera2-internal-ProcessingCaptureSession(Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .param p1, "v"    # Ljava/lang/Void;

    .line 298
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->onConfigured(Landroidx/camera/camera2/internal/CaptureSession;)V

    .line 299
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$release$4$androidx-camera-camera2-internal-ProcessingCaptureSession()V
    .locals 2

    .line 498
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "== deInitSession (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    invoke-interface {v0}, Landroidx/camera/core/impl/SessionProcessor;->deInitSession()V

    .line 502
    return-void
.end method

.method onConfigured(Landroidx/camera/camera2/internal/CaptureSession;)V
    .locals 2
    .param p1, "captureSession"    # Landroidx/camera/camera2/internal/CaptureSession;

    .line 523
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    sget-object v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->SESSION_INITIALIZED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    if-eq v0, v1, :cond_0

    .line 524
    return-void

    .line 526
    :cond_0
    new-instance v0, Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 527
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->getSessionProcessorSurfaceList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;-><init>(Landroidx/camera/camera2/internal/CaptureSession;Ljava/util/List;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mRequestProcessor:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    .line 528
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "== onCaptureSessinStarted (id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 529
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mRequestProcessor:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    invoke-interface {v0, v1}, Landroidx/camera/core/impl/SessionProcessor;->onCaptureSessionStart(Landroidx/camera/core/impl/RequestProcessor;)V

    .line 530
    sget-object v0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->ON_CAPTURE_SESSION_STARTED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    .line 532
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    if-eqz v0, :cond_1

    .line 533
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->setSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 536
    :cond_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 537
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->issueCaptureRequests(Ljava/util/List;)V

    .line 538
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mPendingCaptureConfigs:Ljava/util/List;

    .line 540
    :cond_2
    return-void
.end method

.method public open(Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 7
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p2, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p3, "opener"    # Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/SessionConfig;",
            "Landroid/hardware/camera2/CameraDevice;",
            "Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    sget-object v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->UNINITIALIZED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid state state:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 147
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v2

    const-string v1, "SessionConfig contains no surfaces"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "open (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mOutputSurfaces:Ljava/util/List;

    .line 152
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mOutputSurfaces:Ljava/util/List;

    iget-object v5, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mExecutor:Ljava/util/concurrent/Executor;

    iget-object v6, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mScheduledExecutorService:Ljava/util/concurrent/ScheduledExecutorService;

    .line 153
    const/4 v2, 0x0

    const-wide/16 v3, 0x1388

    invoke-static/range {v1 .. v6}, Landroidx/camera/core/impl/DeferrableSurfaces;->surfaceListWithTimeout(Ljava/util/Collection;ZJLjava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v0

    new-instance v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2, p3}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/ProcessingCaptureSession;Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;)V

    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mExecutor:Ljava/util/concurrent/Executor;

    .line 156
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v0

    new-instance v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/ProcessingCaptureSession;)V

    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mExecutor:Ljava/util/concurrent/Executor;

    .line 294
    invoke-virtual {v0, v1, v2}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transform(Landroidx/arch/core/util/Function;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v0

    .line 302
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    return-object v0
.end method

.method public release(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p1, "abortInFlightCaptures"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 490
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "release (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") mProcessorState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 492
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mCaptureSession:Landroidx/camera/camera2/internal/CaptureSession;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/CaptureSession;->release(Z)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 494
    .local v0, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 497
    :pswitch_1
    new-instance v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/ProcessingCaptureSession;)V

    .line 502
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 497
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 503
    nop

    .line 507
    :goto_0
    sget-object v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->DE_INITIALIZED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    iput-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    .line 508
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V
    .locals 5
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 610
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "setSessionConfig (id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mInstanceId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ProcessingCaptureSession"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 612
    iput-object p1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 613
    if-nez p1, :cond_0

    .line 614
    return-void

    .line 617
    :cond_0
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mRequestProcessor:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    if-eqz v0, :cond_1

    .line 618
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mRequestProcessor:Landroidx/camera/camera2/internal/Camera2RequestProcessor;

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/Camera2RequestProcessor;->updateSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V

    .line 621
    :cond_1
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mProcessorState:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    sget-object v1, Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;->ON_CAPTURE_SESSION_STARTED:Landroidx/camera/camera2/internal/ProcessingCaptureSession$ProcessorState;

    if-ne v0, v1, :cond_4

    .line 622
    nop

    .line 623
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    move-result-object v0

    .line 626
    .local v0, "requestOptionsbuilder":Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;
    nop

    .line 628
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v1

    .line 627
    invoke-static {v1}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->getVideoStabilizationModeFromCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Ljava/lang/Integer;

    move-result-object v1

    .line 629
    .local v1, "stabilizationMode":Ljava/lang/Integer;
    if-eqz v1, :cond_2

    .line 630
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v0, v2, v1}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;

    .line 633
    :cond_2
    invoke-virtual {v0}, Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;->build()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    .line 634
    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    iget-object v3, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mStillCaptureOptions:Landroidx/camera/camera2/interop/CaptureRequestOptions;

    invoke-direct {p0, v2, v3}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->updateParameters(Landroidx/camera/camera2/interop/CaptureRequestOptions;Landroidx/camera/camera2/interop/CaptureRequestOptions;)V

    .line 640
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v2

    invoke-static {v2}, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->hasPreviewSurface(Landroidx/camera/core/impl/CaptureConfig;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 641
    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    invoke-interface {v2}, Landroidx/camera/core/impl/SessionProcessor;->stopRepeating()V

    goto :goto_0

    .line 643
    :cond_3
    iget-object v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessor:Landroidx/camera/core/impl/SessionProcessor;

    .line 644
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/CaptureConfig;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession;->mSessionProcessorCaptureCallback:Landroidx/camera/camera2/internal/ProcessingCaptureSession$SessionProcessorCaptureCallback;

    .line 643
    invoke-interface {v2, v3, v4}, Landroidx/camera/core/impl/SessionProcessor;->startRepeating(Landroidx/camera/core/impl/TagBundle;Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;)I

    .line 648
    .end local v0    # "requestOptionsbuilder":Landroidx/camera/camera2/interop/CaptureRequestOptions$Builder;
    .end local v1    # "stabilizationMode":Ljava/lang/Integer;
    :cond_4
    :goto_0
    return-void
.end method

.method public setStreamUseCaseMap(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 673
    .local p1, "streamUseCaseMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Ljava/lang/Long;>;"
    return-void
.end method
