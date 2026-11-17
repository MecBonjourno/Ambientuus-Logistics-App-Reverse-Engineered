.class public Lorg/chromium/base/lifetime/DestroyChecker;
.super Ljava/lang/Object;
.source "DestroyChecker.java"

# interfaces
.implements Lorg/chromium/base/lifetime/Destroyable;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mIsDestroyed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkNotDestroyed()V
    .locals 2

    .line 39
    iget-boolean v0, p0, Lorg/chromium/base/lifetime/DestroyChecker;->mIsDestroyed:Z

    if-nez v0, :cond_0

    .line 40
    return-void

    .line 39
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Object is already destroyed."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public destroy()V
    .locals 1

    .line 28
    invoke-virtual {p0}, Lorg/chromium/base/lifetime/DestroyChecker;->checkNotDestroyed()V

    .line 29
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/base/lifetime/DestroyChecker;->mIsDestroyed:Z

    .line 30
    return-void
.end method

.method public isDestroyed()Z
    .locals 1

    .line 34
    iget-boolean v0, p0, Lorg/chromium/base/lifetime/DestroyChecker;->mIsDestroyed:Z

    return v0
.end method
