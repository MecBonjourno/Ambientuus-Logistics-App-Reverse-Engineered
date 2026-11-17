.class final Lorg/chromium/base/EarlyTraceEvent$Event;
.super Ljava/lang/Object;
.source "EarlyTraceEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/EarlyTraceEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Event"
.end annotation


# instance fields
.field final mIsStart:Z

.field final mIsToplevel:Z

.field final mName:Ljava/lang/String;

.field final mThreadId:I

.field final mThreadTimeMillis:J

.field final mTimeNanos:J


# direct methods
.method constructor <init>(Ljava/lang/String;ZZ)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isStart"    # Z
    .param p3, "isToplevel"    # Z

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-boolean p2, p0, Lorg/chromium/base/EarlyTraceEvent$Event;->mIsStart:Z

    .line 55
    iput-boolean p3, p0, Lorg/chromium/base/EarlyTraceEvent$Event;->mIsToplevel:Z

    .line 56
    iput-object p1, p0, Lorg/chromium/base/EarlyTraceEvent$Event;->mName:Ljava/lang/String;

    .line 57
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v0

    iput v0, p0, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadId:I

    .line 58
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/chromium/base/EarlyTraceEvent$Event;->mTimeNanos:J

    .line 59
    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadTimeMillis:J

    .line 60
    return-void
.end method
