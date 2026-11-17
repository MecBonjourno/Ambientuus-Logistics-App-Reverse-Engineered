.class public Lorg/chromium/base/ApplicationStatus;
.super Ljava/lang/Object;
.source "ApplicationStatus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;,
        Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;,
        Lorg/chromium/base/ApplicationStatus$ActivityInfo;,
        Lorg/chromium/base/ApplicationStatus$ActivityStateListener;,
        Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;,
        Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;,
        Lorg/chromium/base/ApplicationStatus$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final CACHE_ACTIVITY_TASKID_KEY:Ljava/lang/String; = "cache_activity_taskid_enabled"

.field private static final TOOLBAR_CALLBACK_WRAPPER_CLASS:Ljava/lang/String; = "androidx.appcompat.app.ToolbarActionBar$ToolbarCallbackWrapper"

.field private static sActivity:Landroid/app/Activity;

.field private static final sActivityInfo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Lorg/chromium/base/ApplicationStatus$ActivityInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final sActivityTaskId:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static sApplicationStateListeners:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;",
            ">;"
        }
    .end annotation
.end field

.field private static sCurrentApplicationState:I

.field private static sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/base/ApplicationStatus$ActivityStateListener;",
            ">;"
        }
    .end annotation
.end field

.field private static sNativeApplicationStateListener:Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;

.field private static sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;",
            ">;"
        }
    .end annotation
.end field

.field private static sWindowFocusListeners:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$sfgetsActivity()Landroid/app/Activity;
    .locals 1

    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsNativeApplicationStateListener()Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;
    .locals 1

    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sNativeApplicationStateListener:Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsWindowFocusListeners()Lorg/chromium/base/ObserverList;
    .locals 1

    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfputsActivity(Landroid/app/Activity;)V
    .locals 0

    sput-object p0, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    return-void
.end method

.method static bridge synthetic -$$Nest$sfputsNativeApplicationStateListener(Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;)V
    .locals 0

    sput-object p0, Lorg/chromium/base/ApplicationStatus;->sNativeApplicationStateListener:Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;

    return-void
.end method

.method static bridge synthetic -$$Nest$smonStateChange(Landroid/app/Activity;I)V
    .locals 0

    invoke-static {p0, p1}, Lorg/chromium/base/ApplicationStatus;->onStateChange(Landroid/app/Activity;I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 45
    nop

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 81
    invoke-static {v0}, Lj$/util/DesugarCollections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    .line 86
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 87
    invoke-static {v0}, Lj$/util/DesugarCollections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityTaskId:Ljava/util/Map;

    .line 97
    const/4 v0, 0x0

    sput v0, Lorg/chromium/base/ApplicationStatus;->sCurrentApplicationState:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static createWindowCallbackProxy(Landroid/app/Activity;Landroid/view/Window$Callback;)Landroid/view/Window$Callback;
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "callback"    # Landroid/view/Window$Callback;

    .line 392
    const-class v0, Landroid/view/Window$Callback;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Landroid/view/Window$Callback;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;

    invoke-direct {v2, p0, p1}, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;-><init>(Landroid/app/Activity;Landroid/view/Window$Callback;)V

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/Window$Callback;

    return-object v0
.end method

.method public static destroyForJUnitTests()V
    .locals 2

    .line 738
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v0

    .line 739
    :try_start_0
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    if-eqz v1, :cond_0

    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->clear()V

    .line 740
    :cond_0
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    if-eqz v1, :cond_1

    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->clear()V

    .line 741
    :cond_1
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    if-eqz v1, :cond_2

    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->clear()V

    .line 742
    :cond_2
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 743
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    if-eqz v1, :cond_3

    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v1}, Lorg/chromium/base/ObserverList;->clear()V

    .line 744
    :cond_3
    const/4 v1, 0x0

    sput v1, Lorg/chromium/base/ApplicationStatus;->sCurrentApplicationState:I

    .line 745
    const/4 v1, 0x0

    sput-object v1, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    .line 746
    sput-object v1, Lorg/chromium/base/ApplicationStatus;->sNativeApplicationStateListener:Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;

    .line 747
    monitor-exit v0

    .line 748
    return-void

    .line 747
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private static determineApplicationStateLocked()I
    .locals 8

    .line 805
    const/4 v0, 0x0

    .line 806
    .local v0, "hasPausedActivity":Z
    const/4 v1, 0x0

    .line 808
    .local v1, "hasStoppedActivity":Z
    sget-object v2, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x4

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/chromium/base/ApplicationStatus$ActivityInfo;

    .line 809
    .local v3, "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    invoke-virtual {v3}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->getStatus()I

    move-result v5

    .line 810
    .local v5, "state":I
    const/4 v6, 0x5

    if-eq v5, v4, :cond_0

    if-eq v5, v6, :cond_0

    const/4 v7, 0x6

    if-eq v5, v7, :cond_0

    .line 812
    const/4 v2, 0x1

    return v2

    .line 813
    :cond_0
    if-ne v5, v4, :cond_1

    .line 814
    const/4 v0, 0x1

    goto :goto_1

    .line 815
    :cond_1
    if-ne v5, v6, :cond_2

    .line 816
    const/4 v1, 0x1

    .line 818
    .end local v3    # "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    .end local v5    # "state":I
    :cond_2
    :goto_1
    goto :goto_0

    .line 820
    :cond_3
    if-eqz v0, :cond_4

    const/4 v2, 0x2

    return v2

    .line 821
    :cond_4
    if-eqz v1, :cond_5

    const/4 v2, 0x3

    return v2

    .line 822
    :cond_5
    return v4
