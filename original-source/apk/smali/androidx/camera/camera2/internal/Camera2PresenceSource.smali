.class public final Landroidx/camera/camera2/internal/Camera2PresenceSource;
.super Landroidx/camera/core/impl/AbstractCameraPresenceSource;
.source "Camera2PresenceSource.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/Camera2PresenceSource$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCamera2PresenceSource.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Camera2PresenceSource.kt\nandroidx/camera/camera2/internal/Camera2PresenceSource\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,123:1\n11165#2:124\n11500#2,3:125\n*S KotlinDebug\n*F\n+ 1 Camera2PresenceSource.kt\nandroidx/camera/camera2/internal/Camera2PresenceSource\n*L\n93#1:124\n93#1:125,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B%\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0008\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\u000eH\u0016J\u0014\u0010\u0010\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00120\u00030\u0011H\u0016J\u0010\u0010\u0013\u001a\u00020\u000e*\u0006\u0012\u0002\u0008\u00030\u0011H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Landroidx/camera/camera2/internal/Camera2PresenceSource;",
        "Landroidx/camera/core/impl/AbstractCameraPresenceSource;",
        "initialCameraIds",
        "",
        "",
        "cameraManager",
        "Landroidx/camera/camera2/internal/compat/CameraManagerCompat;",
        "systemCallbackExecutor",
        "Ljava/util/concurrent/Executor;",
        "<init>",
        "(Ljava/util/List;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/util/concurrent/Executor;)V",
        "systemAvailabilityCallback",
        "Landroid/hardware/camera2/CameraManager$AvailabilityCallback;",
        "startMonitoring",
        "",
        "stopMonitoring",
        "fetchData",
        "Lcom/google/common/util/concurrent/ListenableFuture;",
        "Landroidx/camera/core/CameraIdentifier;",
        "fetchDataAndForget",
        "Companion",
        "camera-camera2_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final Companion:Landroidx/camera/camera2/internal/Camera2PresenceSource$Companion;

.field private static final TAG:Ljava/lang/String; = "Camera2PresenceSrc"


# instance fields
.field private final cameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private systemAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

