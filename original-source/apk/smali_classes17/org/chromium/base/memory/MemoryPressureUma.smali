.class public Lorg/chromium/base/memory/MemoryPressureUma;
.super Ljava/lang/Object;
.source "MemoryPressureUma.java"

# interfaces
.implements Landroid/content/ComponentCallbacks2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/memory/MemoryPressureUma$Notification;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sInstance:Lorg/chromium/base/memory/MemoryPressureUma;


# instance fields
.field private final mHistogramName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 22
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "processType"    # Ljava/lang/String;

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Android.MemoryPressureNotification."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/memory/MemoryPressureUma;->mHistogramName:Ljava/lang/String;

    .line 68
    return-void
.end method

.method public static initializeForBrowser()V
    .locals 1

    .line 52
    const-string v0, "Browser"

    invoke-static {v0}, Lorg/chromium/base/memory/MemoryPressureUma;->initializeInstance(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public static initializeForChildService()V
    .locals 1

    .line 56
    const-string v0, "ChildService"

    invoke-static {v0}, Lorg/chromium/base/memory/MemoryPressureUma;->initializeInstance(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method private static initializeInstance(Ljava/lang/String;)V
    .locals 2
    .param p0, "processType"    # Ljava/lang/String;

    .line 60
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 61
    sget-object v0, Lorg/chromium/base/memory/MemoryPressureUma;->sInstance:Lorg/chromium/base/memory/MemoryPressureUma;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Lorg/chromium/base/memory/MemoryPressureUma;

    invoke-direct {v0, p0}, Lorg/chromium/base/memory/MemoryPressureUma;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/chromium/base/memory/MemoryPressureUma;->sInstance:Lorg/chromium/base/memory/MemoryPressureUma;

    .line 63
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lorg/chromium/base/memory/MemoryPressureUma;->sInstance:Lorg/chromium/base/memory/MemoryPressureUma;

    invoke-virtual {v0, v1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 64
    return-void

    .line 61
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private record(I)V
    .locals 2
    .param p1, "notification"    # I

    .line 109
    iget-object v0, p0, Lorg/chromium/base/memory/MemoryPressureUma;->mHistogramName:Ljava/lang/String;

    const/16 v1, 0x9

    invoke-static {v0, p1, v1}, Lorg/chromium/base/metrics/RecordHistogram;->recordEnumeratedHistogram(Ljava/lang/String;II)V

    .line 111
    return-void
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "configuration"    # Landroid/content/res/Configuration;

    .line 106
    return-void
.end method

.method public onLowMemory()V
    .locals 1

    .line 72
    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 73
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1
    .param p1, "level"    # I

    .line 77
    sparse-switch p1, :sswitch_data_0

    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    goto :goto_0

    .line 79
    :sswitch_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 80
    goto :goto_0

    .line 82
    :sswitch_1
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 83
    goto :goto_0

    .line 85
    :sswitch_2
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 86
    goto :goto_0

    .line 88
    :sswitch_3
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 89
    goto :goto_0

    .line 91
    :sswitch_4
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 92
    goto :goto_0

    .line 94
    :sswitch_5
    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 95
    goto :goto_0

    .line 97
    :sswitch_6
    const/4 v0, 0x7

    invoke-direct {p0, v0}, Lorg/chromium/base/memory/MemoryPressureUma;->record(I)V

    .line 98
    nop

    .line 103
    :goto_0
    return-void

    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_6
        0xa -> :sswitch_5
        0xf -> :sswitch_4
        0x14 -> :sswitch_3
        0x28 -> :sswitch_2
        0x3c -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method
