.class public interface abstract Landroidx/camera/core/impl/UseCaseConfig;
.super Ljava/lang/Object;
.source "UseCaseConfig.java"

# interfaces
.implements Landroidx/camera/core/internal/TargetConfig;
.implements Landroidx/camera/core/impl/ImageInputConfig;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/UseCaseConfig$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroidx/camera/core/UseCase;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/camera/core/internal/TargetConfig<",
        "TT;>;",
        "Landroidx/camera/core/impl/ImageInputConfig;"
    }
.end annotation


# static fields
.field public static final OPTION_CAPTURE_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_CAPTURE_TYPE:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_DEFAULT_CAPTURE_CONFIG:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_DEFAULT_SESSION_CONFIG:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroidx/camera/core/impl/SessionConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_HIGH_RESOLUTION_DISABLED:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_IS_STRICT_FRAME_RATE_REQUIRED:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_PREVIEW_STABILIZATION_MODE:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_SESSION_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_SESSION_TYPE:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_STREAM_USE_CASE:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroidx/camera/core/impl/StreamUseCase;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_SURFACE_OCCUPANCY_PRIORITY:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_TAKE_PICTURE_MANAGER_PROVIDER:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroidx/camera/core/imagecapture/TakePictureManager$Provider;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_TARGET_FRAME_RATE:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final OPTION_VIDEO_STABILIZATION_MODE:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/impl/Config$Option<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 47
    const-class v0, Landroidx/camera/core/impl/SessionConfig;

    .line 48
    const-string v1, "camerax.core.useCase.defaultSessionConfig"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_SESSION_CONFIG:Landroidx/camera/core/impl/Config$Option;

    .line 53
    const-class v0, Landroidx/camera/core/impl/CaptureConfig;

    .line 54
    const-string v1, "camerax.core.useCase.defaultCaptureConfig"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_DEFAULT_CAPTURE_CONFIG:Landroidx/camera/core/impl/Config$Option;

    .line 62
    const-class v0, Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;

    .line 63
    const-string v1, "camerax.core.useCase.sessionConfigUnpacker"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SESSION_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    .line 72
    const-class v0, Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;

    .line 73
    const-string v1, "camerax.core.useCase.captureConfigUnpacker"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_CONFIG_UNPACKER:Landroidx/camera/core/impl/Config$Option;

    .line 79
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 80
    const-string v1, "camerax.core.useCase.surfaceOccupancyPriority"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SURFACE_OCCUPANCY_PRIORITY:Landroidx/camera/core/impl/Config$Option;

    .line 85
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 86
    const-string v1, "camerax.core.useCase.sessionType"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_SESSION_TYPE:Landroidx/camera/core/impl/Config$Option;

    .line 91
    const-class v0, Landroid/util/Range;

    .line 92
    const-string v1, "camerax.core.useCase.targetFrameRate"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TARGET_FRAME_RATE:Landroidx/camera/core/impl/Config$Option;

    .line 97
    const-class v0, Ljava/lang/Boolean;

    .line 98
    const-string v1, "camerax.core.useCase.isStrictFrameRateRequired"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_IS_STRICT_FRAME_RATE_REQUIRED:Landroidx/camera/core/impl/Config$Option;

    .line 103
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 104
    const-string v1, "camerax.core.useCase.zslDisabled"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_ZSL_DISABLED:Landroidx/camera/core/impl/Config$Option;

    .line 109
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 110
    const-string v1, "camerax.core.useCase.highResolutionDisabled"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_HIGH_RESOLUTION_DISABLED:Landroidx/camera/core/impl/Config$Option;

    .line 115
    const-string v0, "camerax.core.useCase.captureType"

    const-class v1, Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;

    invoke-static {v0, v1}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_CAPTURE_TYPE:Landroidx/camera/core/impl/Config$Option;

    .line 121
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 122
    const-string v1, "camerax.core.useCase.previewStabilizationMode"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_PREVIEW_STABILIZATION_MODE:Landroidx/camera/core/impl/Config$Option;

    .line 127
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 128
    const-string v1, "camerax.core.useCase.videoStabilizationMode"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_VIDEO_STABILIZATION_MODE:Landroidx/camera/core/impl/Config$Option;

    .line 130
    const-class v0, Landroidx/camera/core/imagecapture/TakePictureManager$Provider;

    .line 131
    const-string v1, "camerax.core.useCase.takePictureManagerProvider"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_TAKE_PICTURE_MANAGER_PROVIDER:Landroidx/camera/core/impl/Config$Option;

    .line 137
    const-class v0, Landroidx/camera/core/impl/StreamUseCase;

    .line 138
    const-string v1, "camerax.core.useCase.streamUseCase"

    invoke-static {v1, v0}, Landroidx/camera/core/impl/Config$Option;->create(Ljava/lang/String;Ljava/lang/Class;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/UseCaseConfig;->OPTION_STREAM_USE_CASE:Landroidx/camera/core/impl/Config$Option;

    .line 137
    return-void
.end method


# virtual methods
.method public abstract getCaptureOptionUnpacker()Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;
.end method

.method public abstract getCaptureOptionUnpacker(Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;)Landroidx/camera/core/impl/CaptureConfig$OptionUnpacker;
.end method

.method public abstract getCaptureType()Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;
.end method

.method public abstract getDefaultCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;
.end method

.method public abstract getDefaultCaptureConfig(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig;
.end method

.method public abstract getDefaultSessionConfig()Landroidx/camera/core/impl/SessionConfig;
.end method

.method public abstract getDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Landroidx/camera/core/impl/SessionConfig;
.end method

.method public abstract getPreviewStabilizationMode()I
.end method

.method public abstract getSessionOptionUnpacker()Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;
.end method

.method public abstract getSessionOptionUnpacker(Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;)Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;
.end method

.method public abstract getSessionType()I
.end method

.method public abstract getSessionType(I)I
.end method

.method public abstract getStreamUseCase()Landroidx/camera/core/impl/StreamUseCase;
.end method

.method public abstract getSurfaceOccupancyPriority()I
.end method

.method public abstract getSurfaceOccupancyPriority(I)I
.end method

.method public abstract getTakePictureManagerProvider()Landroidx/camera/core/imagecapture/TakePictureManager$Provider;
.end method

.method public abstract getTargetFrameRate()Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTargetFrameRate(Landroid/util/Range;)Landroid/util/Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getVideoStabilizationMode()I
.end method

.method public abstract hasTargetFrameRate()Z
.end method

.method public abstract isHighResolutionDisabled(Z)Z
.end method

.method public abstract isStrictFrameRateRequired()Z
.end method

.method public abstract isZslDisabled(Z)Z
.end method
