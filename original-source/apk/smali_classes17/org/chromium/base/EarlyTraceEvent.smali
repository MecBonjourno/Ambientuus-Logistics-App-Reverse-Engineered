.class public Lorg/chromium/base/EarlyTraceEvent;
.super Ljava/lang/Object;
.source "EarlyTraceEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/EarlyTraceEvent$Event;,
        Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;,
        Lorg/chromium/base/EarlyTraceEvent$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation

.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final BACKGROUND_STARTUP_TRACING_ENABLED_KEY:Ljava/lang/String; = "bg_startup_tracing"

.field static final STATE_DISABLED:I = 0x0

.field static final STATE_ENABLED:I = 0x1

.field static final STATE_FINISHED:I = 0x2

.field private static final TRACE_CONFIG_FILENAME:Ljava/lang/String; = "/data/local/chrome-trace-config.json"

.field public static final TRACE_EARLY_JAVA_IN_CHILD_SWITCH:Ljava/lang/String; = "trace-early-java-in-child"

.field private static final TRACE_STARTUP_SWITCH:Ljava/lang/String; = "trace-startup"

.field static sAsyncEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;",
            ">;"
        }
    .end annotation
.end field

.field private static sCachedBackgroundStartupTracingFlag:Z

.field private static volatile sEnabledInChildProcessBeforeCommandLine:Z

.field static sEvents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/base/EarlyTraceEvent$Event;",
            ">;"
        }
    .end annotation
.end field

.field static final sLock:Ljava/lang/Object;

.field static volatile sState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 40
    nop

    .line 86
    const/4 v0, 0x0

    sput v0, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    .line 114
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static begin(Ljava/lang/String;Z)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "isToplevel"    # Z

    .line 266
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 267
    :cond_0
    new-instance v0, Lorg/chromium/base/EarlyTraceEvent$Event;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1, p1}, Lorg/chromium/base/EarlyTraceEvent$Event;-><init>(Ljava/lang/String;ZZ)V

    .line 268
    .local v0, "event":Lorg/chromium/base/EarlyTraceEvent$Event;
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 269
    :try_start_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v2

    if-nez v2, :cond_1

    monitor-exit v1

    return-void

    .line 270
    :cond_1
    sget-object v2, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 271
    monitor-exit v1

    .line 272
    return-void

    .line 271
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method static disable()V
    .locals 2

    .line 206
    sget-object v0, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 207
    :try_start_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    .line 209
    :cond_0
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 210
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    invoke-static {v1}, Lorg/chromium/base/EarlyTraceEvent;->dumpEvents(Ljava/util/List;)V

    .line 211
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 213
    :cond_1
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 214
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    invoke-static {v1}, Lorg/chromium/base/EarlyTraceEvent;->dumpAsyncEvents(Ljava/util/List;)V

    .line 215
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 218
    :cond_2
    const/4 v1, 0x2

    sput v1, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    .line 219
    const/4 v1, 0x0

    sput-object v1, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    .line 220
    sput-object v1, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    .line 221
    monitor-exit v0

    .line 222
    return-void

    .line 221
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static dumpAsyncEvents(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;",
            ">;)V"
        }
    .end annotation

    .line 339
    .local p0, "events":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;

    .line 340
    .local v1, "e":Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;
    iget-boolean v2, v1, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;->mIsStart:Z

    if-eqz v2, :cond_0

    .line 341
    invoke-static {}, Lorg/chromium/base/EarlyTraceEventJni;->get()Lorg/chromium/base/EarlyTraceEvent$Natives;

    move-result-object v3

    iget-object v4, v1, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;->mName:Ljava/lang/String;

    iget-wide v5, v1, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;->mId:J

    iget-wide v7, v1, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;->mTimeNanos:J

    invoke-interface/range {v3 .. v8}, Lorg/chromium/base/EarlyTraceEvent$Natives;->recordEarlyAsyncBeginEvent(Ljava/lang/String;JJ)V

    goto :goto_1

    .line 343
    :cond_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEventJni;->get()Lorg/chromium/base/EarlyTraceEvent$Natives;

    move-result-object v2

    iget-wide v3, v1, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;->mId:J

    iget-wide v5, v1, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;->mTimeNanos:J

    invoke-interface {v2, v3, v4, v5, v6}, Lorg/chromium/base/EarlyTraceEvent$Natives;->recordEarlyAsyncEndEvent(JJ)V

    .line 345
    .end local v1    # "e":Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;
    :goto_1
    goto :goto_0

    .line 346
    :cond_1
    return-void
