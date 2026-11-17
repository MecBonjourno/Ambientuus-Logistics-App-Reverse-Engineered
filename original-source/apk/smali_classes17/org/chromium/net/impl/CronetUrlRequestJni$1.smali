.class Lorg/chromium/net/impl/CronetUrlRequestJni$1;
.super Ljava/lang/Object;
.source "CronetUrlRequestJni.java"

# interfaces
.implements Lorg/jni_zero/JniStaticTestMocker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/impl/CronetUrlRequestJni;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/jni_zero/JniStaticTestMocker<",
        "Lorg/chromium/net/impl/CronetUrlRequest$Natives;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic setInstanceForTesting(Ljava/lang/Object;)V
    .locals 0

    .line 46
    check-cast p1, Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    invoke-virtual {p0, p1}, Lorg/chromium/net/impl/CronetUrlRequestJni$1;->setInstanceForTesting(Lorg/chromium/net/impl/CronetUrlRequest$Natives;)V

    return-void
.end method

.method public setInstanceForTesting(Lorg/chromium/net/impl/CronetUrlRequest$Natives;)V
    .locals 2
    .param p1, "instance"    # Lorg/chromium/net/impl/CronetUrlRequest$Natives;

    .line 49
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->TESTING_ENABLED:Z

    if-eqz v0, :cond_0

    .line 53
    invoke-static {p1}, Lorg/chromium/net/impl/CronetUrlRequestJni;->-$$Nest$sfputtestInstance(Lorg/chromium/net/impl/CronetUrlRequest$Natives;)V

    .line 54
    return-void

    .line 50
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Tried to set a JNI mock when mocks aren\'t enabled!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
