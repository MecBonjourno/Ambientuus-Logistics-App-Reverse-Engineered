.class public final synthetic Landroidx/camera/lifecycle/LifecycleCameraProvider$-CC;
.super Ljava/lang/Object;
.source "LifecycleCameraProvider.kt"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Landroidx/camera/lifecycle/LifecycleCameraProvider;->Companion:Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;

    return-void
.end method

.method public static createInstance(Landroid/content/Context;Landroidx/camera/core/CameraXConfig;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/camera/core/CameraXConfig;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroidx/camera/lifecycle/LifecycleCameraProvider;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/camera/lifecycle/LifecycleCameraProvider;->Companion:Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;

    invoke-virtual {v0, p0, p1, p2}, Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;->createInstance(Landroid/content/Context;Landroidx/camera/core/CameraXConfig;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 332
    return-object v0
.end method

.method public static createInstance(Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroidx/camera/lifecycle/LifecycleCameraProvider;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/camera/lifecycle/LifecycleCameraProvider;->Companion:Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;

    invoke-virtual {v0, p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;->createInstance(Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    .line 332
    return-object v0
.end method

.method public static createInstanceAsync(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/lifecycle/LifecycleCameraProvider;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/camera/lifecycle/LifecycleCameraProvider;->Companion:Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;

    invoke-virtual {v0, p0}, Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;->createInstanceAsync(Landroid/content/Context;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 356
    return-object v0
.end method

.method public static createInstanceAsync(Landroid/content/Context;Landroidx/camera/core/CameraXConfig;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "cameraXConfig"    # Landroidx/camera/core/CameraXConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/camera/core/CameraXConfig;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/lifecycle/LifecycleCameraProvider;",
            ">;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 0
    sget-object v0, Landroidx/camera/lifecycle/LifecycleCameraProvider;->Companion:Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;

    invoke-virtual {v0, p0, p1}, Landroidx/camera/lifecycle/LifecycleCameraProvider$Companion;->createInstanceAsync(Landroid/content/Context;Landroidx/camera/core/CameraXConfig;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 356
    return-object v0
.end method
