.class public final Lorg/chromium/net/impl/NoOpLogger;
.super Lorg/chromium/net/impl/CronetLogger;
.source "NoOpLogger.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lorg/chromium/net/impl/CronetLogger;-><init>()V

    return-void
.end method


# virtual methods
.method public logCronetEngineCreation(ILorg/chromium/net/impl/CronetLogger$CronetEngineBuilderInfo;Lorg/chromium/net/impl/CronetLogger$CronetVersion;Lorg/chromium/net/impl/CronetLogger$CronetSource;)V
    .locals 0
    .param p1, "cronetEngineId"    # I
    .param p2, "engineBuilderInfo"    # Lorg/chromium/net/impl/CronetLogger$CronetEngineBuilderInfo;
    .param p3, "version"    # Lorg/chromium/net/impl/CronetLogger$CronetVersion;
    .param p4, "source"    # Lorg/chromium/net/impl/CronetLogger$CronetSource;

    .line 14
    return-void
.end method

.method public logCronetTrafficInfo(ILorg/chromium/net/impl/CronetLogger$CronetTrafficInfo;)V
    .locals 0
    .param p1, "cronetEngineId"    # I
    .param p2, "trafficInfo"    # Lorg/chromium/net/impl/CronetLogger$CronetTrafficInfo;

    .line 17
    return-void
.end method