.end method

.method private static dumpEvents(Ljava/util/List;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/chromium/base/EarlyTraceEvent$Event;",
            ">;)V"
        }
    .end annotation

    .line 317
    .local p0, "events":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/EarlyTraceEvent$Event;>;"
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/EarlyTraceEvent$Event;

    .line 318
    .local v1, "e":Lorg/chromium/base/EarlyTraceEvent$Event;
    iget-boolean v2, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mIsStart:Z

    if-eqz v2, :cond_1

    .line 319
    iget-boolean v2, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mIsToplevel:Z

    if-eqz v2, :cond_0

    .line 320
    invoke-static {}, Lorg/chromium/base/EarlyTraceEventJni;->get()Lorg/chromium/base/EarlyTraceEvent$Natives;

    move-result-object v3

    iget-object v4, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mName:Ljava/lang/String;

    iget-wide v5, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mTimeNanos:J

    iget v7, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadId:I

    iget-wide v8, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadTimeMillis:J

    invoke-interface/range {v3 .. v9}, Lorg/chromium/base/EarlyTraceEvent$Natives;->recordEarlyToplevelBeginEvent(Ljava/lang/String;JIJ)V

    goto :goto_1

    .line 323
    :cond_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEventJni;->get()Lorg/chromium/base/EarlyTraceEvent$Natives;

    move-result-object v10

    iget-object v11, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mName:Ljava/lang/String;

    iget-wide v12, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mTimeNanos:J

    iget v14, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadId:I

    iget-wide v2, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadTimeMillis:J

    move-wide v15, v2

    invoke-interface/range {v10 .. v16}, Lorg/chromium/base/EarlyTraceEvent$Natives;->recordEarlyBeginEvent(Ljava/lang/String;JIJ)V

    goto :goto_1

    .line 327
    :cond_1
    iget-boolean v2, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mIsToplevel:Z

    if-eqz v2, :cond_2

    .line 328
    invoke-static {}, Lorg/chromium/base/EarlyTraceEventJni;->get()Lorg/chromium/base/EarlyTraceEvent$Natives;

    move-result-object v3

    iget-object v4, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mName:Ljava/lang/String;

    iget-wide v5, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mTimeNanos:J

    iget v7, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadId:I

    iget-wide v8, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadTimeMillis:J

    invoke-interface/range {v3 .. v9}, Lorg/chromium/base/EarlyTraceEvent$Natives;->recordEarlyToplevelEndEvent(Ljava/lang/String;JIJ)V

    goto :goto_1

    .line 331
    :cond_2
    invoke-static {}, Lorg/chromium/base/EarlyTraceEventJni;->get()Lorg/chromium/base/EarlyTraceEvent$Natives;

    move-result-object v10

    iget-object v11, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mName:Ljava/lang/String;

    iget-wide v12, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mTimeNanos:J

    iget v14, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadId:I

    iget-wide v2, v1, Lorg/chromium/base/EarlyTraceEvent$Event;->mThreadTimeMillis:J

    move-wide v15, v2

    invoke-interface/range {v10 .. v16}, Lorg/chromium/base/EarlyTraceEvent$Natives;->recordEarlyEndEvent(Ljava/lang/String;JIJ)V

    .line 335
    .end local v1    # "e":Lorg/chromium/base/EarlyTraceEvent$Event;
    :goto_1
    goto :goto_0

    .line 336
    :cond_3
    return-void
.end method

