.class final Landroidx/camera/camera2/internal/CaptureSession;
.super Ljava/lang/Object;
.source "CaptureSession.java"

# interfaces
.implements Landroidx/camera/camera2/internal/CaptureSessionInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/CaptureSession$State;,
        Landroidx/camera/camera2/internal/CaptureSession$StateCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CaptureSession"

.field private static final TIMEOUT_GET_SURFACE_IN_MS:J = 0x1388L


# instance fields
.field private final mCanUseMultiResolutionImageReader:Z

.field private final mCaptureConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

.field private final mCaptureSessionStateCallback:Landroidx/camera/camera2/internal/CaptureSession$StateCallback;

.field mConfiguredDeferrableSurfaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            ">;"
        }
    .end annotation
.end field

.field private final mConfiguredSurfaceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation
.end field

.field private final mDynamicRangesCompat:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

.field mHighestState:Landroidx/camera/camera2/internal/CaptureSession$State;

.field mReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field mReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

.field mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

.field final mSessionLock:Ljava/lang/Object;

.field mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

.field mState:Landroidx/camera/camera2/internal/CaptureSession$State;

.field private final mStillCaptureFlow:Landroidx/camera/camera2/internal/compat/workaround/StillCaptureFlow;

.field private mStreamUseCaseMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

.field private final mTemplateParamsOverride:Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;

.field private final mTorchStateReset:Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;)V
    .locals 1
    .param p1, "dynamicRangesCompat"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    .line 142
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/camera/camera2/internal/CaptureSession;-><init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Z)V

    .line 143
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Landroidx/camera/core/impl/Quirks;)V
    .locals 2
    .param p1, "dynamicRangesCompat"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .param p2, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;

    .line 159
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Landroidx/camera/camera2/internal/CaptureSession;-><init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Landroidx/camera/core/impl/Quirks;ZLandroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V

    .line 160
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Landroidx/camera/core/impl/Quirks;Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V
    .locals 1
    .param p1, "dynamicRangesCompat"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .param p2, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p3, "captureRequestConfigurator"    # Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    .line 178
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroidx/camera/camera2/internal/CaptureSession;-><init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Landroidx/camera/core/impl/Quirks;ZLandroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V

    .line 179
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Landroidx/camera/core/impl/Quirks;ZLandroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V
    .locals 2
    .param p1, "dynamicRangesCompat"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .param p2, "cameraQuirks"    # Landroidx/camera/core/impl/Quirks;
    .param p3, "canUseMultiResolutionImageReader"    # Z
    .param p4, "captureRequestConfigurator"    # Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    .line 114
    nop

    .line 115
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredDeferrableSurfaces:Ljava/util/List;

    .line 117
    sget-object v0, Landroidx/camera/camera2/internal/CaptureSession$State;->UNINITIALIZED:Landroidx/camera/camera2/internal/CaptureSession$State;

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mHighestState:Landroidx/camera/camera2/internal/CaptureSession$State;

    .line 120
    sget-object v0, Landroidx/camera/camera2/internal/CaptureSession$State;->UNINITIALIZED:Landroidx/camera/camera2/internal/CaptureSession$State;

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mStreamUseCaseMap:Ljava/util/Map;

    .line 130
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/StillCaptureFlow;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/StillCaptureFlow;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mStillCaptureFlow:Landroidx/camera/camera2/internal/compat/workaround/StillCaptureFlow;

    .line 131
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;-><init>()V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mTorchStateReset:Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;

    .line 187
    sget-object v0, Landroidx/camera/camera2/internal/CaptureSession$State;->INITIALIZED:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    .line 188
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mDynamicRangesCompat:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    .line 189
    new-instance v0, Landroidx/camera/camera2/internal/CaptureSession$StateCallback;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/CaptureSession$StateCallback;-><init>(Landroidx/camera/camera2/internal/CaptureSession;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureSessionStateCallback:Landroidx/camera/camera2/internal/CaptureSession$StateCallback;

    .line 190
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    const-class v1, Landroidx/camera/camera2/internal/compat/quirk/CaptureNoResponseQuirk;

    invoke-virtual {p2, v1}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v1

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;-><init>(Z)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    .line 191
    new-instance v0, Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;

    invoke-direct {v0, p2}, Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;-><init>(Landroidx/camera/core/impl/Quirks;)V

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mTemplateParamsOverride:Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;

    .line 192
    iput-boolean p3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCanUseMultiResolutionImageReader:Z

    .line 193
    iput-object p4, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    .line 194
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Z)V
    .locals 2
    .param p1, "dynamicRangesCompat"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .param p2, "canUseMultiResolutionImageReader"    # Z

    .line 150
    new-instance v0, Landroidx/camera/core/impl/Quirks;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/Quirks;-><init>(Ljava/util/List;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p2, v1}, Landroidx/camera/camera2/internal/CaptureSession;-><init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Landroidx/camera/core/impl/Quirks;ZLandroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V

    .line 152
    return-void
.end method

.method constructor <init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;ZLandroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V
    .locals 2
    .param p1, "dynamicRangesCompat"    # Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;
    .param p2, "canUseMultiResolutionImageReader"    # Z
    .param p3, "captureRequestConfigurator"    # Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    .line 168
    new-instance v0, Landroidx/camera/core/impl/Quirks;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/Quirks;-><init>(Ljava/util/List;)V

    invoke-direct {p0, p1, v0, p2, p3}, Landroidx/camera/camera2/internal/CaptureSession;-><init>(Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;Landroidx/camera/core/impl/Quirks;ZLandroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;)V

    .line 170
    return-void
.end method

.method static synthetic access$000(Landroidx/camera/camera2/internal/CaptureSession;)Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;
    .locals 1
    .param p0, "x0"    # Landroidx/camera/camera2/internal/CaptureSession;

    .line 84
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mTorchStateReset:Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;

    return-object v0
.end method

.method static synthetic access$100(Landroidx/camera/camera2/internal/CaptureSession;Landroidx/camera/camera2/internal/CaptureSession$State;)V
    .locals 0
    .param p0, "x0"    # Landroidx/camera/camera2/internal/CaptureSession;
    .param p1, "x1"    # Landroidx/camera/camera2/internal/CaptureSession$State;

    .line 84
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    return-void
.end method