.field private final systemCallbackExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public static synthetic $r8$lambda$3DdYpxviK9c6urYaW35ObgcwUyY(Landroidx/camera/camera2/internal/Camera2PresenceSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->fetchData$lambda$3$lambda$2(Landroidx/camera/camera2/internal/Camera2PresenceSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    return-void
.end method

.method public static synthetic $r8$lambda$fUbp7ggRRGFDeaRtAjMPoDv1pXI(Landroidx/camera/camera2/internal/Camera2PresenceSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->fetchData$lambda$3(Landroidx/camera/camera2/internal/Camera2PresenceSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/camera/camera2/internal/Camera2PresenceSource$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/camera2/internal/Camera2PresenceSource$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->Companion:Landroidx/camera/camera2/internal/Camera2PresenceSource$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;Ljava/util/concurrent/Executor;)V
    .locals 1
    .param p1, "initialCameraIds"    # Ljava/util/List;
    .param p2, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;
    .param p3, "systemCallbackExecutor"    # Ljava/util/concurrent/Executor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/camera/camera2/internal/compat/CameraManagerCompat;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    const-string v0, "initialCameraIds"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cameraManager"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "systemCallbackExecutor"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    invoke-direct {p0, p1}, Landroidx/camera/core/impl/AbstractCameraPresenceSource;-><init>(Ljava/util/List;)V

    .line 36
    iput-object p2, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->cameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 37
    iput-object p3, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 34
    return-void
.end method

.method public static final synthetic access$fetchDataAndForget(Landroidx/camera/camera2/internal/Camera2PresenceSource;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 0
    .param p0, "$this"    # Landroidx/camera/camera2/internal/Camera2PresenceSource;
    .param p1, "$receiver"    # Lcom/google/common/util/concurrent/ListenableFuture;

    .line 34
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->fetchDataAndForget(Lcom/google/common/util/concurrent/ListenableFuture;)V

    return-void
.end method

.method private static final fetchData$lambda$3(Landroidx/camera/camera2/internal/Camera2PresenceSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)Ljava/lang/Object;
    .locals 2
    .param p0, "this$0"    # Landroidx/camera/camera2/internal/Camera2PresenceSource;
    .param p1, "completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    const-string v0, "completer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/camera2/internal/Camera2PresenceSource$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Landroidx/camera/camera2/internal/Camera2PresenceSource$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/internal/Camera2PresenceSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 104
    const-string v0, "FetchData for CameraAvailability"

    return-object v0
.end method

.method private static final fetchData$lambda$3$lambda$2(Landroidx/camera/camera2/internal/Camera2PresenceSource;Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .locals 18
    .param p0, "this$0"    # Landroidx/camera/camera2/internal/Camera2PresenceSource;
    .param p1, "$completer"    # Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 91
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "Camera2PresenceSrc"

    .line 93
    :try_start_0
    iget-object v0, v1, Landroidx/camera/camera2/internal/Camera2PresenceSource;->cameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraIdList()[Ljava/lang/String;

    move-result-object v0

    const-string v4, "getCameraIdList(...)"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, [Ljava/lang/Object;

    .local v0, "$this$map$iv":[Ljava/lang/Object;
    const/4 v4, 0x0

    .line 124
    .local v4, "$i$f$map":I
    new-instance v5, Ljava/util/ArrayList;

    array-length v6, v0

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v0

    .local v6, "$this$mapTo$iv$iv":[Ljava/lang/Object;
    const/4 v7, 0x0

    .line 125
    .local v7, "$i$f$mapTo":I
    array-length v8, v6

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v8, :cond_0

    aget-object v10, v6, v9

    .line 126
    .local v10, "item$iv$iv":Ljava/lang/Object;
    move-object v11, v10

    check-cast v11, Ljava/lang/String;

    move-object v13, v11

    .local v13, "it":Ljava/lang/String;
    const/4 v11, 0x0

    .line 93
    .local v11, "$i$a$-map-Camera2PresenceSource$fetchData$1$1$newCameraList$1":I
    sget-object v12, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-static {v13}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/16 v16, 0x6

    const/16 v17, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static/range {v12 .. v17}, Landroidx/camera/core/CameraIdentifier$Companion;->create$default(Landroidx/camera/core/CameraIdentifier$Companion;Ljava/lang/String;Ljava/lang/String;Landroidx/camera/core/impl/Identifier;ILjava/lang/Object;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v12

    .line 126
    .end local v11    # "$i$a$-map-Camera2PresenceSource$fetchData$1$1$newCameraList$1":I
    .end local v13    # "it":Ljava/lang/String;
    invoke-interface {v5, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 125
    nop

    .end local v10    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 127
    :cond_0
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v6    # "$this$mapTo$iv$iv":[Ljava/lang/Object;
    .end local v7    # "$i$f$mapTo":I
    check-cast v5, Ljava/util/List;

    .line 124
    nop

    .line 93
    .end local v0    # "$this$map$iv":[Ljava/lang/Object;
    .end local v4    # "$i$f$map":I
    nop

    .line 92
    nop

    .line 94
    .local v5, "newCameraList":Ljava/util/List;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[FetchData] Refreshed camera list: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object v6, v5

    check-cast v6, Ljava/lang/Iterable;

    const/16 v13, 0x3f

    const/4 v14, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v6 .. v14}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    invoke-virtual {v1, v5}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->updateData(Ljava/util/List;)V

    .line 96
    invoke-virtual {v2, v5}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->set(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .end local v5    # "newCameraList":Ljava/util/List;
    goto :goto_1

    .line 97
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    const-string v4, "[FetchData] Failed to get camera list for refresh."

    move-object v5, v0

    check-cast v5, Ljava/lang/Throwable;

    invoke-static {v3, v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v3

    const-string v4, "createFrom(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    .local v3, "error":Landroidx/camera/core/CameraUnavailableException;
    move-object v4, v3

    check-cast v4, Ljava/lang/Throwable;

    invoke-virtual {v1, v4}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->updateError(Ljava/lang/Throwable;)V

    .line 101
    move-object v4, v3

    check-cast v4, Ljava/lang/Throwable;

    invoke-virtual {v2, v4}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->setException(Ljava/lang/Throwable;)Z

    .line 103
    .end local v0    # "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    .end local v3    # "error":Landroidx/camera/core/CameraUnavailableException;
    :goto_1
    return-void
.end method

.method private final fetchDataAndForget(Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 0
    .param p1, "$this$fetchDataAndForget"    # Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "*>;)V"
        }
    .end annotation

    .line 116
    invoke-static {p1}, Landroidx/camera/core/impl/utils/futures/Futures;->transformAsyncOnCompletion(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    .line 117
    return-void
.end method


# virtual methods
.method public fetchData()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;>;"
        }
    .end annotation

    .line 89
    new-instance v0, Landroidx/camera/camera2/internal/Camera2PresenceSource$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/Camera2PresenceSource$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/internal/Camera2PresenceSource;)V

    invoke-static {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter;->getFuture(Landroidx/concurrent/futures/CallbackToFutureAdapter$Resolver;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    const-string v1, "getFuture(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public startMonitoring()V
    .locals 3

    .line 43
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    const-string v1, "Camera2PresenceSrc"

    if-eqz v0, :cond_0

    .line 44
    const-string v0, "Monitoring already started. Unregistering existing callback."

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->stopMonitoring()V

    .line 48
    :cond_0
    const-string v0, "Starting system availability monitoring."

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    nop

    .line 50
    new-instance v0, Landroidx/camera/camera2/internal/Camera2PresenceSource$startMonitoring$1;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/internal/Camera2PresenceSource$startMonitoring$1;-><init>(Landroidx/camera/camera2/internal/Camera2PresenceSource;)V

    check-cast v0, Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 49
    iput-object v0, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 67
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->cameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 68
    iget-object v1, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 69
    iget-object v2, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 67
    invoke-virtual {v0, v1, v2}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->registerAvailabilityCallback(Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    .line 72
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/camera2/internal/Camera2PresenceSource;->fetchDataAndForget(Lcom/google/common/util/concurrent/ListenableFuture;)V

    .line 73
    return-void
.end method

.method public stopMonitoring()V
    .locals 7

    .line 76
    const-string v0, "Stopping system availability monitoring."

    const-string v1, "Camera2PresenceSrc"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    iget-object v0, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    if-eqz v0, :cond_0

    .local v0, "it":Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
    const/4 v2, 0x0

    .line 78
    .local v2, "$i$a$-let-Camera2PresenceSource$stopMonitoring$1":I
    nop

    .line 79
    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->cameraManager:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v4, v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->unregisterAvailabilityCallback(Landroid/hardware/camera2/CameraManager$AvailabilityCallback;)V

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    :goto_0
    iput-object v3, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    .line 84
    goto :goto_1

    .line 83
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 80
    :catch_0
    move-exception v4

    .line 81
    .local v4, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v5, "Failed to unregister system availability callback."

    move-object v6, v4

    check-cast v6, Ljava/lang/Throwable;

    invoke-static {v1, v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v4    # "e":Ljava/lang/Exception;
    goto :goto_0

    .line 77
    .end local v0    # "it":Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
    .end local v2    # "$i$a$-let-Camera2PresenceSource$stopMonitoring$1":I
    :goto_1
    goto :goto_3

    .line 83
    .restart local v0    # "it":Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
    .restart local v2    # "$i$a$-let-Camera2PresenceSource$stopMonitoring$1":I
    :goto_2
    iput-object v3, p0, Landroidx/camera/camera2/internal/Camera2PresenceSource;->systemAvailabilityCallback:Landroid/hardware/camera2/CameraManager$AvailabilityCallback;

    throw v1

    .line 86
    .end local v0    # "it":Landroid/hardware/camera2/CameraManager$AvailabilityCallback;
    .end local v2    # "$i$a$-let-Camera2PresenceSource$stopMonitoring$1":I
    :cond_0
    :goto_3
    return-void
.end method
