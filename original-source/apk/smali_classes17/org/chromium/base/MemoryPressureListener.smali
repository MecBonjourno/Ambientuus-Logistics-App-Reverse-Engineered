.class public Lorg/chromium/base/MemoryPressureListener;
.super Ljava/lang/Object;
.source "MemoryPressureListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/MemoryPressureListener$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field private static final ACTION_LOW_MEMORY:Ljava/lang/String; = "org.chromium.base.ACTION_LOW_MEMORY"

.field private static final ACTION_TRIM_MEMORY:Ljava/lang/String; = "org.chromium.base.ACTION_TRIM_MEMORY"

.field private static final ACTION_TRIM_MEMORY_MODERATE:Ljava/lang/String; = "org.chromium.base.ACTION_TRIM_MEMORY_MODERATE"

.field private static final ACTION_TRIM_MEMORY_RUNNING_CRITICAL:Ljava/lang/String; = "org.chromium.base.ACTION_TRIM_MEMORY_RUNNING_CRITICAL"

.field private static sCallbacks:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/base/memory/MemoryPressureCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addCallback(Lorg/chromium/base/memory/MemoryPressureCallback;)V
    .locals 1
    .param p0, "callback"    # Lorg/chromium/base/memory/MemoryPressureCallback;

    .line 73
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 74
    sget-object v0, Lorg/chromium/base/MemoryPressureListener;->sCallbacks:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    sput-object v0, Lorg/chromium/base/MemoryPressureListener;->sCallbacks:Lorg/chromium/base/ObserverList;

    .line 75
    :cond_0
    sget-object v0, Lorg/chromium/base/MemoryPressureListener;->sCallbacks:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 76
    return-void
.end method

.method private static addNativeCallback()V
    .locals 1

    .line 63
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 64
    new-instance v0, Lorg/chromium/base/MemoryPressureListener$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lorg/chromium/base/MemoryPressureListener$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0}, Lorg/chromium/base/MemoryPressureListener;->addCallback(Lorg/chromium/base/memory/MemoryPressureCallback;)V

    .line 65
    return-void
.end method

.method public static handleDebugIntent(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "action"    # Ljava/lang/String;

    .line 109
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 110
    const-string v0, "org.chromium.base.ACTION_LOW_MEMORY"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    invoke-static {p0}, Lorg/chromium/base/MemoryPressureListener;->simulateLowMemoryPressureSignal(Landroid/app/Activity;)V

    goto :goto_0

    .line 112
    :cond_0
    const-string v0, "org.chromium.base.ACTION_TRIM_MEMORY"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 113
    const/16 v0, 0x50

    invoke-static {p0, v0}, Lorg/chromium/base/MemoryPressureListener;->simulateTrimMemoryPressureSignal(Landroid/app/Activity;I)V

    goto :goto_0

    .line 114
    :cond_1
    const-string v0, "org.chromium.base.ACTION_TRIM_MEMORY_RUNNING_CRITICAL"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 115
    const/16 v0, 0xf

    invoke-static {p0, v0}, Lorg/chromium/base/MemoryPressureListener;->simulateTrimMemoryPressureSignal(Landroid/app/Activity;I)V

    goto :goto_0

    .line 117
    :cond_2
    const-string v0, "org.chromium.base.ACTION_TRIM_MEMORY_MODERATE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 118
    const/16 v0, 0x3c

    invoke-static {p0, v0}, Lorg/chromium/base/MemoryPressureListener;->simulateTrimMemoryPressureSignal(Landroid/app/Activity;I)V

    .line 123
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 120
    :cond_3
    const/4 v0, 0x0

    return v0
.end method

.method static synthetic lambda$addNativeCallback$0(I)V
    .locals 1
    .param p0, "pressure"    # I

    .line 64
    invoke-static {}, Lorg/chromium/base/MemoryPressureListenerJni;->get()Lorg/chromium/base/MemoryPressureListener$Natives;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/base/MemoryPressureListener$Natives;->onMemoryPressure(I)V

    return-void
.end method

.method public static notifyMemoryPressure(I)V
    .locals 2
    .param p0, "pressure"    # I

    .line 97
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 98
    sget-object v0, Lorg/chromium/base/MemoryPressureListener;->sCallbacks:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    return-void

    .line 99
    :cond_0
    sget-object v0, Lorg/chromium/base/MemoryPressureListener;->sCallbacks:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/memory/MemoryPressureCallback;

    .line 100
    .local v1, "callback":Lorg/chromium/base/memory/MemoryPressureCallback;
    invoke-interface {v1, p0}, Lorg/chromium/base/memory/MemoryPressureCallback;->onPressure(I)V

    .line 101
    .end local v1    # "callback":Lorg/chromium/base/memory/MemoryPressureCallback;
    goto :goto_0

    .line 102
    :cond_1
    return-void
.end method

.method public static removeCallback(Lorg/chromium/base/memory/MemoryPressureCallback;)V
    .locals 1
    .param p0, "callback"    # Lorg/chromium/base/memory/MemoryPressureCallback;

    .line 83
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 84
    sget-object v0, Lorg/chromium/base/MemoryPressureListener;->sCallbacks:Lorg/chromium/base/ObserverList;

    if-nez v0, :cond_0

    return-void

    .line 85
    :cond_0
    sget-object v0, Lorg/chromium/base/MemoryPressureListener;->sCallbacks:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p0}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    .line 86
    return-void
.end method

.method private static simulateLowMemoryPressureSignal(Landroid/app/Activity;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .line 130
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->onLowMemory()V

    .line 131
    invoke-virtual {p0}, Landroid/app/Activity;->onLowMemory()V

    .line 132
    return-void
.end method

.method private static simulateTrimMemoryPressureSignal(Landroid/app/Activity;I)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "level"    # I

    .line 138
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 139
    invoke-virtual {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    .line 140
    return-void
.end method