.end method

.method public static getLastTrackedFocusedActivity()Landroid/app/Activity;
    .locals 1

    .line 526
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public static getRunningActivities()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation

    .line 534
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 535
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v0

    .line 536
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 537
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 534
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static getStateForActivity(Landroid/app/Activity;)I
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;

    .line 586
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 587
    const/4 v0, 0x6

    if-nez p0, :cond_0

    return v0

    .line 588
    :cond_0
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/ApplicationStatus$ActivityInfo;

    .line 589
    .local v1, "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->getStatus()I

    move-result v0

    :cond_1
    return v0

    .line 586
    .end local v1    # "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static getStateForApplication()I
    .locals 2

    .line 599
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v0

    .line 600
    :try_start_0
    sget v1, Lorg/chromium/base/ApplicationStatus;->sCurrentApplicationState:I

    monitor-exit v0

    return v1

    .line 601
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getTaskId(Landroid/app/Activity;)I
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .line 244
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isCachingEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    move-result v0

    return v0

    .line 246
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityTaskId:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 247
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityTaskId:Ljava/util/Map;

    monitor-enter v0

    .line 248
    :try_start_0
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sActivityTaskId:Ljava/util/Map;

    invoke-virtual {p0}, Landroid/app/Activity;->getTaskId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 251
    :cond_1
    :goto_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityTaskId:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static hasVisibleActivities()Z
    .locals 3

    .line 614
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 615
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->getStateForApplication()I

    move-result v0

    .line 616
    .local v0, "state":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1

    .line 614
    .end local v0    # "state":I
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static initialize(Landroid/app/Application;)V
    .locals 2
    .param p0, "application"    # Landroid/app/Application;

    .line 319
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 320
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v0

    .line 321
    const/4 v1, 0x4

    :try_start_0
    sput v1, Lorg/chromium/base/ApplicationStatus;->sCurrentApplicationState:I

    .line 322
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 324
    new-instance v0, Lorg/chromium/base/ApplicationStatus$1;

    invoke-direct {v0}, Lorg/chromium/base/ApplicationStatus$1;-><init>()V

    invoke-static {v0}, Lorg/chromium/base/ApplicationStatus;->registerWindowFocusChangedListener(Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;)V

    .line 339
    new-instance v0, Lorg/chromium/base/ApplicationStatus$2;

    invoke-direct {v0}, Lorg/chromium/base/ApplicationStatus$2;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 388
    return-void

    .line 322
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 319
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static isCachingEnabled()Z
    .locals 4

    .line 237
    invoke-static {}, Lorg/chromium/base/StrictModeContext;->allowDiskReads()Lorg/chromium/base/StrictModeContext;

    move-result-object v0

    .line 238
    .local v0, "ignored":Lorg/chromium/base/StrictModeContext;
    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getAppSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "cache_activity_taskid_enabled"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V

    .line 238
    :cond_0
    return v1

    .line 237
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-virtual {v0}, Lorg/chromium/base/StrictModeContext;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
.end method

