.class public Lorg/chromium/base/PowerMonitor;
.super Ljava/lang/Object;
.source "PowerMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/PowerMonitor$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sInstance:Lorg/chromium/base/PowerMonitor;


# instance fields
.field private mIsBatteryPower:Z


# direct methods
.method static bridge synthetic -$$Nest$smonBatteryChargingChanged(Z)V
    .locals 0

    invoke-static {p0}, Lorg/chromium/base/PowerMonitor;->onBatteryChargingChanged(Z)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 23
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    return-void
.end method

.method public static create()V
    .locals 6

    .line 40
    invoke-static {}, Lorg/chromium/base/ThreadUtils;->assertOnUiThread()V

    .line 42
    sget-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    if-eqz v0, :cond_0

    return-void

    .line 44
    :cond_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 45
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Lorg/chromium/base/PowerMonitor;

    invoke-direct {v1}, Lorg/chromium/base/PowerMonitor;-><init>()V

    sput-object v1, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    .line 46
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 47
    .local v1, "ifilter":Landroid/content/IntentFilter;
    nop

    .line 48
    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Lorg/chromium/base/ContextUtils;->registerProtectedBroadcastReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v2

    .line 49
    .local v2, "batteryStatusIntent":Landroid/content/Intent;
    if-eqz v2, :cond_2

    .line 52
    const-string v3, "plugged"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 54
    .local v3, "chargePlug":I
    if-nez v3, :cond_1

    const/4 v4, 0x1

    :cond_1
    invoke-static {v4}, Lorg/chromium/base/PowerMonitor;->onBatteryChargingChanged(Z)V

    .line 57
    .end local v3    # "chargePlug":I
    :cond_2
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 58
    .local v3, "powerConnectedFilter":Landroid/content/IntentFilter;
    const-string v4, "android.intent.action.ACTION_POWER_CONNECTED"

    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 59
    const-string v4, "android.intent.action.ACTION_POWER_DISCONNECTED"

    invoke-virtual {v3, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 60
    new-instance v4, Lorg/chromium/base/PowerMonitor$1;

    invoke-direct {v4}, Lorg/chromium/base/PowerMonitor$1;-><init>()V

    invoke-static {v0, v4, v3}, Lorg/chromium/base/ContextUtils;->registerProtectedBroadcastReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 68
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1d

    if-lt v4, v5, :cond_3

    .line 69
    nop

    .line 70
    const-string v4, "power"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/PowerManager;

    .line 71
    .local v4, "powerManager":Landroid/os/PowerManager;
    if-eqz v4, :cond_3

    .line 72
    invoke-static {v4}, Lorg/chromium/base/PowerMonitorForQ;->addThermalStatusListener(Landroid/os/PowerManager;)V

    .line 75
    .end local v4    # "powerManager":Landroid/os/PowerManager;
    :cond_3
    return-void
.end method

.method public static createForTests()V
    .locals 1

    .line 33
    new-instance v0, Lorg/chromium/base/PowerMonitor;

    invoke-direct {v0}, Lorg/chromium/base/PowerMonitor;-><init>()V

    sput-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    .line 34
    return-void
.end method

.method private static getCurrentThermalStatus()I
    .locals 3

    .line 115
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    const/4 v2, -0x1

    if-ge v0, v1, :cond_0

    return v2

    .line 120
    :cond_0
    sget-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    if-nez v0, :cond_1

    invoke-static {}, Lorg/chromium/base/PowerMonitor;->create()V

    .line 123
    :cond_1
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 125
    .local v0, "powerManager":Landroid/os/PowerManager;
    if-nez v0, :cond_2

    return v2

    .line 126
    :cond_2
    invoke-static {v0}, Lorg/chromium/base/compat/ApiHelperForQ;->getCurrentThermalStatus(Landroid/os/PowerManager;)I

    move-result v1

    return v1
.end method

.method private static getRemainingBatteryCapacity()I
    .locals 1

    .line 101
    sget-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    if-nez v0, :cond_0

    invoke-static {}, Lorg/chromium/base/PowerMonitor;->create()V

    .line 103
    :cond_0
    invoke-static {}, Lorg/chromium/base/PowerMonitor;->getRemainingBatteryCapacityImpl()I

    move-result v0

    return v0
.end method

.method private static getRemainingBatteryCapacityImpl()I
    .locals 2

    .line 107
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "batterymanager"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/BatteryManager;

    .line 109
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/BatteryManager;->getIntProperty(I)I

    move-result v0

    .line 107
    return v0
.end method

.method private static isBatteryPower()Z
    .locals 1

    .line 91
    sget-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    if-nez v0, :cond_0

    invoke-static {}, Lorg/chromium/base/PowerMonitor;->create()V

    .line 93
    :cond_0
    sget-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    iget-boolean v0, v0, Lorg/chromium/base/PowerMonitor;->mIsBatteryPower:Z

    return v0
.end method

.method private static onBatteryChargingChanged(Z)V
    .locals 1
    .param p0, "isBatteryPower"    # Z

    .line 81
    sget-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    if-eqz v0, :cond_0

    .line 82
    sget-object v0, Lorg/chromium/base/PowerMonitor;->sInstance:Lorg/chromium/base/PowerMonitor;

    iput-boolean p0, v0, Lorg/chromium/base/PowerMonitor;->mIsBatteryPower:Z

    .line 83
    invoke-static {}, Lorg/chromium/base/PowerMonitorJni;->get()Lorg/chromium/base/PowerMonitor$Natives;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/base/PowerMonitor$Natives;->onBatteryChargingChanged()V

    .line 84
    return-void

    .line 81
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method
