.class public Lorg/chromium/base/TraceEvent;
.super Ljava/lang/Object;
.source "TraceEvent.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/TraceEvent$LooperMonitorHolder;,
        Lorg/chromium/base/TraceEvent$BasicLooperMonitor;,
        Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;,
        Lorg/chromium/base/TraceEvent$Natives;,
        Lorg/chromium/base/TraceEvent$ActivityInfo;,
        Lorg/chromium/base/TraceEvent$ViewInfo;,
        Lorg/chromium/base/TraceEvent$IdleTracingLooperMonitor;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation

.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field private static volatile sEnabled:Z

.field private static sEventNameFilteringEnabled:Z

.field private static volatile sUiThreadReady:Z


# instance fields
.field private final mName:Ljava/lang/String;


# direct methods
.method static bridge synthetic -$$Nest$sfgetsEnabled()Z
    .locals 1

    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    return v0
.end method

.method static bridge synthetic -$$Nest$sfgetsEventNameFilteringEnabled()Z
    .locals 1

    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEventNameFilteringEnabled:Z

    return v0
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg"    # I

    .line 267
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 268
    iput-object p1, p0, Lorg/chromium/base/TraceEvent;->mName:Ljava/lang/String;

    .line 269
    invoke-static {p1, p2}, Lorg/chromium/base/TraceEvent;->begin(Ljava/lang/String;I)V

    .line 270
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;

    .line 259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 260
    iput-object p1, p0, Lorg/chromium/base/TraceEvent;->mName:Ljava/lang/String;

    .line 261
    invoke-static {p1, p2}, Lorg/chromium/base/TraceEvent;->begin(Ljava/lang/String;Ljava/lang/String;)V

    .line 262
    return-void
.end method