.method public static isEveryActivityDestroyed()Z
    .locals 1

    .line 627
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 628
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0

    .line 627
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static isInitialized()Z
    .locals 2

    .line 307
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v0

    .line 308
    :try_start_0
    sget v1, Lorg/chromium/base/ApplicationStatus;->sCurrentApplicationState:I

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 309
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static isTaskVisible(I)Z
    .locals 4
    .param p0, "taskId"    # I

    .line 640
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 641
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 642
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/app/Activity;Lorg/chromium/base/ApplicationStatus$ActivityInfo;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    invoke-static {v2}, Lorg/chromium/base/ApplicationStatus;->getTaskId(Landroid/app/Activity;)I

    move-result v2

    if-ne v2, p0, :cond_1

    .line 644
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/base/ApplicationStatus$ActivityInfo;

    invoke-virtual {v2}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->getStatus()I

    move-result v2

    .line 645
    .local v2, "state":I
    const/4 v3, 0x3

    if-eq v2, v3, :cond_0

    const/4 v3, 0x4

    if-ne v2, v3, :cond_1

    .line 646
    :cond_0
    const/4 v0, 0x1

    return v0

    .line 649
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/app/Activity;Lorg/chromium/base/ApplicationStatus$ActivityInfo;>;"
    .end local v2    # "state":I
    :cond_1
    goto :goto_0

    .line 650
    :cond_2
    const/4 v0, 0x0

    return v0

    .line 640
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static onStateChange(Landroid/app/Activity;I)V
    .locals 8
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "newState"    # I

    .line 446
    if-eqz p0, :cond_a

    .line 448
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    if-eq p1, v1, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 452
    :cond_0
    sput-object p0, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    .line 455
    :cond_1
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->getStateForApplication()I

    move-result v0

    .line 456
    .local v0, "oldApplicationState":I
    invoke-static {p0}, Lorg/chromium/base/ApplicationStatus;->getTaskId(Landroid/app/Activity;)I

    move-result v2

    invoke-static {v2}, Lorg/chromium/base/ApplicationStatus;->isTaskVisible(I)Z

    move-result v2

    .line 459
    .local v2, "oldTaskVisibility":Z
    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v3

    .line 460
    const/4 v4, 0x0

    if-ne p1, v1, :cond_3

    .line 461
    :try_start_0
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 462
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    new-instance v5, Lorg/chromium/base/ApplicationStatus$ActivityInfo;

    invoke-direct {v5, v4}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;-><init>(Lorg/chromium/base/ApplicationStatus-IA;)V

    invoke-interface {v1, p0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 461
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    .end local v0    # "oldApplicationState":I
    .end local v2    # "oldTaskVisibility":Z
    .end local p0    # "activity":Landroid/app/Activity;
    .end local p1    # "newState":I
    throw v1

    .line 465
    .restart local v0    # "oldApplicationState":I
    .restart local v2    # "oldTaskVisibility":Z
    .restart local p0    # "activity":Landroid/app/Activity;
    .restart local p1    # "newState":I
    :cond_3
    :goto_0
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/ApplicationStatus$ActivityInfo;

    .line 466
    .local v1, "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    invoke-virtual {v1, p1}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->setStatus(I)V

    .line 470
    const/4 v5, 0x6

    if-ne p1, v5, :cond_4

    .line 471
    sget-object v6, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v6, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    sget-object v6, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    if-ne p0, v6, :cond_4

    sput-object v4, Lorg/chromium/base/ApplicationStatus;->sActivity:Landroid/app/Activity;

    .line 475
    :cond_4
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->determineApplicationStateLocked()I

    move-result v4

    sput v4, Lorg/chromium/base/ApplicationStatus;->sCurrentApplicationState:I

    .line 476
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 479
    invoke-virtual {v1}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->getListeners()Lorg/chromium/base/ObserverList;

    move-result-object v3

    invoke-virtual {v3}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/base/ApplicationStatus$ActivityStateListener;

    .line 480
    .local v4, "listener":Lorg/chromium/base/ApplicationStatus$ActivityStateListener;
    invoke-interface {v4, p0, p1}, Lorg/chromium/base/ApplicationStatus$ActivityStateListener;->onActivityStateChange(Landroid/app/Activity;I)V

    .line 481
    .end local v4    # "listener":Lorg/chromium/base/ApplicationStatus$ActivityStateListener;
    goto :goto_1

    .line 485
    :cond_5
    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    if-eqz v3, :cond_6

    .line 486
    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v3}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/chromium/base/ApplicationStatus$ActivityStateListener;

    .line 487
    .restart local v4    # "listener":Lorg/chromium/base/ApplicationStatus$ActivityStateListener;
    invoke-interface {v4, p0, p1}, Lorg/chromium/base/ApplicationStatus$ActivityStateListener;->onActivityStateChange(Landroid/app/Activity;I)V

    .line 488
    .end local v4    # "listener":Lorg/chromium/base/ApplicationStatus$ActivityStateListener;
    goto :goto_2

    .line 491
    :cond_6
    invoke-static {p0}, Lorg/chromium/base/ApplicationStatus;->getTaskId(Landroid/app/Activity;)I

    move-result v3

    invoke-static {v3}, Lorg/chromium/base/ApplicationStatus;->isTaskVisible(I)Z

    move-result v4

    .line 492
    .local v4, "taskVisibility":Z
    if-eq v4, v2, :cond_7

    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    if-eqz v3, :cond_7

    .line 493
    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v3}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;

    .line 494
    .local v6, "listener":Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;
    invoke-static {p0}, Lorg/chromium/base/ApplicationStatus;->getTaskId(Landroid/app/Activity;)I

    move-result v7

    invoke-interface {v6, v7, v4}, Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;->onTaskVisibilityChanged(IZ)V

    .line 495
    .end local v6    # "listener":Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;
    goto :goto_3

    .line 498
    :cond_7
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->getStateForApplication()I

    move-result v6

    .line 499
    .local v6, "applicationState":I
    if-eq v6, v0, :cond_8

    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    if-eqz v3, :cond_8

    .line 500
    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v3}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;

    .line 501
    .local v7, "listener":Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;
    invoke-interface {v7, v6}, Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;->onApplicationStateChange(I)V

    .line 502
    .end local v7    # "listener":Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;
    goto :goto_4

    .line 504
    :cond_8
    sget-object v7, Lorg/chromium/base/ApplicationStatus;->sActivityTaskId:Ljava/util/Map;

    monitor-enter v7

    .line 505
    if-ne p1, v5, :cond_9

    .line 506
    :try_start_1
    sget-object v3, Lorg/chromium/base/ApplicationStatus;->sActivityTaskId:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    :cond_9
    monitor-exit v7

    .line 509
    return-void

    .line 508
    :catchall_0
    move-exception v3

    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 476
    .end local v1    # "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    .end local v4    # "taskVisibility":Z
    .end local v6    # "applicationState":I
    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 446
    .end local v0    # "oldApplicationState":I
    .end local v2    # "oldTaskVisibility":Z
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "null activity is not supported"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static onStateChangeForTesting(Landroid/app/Activity;I)V
    .locals 0
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "newState"    # I

    .line 517
    invoke-static {p0, p1}, Lorg/chromium/base/ApplicationStatus;->onStateChange(Landroid/app/Activity;I)V

    .line 518
    return-void
