.class Lorg/chromium/net/impl/CronetUrlRequestJni;
.super Ljava/lang/Object;
.source "CronetUrlRequestJni.java"

# interfaces
.implements Lorg/chromium/net/impl/CronetUrlRequest$Natives;


# static fields
.field public static final TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jni_zero/JniStaticTestMocker<",
            "Lorg/chromium/net/impl/CronetUrlRequest$Natives;",
            ">;"
        }
    .end annotation
.end field

.field private static testInstance:Lorg/chromium/net/impl/CronetUrlRequest$Natives;


# direct methods
.method static bridge synthetic -$$Nest$sfputtestInstance(Lorg/chromium/net/impl/CronetUrlRequest$Natives;)V
    .locals 0

    sput-object p0, Lorg/chromium/net/impl/CronetUrlRequestJni;->testInstance:Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 45
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequestJni$1;

    invoke-direct {v0}, Lorg/chromium/net/impl/CronetUrlRequestJni$1;-><init>()V

    sput-object v0, Lorg/chromium/net/impl/CronetUrlRequestJni;->TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lorg/chromium/net/impl/CronetUrlRequest$Natives;
    .locals 2

    .line 98
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->TESTING_ENABLED:Z

    if-eqz v0, :cond_2

    .line 99
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestJni;->testInstance:Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    if-eqz v0, :cond_0

    .line 100
    sget-object v0, Lorg/chromium/net/impl/CronetUrlRequestJni;->testInstance:Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    return-object v0

    .line 102
    :cond_0
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->REQUIRE_MOCK:Z

    if-nez v0, :cond_1

    goto :goto_0

    .line 103
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "No mock found for the native implementation of CronetUrlRequest.Natives. The current configuration requires implementations be mocked."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_2
    :goto_0
    invoke-static {}, Lorg/jni_zero/NativeLibraryLoadedStatus;->checkLoaded()V

    .line 109
    new-instance v0, Lorg/chromium/net/impl/CronetUrlRequestJni;

    invoke-direct {v0}, Lorg/chromium/net/impl/CronetUrlRequestJni;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addRequestHeader(JLorg/chromium/net/impl/CronetUrlRequest;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "value"    # Ljava/lang/String;

    .line 59
    invoke-static {p1, p2, p3, p4, p5}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_addRequestHeader(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public createRequestAdapter(Lorg/chromium/net/impl/CronetUrlRequest;JLjava/lang/String;IZZZIZIIJ)J
    .locals 2
    .param p1, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;
    .param p2, "urlRequestContextAdapter"    # J
    .param p4, "url"    # Ljava/lang/String;
    .param p5, "priority"    # I
    .param p6, "disableCache"    # Z
    .param p7, "disableConnectionMigration"    # Z
    .param p8, "trafficStatsTagSet"    # Z
    .param p9, "trafficStatsTag"    # I
    .param p10, "trafficStatsUidSet"    # Z
    .param p11, "trafficStatsUid"    # I
    .param p12, "idempotency"    # I
    .param p13, "networkHandle"    # J

    .line 64
    invoke-static/range {p1 .. p14}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_createRequestAdapter(Ljava/lang/Object;JLjava/lang/String;IZZZIZIIJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public destroy(JLorg/chromium/net/impl/CronetUrlRequest;Z)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;
    .param p4, "sendOnCanceled"    # Z

    .line 69
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_destroy(JLjava/lang/Object;Z)V

    .line 70
    return-void
.end method

.method public followDeferredRedirect(JLorg/chromium/net/impl/CronetUrlRequest;)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;

    .line 74
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_followDeferredRedirect(JLjava/lang/Object;)V

    .line 75
    return-void
.end method

.method public getStatus(JLorg/chromium/net/impl/CronetUrlRequest;Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;
    .param p4, "listener"    # Lorg/chromium/net/impl/VersionSafeCallbacks$UrlRequestStatusListener;

    .line 79
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_getStatus(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 80
    return-void
.end method

.method public readData(JLorg/chromium/net/impl/CronetUrlRequest;Ljava/nio/ByteBuffer;II)Z
    .locals 1
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;
    .param p4, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p5, "position"    # I
    .param p6, "capacity"    # I

    .line 84
    invoke-static/range {p1 .. p6}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_readData(JLjava/lang/Object;Ljava/lang/Object;II)Z

    move-result v0

    return v0
.end method

.method public setHttpMethod(JLorg/chromium/net/impl/CronetUrlRequest;Ljava/lang/String;)Z
    .locals 1
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;
    .param p4, "method"    # Ljava/lang/String;

    .line 89
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_setHttpMethod(JLjava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public start(JLorg/chromium/net/impl/CronetUrlRequest;)V
    .locals 0
    .param p1, "nativePtr"    # J
    .param p3, "caller"    # Lorg/chromium/net/impl/CronetUrlRequest;

    .line 94
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_net_impl_CronetUrlRequest_start(JLjava/lang/Object;)V

    .line 95
    return-void
.end method
