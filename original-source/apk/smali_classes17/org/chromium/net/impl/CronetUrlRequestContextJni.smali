.class Lorg/chromium/net/impl/CronetUrlRequestContextJni;
.super Ljava/lang/Object;
.source "CronetUrlRequestContextJni.java"

# interfaces
.implements Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;


# static fields
.field public static final TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jni_zero/JniStaticTestMocker<",
            "Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;",
            ">;"
        }
    .end annotation
.end field

.field private static testInstance:Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;


# direct methods
.method static bridge synthetic -$$Nest$sfputtestInstance(Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;)V
    .locals 0

    sput-object p0, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->testInstance:Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 55
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequestContextJni$1;

    invoke-direct {v0}, Lorg/chromium/net/impl/CronetUrlRequestContextJni$1;-><init>()V

    sput-object v0, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;
    .locals 2

    .line 138
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->TESTING_ENABLED:Z

    if-eqz v0, :cond_2

    .line 139
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->testInstance:Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    if-eqz v0, :cond_0

    .line 140
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestContextJni;->testInstance:Lorg/chromium/net/impl/CronetUrlRequestContext$Natives;

    return-object v0

    .line 142
    :cond_0
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->REQUIRE_MOCK:Z

    if-nez v0, :cond_1

    goto :goto_0

    .line 143
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "No mock found for the native implementation of CronetUrlRequestContext.Natives. The current configuration requires implementations be mocked."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_2
    :goto_0
    invoke-static {}, Lorg/jni_zero/NativeLibraryLoadedStatus;->checkLoaded()V

    .line 149
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequestContextJni;

    invoke-direct {v0}, Lorg/chromium/net/impl/CronetUrlRequestContextJni;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addPkp(JLjava/lang/String;[[BZJ)V
    .locals 0
    .param p1, "urlRequestContextConfig"    # J
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "hashes"    # [[B
    .param p5, "includeSubdomains"    # Z
    .param p6, "expirationTime"    # J

    .line 69
    invoke-static/range {p1 .. p7}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_addPkp(JLjava/lang/String;[[BZJ)V

    .line 70
    return-void
.end method

.method public addQuicHint(JLjava/lang/String;II)V
    .locals 0
    .param p1, "urlRequestContextConfig"    # J
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .param p5, "alternatePort"    # I

    .line 74
    invoke-static {p1, p2, p3, p4, p5}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_addQuicHint(JLjava/lang/String;II)V

    .line 75
    return-void
.end method

.method public configureNetworkQualityEstimatorForTesting(JLorg/chromium/net/impl/CronetUrlRequestContext;ZZZ)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;
    .param p4, "useLocalHostRequests"    # Z
    .param p5, "useSmallerResponses"    # Z
    .param p6, "disableOfflineCheck"    # Z

    .line 79
    invoke-static/range {p1 .. p6}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_configureNetworkQualityEstimatorForTesting(JLjava/lang/Object;ZZZ)V

    .line 80
    return-void
.end method

.method public createRequestContextAdapter(J)J
    .locals 2
    .param p1, "urlRequestContextConfig"    # J

    .line 84
    invoke-static {p1, p2}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_createRequestContextAdapter(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public createRequestContextConfig([B)J
    .locals 2
    .param p1, "serializedRequestContextConfigOptions"    # [B

    .line 89
    invoke-static {p1}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_createRequestContextConfig([B)J

    move-result-wide v0

    return-wide v0
.end method

.method public destroy(JLorg/chromium/net/impl/CronetUrlRequestContext;)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 94
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_destroy(JLjava/lang/Object;)V

    .line 95
    return-void
.end method

.method public getEnableTelemetry(JLorg/chromium/net/impl/CronetUrlRequestContext;)Z
    .locals 1
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 99
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_getEnableTelemetry(JLjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getHistogramDeltas()[B
    .locals 1

    .line 104
    invoke-static {}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_getHistogramDeltas()[B

    move-result-object v0

    return-object v0
.end method

.method public initRequestContextOnInitThread(JLorg/chromium/net/impl/CronetUrlRequestContext;)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 109
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_initRequestContextOnInitThread(JLjava/lang/Object;)V

    .line 110
    return-void
.end method

.method public provideRTTObservations(JLorg/chromium/net/impl/CronetUrlRequestContext;Z)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;
    .param p4, "should"    # Z

    .line 114
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_provideRTTObservations(JLjava/lang/Object;Z)V

    .line 115
    return-void
.end method

.method public provideThroughputObservations(JLorg/chromium/net/impl/CronetUrlRequestContext;Z)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;
    .param p4, "should"    # Z

    .line 119
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_provideThroughputObservations(JLjava/lang/Object;Z)V

    .line 120
    return-void
.end method

.method public startNetLogToDisk(JLorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;ZI)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;
    .param p4, "dirPath"    # Ljava/lang/String;
    .param p5, "logAll"    # Z
    .param p6, "maxSize"    # I

    .line 124
    invoke-static/range {p1 .. p6}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_startNetLogToDisk(JLjava/lang/Object;Ljava/lang/String;ZI)V

    .line 125
    return-void
.end method

.method public startNetLogToFile(JLorg/chromium/net/impl/CronetUrlRequestContext;Ljava/lang/String;Z)Z
    .locals 1
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;
    .param p4, "fileName"    # Ljava/lang/String;
    .param p5, "logAll"    # Z

    .line 129
    invoke-static {p1, p2, p3, p4, p5}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_startNetLogToFile(JLjava/lang/Object;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public stopNetLog(JLorg/chromium/net/impl/CronetUrlRequestContext;)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequestContext;

    .line 134
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequestContext_stopNetLog(JLjava/lang/Object;)V

    .line 135
    return-void
.end method