.method public static begin(Ljava/lang/String;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 510
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/TraceEvent;->begin(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    return-void
.end method

.method public static begin(Ljava/lang/String;I)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # I

    .line 531
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/EarlyTraceEvent;->begin(Ljava/lang/String;Z)V

    .line 532
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 533
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/TraceEvent$Natives;->beginWithIntArg(Ljava/lang/String;I)V

    .line 535
    :cond_0
    return-void
.end method

.method public static begin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .line 519
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/EarlyTraceEvent;->begin(Ljava/lang/String;Z)V

    .line 520
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 521
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/TraceEvent$Natives;->begin(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    :cond_0
    return-void
.end method

.method public static dumpViewHierarchy(JLjava/lang/Object;)V
    .locals 17
    .param p0, "dumpProtoPtr"    # J
    .param p2, "list"    # Ljava/lang/Object;

    .line 611
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 612
    return-void

    .line 617
    :cond_0
    move-object/from16 v1, p2

    check-cast v1, Ljava/util/ArrayList;

    .line 619
    .local v1, "activities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/chromium/base/TraceEvent$ActivityInfo;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lorg/chromium/base/TraceEvent$ActivityInfo;

    .line 621
    .local v3, "activity":Lorg/chromium/base/TraceEvent$ActivityInfo;
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    iget-object v4, v3, Lorg/chromium/base/TraceEvent$ActivityInfo;->mActivityName:Ljava/lang/String;

    move-wide/from16 v5, p0

    invoke-interface {v0, v4, v5, v6}, Lorg/chromium/base/TraceEvent$Natives;->startActivityDump(Ljava/lang/String;J)J

    move-result-wide v14

    .line 622
    .local v14, "activityProtoPtr":J
    iget-object v0, v3, Lorg/chromium/base/TraceEvent$ActivityInfo;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v16, v0

    check-cast v16, Lorg/chromium/base/TraceEvent$ViewInfo;

    .line 627
    .local v16, "view":Lorg/chromium/base/TraceEvent$ViewInfo;
    :try_start_0
    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmRes(Lorg/chromium/base/TraceEvent$ViewInfo;)Landroid/content/res/Resources;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmId(Lorg/chromium/base/TraceEvent$ViewInfo;)I

    move-result v0

    if-eqz v0, :cond_2

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmId(Lorg/chromium/base/TraceEvent$ViewInfo;)I

    move-result v0

    const/4 v7, -0x1

    if-ne v0, v7, :cond_1

    goto :goto_2

    .line 629
    :cond_1
    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmRes(Lorg/chromium/base/TraceEvent$ViewInfo;)Landroid/content/res/Resources;

    move-result-object v0

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmId(Lorg/chromium/base/TraceEvent$ViewInfo;)I

    move-result v7

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 628
    :cond_2
    :goto_2
    const-string v0, "__no_id__"

    goto :goto_3

    .line 630
    :cond_3
    const-string v0, "__no_resources__"
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_3
    nop

    .line 633
    .local v0, "resource":Ljava/lang/String;
    move-object v13, v0

    goto :goto_4

    .line 631
    .end local v0    # "resource":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 632
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    const-string v7, "__name_not_found__"

    move-object v13, v7

    .line 634
    .end local v0    # "e":Landroid/content/res/Resources$NotFoundException;
    .local v13, "resource":Ljava/lang/String;
    :goto_4
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v7

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmId(Lorg/chromium/base/TraceEvent$ViewInfo;)I

    move-result v8

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmParentId(Lorg/chromium/base/TraceEvent$ViewInfo;)I

    move-result v9

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmIsShown(Lorg/chromium/base/TraceEvent$ViewInfo;)Z

    move-result v10

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmIsDirty(Lorg/chromium/base/TraceEvent$ViewInfo;)Z

    move-result v11

    invoke-static/range {v16 .. v16}, Lorg/chromium/base/TraceEvent$ViewInfo;->-$$Nest$fgetmClassName(Lorg/chromium/base/TraceEvent$ViewInfo;)Ljava/lang/String;

    move-result-object v12

    invoke-interface/range {v7 .. v15}, Lorg/chromium/base/TraceEvent$Natives;->addViewDump(IIZZLjava/lang/String;Ljava/lang/String;J)V

    .line 636
    .end local v13    # "resource":Ljava/lang/String;
    .end local v16    # "view":Lorg/chromium/base/TraceEvent$ViewInfo;
    goto :goto_1

    .line 637
    .end local v3    # "activity":Lorg/chromium/base/TraceEvent$ActivityInfo;
    .end local v14    # "activityProtoPtr":J
    :cond_4
    goto :goto_0

    .line 638
    :cond_5
    move-wide/from16 v5, p0

    return-void
.end method

.method public static enabled()Z
    .locals 1

    .line 375
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    return v0
.end method

.method public static end(Ljava/lang/String;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 542
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/TraceEvent;->end(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    return-void
.end method

.method public static end(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .line 551
    const-wide/16 v0, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/chromium/base/TraceEvent;->end(Ljava/lang/String;Ljava/lang/String;J)V

    .line 552
    return-void
.end method

.method public static end(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;
    .param p2, "flow"    # J

    .line 561
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/EarlyTraceEvent;->end(Ljava/lang/String;Z)V

    .line 562
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 563
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2, p3}, Lorg/chromium/base/TraceEvent$Natives;->end(Ljava/lang/String;Ljava/lang/String;J)V

    .line 565
    :cond_0
    return-void
.end method

.method public static eventNameFilteringEnabled()Z
    .locals 1

    .line 336
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEventNameFilteringEnabled:Z

    return v0
.end method

.method public static finishAsync(Ljava/lang/String;J)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "id"    # J

    .line 499
    invoke-static {p0, p1, p2}, Lorg/chromium/base/EarlyTraceEvent;->finishAsync(Ljava/lang/String;J)V

    .line 500
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 501
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lorg/chromium/base/TraceEvent$Natives;->finishAsync(Ljava/lang/String;J)V

    .line 503
    :cond_0
    return-void
.end method

.method public static instant(Ljava/lang/String;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .line 383
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Lorg/chromium/base/TraceEvent$Natives;->instant(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    :cond_0
    return-void
.end method

.method public static instant(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .line 392
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/TraceEvent$Natives;->instant(Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    :cond_0
    return-void
.end method

.method public static instantAndroidIPC(Ljava/lang/String;J)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "durMs"    # J

    .line 401
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lorg/chromium/base/TraceEvent$Natives;->instantAndroidIPC(Ljava/lang/String;J)V

    .line 402
    :cond_0
    return-void
.end method

.method public static instantAndroidToolbar(III)V
    .locals 1
    .param p0, "blockReason"    # I
    .param p1, "allowReason"    # I
    .param p2, "snapshotDiff"    # I

    .line 411
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 412
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lorg/chromium/base/TraceEvent$Natives;->instantAndroidToolbar(III)V

    .line 414
    :cond_0
    return-void
.end method

.method static synthetic lambda$snapshotViewHierarchy$0(JLjava/util/ArrayList;)V
    .locals 1
    .param p0, "flow"    # J
    .param p2, "views"    # Ljava/util/ArrayList;

    .line 475
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lorg/chromium/base/TraceEvent$Natives;->initViewHierarchyDump(JLjava/lang/Object;)V

    .line 476
    return-void
.end method

.method public static maybeEnableEarlyTracing(Z)V
    .locals 2
    .param p0, "readCommandLine"    # Z

    .line 349
    if-eqz p0, :cond_0

    .line 350
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->maybeEnableInBrowserProcess()V

    .line 352
    :cond_0
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 353
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->getUiThreadLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Lorg/chromium/base/TraceEvent$LooperMonitorHolder;->-$$Nest$sfgetsInstance()Lorg/chromium/base/TraceEvent$BasicLooperMonitor;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Looper;->setMessageLogging(Landroid/util/Printer;)V

    .line 355
    :cond_1
    return-void
.end method

.method public static onNativeTracingReady()V
    .locals 1

    .line 358
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/base/TraceEvent$Natives;->registerEnabledObserver()V

    .line 359
    return-void
.end method

.method static onUiThreadReady()V
    .locals 1

    .line 363
    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/base/TraceEvent;->sUiThreadReady:Z

    .line 364
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 365
    invoke-static {}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->updateEnabledState()V

    .line 367
    :cond_0
    return-void
.end method

.method public static scoped(Ljava/lang/String;)Lorg/chromium/base/TraceEvent;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 309
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/chromium/base/TraceEvent;->scoped(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;

    move-result-object v0

    return-object v0
.end method

.method public static scoped(Ljava/lang/String;I)Lorg/chromium/base/TraceEvent;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # I

    .line 301
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/chromium/base/TraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 302
    :cond_0
    new-instance v0, Lorg/chromium/base/TraceEvent;

    invoke-direct {v0, p0, p1}, Lorg/chromium/base/TraceEvent;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method

.method public static scoped(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/base/TraceEvent;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .line 287
    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lorg/chromium/base/TraceEvent;->enabled()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 288
    :cond_0
    new-instance v0, Lorg/chromium/base/TraceEvent;

    invoke-direct {v0, p0, p1}, Lorg/chromium/base/TraceEvent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static setEnabled(Z)V
    .locals 2
    .param p0, "enabled"    # Z

    .line 317
    if-eqz p0, :cond_0

    invoke-static {}, Lorg/chromium/base/EarlyTraceEvent;->disable()V

    .line 320
    :cond_0
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eq v0, p0, :cond_2

    .line 321
    sput-boolean p0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    .line 322
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->getUiThreadLooper()Landroid/os/Looper;

    move-result-object v0

    .line 323
    if-eqz p0, :cond_1

    invoke-static {}, Lorg/chromium/base/TraceEvent$LooperMonitorHolder;->-$$Nest$sfgetsInstance()Lorg/chromium/base/TraceEvent$BasicLooperMonitor;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 322
    :goto_0
    invoke-virtual {v0, v1}, Landroid/os/Looper;->setMessageLogging(Landroid/util/Printer;)V

    .line 325
    :cond_2
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sUiThreadReady:Z

    if-eqz v0, :cond_3

    .line 326
    invoke-static {}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->updateEnabledState()V

    .line 328
    :cond_3
    return-void
.end method

.method public static setEventNameFilteringEnabled(Z)V
    .locals 0
    .param p0, "enabled"    # Z

    .line 332
    sput-boolean p0, Lorg/chromium/base/TraceEvent;->sEventNameFilteringEnabled:Z

    .line 333
    return-void
.end method

.method public static snapshotViewHierarchy()V
    .locals 6

    .line 456
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/base/TraceEvent$Natives;->viewHierarchyDumpEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 458
    const-string v0, "instantAndroidViewHierarchy"

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->begin(Ljava/lang/String;)V

    .line 461
    invoke-static {}, Lorg/chromium/base/TraceEvent;->snapshotViewHierarchyState()Ljava/util/ArrayList;

    move-result-object v1

    .line 462
    .local v1, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/chromium/base/TraceEvent$ActivityInfo;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 463
    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->end(Ljava/lang/String;)V

    .line 464
    return-void

    .line 471
    :cond_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->hashCode()I

    move-result v2

    int-to-long v2, v2

    .line 473
    .local v2, "flow":J
    new-instance v4, Lorg/chromium/base/TraceEvent$$ExternalSyntheticLambda0;

    invoke-direct {v4, v2, v3, v1}, Lorg/chromium/base/TraceEvent$$ExternalSyntheticLambda0;-><init>(JLjava/util/ArrayList;)V

    const/4 v5, 0x0

    invoke-static {v5, v4}, Lorg/chromium/base/task/PostTask;->postTask(ILjava/lang/Runnable;)V

    .line 477
    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v3}, Lorg/chromium/base/TraceEvent;->end(Ljava/lang/String;Ljava/lang/String;J)V

    .line 479
    .end local v1    # "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/chromium/base/TraceEvent$ActivityInfo;>;"
    .end local v2    # "flow":J
    :cond_1
    return-void
.end method

.method public static snapshotViewHierarchyState()Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lorg/chromium/base/TraceEvent$ActivityInfo;",
            ">;"
        }
    .end annotation

    .line 568
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 569
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0

    .line 573
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 574
    .local v0, "views":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/chromium/base/TraceEvent$ActivityInfo;>;"
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->getRunningActivities()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 575
    .local v2, "a":Landroid/app/Activity;
    new-instance v3, Lorg/chromium/base/TraceEvent$ActivityInfo;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/chromium/base/TraceEvent$ActivityInfo;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 576
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/chromium/base/TraceEvent$ActivityInfo;

    .line 577
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v4

    .line 576
    const/4 v5, 0x0

    invoke-static {v3, v5, v4}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->-$$Nest$smdumpView(Lorg/chromium/base/TraceEvent$ActivityInfo;ILandroid/view/View;)V

    .line 578
    .end local v2    # "a":Landroid/app/Activity;
    goto :goto_0

    .line 579
    :cond_1
    return-object v0
.end method

.method public static startAsync(Ljava/lang/String;J)V
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "id"    # J

    .line 487
    invoke-static {p0, p1, p2}, Lorg/chromium/base/EarlyTraceEvent;->startAsync(Ljava/lang/String;J)V

    .line 488
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 489
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, Lorg/chromium/base/TraceEvent$Natives;->startAsync(Ljava/lang/String;J)V

    .line 491
    :cond_0
    return-void
.end method

.method public static webViewStartupStage1(JJ)V
    .locals 1
    .param p0, "startTimeMs"    # J
    .param p2, "durationMs"    # J

    .line 433
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 434
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2, p3}, Lorg/chromium/base/TraceEvent$Natives;->webViewStartupStage1(JJ)V

    .line 436
    :cond_0
    return-void
.end method

.method public static webViewStartupStage2(JJZ)V
    .locals 7
    .param p0, "startTimeMs"    # J
    .param p2, "durationMs"    # J
    .param p4, "isColdStartup"    # Z

    .line 446
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 447
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v1

    move-wide v2, p0

    move-wide v4, p2

    move v6, p4

    .end local p0    # "startTimeMs":J
    .end local p2    # "durationMs":J
    .end local p4    # "isColdStartup":Z
    .local v2, "startTimeMs":J
    .local v4, "durationMs":J
    .local v6, "isColdStartup":Z
    invoke-interface/range {v1 .. v6}, Lorg/chromium/base/TraceEvent$Natives;->webViewStartupStage2(JJZ)V

    goto :goto_0

    .line 446
    .end local v2    # "startTimeMs":J
    .end local v4    # "durationMs":J
    .end local v6    # "isColdStartup":Z
    .restart local p0    # "startTimeMs":J
    .restart local p2    # "durationMs":J
    .restart local p4    # "isColdStartup":Z
    :cond_0
    move-wide v2, p0

    move-wide v4, p2

    move v6, p4

    .line 449
    .end local p0    # "startTimeMs":J
    .end local p2    # "durationMs":J
    .end local p4    # "isColdStartup":Z
    .restart local v2    # "startTimeMs":J
    .restart local v4    # "durationMs":J
    .restart local v6    # "isColdStartup":Z
    :goto_0
    return-void
.end method

.method public static webViewStartupTotalFactoryInit(JJ)V
    .locals 1
    .param p0, "startTimeMs"    # J
    .param p2, "durationMs"    # J

    .line 422
    sget-boolean v0, Lorg/chromium/base/TraceEvent;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 423
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2, p3}, Lorg/chromium/base/TraceEvent$Natives;->webViewStartupTotalFactoryInit(JJ)V

    .line 425
    :cond_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 274
    iget-object v0, p0, Lorg/chromium/base/TraceEvent;->mName:Ljava/lang/String;

    invoke-static {v0}, Lorg/chromium/base/TraceEvent;->end(Ljava/lang/String;)V

    .line 275
    return-void
.end method