.method private captureHighSpeedBurst(Ljava/util/List;Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;)I
    .locals 9
    .param p2, "callbackAggregator"    # Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;",
            "Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;
        }
    .end annotation

    .line 925
    .local p1, "captureRequests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    new-instance v0, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;-><init>()V

    .line 927
    .local v0, "highSpeedCallbackAggregator":Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;
    const/4 v1, -0x1

    .line 929
    .local v1, "sequenceId":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/camera2/CaptureRequest;

    .line 930
    .local v3, "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    iget-object v4, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 931
    invoke-static {v4}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 932
    invoke-interface {v4, v3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;

    move-result-object v4

    .line 937
    .local v4, "highSpeedRequests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/hardware/camera2/CaptureRequest;

    .line 938
    .local v6, "highSpeedRequest":Landroid/hardware/camera2/CaptureRequest;
    new-instance v7, Landroidx/camera/camera2/internal/RequestForwardingCaptureCallback;

    invoke-direct {v7, v3, p2}, Landroidx/camera/camera2/internal/RequestForwardingCaptureCallback;-><init>(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)V

    .line 940
    .local v7, "forwardingCallback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    nop

    .line 941
    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    .line 940
    invoke-virtual {v0, v6, v8}, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;->addCamera2Callbacks(Landroid/hardware/camera2/CaptureRequest;Ljava/util/List;)V

    .line 942
    .end local v6    # "highSpeedRequest":Landroid/hardware/camera2/CaptureRequest;
    .end local v7    # "forwardingCallback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    goto :goto_1

    .line 944
    :cond_0
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v5, v4, v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->captureBurstRequests(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v1

    .line 946
    .end local v3    # "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    .end local v4    # "highSpeedRequests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    goto :goto_0

    .line 949
    :cond_1
    return v1
.end method

.method private varargs createCamera2CaptureCallback(Ljava/util/List;[Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 4
    .param p2, "additionalCallbacks"    # [Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;[",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            ")",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;"
        }
    .end annotation

    .line 1031
    .local p1, "cameraCaptureCallbacks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CameraCaptureCallback;>;"
    new-instance v0, Ljava/util/ArrayList;

    .line 1032
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    array-length v2, p2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1033
    .local v0, "camera2Callbacks":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1034
    .local v2, "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-static {v2}, Landroidx/camera/camera2/internal/CaptureCallbackConverter;->toCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1035
    .end local v2    # "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 1036
    :cond_0
    invoke-static {v0, p2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 1037
    invoke-static {v0}, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks;->createComboCallback(Ljava/util/List;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v1

    return-object v1
.end method

.method private static createMultiResolutionOutputConfigurationCompats(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionConfig$OutputConfig;",
            ">;>;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Landroid/view/Surface;",
            ">;)",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/SessionConfig$OutputConfig;",
            "Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;",
            ">;"
        }
    .end annotation

    .line 1081
    .local p0, "groupIdToOutputConfigsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;>;"
    .local p1, "configuredSurfaceMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Landroid/view/Surface;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1083
    .local v0, "outputConfigToOutputConfigurationCompatMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SessionConfig$OutputConfig;Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 1084
    .local v2, "groupId":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1085
    .local v3, "streamInfos":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MultiResolutionStreamInfo;>;"
    const/4 v4, 0x0

    .line 1086
    .local v4, "imageFormat":I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {p0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 1087
    .local v6, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    invoke-virtual {v6}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v7

    invoke-interface {p1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/Surface;

    .line 1088
    .local v7, "surface":Landroid/view/Surface;
    invoke-static {v7}, Landroidx/camera/core/impl/utils/SurfaceUtil;->getSurfaceInfo(Landroid/view/Surface;)Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;

    move-result-object v8

    .line 1089
    .local v8, "surfaceInfo":Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;
    if-nez v4, :cond_0

    .line 1090
    iget v4, v8, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;->format:I

    .line 1092
    :cond_0
    new-instance v9, Landroid/hardware/camera2/params/MultiResolutionStreamInfo;

    iget v10, v8, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;->width:I

    iget v11, v8, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;->height:I

    .line 1093
    invoke-virtual {v6}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getPhysicalCameraId()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-direct {v9, v10, v11, v12}, Landroid/hardware/camera2/params/MultiResolutionStreamInfo;-><init>(IILjava/lang/String;)V

    .line 1092
    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1094
    .end local v6    # "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .end local v7    # "surface":Landroid/view/Surface;
    .end local v8    # "surfaceInfo":Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;
    goto :goto_1

    .line 1095
    :cond_1
    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_3

    .line 1100
    :cond_2
    nop

    .line 1101
    invoke-static {v3, v4}, Landroid/hardware/camera2/params/OutputConfiguration;->createInstancesForMultiResolutionOutput(Ljava/util/Collection;I)Ljava/util/List;

    move-result-object v5

    .line 1103
    .local v5, "outputConfigurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    if-eqz v5, :cond_3

    .line 1104
    nop

    .line 1105
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 1104
    invoke-interface {p0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 1106
    .local v7, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    const/4 v8, 0x0

    invoke-interface {v5, v8}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/hardware/camera2/params/OutputConfiguration;

    .line 1107
    .local v8, "outputConfiguration":Landroid/hardware/camera2/params/OutputConfiguration;
    invoke-virtual {v7}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v9

    invoke-interface {p1, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/Surface;

    .line 1108
    .local v9, "surface":Landroid/view/Surface;
    invoke-virtual {v8, v9}, Landroid/hardware/camera2/params/OutputConfiguration;->addSurface(Landroid/view/Surface;)V

    .line 1109
    new-instance v10, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    invoke-direct {v10, v8}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;-><init>(Landroid/hardware/camera2/params/OutputConfiguration;)V

    invoke-interface {v0, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1111
    .end local v7    # "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .end local v8    # "outputConfiguration":Landroid/hardware/camera2/params/OutputConfiguration;
    .end local v9    # "surface":Landroid/view/Surface;
    goto :goto_2

    .line 1113
    .end local v2    # "groupId":I
    .end local v3    # "streamInfos":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MultiResolutionStreamInfo;>;"
    .end local v4    # "imageFormat":I
    .end local v5    # "outputConfigurations":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/OutputConfiguration;>;"
    :cond_3
    goto/16 :goto_0

    .line 1096
    .restart local v2    # "groupId":I
    .restart local v3    # "streamInfos":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MultiResolutionStreamInfo;>;"
    .restart local v4    # "imageFormat":I
    :cond_4
    :goto_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Skips to create instances for multi-resolution output. imageFormat: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", streamInfos size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 1097
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1096
    const-string v6, "CaptureSession"

    invoke-static {v6, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 1098
    goto/16 :goto_0

    .line 1114
    .end local v2    # "groupId":I
    .end local v3    # "streamInfos":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/params/MultiResolutionStreamInfo;>;"
    .end local v4    # "imageFormat":I
    :cond_5
    return-object v0
.end method

.method private getOutputConfigurationCompat(Landroidx/camera/core/impl/SessionConfig$OutputConfig;Ljava/util/Map;Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
    .locals 9
    .param p1, "outputConfig"    # Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .param p3, "physicalCameraIdForAllStreams"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/SessionConfig$OutputConfig;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Landroid/view/Surface;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;"
        }
    .end annotation

    .line 450
    .local p2, "configuredSurfaceMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Landroid/view/Surface;>;"
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/Surface;

    .line 451
    .local v0, "surface":Landroid/view/Surface;
    const-string v1, "Surface in OutputConfig not found in configuredSurfaceMap."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    new-instance v2, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    .line 455
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurfaceGroupId()I

    move-result v3

    invoke-direct {v2, v3, v0}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;-><init>(ILandroid/view/Surface;)V

    .line 460
    .local v2, "outputConfiguration":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
    if-eqz p3, :cond_0

    .line 461
    invoke-virtual {v2, p3}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->setPhysicalCameraId(Ljava/lang/String;)V

    goto :goto_0

    .line 463
    :cond_0
    nop

    .line 464
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getPhysicalCameraId()Ljava/lang/String;

    move-result-object v3

    .line 463
    invoke-virtual {v2, v3}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->setPhysicalCameraId(Ljava/lang/String;)V

    .line 469
    :goto_0
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getMirrorMode()I

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_1

    .line 470
    invoke-virtual {v2, v4}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->setMirrorMode(I)V

    goto :goto_1

    .line 471
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getMirrorMode()I

    move-result v3

    if-ne v3, v4, :cond_2

    .line 472
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->setMirrorMode(I)V

    .line 475
    :cond_2
    :goto_1
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSharedSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 476
    invoke-virtual {v2}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->enableSurfaceSharing()V

    .line 477
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSharedSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/DeferrableSurface;

    .line 478
    .local v4, "sharedDeferSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/Surface;

    .line 479
    .local v5, "sharedSurface":Landroid/view/Surface;
    invoke-static {v5, v1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 481
    invoke-virtual {v2, v5}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->addSurface(Landroid/view/Surface;)V

    .line 482
    .end local v4    # "sharedDeferSurface":Landroidx/camera/core/impl/DeferrableSurface;
    .end local v5    # "sharedSurface":Landroid/view/Surface;
    goto :goto_2

    .line 485
    :cond_3
    const-wide/16 v3, 0x1

    .line 486
    .local v3, "dynamicRangeProfile":J
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x21

    if-lt v1, v5, :cond_5

    .line 487
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mDynamicRangesCompat:Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    .line 488
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->toDynamicRangeProfiles()Landroid/hardware/camera2/params/DynamicRangeProfiles;

    move-result-object v1

    .line 489
    .local v1, "dynamicRangeProfiles":Landroid/hardware/camera2/params/DynamicRangeProfiles;
    if-eqz v1, :cond_5

    .line 490
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v5

    .line 491
    .local v5, "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    nop

    .line 492
    invoke-static {v5, v1}, Landroidx/camera/camera2/internal/compat/params/DynamicRangeConversions;->dynamicRangeToFirstSupportedProfile(Landroidx/camera/core/DynamicRange;Landroid/hardware/camera2/params/DynamicRangeProfiles;)Ljava/lang/Long;

    move-result-object v6

    .line 494
    .local v6, "dynamicRangeProfileOrNull":Ljava/lang/Long;
    if-nez v6, :cond_4

    .line 495
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Requested dynamic range is not supported. Defaulting to STANDARD dynamic range profile.\nRequested dynamic range:\n  "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "CaptureSession"

    invoke-static {v8, v7}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 500
    :cond_4
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 504
    .end local v1    # "dynamicRangeProfiles":Landroid/hardware/camera2/params/DynamicRangeProfiles;
    .end local v5    # "requestedDynamicRange":Landroidx/camera/core/DynamicRange;
    .end local v6    # "dynamicRangeProfileOrNull":Ljava/lang/Long;
    :cond_5
    :goto_3
    invoke-virtual {v2, v3, v4}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->setDynamicRangeProfile(J)V

    .line 505
    return-object v2
.end method

.method private getUniqueOutputConfigurations(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;",
            ">;"
        }
    .end annotation

    .line 433
    .local p1, "outputConfigurations":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 434
    .local v0, "addedSurfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 435
    .local v1, "results":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    .line 436
    .local v3, "outputConfiguration":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
    invoke-virtual {v3}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->getSurface()Landroid/view/Surface;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 438
    goto :goto_0

    .line 440
    :cond_0
    invoke-virtual {v3}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->getSurface()Landroid/view/Surface;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 441
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    .end local v3    # "outputConfiguration":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
    goto :goto_0

    .line 443
    :cond_1
    return-object v1
.end method

.method private static groupMrirOutputConfigs(Ljava/util/Collection;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Landroidx/camera/core/impl/SessionConfig$OutputConfig;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/SessionConfig$OutputConfig;",
            ">;>;"
        }
    .end annotation

    .line 1045
    .local p0, "outputConfigs":Ljava/util/Collection;, "Ljava/util/Collection<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1047
    .local v0, "groupResult":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 1050
    .local v2, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurfaceGroupId()I

    move-result v3

    if-lez v3, :cond_0

    .line 1051
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSharedSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1052
    goto :goto_0

    .line 1054
    :cond_1
    nop

    .line 1055
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurfaceGroupId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1054
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 1056
    .local v3, "groupedOutputConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;"
    if-nez v3, :cond_2

    .line 1057
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v3, v4

    .line 1058
    invoke-virtual {v2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurfaceGroupId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1060
    :cond_2
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1061
    .end local v2    # "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .end local v3    # "groupedOutputConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;"
    goto :goto_0

    .line 1065
    :cond_3
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 1066
    .local v1, "mrirGroupResult":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 1067
    .local v3, "groupId":I
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_4

    .line 1068
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1070
    .end local v3    # "groupId":I
    :cond_4
    goto :goto_1

    .line 1072
    :cond_5
    return-object v1
.end method

.method private openCaptureSession(Ljava/util/List;Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 16
    .param p2, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p3, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;",
            "Landroidx/camera/core/impl/SessionConfig;",
            "Landroid/hardware/camera2/CameraDevice;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 317
    .local p1, "configuredSurfaces":Ljava/util/List;, "Ljava/util/List<Landroid/view/Surface;>;"
    move-object/from16 v1, p0

    move-object/from16 v2, p3

    iget-object v3, v1, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v3

    .line 318
    :try_start_0
    iget-object v0, v1, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sparse-switch v0, :sswitch_data_0

    .line 425
    move-object/from16 v6, p1

    :try_start_1
    new-instance v0, Ljava/util/concurrent/CancellationException;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto/16 :goto_3

    .line 327
    :sswitch_0
    :try_start_2
    iget-object v0, v1, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 328
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 329
    iget-object v4, v1, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    iget-object v5, v1, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredDeferrableSurfaces:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/impl/DeferrableSurface;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 330
    move-object/from16 v6, p1

    :try_start_3
    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/Surface;

    .line 329
    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move-object/from16 v6, p1

    .line 333
    .end local v0    # "i":I
    sget-object v0, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENING:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {v1, v0}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    .line 334
    const-string v0, "CaptureSession"

    const-string v4, "Opening capture session."

    invoke-static {v0, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    const/4 v0, 0x2

    new-array v0, v0, [Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    iget-object v4, v1, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureSessionStateCallback:Landroidx/camera/camera2/internal/CaptureSession$StateCallback;

    const/4 v5, 0x0

    aput-object v4, v0, v5

    new-instance v4, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks$Adapter;

    .line 339
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getSessionStateCallbacks()Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks$Adapter;-><init>(Ljava/util/List;)V

    const/4 v5, 0x1

    aput-object v4, v0, v5

    .line 336
    invoke-static {v0}, Landroidx/camera/camera2/internal/SynchronizedCaptureSessionStateCallbacks;->createComboCallback([Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;)Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;

    move-result-object v0

    move-object v4, v0

    .line 342
    .local v4, "callbacks":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    new-instance v0, Landroidx/camera/camera2/impl/Camera2ImplConfig;

    .line 343
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v5

    invoke-direct {v0, v5}, Landroidx/camera/camera2/impl/Camera2ImplConfig;-><init>(Landroidx/camera/core/impl/Config;)V

    move-object v5, v0

    .line 347
    .local v5, "camera2Config":Landroidx/camera/camera2/impl/Camera2ImplConfig;
    nop

    .line 348
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->from(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig$Builder;

    move-result-object v0

    move-object v7, v0

    .line 351
    .local v7, "sessionParameterConfigBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 352
    .local v0, "mrirOutputConfigurationCompatMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SessionConfig$OutputConfig;Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    iget-boolean v8, v1, Landroidx/camera/camera2/internal/CaptureSession;->mCanUseMultiResolutionImageReader:Z

    const/16 v9, 0x23

    if-eqz v8, :cond_1

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v9, :cond_1

    .line 353
    nop

    .line 354
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getOutputConfigs()Ljava/util/List;

    move-result-object v8

    invoke-static {v8}, Landroidx/camera/camera2/internal/CaptureSession;->groupMrirOutputConfigs(Ljava/util/Collection;)Ljava/util/Map;

    move-result-object v8

    .line 355
    .local v8, "groupIdToOutputConfigsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;>;"
    iget-object v10, v1, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    .line 356
    invoke-static {v8, v10}, Landroidx/camera/camera2/internal/CaptureSession;->createMultiResolutionOutputConfigurationCompats(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v10

    move-object v0, v10

    move-object v8, v0

    goto :goto_1

    .line 360
    .end local v8    # "groupIdToOutputConfigsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/List<Landroidx/camera/core/impl/SessionConfig$OutputConfig;>;>;"
    :cond_1
    move-object v8, v0

    .end local v0    # "mrirOutputConfigurationCompatMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SessionConfig$OutputConfig;Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    .local v8, "mrirOutputConfigurationCompatMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SessionConfig$OutputConfig;Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 361
    .local v0, "outputConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    nop

    .line 362
    const/4 v10, 0x0

    invoke-virtual {v5, v10}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getPhysicalCameraId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 364
    .local v10, "physicalCameraIdForAllStreams":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getOutputConfigs()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 365
    .local v12, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    const/4 v13, 0x0

    .line 369
    .local v13, "outputConfiguration":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
    iget-boolean v14, v1, Landroidx/camera/camera2/internal/CaptureSession;->mCanUseMultiResolutionImageReader:Z

    if-eqz v14, :cond_2

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v14, v9, :cond_2

    .line 370
    invoke-interface {v8, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    move-object v13, v14

    .line 376
    :cond_2
    if-nez v13, :cond_3

    .line 377
    iget-object v14, v1, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    invoke-direct {v1, v12, v14, v10}, Landroidx/camera/camera2/internal/CaptureSession;->getOutputConfigurationCompat(Landroidx/camera/core/impl/SessionConfig$OutputConfig;Ljava/util/Map;Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;

    move-result-object v14

    move-object v13, v14

    .line 381
    iget-object v14, v1, Landroidx/camera/camera2/internal/CaptureSession;->mStreamUseCaseMap:Ljava/util/Map;

    invoke-virtual {v12}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v15

    invoke-interface {v14, v15}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 382
    iget-object v14, v1, Landroidx/camera/camera2/internal/CaptureSession;->mStreamUseCaseMap:Ljava/util/Map;

    .line 383
    invoke-virtual {v12}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v15

    invoke-interface {v14, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Long;

    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v14

    .line 382
    invoke-virtual {v13, v14, v15}, Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;->setStreamUseCase(J)V

    .line 386
    :cond_3
    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    nop

    .end local v12    # "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .end local v13    # "outputConfiguration":Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;
    goto :goto_2

    .line 393
    :cond_4
    invoke-direct {v1, v0}, Landroidx/camera/camera2/internal/CaptureSession;->getUniqueOutputConfigurations(Ljava/util/List;)Ljava/util/List;

    move-result-object v9

    .line 395
    .end local v0    # "outputConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    .local v9, "outputConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    iget-object v0, v1, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    .line 397
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getSessionType()I

    move-result v11

    .line 396
    invoke-interface {v0, v11, v9, v4}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->createSessionConfigurationCompat(ILjava/util/List;Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;)Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;

    move-result-object v0

    move-object v11, v0

    .line 400
    .local v11, "sessionConfigCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getTemplateType()I

    move-result v0

    const/4 v12, 0x5

    if-ne v0, v12, :cond_5

    .line 401
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getInputConfiguration()Landroid/hardware/camera2/params/InputConfiguration;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 402
    nop

    .line 404
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/impl/SessionConfig;->getInputConfiguration()Landroid/hardware/camera2/params/InputConfiguration;

    move-result-object v0

    .line 403
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;->wrap(Ljava/lang/Object;)Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;

    move-result-object v0

    .line 402
    invoke-virtual {v11, v0}, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;->setInputConfiguration(Landroidx/camera/camera2/internal/compat/params/InputConfigurationCompat;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 408
    :cond_5
    nop

    .line 410
    :try_start_4
    invoke-virtual {v7}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v0

    iget-object v12, v1, Landroidx/camera/camera2/internal/CaptureSession;->mTemplateParamsOverride:Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;

    .line 409
    invoke-static {v0, v2, v12}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->buildWithoutTarget(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    .line 412
    .local v0, "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    if-eqz v0, :cond_7

    .line 413
    iget-object v12, v1, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    if-eqz v12, :cond_6

    .line 414
    iget-object v12, v1, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    invoke-interface {v12, v0}, Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;->configureWith(Landroid/hardware/camera2/CaptureRequest;)V

    .line 416
    :cond_6
    invoke-virtual {v11, v0}, Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;->setSessionParameters(Landroid/hardware/camera2/CaptureRequest;)V
    :try_end_4
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 420
    .end local v0    # "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    :cond_7
    nop

    .line 422
    :try_start_5
    iget-object v0, v1, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    iget-object v12, v1, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredDeferrableSurfaces:Ljava/util/List;

    invoke-interface {v0, v2, v11, v12}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->openCaptureSession(Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    monitor-exit v3

    return-object v0

    .line 418
    :catch_0
    move-exception v0

    .line 419
    .local v0, "e":Landroid/hardware/camera2/CameraAccessException;
    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v12

    monitor-exit v3

    return-object v12

    .line 322
    .end local v0    # "e":Landroid/hardware/camera2/CameraAccessException;
    .end local v4    # "callbacks":Landroidx/camera/camera2/internal/SynchronizedCaptureSession$StateCallback;
    .end local v5    # "camera2Config":Landroidx/camera/camera2/impl/Camera2ImplConfig;
    .end local v7    # "sessionParameterConfigBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    .end local v8    # "mrirOutputConfigurationCompatMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/SessionConfig$OutputConfig;Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    .end local v9    # "outputConfigList":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/camera2/internal/compat/params/OutputConfigurationCompat;>;"
    .end local v10    # "physicalCameraIdForAllStreams":Ljava/lang/String;
    .end local v11    # "sessionConfigCompat":Landroidx/camera/camera2/internal/compat/params/SessionConfigurationCompat;
    :sswitch_1
    move-object/from16 v6, p1

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "openCaptureSession() should not be possible in state: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    monitor-exit v3

    return-object v0

    .line 425
    :goto_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "openCaptureSession() not execute in state: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v1, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    monitor-exit v3

    return-object v0

    .line 428
    :catchall_0
    move-exception v0

    move-object/from16 v6, p1

    :goto_4
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_4

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x2 -> :sswitch_1
        0x3 -> :sswitch_0
        0x7 -> :sswitch_1
    .end sparse-switch
.end method

.method private setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V
    .locals 4
    .param p1, "state"    # Landroidx/camera/camera2/internal/CaptureSession$State;

    .line 1013
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v0

    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mHighestState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    if-le v0, v1, :cond_0

    .line 1014
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mHighestState:Landroidx/camera/camera2/internal/CaptureSession$State;

    .line 1016
    :cond_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    .line 1020
    invoke-static {}, Landroidx/tracing/Trace;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mHighestState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v0

    sget-object v1, Landroidx/camera/camera2/internal/CaptureSession$State;->GET_SURFACE:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 1021
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CX:C2State["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const-string v1, "CaptureSession@%x"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1023
    .local v0, "counterName":Ljava/lang/String;
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    invoke-static {v0, v1}, Landroidx/tracing/Trace;->setCounter(Ljava/lang/String;I)V

    .line 1025
    .end local v0    # "counterName":Ljava/lang/String;
    :cond_1
    return-void
.end method


# virtual methods
.method abortCaptures()V
    .locals 4

    .line 956
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 957
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-eq v1, v2, :cond_0

    .line 958
    const-string v1, "CaptureSession"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to abort captures. Incorrect state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 959
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    .line 963
    :cond_0
    :try_start_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->abortCaptures()V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 966
    goto :goto_0

    .line 964
    :catch_0
    move-exception v1

    .line 965
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_2
    const-string v2, "CaptureSession"

    const-string v3, "Unable to abort captures."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 967
    .end local v1    # "e":Landroid/hardware/camera2/CameraAccessException;
    :goto_0
    monitor-exit v0

    .line 968
    return-void

    .line 967
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public cancelIssuedCaptureRequests()V
    .locals 6

    .line 993
    const/4 v0, 0x0

    .line 994
    .local v0, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v1

    .line 995
    :try_start_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 996
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v0, v2

    .line 997
    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 999
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1001
    if-eqz v0, :cond_2

    .line 1002
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CaptureConfig;

    .line 1004
    .local v2, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-virtual {v2}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 1005
    .local v4, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-virtual {v2}, Landroidx/camera/core/impl/CaptureConfig;->getId()I

    move-result v5

    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCancelled(I)V

    .line 1006
    .end local v4    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_1

    .line 1007
    .end local v2    # "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    :cond_1
    goto :goto_0

    .line 1009
    :cond_2
    return-void

    .line 999
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public close()V
    .locals 4

    .line 513
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 514
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 529
    :pswitch_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The Opener shouldn\'t null in state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->stop()Z

    .line 532
    sget-object v1, Landroidx/camera/camera2/internal/CaptureSession$State;->CLOSED:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    .line 533
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->stop()V

    .line 534
    const/4 v1, 0x0

    iput-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 536
    goto :goto_0

    .line 519
    :pswitch_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The Opener shouldn\'t null in state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->stop()Z

    .line 524
    :pswitch_3
    sget-object v1, Landroidx/camera/camera2/internal/CaptureSession$State;->RELEASED:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    .line 525
    goto :goto_0

    .line 516
    :pswitch_4
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "close() should not be possible in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 542
    :goto_0
    monitor-exit v0

    .line 543
    return-void

    .line 542
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method finishClose()V
    .locals 2

    .line 670
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v1, Landroidx/camera/camera2/internal/CaptureSession$State;->RELEASED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-ne v0, v1, :cond_0

    .line 671
    const-string v0, "CaptureSession"

    const-string v1, "Skipping finishClose due to being state RELEASED."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 672
    return-void

    .line 675
    :cond_0
    sget-object v0, Landroidx/camera/camera2/internal/CaptureSession$State;->RELEASED:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    .line 676
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 678
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-eqz v1, :cond_1

    .line 679
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    invoke-virtual {v1, v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z

    .line 680
    iput-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 682
    :cond_1
    return-void
.end method

.method public getCaptureConfigs()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 648
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 649
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-static {v1}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 650
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSessionConfig()Landroidx/camera/core/impl/SessionConfig;
    .locals 2

    .line 208
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 209
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    monitor-exit v0

    return-object v1

    .line 210
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getState()Landroidx/camera/camera2/internal/CaptureSession$State;
    .locals 2

    .line 655
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 656
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    monitor-exit v0

    return-object v1

    .line 657
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isInOpenState()Z
    .locals 3

    .line 662
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 663
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENING:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    monitor-exit v0

    return v1

    .line 664
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method issueBurstCaptureRequest(Ljava/util/List;)I
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;)I"
        }
    .end annotation

    .line 777
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 778
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    const/4 v3, -0x1

    if-eq v1, v2, :cond_0

    .line 779
    const-string v1, "CaptureSession"

    const-string v2, "Skipping issueBurstCaptureRequest due to session closed"

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 780
    monitor-exit v0

    return v3

    .line 782
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 783
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v3

    .line 786
    :cond_1
    :try_start_1
    new-instance v1, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;

    invoke-direct {v1}, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;-><init>()V

    .line 787
    .local v1, "callbackAggregator":Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 788
    .local v2, "captureRequests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    const/4 v4, 0x0

    .line 789
    .local v4, "isStillCapture":Z
    const-string v5, "CaptureSession"

    const-string v6, "Issuing capture request."

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 790
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/impl/CaptureConfig;

    .line 791
    .local v6, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 792
    const-string v7, "CaptureSession"

    const-string v8, "Skipping issuing empty capture request."

    invoke-static {v7, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 793
    goto :goto_0

    .line 797
    :cond_2
    const/4 v7, 0x1

    .line 798
    .local v7, "surfacesValid":Z
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/impl/DeferrableSurface;

    .line 799
    .local v9, "surface":Landroidx/camera/core/impl/DeferrableSurface;
    iget-object v10, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    invoke-interface {v10, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 800
    const-string v8, "CaptureSession"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Skipping capture request with invalid surface: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v10}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 802
    const/4 v7, 0x0

    .line 803
    goto :goto_2

    .line 805
    .end local v9    # "surface":Landroidx/camera/core/impl/DeferrableSurface;
    :cond_3
    goto :goto_1

    .line 807
    :cond_4
    :goto_2
    if-nez v7, :cond_5

    .line 811
    goto :goto_0

    .line 814
    :cond_5
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v8

    const/4 v9, 0x2

    if-ne v8, v9, :cond_6

    .line 815
    const/4 v4, 0x1

    .line 817
    :cond_6
    invoke-static {v6}, Landroidx/camera/core/impl/CaptureConfig$Builder;->from(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig$Builder;

    move-result-object v8

    .line 820
    .local v8, "captureConfigBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v9

    const/4 v10, 0x5

    if-ne v9, v10, :cond_7

    .line 821
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v9

    if-eqz v9, :cond_7

    .line 822
    nop

    .line 823
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v9

    .line 822
    invoke-virtual {v8, v9}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setCameraCaptureResult(Landroidx/camera/core/impl/CameraCaptureResult;)V

    .line 829
    :cond_7
    iget-object v9, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    if-eqz v9, :cond_8

    .line 830
    iget-object v9, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 831
    invoke-virtual {v9}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v9

    .line 832
    invoke-virtual {v9}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v9

    .line 830
    invoke-virtual {v8, v9}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 836
    :cond_8
    nop

    .line 837
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v9

    .line 836
    invoke-virtual {v8, v9}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 839
    nop

    .line 840
    invoke-virtual {v8}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v9

    iget-object v10, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v10}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->getDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v10

    iget-object v11, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    iget-object v12, p0, Landroidx/camera/camera2/internal/CaptureSession;->mTemplateParamsOverride:Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;

    .line 839
    const/4 v13, 0x0

    invoke-static {v9, v10, v11, v13, v12}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->build(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CameraDevice;Ljava/util/Map;ZLandroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)Landroid/hardware/camera2/CaptureRequest;

    move-result-object v9

    .line 842
    .local v9, "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    if-nez v9, :cond_9

    .line 843
    const-string v5, "CaptureSession"

    const-string v10, "Skipping issuing request without surface."

    invoke-static {v5, v10}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 844
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return v3

    .line 847
    :cond_9
    :try_start_3
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 849
    .local v10, "cameraCallbacks":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;>;"
    invoke-virtual {v6}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 850
    .local v12, "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    invoke-static {v12, v10}, Landroidx/camera/camera2/internal/CaptureCallbackConverter;->toCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;Ljava/util/List;)V

    .line 851
    .end local v12    # "callback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_3

    .line 852
    :cond_a
    invoke-virtual {v1, v9, v10}, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;->addCamera2Callbacks(Landroid/hardware/camera2/CaptureRequest;Ljava/util/List;)V

    .line 853
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 854
    nop

    .end local v6    # "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    .end local v7    # "surfacesValid":Z
    .end local v8    # "captureConfigBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    .end local v9    # "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    .end local v10    # "cameraCallbacks":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;>;"
    goto/16 :goto_0

    .line 856
    :cond_b
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_10

    .line 857
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mStillCaptureFlow:Landroidx/camera/camera2/internal/compat/workaround/StillCaptureFlow;

    .line 858
    invoke-virtual {v5, v2, v4}, Landroidx/camera/camera2/internal/compat/workaround/StillCaptureFlow;->shouldStopRepeatingBeforeCapture(Ljava/util/List;Z)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 859
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v5}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->stopRepeating()V

    .line 860
    new-instance v5, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0}, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/CaptureSession;)V

    invoke-virtual {v1, v5}, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;->setCaptureSequenceCallback(Landroidx/camera/camera2/internal/CameraBurstCaptureCallback$CaptureSequenceCallback;)V

    .line 869
    :cond_c
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mTorchStateReset:Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;

    invoke-virtual {v5, v2, v4}, Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;->isTorchResetRequired(Ljava/util/List;Z)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_d

    .line 870
    nop

    .line 871
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v6

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/camera2/CaptureRequest;

    new-instance v7, Landroidx/camera/camera2/internal/CaptureSession$2;

    invoke-direct {v7, p0}, Landroidx/camera/camera2/internal/CaptureSession$2;-><init>(Landroidx/camera/camera2/internal/CaptureSession;)V

    .line 872
    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    .line 870
    invoke-virtual {v1, v5, v7}, Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;->addCamera2Callbacks(Landroid/hardware/camera2/CaptureRequest;Ljava/util/List;)V

    .line 893
    :cond_d
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    if-eqz v5, :cond_e

    .line 894
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_e

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/hardware/camera2/CaptureRequest;

    .line 895
    .local v7, "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    iget-object v8, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    invoke-interface {v8, v7}, Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;->configureWith(Landroid/hardware/camera2/CaptureRequest;)V

    .line 896
    .end local v7    # "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    goto :goto_4

    .line 898
    :cond_e
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    if-eqz v5, :cond_f

    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {v5}, Landroidx/camera/core/impl/SessionConfig;->getSessionType()I

    move-result v5

    if-ne v5, v6, :cond_f

    .line 900
    invoke-direct {p0, v2, v1}, Landroidx/camera/camera2/internal/CaptureSession;->captureHighSpeedBurst(Ljava/util/List;Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;)I

    move-result v3
    :try_end_3
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    return v3

    .line 902
    :cond_f
    :try_start_5
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v5, v2, v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->captureBurstRequests(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v3
    :try_end_5
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    return v3

    .line 906
    :cond_10
    :try_start_7
    const-string v5, "CaptureSession"

    const-string v6, "Skipping issuing burst request due to no valid request elements"

    invoke-static {v5, v6}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 912
    .end local v1    # "callbackAggregator":Landroidx/camera/camera2/internal/CameraBurstCaptureCallback;
    .end local v2    # "captureRequests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    .end local v4    # "isStillCapture":Z
    goto :goto_5

    .line 909
    :catch_0
    move-exception v1

    .line 910
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_8
    const-string v2, "CaptureSession"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to access camera: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 911
    invoke-static {}, Ljava/lang/Thread;->dumpStack()V

    .line 914
    .end local v1    # "e":Landroid/hardware/camera2/CameraAccessException;
    :goto_5
    monitor-exit v0

    return v3

    .line 915
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    throw v1
.end method

.method public issueCaptureRequests(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;)V"
        }
    .end annotation

    .line 619
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 620
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 631
    :pswitch_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 632
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/CaptureSession;->issuePendingCaptureRequest()V

    .line 633
    goto :goto_0

    .line 628
    :pswitch_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 629
    goto :goto_0

    .line 637
    :pswitch_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot issue capture request on a closed/released session."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    throw v1

    .line 622
    .restart local p1    # "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    :pswitch_3
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "issueCaptureRequests() should not be possible in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    throw v1

    .line 640
    .restart local p1    # "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    :goto_0
    monitor-exit v0

    .line 641
    return-void

    .line 640
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method issuePendingCaptureRequest()V
    .locals 3

    .line 756
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->getRequestsProcessedFuture()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v1, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/internal/CaptureSession;)V

    .line 767
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 756
    invoke-interface {v0, v1, v2}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 768
    return-void
.end method

.method issueRepeatingCaptureRequests(Landroidx/camera/core/impl/SessionConfig;)I
    .locals 8
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 691
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 692
    const/4 v1, -0x1

    if-nez p1, :cond_0

    .line 693
    :try_start_0
    const-string v2, "CaptureSession"

    const-string v3, "Skipping issueRepeatingCaptureRequests for no configuration case."

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 694
    monitor-exit v0

    return v1

    .line 697
    :cond_0
    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v3, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-eq v2, v3, :cond_1

    .line 698
    const-string v2, "CaptureSession"

    const-string v3, "Skipping issueRepeatingCaptureRequests due to session closed"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 699
    monitor-exit v0

    return v1

    .line 702
    :cond_1
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v2

    .line 703
    .local v2, "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    invoke-virtual {v2}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 704
    const-string v3, "CaptureSession"

    const-string v4, "Skipping issueRepeatingCaptureRequests for no surface."

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 709
    :try_start_1
    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->stopRepeating()V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 713
    goto :goto_0

    .line 710
    :catch_0
    move-exception v3

    .line 711
    .local v3, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_2
    const-string v4, "CaptureSession"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to access camera: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    invoke-static {}, Ljava/lang/Thread;->dumpStack()V

    .line 714
    .end local v3    # "e":Landroid/hardware/camera2/CameraAccessException;
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return v1

    .line 718
    :cond_2
    :try_start_3
    const-string v3, "CaptureSession"

    const-string v4, "Issuing request for session."

    invoke-static {v3, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 719
    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 720
    invoke-interface {v3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->getDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v3

    iget-object v4, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mTemplateParamsOverride:Landroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;

    .line 719
    const/4 v6, 0x1

    invoke-static {v2, v3, v4, v6, v5}, Landroidx/camera/camera2/internal/Camera2CaptureRequestBuilder;->build(Landroidx/camera/core/impl/CaptureConfig;Landroid/hardware/camera2/CameraDevice;Ljava/util/Map;ZLandroidx/camera/camera2/internal/compat/workaround/TemplateParamsOverride;)Landroid/hardware/camera2/CaptureRequest;

    move-result-object v3

    .line 722
    .local v3, "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    if-nez v3, :cond_3

    .line 723
    const-string v4, "CaptureSession"

    const-string v5, "Skipping issuing empty request for session."

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 724
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    return v1

    .line 727
    :cond_3
    :try_start_5
    iget-object v4, p0, Landroidx/camera/camera2/internal/CaptureSession;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    .line 729
    invoke-virtual {v2}, Landroidx/camera/core/impl/CaptureConfig;->getCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v5

    const/4 v7, 0x0

    new-array v7, v7, [Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    .line 728
    invoke-direct {p0, v5, v7}, Landroidx/camera/camera2/internal/CaptureSession;->createCamera2CaptureCallback(Ljava/util/List;[Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->createMonitorListener(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v4

    .line 731
    .local v4, "comboCaptureCallback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    if-eqz v5, :cond_4

    .line 732
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureRequestConfigurator:Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;

    invoke-interface {v5, v3}, Landroidx/camera/camera2/interop/Camera2CaptureRequestConfigurator;->configureWith(Landroid/hardware/camera2/CaptureRequest;)V

    .line 734
    :cond_4
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSessionType()I

    move-result v5

    if-ne v5, v6, :cond_5

    .line 735
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    .line 736
    invoke-interface {v5, v3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->createHighSpeedRequestList(Landroid/hardware/camera2/CaptureRequest;)Ljava/util/List;

    move-result-object v5

    .line 737
    .local v5, "requests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    iget-object v6, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v6, v5, v4}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->setRepeatingBurstRequests(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v1
    :try_end_5
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    return v1

    .line 740
    .end local v5    # "requests":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    :cond_5
    :try_start_7
    iget-object v5, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v5, v3, v4}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->setSingleRepeatingRequest(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)I

    move-result v1
    :try_end_7
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    monitor-exit v0

    return v1

    .line 743
    .end local v3    # "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    .end local v4    # "comboCaptureCallback":Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    :catch_1
    move-exception v3

    .line 744
    .local v3, "e":Landroid/hardware/camera2/CameraAccessException;
    const-string v4, "CaptureSession"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to access camera: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Landroid/hardware/camera2/CameraAccessException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 745
    invoke-static {}, Ljava/lang/Thread;->dumpStack()V

    .line 748
    .end local v3    # "e":Landroid/hardware/camera2/CameraAccessException;
    monitor-exit v0

    return v1

    .line 749
    .end local v2    # "captureConfig":Landroidx/camera/core/impl/CaptureConfig;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    throw v1
.end method

.method synthetic lambda$issueBurstCaptureRequest$3$androidx-camera-camera2-internal-CaptureSession(Landroid/hardware/camera2/CameraCaptureSession;IZ)V
    .locals 3
    .param p1, "session"    # Landroid/hardware/camera2/CameraCaptureSession;
    .param p2, "sequenceId"    # I
    .param p3, "isAborted"    # Z

    .line 862
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 863
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-ne v1, v2, :cond_0

    .line 864
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->issueRepeatingCaptureRequests(Landroidx/camera/core/impl/SessionConfig;)I

    .line 866
    :cond_0
    monitor-exit v0

    .line 867
    return-void

    .line 866
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method synthetic lambda$issuePendingCaptureRequest$2$androidx-camera-camera2-internal-CaptureSession()V
    .locals 3

    .line 757
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 758
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 759
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    return-void

    .line 762
    :cond_0
    :try_start_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->issueBurstCaptureRequest(Ljava/util/List;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 764
    :try_start_2
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 765
    nop

    .line 766
    monitor-exit v0

    .line 767
    return-void

    .line 764
    :catchall_0
    move-exception v1

    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSession;->mCaptureConfigs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 765
    throw v1

    .line 766
    :catchall_1
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method synthetic lambda$open$0$androidx-camera-camera2-internal-CaptureSession(Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .param p2, "cameraDevice"    # Landroid/hardware/camera2/CameraDevice;
    .param p3, "surfaces"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 268
    invoke-direct {p0, p3, p1, p2}, Landroidx/camera/camera2/internal/CaptureSession;->openCaptureSession(Ljava/util/List;Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$release$1$androidx-camera-camera2-internal-CaptureSession(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 3
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 587
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 588
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "Release completer expected to be null"

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 590
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseCompleter:Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 591
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Release[session="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 592
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public open(Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 5
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

    .line 258
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 259
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 305
    const-string v1, "CaptureSession"

    goto :goto_0

    .line 261
    :pswitch_0
    sget-object v1, Landroidx/camera/camera2/internal/CaptureSession$State;->GET_SURFACE:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    .line 262
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredDeferrableSurfaces:Ljava/util/List;

    .line 263
    iput-object p3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    .line 264
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    iget-object v2, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredDeferrableSurfaces:Ljava/util/List;

    .line 265
    const-wide/16 v3, 0x1388

    invoke-interface {v1, v2, v3, v4}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->startWithDeferrableSurface(Ljava/util/List;J)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    .line 264
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/FutureChain;->from(Lcom/google/common/util/concurrent/ListenableFuture;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    new-instance v2, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, p1, p2}, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/internal/CaptureSession;Landroidx/camera/core/impl/SessionConfig;Landroid/hardware/camera2/CameraDevice;)V

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    .line 269
    invoke-interface {v3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 267
    invoke-virtual {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/FutureChain;->transformAsync(Landroidx/camera/core/impl/utils/futures/AsyncFunction;Ljava/util/concurrent/Executor;)Landroidx/camera/core/impl/utils/futures/FutureChain;

    move-result-object v1

    .line 271
    .local v1, "openFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    new-instance v2, Landroidx/camera/camera2/internal/CaptureSession$1;

    invoke-direct {v2, p0}, Landroidx/camera/camera2/internal/CaptureSession$1;-><init>(Landroidx/camera/camera2/internal/CaptureSession;)V

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    .line 295
    invoke-interface {v3}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v3

    .line 271
    invoke-static {v1, v2, v3}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 303
    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->nonCancellationPropagating(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    monitor-exit v0

    return-object v2

    .line 305
    .end local v1    # "openFuture":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Ljava/lang/Void;>;"
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Open not allowed in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 308
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "open() should not allow the state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 310
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public release(Z)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 4
    .param p1, "abortInFlightCaptures"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 551
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 552
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_1

    .line 558
    :pswitch_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 559
    if-eqz p1, :cond_0

    .line 561
    :try_start_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->abortCaptures()V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 566
    goto :goto_0

    .line 562
    :catch_0
    move-exception v1

    .line 565
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_2
    const-string v2, "CaptureSession"

    const-string v3, "Unable to abort captures."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 568
    .end local v1    # "e":Landroid/hardware/camera2/CameraAccessException;
    :cond_0
    :goto_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->close()V

    .line 572
    :cond_1
    :pswitch_2
    sget-object v1, Landroidx/camera/camera2/internal/CaptureSession$State;->RELEASING:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    .line 573
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mRequestMonitor:Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/workaround/RequestMonitor;->stop()V

    .line 574
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The Opener shouldn\'t null in state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 576
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->stop()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 579
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/CaptureSession;->finishClose()V

    .line 580
    goto :goto_1

    .line 584
    :cond_2
    :pswitch_3
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    if-nez v1, :cond_3

    .line 585
    new-instance v1, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/camera/camera2/internal/CaptureSession$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/CaptureSession;)V

    invoke-static {v1}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v1

    iput-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    .line 596
    :cond_3
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mReleaseFuture:Lcom/google/common/util/concurrent/ListenableFuture;

    monitor-exit v0

    return-object v1

    .line 598
    :pswitch_4
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The Opener shouldn\'t null in state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 600
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionOpener:Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession$Opener;->stop()Z

    .line 603
    :pswitch_5
    sget-object v1, Landroidx/camera/camera2/internal/CaptureSession$State;->RELEASED:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->setState(Landroidx/camera/camera2/internal/CaptureSession$State;)V

    goto :goto_1

    .line 554
    :pswitch_6
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "release() should not be possible in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "abortInFlightCaptures":Z
    throw v1

    .line 608
    .restart local p1    # "abortInFlightCaptures":Z
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 611
    const/4 v0, 0x0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 608
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public setSessionConfig(Landroidx/camera/core/impl/SessionConfig;)V
    .locals 4
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    .line 218
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 219
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/CaptureSession$State;->ordinal()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 229
    :pswitch_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 230
    if-nez p1, :cond_0

    .line 231
    monitor-exit v0

    return-void

    .line 234
    :cond_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mConfiguredSurfaceMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getSurfaces()Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 235
    const-string v1, "CaptureSession"

    const-string v2, "Does not have the proper configured lists"

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    monitor-exit v0

    return-void

    .line 239
    :cond_1
    const-string v1, "CaptureSession"

    const-string v2, "Attempting to submit CaptureRequest after setting"

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    invoke-virtual {p0, v1}, Landroidx/camera/camera2/internal/CaptureSession;->issueRepeatingCaptureRequests(Landroidx/camera/core/impl/SessionConfig;)I

    .line 241
    goto :goto_0

    .line 226
    :pswitch_1
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionConfig:Landroidx/camera/core/impl/SessionConfig;

    .line 227
    goto :goto_0

    .line 245
    :pswitch_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Session configuration cannot be set on a closed/released session."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    throw v1

    .line 221
    .restart local p1    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    :pswitch_3
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setSessionConfig() should not be possible in state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    throw v1

    .line 248
    .restart local p1    # "sessionConfig":Landroidx/camera/core/impl/SessionConfig;
    :goto_0
    monitor-exit v0

    .line 249
    return-void

    .line 248
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setStreamUseCaseMap(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Landroidx/camera/core/impl/DeferrableSurface;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 198
    .local p1, "streamUseCaseMap":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/impl/DeferrableSurface;Ljava/lang/Long;>;"
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 199
    :try_start_0
    iput-object p1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mStreamUseCaseMap:Ljava/util/Map;

    .line 200
    monitor-exit v0

    .line 201
    return-void

    .line 200
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method stopRepeating()V
    .locals 4

    .line 974
    iget-object v0, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSessionLock:Ljava/lang/Object;

    monitor-enter v0

    .line 975
    :try_start_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    sget-object v2, Landroidx/camera/camera2/internal/CaptureSession$State;->OPENED:Landroidx/camera/camera2/internal/CaptureSession$State;

    if-eq v1, v2, :cond_0

    .line 976
    const-string v1, "CaptureSession"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to stop repeating. Incorrect state:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Landroidx/camera/camera2/internal/CaptureSession;->mState:Landroidx/camera/camera2/internal/CaptureSession$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 977
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    .line 981
    :cond_0
    :try_start_1
    iget-object v1, p0, Landroidx/camera/camera2/internal/CaptureSession;->mSynchronizedCaptureSession:Landroidx/camera/camera2/internal/SynchronizedCaptureSession;

    invoke-interface {v1}, Landroidx/camera/camera2/internal/SynchronizedCaptureSession;->stopRepeating()V
    :try_end_1
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 984
    goto :goto_0

    .line 982
    :catch_0
    move-exception v1

    .line 983
    .local v1, "e":Landroid/hardware/camera2/CameraAccessException;
    :try_start_2
    const-string v2, "CaptureSession"

    const-string v3, "Unable to stop repeating."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 985
    .end local v1    # "e":Landroid/hardware/camera2/CameraAccessException;
    :goto_0
    monitor-exit v0

    .line 986
    return-void

    .line 985
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
