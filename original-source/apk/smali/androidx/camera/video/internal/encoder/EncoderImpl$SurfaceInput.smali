.class Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;
.super Ljava/lang/Object;
.source "EncoderImpl.java"

# interfaces
.implements Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/internal/encoder/EncoderImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SurfaceInput"
.end annotation


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private final mObsoleteSurfaces:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation
.end field

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

.field private mSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

.field final synthetic this$0:Landroidx/camera/video/internal/encoder/EncoderImpl;


# direct methods
.method constructor <init>(Landroidx/camera/video/internal/encoder/EncoderImpl;)V
    .locals 1
    .param p1, "this$0"    # Landroidx/camera/video/internal/encoder/EncoderImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1639
    iput-object p1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->this$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1641
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mLock:Ljava/lang/Object;

    .line 1646
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mObsoleteSurfaces:Ljava/util/Set;

    return-void
.end method

.method static synthetic lambda$notifySurfaceUpdate$0(Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V
    .locals 0
    .param p0, "listener"    # Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;
    .param p1, "surface"    # Landroid/view/Surface;

    .line 1726
    invoke-interface {p0, p1}, Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;->onSurfaceUpdate(Landroid/view/Surface;)V

    return-void
.end method

.method private notifySurfaceUpdate(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V
    .locals 3
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;
    .param p3, "surface"    # Landroid/view/Surface;

    .line 1726
    :try_start_0
    new-instance v0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2, p3}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1729
    goto :goto_0

    .line 1727
    :catch_0
    move-exception v0

    .line 1728
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->this$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    iget-object v1, v1, Landroidx/camera/video/internal/encoder/EncoderImpl;->mTag:Ljava/lang/String;

    const-string v2, "Unable to post to the supplied executor."

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1730
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void
.end method


# virtual methods
.method releaseSurface()V
    .locals 4

    .line 1709
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1710
    :try_start_0
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    .line 1711
    .local v1, "surface":Landroid/view/Surface;
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    .line 1712
    new-instance v2, Ljava/util/HashSet;

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mObsoleteSurfaces:Ljava/util/Set;

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 1713
    .local v2, "obsoleteSurfaces":Ljava/util/Set;, "Ljava/util/Set<Landroid/view/Surface;>;"
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mObsoleteSurfaces:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    .line 1714
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1715
    if-eqz v1, :cond_0

    .line 1716
    invoke-virtual {v1}, Landroid/view/Surface;->release()V

    .line 1718
    :cond_0
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/Surface;

    .line 1719
    .local v3, "obsoleteSurface":Landroid/view/Surface;
    invoke-virtual {v3}, Landroid/view/Surface;->release()V

    .line 1720
    .end local v3    # "obsoleteSurface":Landroid/view/Surface;
    goto :goto_0

    .line 1721
    :cond_1
    return-void

    .line 1714
    .end local v1    # "surface":Landroid/view/Surface;
    .end local v2    # "obsoleteSurfaces":Ljava/util/Set;, "Ljava/util/Set<Landroid/view/Surface;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method resetSurface()V
    .locals 5

    .line 1680
    const-class v0, Landroidx/camera/video/internal/compat/quirk/EncoderNotUsePersistentInputSurfaceQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/compat/quirk/EncoderNotUsePersistentInputSurfaceQuirk;

    .line 1682
    .local v0, "quirk":Landroidx/camera/video/internal/compat/quirk/EncoderNotUsePersistentInputSurfaceQuirk;
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1683
    if-nez v0, :cond_1

    .line 1684
    :try_start_0
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    if-nez v2, :cond_0

    .line 1685
    invoke-static {}, Landroidx/camera/video/internal/encoder/EncoderImpl$Api23Impl;->createPersistentInputSurface()Landroid/view/Surface;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    .line 1686
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    .local v2, "surface":Landroid/view/Surface;
    goto :goto_0

    .line 1688
    .end local v2    # "surface":Landroid/view/Surface;
    :cond_0
    const/4 v2, 0x0

    .line 1690
    .restart local v2    # "surface":Landroid/view/Surface;
    :goto_0
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->this$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    iget-object v3, v3, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    invoke-static {v3, v4}, Landroidx/camera/video/internal/encoder/EncoderImpl$Api23Impl;->setInputSurface(Landroid/media/MediaCodec;Landroid/view/Surface;)V

    goto :goto_1

    .line 1692
    .end local v2    # "surface":Landroid/view/Surface;
    :cond_1
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    if-eqz v2, :cond_2

    .line 1693
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mObsoleteSurfaces:Ljava/util/Set;

    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1695
    :cond_2
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->this$0:Landroidx/camera/video/internal/encoder/EncoderImpl;

    iget-object v2, v2, Landroidx/camera/video/internal/encoder/EncoderImpl;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v2

    iput-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    .line 1696
    iget-object v2, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    .line 1698
    .restart local v2    # "surface":Landroid/view/Surface;
    :goto_1
    iget-object v3, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    .line 1699
    .local v3, "listener":Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;
    iget-object v4, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

    .line 1700
    .local v4, "executor":Ljava/util/concurrent/Executor;
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1701
    if-eqz v2, :cond_3

    if-eqz v3, :cond_3

    if-eqz v4, :cond_3

    .line 1702
    invoke-direct {p0, v4, v3, v2}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->notifySurfaceUpdate(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V

    .line 1704
    :cond_3
    return-void

    .line 1700
    .end local v2    # "surface":Landroid/view/Surface;
    .end local v3    # "listener":Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;
    .end local v4    # "executor":Ljava/util/concurrent/Executor;
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public setOnSurfaceUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    .line 1665
    iget-object v0, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1666
    :try_start_0
    invoke-static {p2}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurfaceUpdateListener:Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;

    .line 1667
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/Executor;

    iput-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurfaceUpdateExecutor:Ljava/util/concurrent/Executor;

    .line 1668
    iget-object v1, p0, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->mSurface:Landroid/view/Surface;

    .line 1669
    .local v1, "surface":Landroid/view/Surface;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1670
    if-eqz v1, :cond_0

    .line 1671
    invoke-direct {p0, p1, p2, v1}, Landroidx/camera/video/internal/encoder/EncoderImpl$SurfaceInput;->notifySurfaceUpdate(Ljava/util/concurrent/Executor;Landroidx/camera/video/internal/encoder/Encoder$SurfaceInput$OnSurfaceUpdateListener;Landroid/view/Surface;)V

    .line 1673
    :cond_0
    return-void

    .line 1669
    .end local v1    # "surface":Landroid/view/Surface;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
