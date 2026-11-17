.class public Lorg/chromium/net/NetworkChangeNotifier;
.super Ljava/lang/Object;
.source "NetworkChangeNotifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/NetworkChangeNotifier$Natives;,
        Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "net"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sInstance:Lorg/chromium/net/NetworkChangeNotifier;


# instance fields
.field private mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

.field private final mConnectionTypeObservers:Lorg/chromium/base/ObserverList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/chromium/base/ObserverList<",
            "Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentConnectionCost:I

.field private mCurrentConnectionType:I

.field private final mNativeChangeNotifiers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$mupdateCurrentConnectionType(Lorg/chromium/net/NetworkChangeNotifier;I)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->updateCurrentConnectionType(I)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 29
    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mCurrentConnectionType:I

    .line 45
    iput v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mCurrentConnectionCost:I

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    .line 53
    new-instance v0, Lorg/chromium/base/ObserverList;

    invoke-direct {v0}, Lorg/chromium/base/ObserverList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mConnectionTypeObservers:Lorg/chromium/base/ObserverList;

    .line 54
    return-void
.end method

.method public static addConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V
    .locals 1
    .param p0, "observer"    # Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    .line 411
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-direct {v0, p0}, Lorg/chromium/net/NetworkChangeNotifier;->addConnectionTypeObserverInternal(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    .line 412
    return-void
.end method

.method private addConnectionTypeObserverInternal(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V
    .locals 1
    .param p1, "observer"    # Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    .line 415
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mConnectionTypeObservers:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p1}, Lorg/chromium/base/ObserverList;->addObserver(Ljava/lang/Object;)Z

    .line 416
    return-void
.end method

.method private destroyAutoDetector()V
    .locals 1

    .line 190
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-eqz v0, :cond_0

    .line 191
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->destroy()V

    .line 192
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    .line 194
    :cond_0
    return-void
.end method

.method public static fakeConnectionCostChanged(I)V
    .locals 1
    .param p0, "connectionCost"    # I

    .line 306
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 307
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionCostChange(I)V

    .line 308
    return-void
.end method

.method public static fakeConnectionSubtypeChanged(I)V
    .locals 1
    .param p0, "connectionSubtype"    # I

    .line 313
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 314
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionSubtypeChange(I)V

    .line 315
    return-void
.end method

.method public static fakeDefaultNetwork(JI)V
    .locals 1
    .param p0, "netId"    # J
    .param p2, "connectionType"    # I

    .line 298
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 299
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-direct {v0, p2, p0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionTypeChange(IJ)V

    .line 300
    return-void
.end method

.method public static fakeNetworkConnected(JI)V
    .locals 1
    .param p0, "netId"    # J
    .param p2, "connectionType"    # I

    .line 270
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 271
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfNetworkConnect(JI)V

    .line 272
    return-void
.end method

.method public static fakeNetworkDisconnected(J)V
    .locals 1
    .param p0, "netId"    # J

    .line 284
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 285
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfNetworkDisconnect(J)V

    .line 286
    return-void
.end method

.method public static fakeNetworkSoonToBeDisconnected(J)V
    .locals 1
    .param p0, "netId"    # J

    .line 277
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 278
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfNetworkSoonToDisconnect(J)V

    .line 279
    return-void
.end method

.method public static fakePurgeActiveNetworkList([J)V
    .locals 1
    .param p0, "activeNetIds"    # [J

    .line 291
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 292
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversToPurgeActiveNetworkList([J)V

    .line 293
    return-void
.end method

.method public static forceConnectivityState(Z)V
    .locals 1
    .param p0, "networkAvailable"    # Z

    .line 252
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityState(Z)V

    .line 253
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-direct {v0, p0}, Lorg/chromium/net/NetworkChangeNotifier;->forceConnectivityStateInternal(Z)V

    .line 254
    return-void
.end method

.method private forceConnectivityStateInternal(Z)V
    .locals 4
    .param p1, "forceOnline"    # Z

    .line 257
    iget v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mCurrentConnectionType:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x6

    if-eq v0, v3, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    .line 259
    .local v0, "connectionCurrentlyExists":Z
    :goto_0
    if-eq v0, p1, :cond_3

    .line 260
    if-eqz p1, :cond_1

    move v3, v2

    goto :goto_1

    .line 261
    :cond_1
    nop

    .line 260
    :goto_1
    invoke-direct {p0, v3}, Lorg/chromium/net/NetworkChangeNotifier;->updateCurrentConnectionType(I)V

    .line 262
    if-eqz p1, :cond_2

    move v1, v2

    goto :goto_2

    .line 263
    :cond_2
    nop

    .line 262
    :goto_2
    invoke-virtual {p0, v1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionSubtypeChange(I)V

    .line 265
    :cond_3
    return-void
.end method

.method public static getAutoDetectorForTest()Lorg/chromium/net/NetworkChangeNotifierAutoDetect;
    .locals 1

    .line 431
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    iget-object v0, v0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    return-object v0
.end method

.method public static getInstance()Lorg/chromium/net/NetworkChangeNotifier;
    .locals 1

    .line 148
    sget-object v0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    if-eqz v0, :cond_0

    .line 149
    sget-object v0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    return-object v0

    .line 148
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public static init()Lorg/chromium/net/NetworkChangeNotifier;
    .locals 1

    .line 61
    sget-object v0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Lorg/chromium/net/NetworkChangeNotifier;

    invoke-direct {v0}, Lorg/chromium/net/NetworkChangeNotifier;-><init>()V

    sput-object v0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    .line 64
    :cond_0
    sget-object v0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    return-object v0
.end method

.method public static isInitialized()Z
    .locals 1

    .line 68
    sget-object v0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isOnline()Z
    .locals 2

    .line 438
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifier;->getCurrentConnectionType()I

    move-result v0

    .line 439
    .local v0, "connectionType":I
    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private notifyObserversOfConnectionTypeChange(IJ)V
    .locals 9
    .param p1, "newConnectionType"    # I
    .param p2, "defaultNetId"    # J

    .line 330
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 331
    .local v1, "nativeChangeNotifier":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifierJni;->get()Lorg/chromium/net/NetworkChangeNotifier$Natives;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    move-object v5, p0

    move v6, p1

    move-wide v7, p2

    .end local p1    # "newConnectionType":I
    .end local p2    # "defaultNetId":J
    .local v6, "newConnectionType":I
    .local v7, "defaultNetId":J
    invoke-interface/range {v2 .. v8}, Lorg/chromium/net/NetworkChangeNotifier$Natives;->notifyConnectionTypeChanged(JLorg/chromium/net/NetworkChangeNotifier;IJ)V

    .line 333
    .end local v1    # "nativeChangeNotifier":Ljava/lang/Long;
    goto :goto_0

    .line 334
    .end local v6    # "newConnectionType":I
    .end local v7    # "defaultNetId":J
    .restart local p1    # "newConnectionType":I
    .restart local p2    # "defaultNetId":J
    :cond_0
    move-object v5, p0

    move v6, p1

    move-wide v7, p2

    .end local p1    # "newConnectionType":I
    .end local p2    # "defaultNetId":J
    .restart local v6    # "newConnectionType":I
    .restart local v7    # "defaultNetId":J
    iget-object p1, v5, Lorg/chromium/net/NetworkChangeNotifier;->mConnectionTypeObservers:Lorg/chromium/base/ObserverList;

    invoke-virtual {p1}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    .line 335
    .local p2, "observer":Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;
    invoke-interface {p2, v6}, Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;->onConnectionTypeChanged(I)V

    .line 336
    .end local p2    # "observer":Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;
    goto :goto_1

    .line 337
    :cond_1
    return-void
.end method

.method public static registerToReceiveNotificationsAlways()V
    .locals 3

    .line 177
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    new-instance v1, Lorg/chromium/net/RegistrationPolicyAlwaysRegister;

    invoke-direct {v1}, Lorg/chromium/net/RegistrationPolicyAlwaysRegister;-><init>()V

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityStateInternal(ZLorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;)V

    .line 179
    return-void
.end method

.method public static removeConnectionTypeObserver(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V
    .locals 1
    .param p0, "observer"    # Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    .line 422
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    invoke-direct {v0, p0}, Lorg/chromium/net/NetworkChangeNotifier;->removeConnectionTypeObserverInternal(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V

    .line 423
    return-void
.end method

.method private removeConnectionTypeObserverInternal(Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;)V
    .locals 1
    .param p1, "observer"    # Lorg/chromium/net/NetworkChangeNotifier$ConnectionTypeObserver;

    .line 426
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mConnectionTypeObservers:Lorg/chromium/base/ObserverList;

    invoke-virtual {v0, p1}, Lorg/chromium/base/ObserverList;->removeObserver(Ljava/lang/Object;)Z

    .line 427
    return-void
.end method

.method public static resetInstanceForTests()V
    .locals 1

    .line 72
    new-instance v0, Lorg/chromium/net/NetworkChangeNotifier;

    invoke-direct {v0}, Lorg/chromium/net/NetworkChangeNotifier;-><init>()V

    sput-object v0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    .line 73
    return-void
.end method

.method public static resetInstanceForTests(Lorg/chromium/net/NetworkChangeNotifier;)V
    .locals 0
    .param p0, "notifier"    # Lorg/chromium/net/NetworkChangeNotifier;

    .line 76
    sput-object p0, Lorg/chromium/net/NetworkChangeNotifier;->sInstance:Lorg/chromium/net/NetworkChangeNotifier;

    .line 77
    return-void
.end method

.method public static setAutoDetectConnectivityState(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;)V
    .locals 2
    .param p0, "policy"    # Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;

    .line 186
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityStateInternal(ZLorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;)V

    .line 187
    return-void
.end method

.method public static setAutoDetectConnectivityState(Z)V
    .locals 2
    .param p0, "shouldAutoDetect"    # Z

    .line 164
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifier;->getInstance()Lorg/chromium/net/NetworkChangeNotifier;

    move-result-object v0

    new-instance v1, Lorg/chromium/net/RegistrationPolicyApplicationStatus;

    invoke-direct {v1}, Lorg/chromium/net/RegistrationPolicyApplicationStatus;-><init>()V

    invoke-direct {v0, p0, v1}, Lorg/chromium/net/NetworkChangeNotifier;->setAutoDetectConnectivityStateInternal(ZLorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;)V

    .line 166
    return-void
.end method

.method private setAutoDetectConnectivityStateInternal(ZLorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;)V
    .locals 2
    .param p1, "shouldAutoDetect"    # Z
    .param p2, "policy"    # Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;

    .line 198
    if-eqz p1, :cond_0

    .line 199
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-nez v0, :cond_1

    .line 200
    new-instance v0, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    new-instance v1, Lorg/chromium/net/NetworkChangeNotifier$1;

    invoke-direct {v1, p0}, Lorg/chromium/net/NetworkChangeNotifier$1;-><init>(Lorg/chromium/net/NetworkChangeNotifier;)V

    invoke-direct {v0, v1, p2}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;-><init>(Lorg/chromium/net/NetworkChangeNotifierAutoDetect$Observer;Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;)V

    iput-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    .line 232
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    .line 233
    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->getCurrentNetworkState()Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    move-result-object v0

    .line 234
    .local v0, "networkState":Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;
    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getConnectionType()I

    move-result v1

    invoke-direct {p0, v1}, Lorg/chromium/net/NetworkChangeNotifier;->updateCurrentConnectionType(I)V

    .line 235
    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getConnectionCost()I

    move-result v1

    invoke-direct {p0, v1}, Lorg/chromium/net/NetworkChangeNotifier;->updateCurrentConnectionCost(I)V

    .line 236
    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getConnectionSubtype()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionSubtypeChange(I)V

    .line 237
    .end local v0    # "networkState":Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;
    goto :goto_0

    .line 239
    :cond_0
    invoke-direct {p0}, Lorg/chromium/net/NetworkChangeNotifier;->destroyAutoDetector()V

    .line 241
    :cond_1
    :goto_0
    return-void
.end method

.method private updateCurrentConnectionCost(I)V
    .locals 0
    .param p1, "newConnectionCost"    # I

    .line 340
    iput p1, p0, Lorg/chromium/net/NetworkChangeNotifier;->mCurrentConnectionCost:I

    .line 341
    invoke-virtual {p0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionCostChange(I)V

    .line 342
    return-void
.end method

.method private updateCurrentConnectionType(I)V
    .locals 0
    .param p1, "newConnectionType"    # I

    .line 318
    iput p1, p0, Lorg/chromium/net/NetworkChangeNotifier;->mCurrentConnectionType:I

    .line 319
    invoke-virtual {p0, p1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionTypeChange(I)V

    .line 320
    return-void
.end method


# virtual methods
.method public addNativeObserver(J)V
    .locals 2
    .param p1, "nativeChangeNotifier"    # J

    .line 124
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    return-void
.end method

.method public getCurrentConnectionCost()I
    .locals 1

    .line 93
    iget v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mCurrentConnectionCost:I

    return v0
.end method

.method public getCurrentConnectionSubtype()I
    .locals 1

    .line 86
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-nez v0, :cond_0

    .line 87
    const/4 v0, 0x0

    goto :goto_0

    .line 88
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->getCurrentNetworkState()Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$NetworkState;->getConnectionSubtype()I

    move-result v0

    .line 86
    :goto_0
    return v0
.end method

.method public getCurrentConnectionType()I
    .locals 1

    .line 81
    iget v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mCurrentConnectionType:I

    return v0
.end method

.method public getCurrentDefaultNetId()J
    .locals 2

    .line 103
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-nez v0, :cond_0

    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->getDefaultNetId()J

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method public getCurrentNetworksAndTypes()[J
    .locals 1

    .line 116
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [J

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->getNetworksAndTypes()[J

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method notifyObserversOfConnectionCostChange(I)V
    .locals 5
    .param p1, "newConnectionCost"    # I

    .line 348
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 349
    .local v1, "nativeChangeNotifier":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifierJni;->get()Lorg/chromium/net/NetworkChangeNotifier$Natives;

    move-result-object v2

    .line 350
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 349
    invoke-interface {v2, v3, v4, p0, p1}, Lorg/chromium/net/NetworkChangeNotifier$Natives;->notifyConnectionCostChanged(JLorg/chromium/net/NetworkChangeNotifier;I)V

    .line 351
    .end local v1    # "nativeChangeNotifier":Ljava/lang/Long;
    goto :goto_0

    .line 352
    :cond_0
    return-void
.end method

.method notifyObserversOfConnectionSubtypeChange(I)V
    .locals 5
    .param p1, "connectionSubtype"    # I

    .line 358
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 359
    .local v1, "nativeChangeNotifier":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifierJni;->get()Lorg/chromium/net/NetworkChangeNotifier$Natives;

    move-result-object v2

    .line 360
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 359
    invoke-interface {v2, v3, v4, p0, p1}, Lorg/chromium/net/NetworkChangeNotifier$Natives;->notifyMaxBandwidthChanged(JLorg/chromium/net/NetworkChangeNotifier;I)V

    .line 361
    .end local v1    # "nativeChangeNotifier":Ljava/lang/Long;
    goto :goto_0

    .line 362
    :cond_0
    return-void
.end method

.method notifyObserversOfConnectionTypeChange(I)V
    .locals 2
    .param p1, "newConnectionType"    # I

    .line 326
    invoke-virtual {p0}, Lorg/chromium/net/NetworkChangeNotifier;->getCurrentDefaultNetId()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lorg/chromium/net/NetworkChangeNotifier;->notifyObserversOfConnectionTypeChange(IJ)V

    .line 327
    return-void
.end method

.method notifyObserversOfNetworkConnect(JI)V
    .locals 9
    .param p1, "netId"    # J
    .param p3, "connectionType"    # I

    .line 368
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 369
    .local v1, "nativeChangeNotifier":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifierJni;->get()Lorg/chromium/net/NetworkChangeNotifier$Natives;

    move-result-object v2

    .line 370
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 369
    move-object v5, p0

    move-wide v6, p1

    move v8, p3

    .end local p1    # "netId":J
    .end local p3    # "connectionType":I
    .local v6, "netId":J
    .local v8, "connectionType":I
    invoke-interface/range {v2 .. v8}, Lorg/chromium/net/NetworkChangeNotifier$Natives;->notifyOfNetworkConnect(JLorg/chromium/net/NetworkChangeNotifier;JI)V

    .line 371
    .end local v1    # "nativeChangeNotifier":Ljava/lang/Long;
    goto :goto_0

    .line 372
    .end local v6    # "netId":J
    .end local v8    # "connectionType":I
    .restart local p1    # "netId":J
    .restart local p3    # "connectionType":I
    :cond_0
    return-void
.end method

.method notifyObserversOfNetworkDisconnect(J)V
    .locals 8
    .param p1, "netId"    # J

    .line 388
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 389
    .local v1, "nativeChangeNotifier":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifierJni;->get()Lorg/chromium/net/NetworkChangeNotifier$Natives;

    move-result-object v2

    .line 390
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 389
    move-object v5, p0

    move-wide v6, p1

    .end local p1    # "netId":J
    .local v6, "netId":J
    invoke-interface/range {v2 .. v7}, Lorg/chromium/net/NetworkChangeNotifier$Natives;->notifyOfNetworkDisconnect(JLorg/chromium/net/NetworkChangeNotifier;J)V

    .line 391
    .end local v1    # "nativeChangeNotifier":Ljava/lang/Long;
    goto :goto_0

    .line 392
    .end local v6    # "netId":J
    .restart local p1    # "netId":J
    :cond_0
    return-void
.end method

.method notifyObserversOfNetworkSoonToDisconnect(J)V
    .locals 8
    .param p1, "netId"    # J

    .line 378
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 379
    .local v1, "nativeChangeNotifier":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifierJni;->get()Lorg/chromium/net/NetworkChangeNotifier$Natives;

    move-result-object v2

    .line 380
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 379
    move-object v5, p0

    move-wide v6, p1

    .end local p1    # "netId":J
    .local v6, "netId":J
    invoke-interface/range {v2 .. v7}, Lorg/chromium/net/NetworkChangeNotifier$Natives;->notifyOfNetworkSoonToDisconnect(JLorg/chromium/net/NetworkChangeNotifier;J)V

    .line 381
    .end local v1    # "nativeChangeNotifier":Ljava/lang/Long;
    goto :goto_0

    .line 382
    .end local v6    # "netId":J
    .restart local p1    # "netId":J
    :cond_0
    return-void
.end method

.method notifyObserversToPurgeActiveNetworkList([J)V
    .locals 5
    .param p1, "activeNetIds"    # [J

    .line 401
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 402
    .local v1, "nativeChangeNotifier":Ljava/lang/Long;
    invoke-static {}, Lorg/chromium/net/NetworkChangeNotifierJni;->get()Lorg/chromium/net/NetworkChangeNotifier$Natives;

    move-result-object v2

    .line 403
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    .line 402
    invoke-interface {v2, v3, v4, p0, p1}, Lorg/chromium/net/NetworkChangeNotifier$Natives;->notifyPurgeActiveNetworkList(JLorg/chromium/net/NetworkChangeNotifier;[J)V

    .line 404
    .end local v1    # "nativeChangeNotifier":Ljava/lang/Long;
    goto :goto_0

    .line 405
    :cond_0
    return-void
.end method

.method public registerNetworkCallbackFailed()Z
    .locals 1

    .line 141
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mAutoDetector:Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    invoke-virtual {v0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect;->registerNetworkCallbackFailed()Z

    move-result v0

    :goto_0
    return v0
.end method

.method public removeNativeObserver(J)V
    .locals 2
    .param p1, "nativeChangeNotifier"    # J

    .line 132
    iget-object v0, p0, Lorg/chromium/net/NetworkChangeNotifier;->mNativeChangeNotifiers:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 133
    return-void
.end method
