.class Lorg/chromium/net/HttpUtilJni$1;
.super Ljava/lang/Object;
.source "HttpUtilJni.java"

# interfaces
.implements Lorg/jni_zero/JniStaticTestMocker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/HttpUtilJni;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/jni_zero/JniStaticTestMocker<",
        "Lorg/chromium/net/HttpUtil$Natives;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic setInstanceForTesting(Ljava/lang/Object;)V
    .locals 0

    .line 18
    check-cast p1, Lorg/chromium/net/HttpUtil$Natives;

    invoke-virtual {p0, p1}, Lorg/chromium/net/HttpUtilJni$1;->setInstanceForTesting(Lorg/chromium/net/HttpUtil$Natives;)V

    return-void
.end method

.method public setInstanceForTesting(Lorg/chromium/net/HttpUtil$Natives;)V
    .locals 2
    .param p1, "instance"    # Lorg/chromium/net/HttpUtil$Natives;

    .line 21
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->TESTING_ENABLED:Z

    if-eqz v0, :cond_0

    .line 25
    invoke-static {p1}, Lorg/chromium/net/HttpUtilJni;->-$$Nest$sfputtestInstance(Lorg/chromium/net/HttpUtil$Natives;)V

    .line 26
    return-void

    .line 22
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Tried to set a JNI mock when mocks aren\'t enabled!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
