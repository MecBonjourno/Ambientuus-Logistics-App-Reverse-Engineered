.class public Lorg/chromium/base/ThreadUtils$ThreadChecker;
.super Ljava/lang/Object;
.source "ThreadUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/ThreadUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThreadChecker"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final mThreadId:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 64
    const-class v0, Lorg/chromium/base/ThreadUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p0, Lorg/chromium/base/ThreadUtils$ThreadChecker;->mThreadId:J

    return-void
.end method


# virtual methods
.method public assertOnValidThread()V
    .locals 4

    .line 72
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->-$$Nest$sfgetsThreadAssertsDisabledForTesting()Z

    move-result v0

    if-nez v0, :cond_1

    iget-wide v0, p0, Lorg/chromium/base/ThreadUtils$ThreadChecker;->mThreadId:J

    .line 73
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto :goto_0

    .line 72
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Must only be used on a single thread."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 74
    :cond_1
    :goto_0
    return-void
.end method
