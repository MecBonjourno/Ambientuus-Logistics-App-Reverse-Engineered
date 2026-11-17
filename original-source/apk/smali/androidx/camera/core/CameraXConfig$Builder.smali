.class public final Landroidx/camera/core/CameraXConfig$Builder;
.super Ljava/lang/Object;
.source "CameraXConfig.java"

# interfaces
.implements Landroidx/camera/core/internal/TargetConfig$Builder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/CameraXConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/internal/TargetConfig$Builder<",
        "Landroidx/camera/core/CameraX;",
        "Landroidx/camera/core/CameraXConfig$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 328
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/CameraXConfig$Builder;-><init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V

    .line 329
    return-void
.end method

.method private constructor <init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V
    .locals 4
    .param p1, "mutableConfig"    # Landroidx/camera/core/impl/MutableOptionsBundle;

    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 332
    iput-object p1, p0, Landroidx/camera/core/CameraXConfig$Builder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    .line 334
    sget-object v0, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_CLASS:Landroidx/camera/core/impl/Config$Option;

    .line 335
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroidx/camera/core/impl/MutableOptionsBundle;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 336
    .local v0, "oldConfigClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_1

    const-class v1, Landroidx/camera/core/CameraX;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 337
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid target class configuration for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 344
    :cond_1
    :goto_0
    const-class v1, Landroidx/camera/core/CameraX;

    invoke-virtual {p0, v1}, Landroidx/camera/core/CameraXConfig$Builder;->setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/CameraXConfig$Builder;

    .line 345
    return-void
.end method

.method public static fromConfig(Landroidx/camera/core/CameraXConfig;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p0, "configuration"    # Landroidx/camera/core/CameraXConfig;

    .line 354
    new-instance v0, Landroidx/camera/core/CameraXConfig$Builder;

    invoke-static {p0}, Landroidx/camera/core/impl/MutableOptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraXConfig$Builder;-><init>(Landroidx/camera/core/impl/MutableOptionsBundle;)V

    return-object v0
.end method


# virtual methods
.method public build()Landroidx/camera/core/CameraXConfig;
    .locals 2

    .line 569
    new-instance v0, Landroidx/camera/core/CameraXConfig;

    iget-object v1, p0, Landroidx/camera/core/CameraXConfig$Builder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    invoke-static {v1}, Landroidx/camera/core/impl/OptionsBundle;->from(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/OptionsBundle;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraXConfig;-><init>(Landroidx/camera/core/impl/OptionsBundle;)V

    return-object v0
.end method

.method public getMutableConfig()Landroidx/camera/core/impl/MutableConfig;
    .locals 1

    .line 560
    iget-object v0, p0, Landroidx/camera/core/CameraXConfig$Builder;->mMutableConfig:Landroidx/camera/core/impl/MutableOptionsBundle;

    return-object v0
.end method

.method public setAvailableCamerasLimiter(Landroidx/camera/core/CameraSelector;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "availableCameraSelector"    # Landroidx/camera/core/CameraSelector;

    .line 469
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_AVAILABLE_CAMERAS_LIMITER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 471
    return-object p0
.end method

.method public setCameraExecutor(Ljava/util/concurrent/Executor;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 406
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_CAMERA_EXECUTOR:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 407
    return-object p0
.end method

.method public setCameraFactoryProvider(Landroidx/camera/core/impl/CameraFactory$Provider;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "cameraFactory"    # Landroidx/camera/core/impl/CameraFactory$Provider;

    .line 364
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_CAMERA_FACTORY_PROVIDER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 365
    return-object p0
.end method

.method public setCameraOpenRetryMaxTimeoutInMillisWhileResuming(J)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 3
    .param p1, "maxTimeoutInMillis"    # J

    .line 498
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_CAMERA_OPEN_RETRY_MAX_TIMEOUT_IN_MILLIS_WHILE_RESUMING:Landroidx/camera/core/impl/Config$Option;

    .line 500
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 498
    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 501
    return-object p0
.end method

.method public setCameraProviderInitRetryPolicy(Landroidx/camera/core/RetryPolicy;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "retryPolicy"    # Landroidx/camera/core/RetryPolicy;

    .line 516
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_CAMERA_PROVIDER_INIT_RETRY_POLICY:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 519
    return-object p0
.end method

.method public setConfigImplType(I)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 3
    .param p1, "configImplType"    # I

    .line 603
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_CONFIG_IMPL_TYPE:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 604
    return-object p0
.end method

.method public setDeviceSurfaceManagerProvider(Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "surfaceManagerProvider"    # Landroidx/camera/core/impl/CameraDeviceSurfaceManager$Provider;

    .line 375
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_DEVICE_SURFACE_MANAGER_PROVIDER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 377
    return-object p0
.end method

.method public setMinimumLoggingLevel(I)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 3
    .param p1, "logLevel"    # I

    .line 446
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_MIN_LOGGING_LEVEL:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 447
    return-object p0
.end method

.method public setQuirkSettings(Landroidx/camera/core/impl/QuirkSettings;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "quirkSettings"    # Landroidx/camera/core/impl/QuirkSettings;

    .line 554
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_QUIRK_SETTINGS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 555
    return-object p0
.end method

.method public setRepeatingStreamForced(Z)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 3
    .param p1, "forced"    # Z

    .line 542
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_REPEATING_STREAM_FORCED:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 543
    return-object p0
.end method

.method public setSchedulerHandler(Landroid/os/Handler;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "handler"    # Landroid/os/Handler;

    .line 424
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_SCHEDULER_HANDLER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 425
    return-object p0
.end method

.method public setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "Landroidx/camera/core/CameraX;",
            ">;)",
            "Landroidx/camera/core/CameraXConfig$Builder;"
        }
    .end annotation

    .line 577
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<Landroidx/camera/core/CameraX;>;"
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_CLASS:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 580
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 581
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 582
    .local v0, "targetName":Ljava/lang/String;
    invoke-virtual {p0, v0}, Landroidx/camera/core/CameraXConfig$Builder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/CameraXConfig$Builder;

    .line 585
    .end local v0    # "targetName":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public bridge synthetic setTargetClass(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 316
    invoke-virtual {p0, p1}, Landroidx/camera/core/CameraXConfig$Builder;->setTargetClass(Ljava/lang/Class;)Landroidx/camera/core/CameraXConfig$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setTargetName(Ljava/lang/String;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "targetName"    # Ljava/lang/String;

    .line 591
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/internal/TargetConfig;->OPTION_TARGET_NAME:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 592
    return-object p0
.end method

.method public bridge synthetic setTargetName(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 316
    invoke-virtual {p0, p1}, Landroidx/camera/core/CameraXConfig$Builder;->setTargetName(Ljava/lang/String;)Landroidx/camera/core/CameraXConfig$Builder;

    move-result-object p1

    return-object p1
.end method

.method public setUseCaseConfigFactoryProvider(Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;)Landroidx/camera/core/CameraXConfig$Builder;
    .locals 2
    .param p1, "configFactoryProvider"    # Landroidx/camera/core/impl/UseCaseConfigFactory$Provider;

    .line 390
    invoke-virtual {p0}, Landroidx/camera/core/CameraXConfig$Builder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/core/CameraXConfig;->OPTION_USECASE_CONFIG_FACTORY_PROVIDER:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 392
    return-object p0
.end method
