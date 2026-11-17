.class Lorg/chromium/base/TraceEventJni$1;
.super Ljava/lang/Object;
.source "TraceEventJni.java"

# interfaces
.implements Lorg/jni_zero/JniStaticTestMocker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/TraceEventJni;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/jni_zero/JniStaticTestMocker<",
        "Lorg/chromium/base/TraceEvent$Natives;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic setInstanceForTesting(Ljava/lang/Object;)V
    .locals 0

    .line 32
    check-cast p1, Lorg/chromium/base/TraceEvent$Natives;

    invoke-virtual {p0, p1}, Lorg/chromium/base/TraceEventJni$1;->setInstanceForTesting(Lorg/chromium/base/TraceEvent$Natives;)V

    return-void
.end method

.method public setInstanceForTesting(Lorg/chromium/base/TraceEvent$Natives;)V
    .locals 2
    .param p1, "instance"    # Lorg/chromium/base/TraceEvent$Natives;

    .line 35
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->TESTING_ENABLED:Z

    if-eqz v0, :cond_0

    .line 39
    invoke-static {p1}, Lorg/chromium/base/TraceEventJni;->-$$Nest$sfputtestInstance(Lorg/chromium/base/TraceEvent$Natives;)V

    .line 40
    return-void

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Tried to set a JNI mock when mocks aren\'t enabled!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
