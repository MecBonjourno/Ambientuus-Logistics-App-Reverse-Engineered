.class public abstract Lorg/chromium/net/NetworkQualityThroughputListener;
.super Ljava/lang/Object;
.source "NetworkQualityThroughputListener.java"


# instance fields
.field private final mExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    if-eqz p1, :cond_0

    .line 26
    iput-object p1, p0, Lorg/chromium/net/NetworkQualityThroughputListener;->mExecutor:Ljava/util/concurrent/Executor;

    .line 27
    return-void

    .line 24
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Executor must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 30
    iget-object v0, p0, Lorg/chromium/net/NetworkQualityThroughputListener;->mExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public abstract onThroughputObservation(IJI)V
.end method
