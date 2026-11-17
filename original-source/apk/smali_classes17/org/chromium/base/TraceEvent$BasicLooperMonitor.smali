.class Lorg/chromium/base/TraceEvent$BasicLooperMonitor;
.super Ljava/lang/Object;
.source "TraceEvent.java"

# interfaces
.implements Landroid/util/Printer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/TraceEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BasicLooperMonitor"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final FILTERED_EVENT_NAME:Ljava/lang/String; = "Looper.dispatch: EVENT_NAME_FILTERED"

.field static final LOOPER_TASK_PREFIX:Ljava/lang/String; = "Looper.dispatch: "

.field private static final SHORTEST_LOG_PREFIX_LENGTH:I


# instance fields
.field private mCurrentTarget:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    const-class v0, Lorg/chromium/base/TraceEvent;

    .line 56
    const-string v0, "<<<<< Finished to "

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->SHORTEST_LOG_PREFIX_LENGTH:I

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getTarget(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "logLine"    # Ljava/lang/String;

    .line 118
    const/16 v0, 0x28

    sget v1, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->SHORTEST_LOG_PREFIX_LENGTH:I

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 119
    .local v0, "start":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/16 v2, 0x29

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 120
    .local v2, "end":I
    :goto_0
    if-eq v2, v1, :cond_1

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    const-string v1, ""

    :goto_1
    return-object v1
.end method

.method private static getTargetName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "logLine"    # Ljava/lang/String;

    .line 125
    const/16 v0, 0x7d

    sget v1, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->SHORTEST_LOG_PREFIX_LENGTH:I

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 126
    .local v0, "start":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    const/16 v2, 0x3a

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 127
    .local v2, "end":I
    :goto_0
    if-ne v2, v1, :cond_1

    .line 128
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 130
    :cond_1
    if-eq v0, v1, :cond_2

    add-int/lit8 v1, v0, 0x2

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_2
    const-string v1, ""

    :goto_1
    return-object v1
.end method

.method static getTraceEventName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "line"    # Ljava/lang/String;

    .line 99
    invoke-static {}, Lorg/chromium/base/TraceEvent;->-$$Nest$sfgetsEventNameFilteringEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    const-string v0, "Looper.dispatch: EVENT_NAME_FILTERED"

    return-object v0

    .line 102
    :cond_0
    invoke-static {p0}, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->getTarget(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->getTargetName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Looper.dispatch: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method beginHandling(Ljava/lang/String;)V
    .locals 3
    .param p1, "line"    # Ljava/lang/String;

    .line 72
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    .line 73
    .local v0, "earlyTracingActive":Z
    invoke-static {}, Lorg/chromium/base/TraceEvent;->-$$Nest$sfgetsEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_2

    .line 76
    :cond_0
    invoke-static {p1}, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->getTraceEventName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->mCurrentTarget:Ljava/lang/String;

    .line 77
    invoke-static {}, Lorg/chromium/base/TraceEvent;->-$$Nest$sfgetsEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 78
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->mCurrentTarget:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/chromium/base/TraceEvent$Natives;->beginToplevel(Ljava/lang/String;)V

    goto :goto_0

    .line 80
    :cond_1
    iget-object v1, p0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->mCurrentTarget:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lorg/chromium/base/EarlyTraceEvent;->begin(Ljava/lang/String;Z)V

    .line 83
    :cond_2
    :goto_0
    return-void
.end method

.method endHandling(Ljava/lang/String;)V
    .locals 3
    .param p1, "line"    # Ljava/lang/String;

    .line 86
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    .line 87
    .local v0, "earlyTracingActive":Z
    invoke-static {}, Lorg/chromium/base/TraceEvent;->-$$Nest$sfgetsEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_2

    :cond_0
    iget-object v1, p0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->mCurrentTarget:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 88
    invoke-static {}, Lorg/chromium/base/TraceEvent;->-$$Nest$sfgetsEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 89
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v1

    iget-object v2, p0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->mCurrentTarget:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/chromium/base/TraceEvent$Natives;->endToplevel(Ljava/lang/String;)V

    goto :goto_0

    .line 91
    :cond_1
    iget-object v1, p0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->mCurrentTarget:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lorg/chromium/base/EarlyTraceEvent;->end(Ljava/lang/String;Z)V

    .line 94
    :cond_2
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->mCurrentTarget:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public println(Ljava/lang/String;)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;

    .line 61
    const-string v0, ">"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0, p1}, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->beginHandling(Ljava/lang/String;)V

    goto :goto_0

    .line 64
    :cond_0
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    invoke-virtual {p0, p1}, Lorg/chromium/base/TraceEvent$BasicLooperMonitor;->endHandling(Ljava/lang/String;)V

    .line 67
    :goto_0
    return-void

    .line 64
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
