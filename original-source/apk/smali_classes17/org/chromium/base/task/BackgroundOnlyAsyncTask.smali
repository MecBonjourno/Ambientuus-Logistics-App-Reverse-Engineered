.class public abstract Lorg/chromium/base/task/BackgroundOnlyAsyncTask;
.super Lorg/chromium/base/task/AsyncTask;
.source "BackgroundOnlyAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Result:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/chromium/base/task/AsyncTask<",
        "TResult;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    .local p0, "this":Lorg/chromium/base/task/BackgroundOnlyAsyncTask;, "Lorg/chromium/base/task/BackgroundOnlyAsyncTask<TResult;>;"
    invoke-direct {p0}, Lorg/chromium/base/task/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected final onPostExecute(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .line 19
    .local p0, "this":Lorg/chromium/base/task/BackgroundOnlyAsyncTask;, "Lorg/chromium/base/task/BackgroundOnlyAsyncTask<TResult;>;"
    .local p1, "result":Ljava/lang/Object;, "TResult;"
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