.method public static earlyEnableInChildWithoutCommandLine()V
    .locals 1

    .line 165
    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/base/EarlyTraceEvent;->sEnabledInChildProcessBeforeCommandLine:Z

    .line 166
    sget v0, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    if-nez v0, :cond_0

    .line 167
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enable()V

    .line 168
    return-void

    .line 166
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method static enable()V
    .locals 2

    .line 192
    sget-object v0, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 193
    :try_start_0
    sget v1, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    .line 194
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    .line 195
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    .line 196
    const/4 v1, 0x1

    sput v1, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    .line 197
    monitor-exit v0

    .line 198
    return-void

    .line 197
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static enabled()Z
    .locals 2

    .line 237
    sget v0, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static end(Ljava/lang/String;Z)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "isToplevel"    # Z

    .line 276
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 277
    :cond_0
    new-instance v0, Lorg/chromium/base/EarlyTraceEvent$Event;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lorg/chromium/base/EarlyTraceEvent$Event;-><init>(Ljava/lang/String;ZZ)V

    .line 278
    .local v0, "event":Lorg/chromium/base/EarlyTraceEvent$Event;
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 279
    :try_start_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v2

    if-nez v2, :cond_1

    monitor-exit v1

    return-void

    .line 280
    :cond_1
    sget-object v2, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    monitor-exit v1

    .line 282
    return-void

    .line 281
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static finishAsync(Ljava/lang/String;J)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "id"    # J

    .line 296
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 297
    :cond_0
    new-instance v0, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;-><init>(Ljava/lang/String;JZ)V

    .line 298
    .local v0, "event":Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 299
    :try_start_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v2

    if-nez v2, :cond_1

    monitor-exit v1

    return-void

    .line 300
    :cond_1
    sget-object v2, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    monitor-exit v1

    .line 302
    return-void

    .line 301
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public static getBackgroundStartupTracingFlag()Z
    .locals 1

    .line 259
    sget-boolean v0, Lorg/chromium/base/EarlyTraceEvent;->sCachedBackgroundStartupTracingFlag:Z

    return v0
.end method

