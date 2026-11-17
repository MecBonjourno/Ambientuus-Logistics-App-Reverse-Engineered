.class public final Lorg/chromium/net/HttpUtil;
.super Ljava/lang/Object;
.source "HttpUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/HttpUtil$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "net"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isAllowedHeader(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "headerName"    # Ljava/lang/String;
    .param p1, "headerValue"    # Ljava/lang/String;

    .line 24
    invoke-static {}, Lorg/chromium/net/HttpUtilJni;->get()Lorg/chromium/net/HttpUtil$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/net/HttpUtil$Natives;->isAllowedHeader(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
