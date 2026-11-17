.class final Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;
.super Ljava/lang/Object;
.source "TraceEvent.java"

# interfaces
.implements Landroid/os/MessageQueue$IdleHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/TraceEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ViewHierarchyDumper"
.end annotation


# static fields
.field private static final EVENT_NAME:Ljava/lang/String; = "TraceEvent.ViewHierarchyDumper"

.field private static final MIN_VIEW_DUMP_INTERVAL_MILLIS:J = 0x3e8L

.field private static sEnabled:Z

.field private static sInstance:Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;


# instance fields
.field private mLastDumpTs:J


# direct methods
.method static bridge synthetic -$$Nest$smdumpView(Lorg/chromium/base/TraceEvent$ActivityInfo;ILandroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->dumpView(Lorg/chromium/base/TraceEvent$ActivityInfo;ILandroid/view/View;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 699
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static disable()V
    .locals 2

    .line 756
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 757
    sget-boolean v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sEnabled:Z

    if-eqz v0, :cond_0

    .line 758
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    sget-object v1, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sInstance:Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;

    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->removeIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 759
    const/4 v0, 0x0

    sput-boolean v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sEnabled:Z

    .line 761
    :cond_0
    return-void
.end method

.method private static dumpView(Lorg/chromium/base/TraceEvent$ActivityInfo;ILandroid/view/View;)V
    .locals 8
    .param p0, "collection"    # Lorg/chromium/base/TraceEvent$ActivityInfo;
    .param p1, "parentId"    # I
    .param p2, "v"    # Landroid/view/View;

    .line 734
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 735
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    .line 736
    .local v1, "id":I
    iget-object v7, p0, Lorg/chromium/base/TraceEvent$ActivityInfo;->mViews:Ljava/util/ArrayList;

    new-instance v0, Lorg/chromium/base/TraceEvent$ViewInfo;

    invoke-virtual {p2}, Landroid/view/View;->isShown()Z

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->isDirty()Z

    move-result v4

    .line 737
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    move v2, p1

    .end local p1    # "parentId":I
    .local v2, "parentId":I
    invoke-direct/range {v0 .. v6}, Lorg/chromium/base/TraceEvent$ViewInfo;-><init>(IIZZLjava/lang/String;Landroid/content/res/Resources;)V

    .line 736
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 739
    instance-of p1, p2, Landroid/view/ViewGroup;

    if-eqz p1, :cond_0

    .line 740
    move-object p1, p2

    check-cast p1, Landroid/view/ViewGroup;

    .line 741
    .local p1, "vg":Landroid/view/ViewGroup;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 742
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {p0, v1, v3}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->dumpView(Lorg/chromium/base/TraceEvent$ActivityInfo;ILandroid/view/View;)V

    .line 741
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 745
    .end local v0    # "i":I
    .end local p1    # "vg":Landroid/view/ViewGroup;
    :cond_0
    return-void
.end method

.method private static enable()V
    .locals 2

    .line 748
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 749
    sget-boolean v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sEnabled:Z

    if-nez v0, :cond_0

    .line 750
    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    sget-object v1, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sInstance:Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;

    invoke-virtual {v0, v1}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    .line 751
    const/4 v0, 0x1

    sput-boolean v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sEnabled:Z

    .line 753
    :cond_0
    return-void
.end method

.method static synthetic lambda$updateEnabledState$0()V
    .locals 1

    .line 720
    invoke-static {}, Lorg/chromium/base/TraceEventJni;->get()Lorg/chromium/base/TraceEvent$Natives;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/base/TraceEvent$Natives;->viewHierarchyDumpEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 721
    sget-object v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sInstance:Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;

    if-nez v0, :cond_0

    .line 722
    new-instance v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;

    invoke-direct {v0}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;-><init>()V

    sput-object v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sInstance:Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;

    .line 724
    :cond_0
    invoke-static {}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->enable()V

    goto :goto_0

    .line 726
    :cond_1
    sget-object v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->sInstance:Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;

    if-eqz v0, :cond_2

    .line 727
    invoke-static {}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->disable()V

    .line 730
    :cond_2
    :goto_0
    return-void
.end method

.method public static updateEnabledState()V
    .locals 2

    .line 719
    new-instance v0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper$$ExternalSyntheticLambda0;-><init>()V

    const/4 v1, 0x7

    invoke-static {v1, v0}, Lorg/chromium/base/task/PostTask;->runOrPostTask(ILjava/lang/Runnable;)V

    .line 731
    return-void
.end method


# virtual methods
.method public final queueIdle()Z
    .locals 6

    .line 708
    invoke-static {}, Lorg/chromium/base/TimeUtils;->elapsedRealtimeMillis()J

    move-result-wide v0

    .line 709
    .local v0, "now":J
    iget-wide v2, p0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->mLastDumpTs:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->mLastDumpTs:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 710
    :cond_0
    iput-wide v0, p0, Lorg/chromium/base/TraceEvent$ViewHierarchyDumper;->mLastDumpTs:J

    .line 711
    invoke-static {}, Lorg/chromium/base/TraceEvent;->snapshotViewHierarchy()V

    .line 715
    :cond_1
    const/4 v2, 0x1

    return v2
.end method