.end method

.method static reachesWindowCallback(Landroid/view/Window$Callback;)Z
    .locals 10
    .param p0, "callback"    # Landroid/view/Window$Callback;

    .line 405
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 406
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "androidx.appcompat.app.ToolbarActionBar$ToolbarCallbackWrapper"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 411
    return v2

    .line 413
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/reflect/Proxy;->isProxyClass(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 414
    invoke-static {p0}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v0

    instance-of v0, v0, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;

    return v0

    .line 417
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    const-class v3, Ljava/lang/Object;

    if-eq v1, v3, :cond_5

    .line 418
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v3

    array-length v4, v3

    move v5, v0

    :goto_1
    if-ge v5, v4, :cond_4

    aget-object v6, v3, v5

    .line 419
    .local v6, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    const-class v8, Landroid/view/Window$Callback;

    invoke-virtual {v7, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 420
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v7

    .line 421
    .local v7, "isAccessible":Z
    invoke-virtual {v6, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 424
    :try_start_0
    invoke-virtual {v6, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/Window$Callback;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 428
    .local v8, "fieldCb":Landroid/view/Window$Callback;
    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 429
    nop

    .line 430
    invoke-static {v8}, Lorg/chromium/base/ApplicationStatus;->reachesWindowCallback(Landroid/view/Window$Callback;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 431
    return v2

    .line 428
    .end local v8    # "fieldCb":Landroid/view/Window$Callback;
    :catchall_0
    move-exception v0

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 429
    throw v0

    .line 425
    :catch_0
    move-exception v8

    .line 428
    .local v8, "ex":Ljava/lang/IllegalAccessException;
    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 426
    nop

    .line 418
    .end local v6    # "f":Ljava/lang/reflect/Field;
    .end local v7    # "isAccessible":Z
    .end local v8    # "ex":Ljava/lang/IllegalAccessException;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 417
    :cond_4
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    .line 436
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_5
    return v0
.end method

.method public static registerApplicationStateListener(Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;)V
    .locals 1
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;

    .line 714
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    .line 715
    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    sput-object v0, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    .line 717
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 718
    return-void
.end method

.method public static registerStateListenerForActivity(Lorg/chromium/base/ApplicationStatus$ActivityStateListener;Landroid/app/Activity;)V
    .locals 3
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$ActivityStateListener;
    .param p1, "activity"    # Landroid/app/Activity;

    .line 680
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 681
    if-eqz p1, :cond_1

    .line 683
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/ApplicationStatus$ActivityInfo;

    .line 684
    .local v0, "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    invoke-virtual {v0}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->getStatus()I

    move-result v1

    const/4 v2, 0x6

    if-eq v1, v2, :cond_0

    .line 685
    invoke-virtual {v0}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->getListeners()Lorg/chromium/base/ObserverList;

    move-result-object v1

    invoke-virtual {v1, p0}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 686
    return-void

    .line 684
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 681
    .end local v0    # "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 680
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static registerStateListenerForAllActivities(Lorg/chromium/base/ApplicationStatus$ActivityStateListener;)V
    .locals 1
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$ActivityStateListener;

    .line 660
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 661
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    .line 662
    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    sput-object v0, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    .line 664
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 665
    return-void

    .line 660
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static registerTaskVisibilityListener(Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;)V
    .locals 1
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;

    .line 215
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 216
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    sput-object v0, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    .line 217
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 218
    return-void

    .line 215
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static registerThreadSafeNativeApplicationStateListener()V
    .locals 1

    .line 776
    new-instance v0, Lorg/chromium/base/ApplicationStatus$3;

    invoke-direct {v0}, Lorg/chromium/base/ApplicationStatus$3;-><init>()V

    invoke-static {v0}, Lorg/chromium/base/ThreadUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 790
    return-void
.end method

.method public static registerWindowFocusChangedListener(Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;)V
    .locals 1
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;

    .line 192
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 193
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    sput-object v0, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    .line 194
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 195
    return-void

    .line 192
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static resetActivitiesForInstrumentationTests()V
    .locals 4

    .line 755
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->runningOnUiThread()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 757
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v0

    .line 759
    :try_start_0
    new-instance v1, Ljava/util/HashSet;

    sget-object v2, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 760
    .local v2, "activity":Landroid/app/Activity;
    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    if-nez v3, :cond_0

    .line 763
    const/4 v3, 0x6

    invoke-static {v2, v3}, Lorg/chromium/base/ApplicationStatus;->onStateChangeForTesting(Landroid/app/Activity;I)V

    .line 764
    .end local v2    # "activity":Landroid/app/Activity;
    goto :goto_0

    .line 760
    .restart local v2    # "activity":Landroid/app/Activity;
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    const-string v3, "Real activities that are launched should be closed by test code and not rely on this cleanup of mocks."

    invoke-direct {v1, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 765
    .end local v2    # "activity":Landroid/app/Activity;
    :cond_1
    monitor-exit v0

    .line 766
    return-void

    .line 765
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 755
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static setCachingEnabled(Z)V
    .locals 2
    .param p0, "enabled"    # Z

    .line 232
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getAppSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 233
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "cache_activity_taskid_enabled"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 234
    return-void
.end method

.method public static unregisterActivityStateListener(Lorg/chromium/base/ApplicationStatus$ActivityStateListener;)V
    .locals 4
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$ActivityStateListener;

    .line 695
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    if-eqz v0, :cond_0

    .line 696
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sGeneralActivityStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    .line 700
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    monitor-enter v0

    .line 701
    :try_start_0
    sget-object v1, Lorg/chromium/base/ApplicationStatus;->sActivityInfo:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/chromium/base/ApplicationStatus$ActivityInfo;

    .line 702
    .local v2, "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    invoke-virtual {v2}, Lorg/chromium/base/ApplicationStatus$ActivityInfo;->getListeners()Lorg/chromium/base/ObserverList;

    move-result-object v3

    invoke-virtual {v3, p0}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    .line 703
    nop

    .end local v2    # "info":Lorg/chromium/base/ApplicationStatus$ActivityInfo;
    goto :goto_0

    .line 704
    :cond_1
    monitor-exit v0

    .line 705
    return-void

    .line 704
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static unregisterApplicationStateListener(Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;)V
    .locals 1
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;

    .line 727
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    return-void

    .line 728
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sApplicationStateListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    .line 729
    return-void
.end method

.method public static unregisterTaskVisibilityListener(Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;)V
    .locals 1
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$TaskVisibilityListener;

    .line 227
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    return-void

    .line 228
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sTaskVisibilityListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    .line 229
    return-void
.end method

.method public static unregisterWindowFocusChangedListener(Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;)V
    .locals 1
    .param p0, "listener"    # Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;

    .line 204
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    return-void

    .line 205
    :cond_0
    sget-object v0, Lorg/chromium/base/ApplicationStatus;->sWindowFocusListeners:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    .line 206
    return-void
.end method