.method static getMatchingCompletedEventsForTesting(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p0, "eventName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/chromium/base/EarlyTraceEvent$Event;",
            ">;"
        }
    .end annotation

    .line 305
    sget-object v0, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 306
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .local v1, "matchingEvents":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/EarlyTraceEvent$Event;>;"
    sget-object v2, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/chromium/base/EarlyTraceEvent$Event;

    .line 308
    .local v3, "evt":Lorg/chromium/base/EarlyTraceEvent$Event;
    iget-object v4, v3, Lorg/chromium/base/EarlyTraceEvent$Event;->mName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 309
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    .end local v3    # "evt":Lorg/chromium/base/EarlyTraceEvent$Event;
    :cond_0
    goto :goto_0

    .line 312
    :cond_1
    monitor-exit v0

    return-object v1

    .line 313
    .end local v1    # "matchingEvents":Ljava/util/List;, "Ljava/util/List<Lorg/chromium/base/EarlyTraceEvent$Event;>;"
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static maybeEnableInBrowserProcess()V
    .locals 5

    .line 126
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 127
    sget-boolean v0, Lorg/chromium/base/EarlyTraceEvent;->sEnabledInChildProcessBeforeCommandLine:Z

    if-nez v0, :cond_5

    .line 129
    sget v0, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    if-eqz v0, :cond_0

    return-void

    .line 130
    :cond_0
    const/4 v0, 0x0

    .line 132
    .local v0, "shouldEnable":Z
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 134
    .local v1, "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    :try_start_0
    invoke-static {}, Lorg/chromium/base/CommandLine;->getInstance()Lorg/chromium/base/CommandLine;

    move-result-object v2

    const-string v3, "trace-startup"

    invoke-virtual {v2, v3}, Lorg/chromium/base/CommandLine;->hasSwitch(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    .line 135
    const/4 v0, 0x1

    goto :goto_0

    .line 138
    :cond_1
    :try_start_1
    new-instance v2, Ljava/io/File;

    const-string v3, "/data/local/chrome-trace-config.json"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v0, v2

    .line 141
    goto :goto_0

    .line 139
    :catch_0
    move-exception v2

    .line 143
    :goto_0
    :try_start_2
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getAppSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "bg_startup_tracing"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 145
    if-eqz v0, :cond_2

    .line 148
    invoke-static {v4}, Lorg/chromium/base/EarlyTraceEvent;->setBackgroundStartupTracingFlag(Z)V

    .line 149
    sput-boolean v4, Lorg/chromium/base/EarlyTraceEvent;->sCachedBackgroundStartupTracingFlag:Z

    goto :goto_1

    .line 151
    :cond_2
    const/4 v2, 0x1

    sput-boolean v2, Lorg/chromium/base/EarlyTraceEvent;->sCachedBackgroundStartupTracingFlag:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    const/4 v0, 0x1

    .line 156
    :cond_3
    :goto_1
    invoke-static {v1}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 157
    nop

    .line 158
    if-eqz v0, :cond_4

    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enable()V

    .line 159
    :cond_4
    return-void

    .line 156
    :catchall_0
    move-exception v2

    invoke-static {v1}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 157
    throw v2

    .line 127
    .end local v0    # "shouldEnable":Z
    .end local v1    # "oldPolicy":Landroid/os/StrictMode$ThreadPolicy;
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Should not have been initialized in a child process"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static onCommandLineAvailableInChildProcess()V
    .locals 3

    .line 178
    sget-boolean v0, Lorg/chromium/base/EarlyTraceEvent;->sEnabledInChildProcessBeforeCommandLine:Z

    if-nez v0, :cond_0

    return-void

    .line 179
    :cond_0
    sget-object v0, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 182
    :try_start_0
    invoke-static {}, Lorg/chromium/base/CommandLine;->getInstance()Lorg/chromium/base/CommandLine;

    move-result-object v1

    const-string v2, "trace-early-java-in-child"

    invoke-virtual {v1, v2}, Lorg/chromium/base/CommandLine;->hasSwitch(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 183
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->reset()V

    .line 184
    monitor-exit v0

    return-void

    .line 187
    :cond_1
    sget v1, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    if-nez v1, :cond_2

    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enable()V

    .line 188
    :cond_2
    monitor-exit v0

    .line 189
    return-void

    .line 188
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static reset()V
    .locals 2

    .line 229
    sget-object v0, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 230
    const/4 v1, 0x0

    :try_start_0
    sput v1, Lorg/chromium/base/EarlyTraceEvent;->sState:I

    .line 231
    const/4 v1, 0x0

    sput-object v1, Lorg/chromium/base/EarlyTraceEvent;->sEvents:Ljava/util/List;

    .line 232
    sput-object v1, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    .line 233
    monitor-exit v0

    .line 234
    return-void

    .line 233
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method static setBackgroundStartupTracingFlag(Z)V
    .locals 2
    .param p0, "enabled"    # Z

    .line 245
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getAppSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    .line 246
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 247
    const-string v1, "bg_startup_tracing"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 248
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 249
    return-void
.end method

.method public static startAsync(Ljava/lang/String;J)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "id"    # J

    .line 286
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 287
    :cond_0
    new-instance v0, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, p2, v1}, Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;-><init>(Ljava/lang/String;JZ)V

    .line 288
    .local v0, "event":Lorg/chromium/base/EarlyTraceEvent$AsyncEvent;
    sget-object v1, Lorg/chromium/base/EarlyTraceEvent;->sLock:Ljava/lang/Object;

    monitor-enter v1

    .line 289
    :try_start_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v2

    if-nez v2, :cond_1

    monitor-exit v1

    return-void

    .line 290
    :cond_1
    sget-object v2, Lorg/chromium/base/EarlyTraceEvent;->sAsyncEvents:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 291
    monitor-exit v1

    .line 292
    return-void

    .line 291
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
