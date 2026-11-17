.class Lorg/chromium/net/AndroidNetworkLibrary$SocketFd$SocketImplFd;
.super Ljava/net/SocketImpl;
.source "AndroidNetworkLibrary.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/AndroidNetworkLibrary$SocketFd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SocketImplFd"
.end annotation


# direct methods
.method constructor <init>(Ljava/io/FileDescriptor;)V
    .locals 0
    .param p1, "fd"    # Ljava/io/FileDescriptor;

    .line 558
    invoke-direct {p0}, Ljava/net/SocketImpl;-><init>()V

    .line 559
    iput-object p1, p0, Lorg/chromium/net/AndroidNetworkLibrary$SocketFd$SocketImplFd;->fd:Ljava/io/FileDescriptor;

    .line 560
    return-void
.end method


# virtual methods
.method protected accept(Ljava/net/SocketImpl;)V
    .locals 2
    .param p1, "s"    # Ljava/net/SocketImpl;

    .line 564
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "accept not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected available()I
    .locals 2

    .line 568
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "accept not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected bind(Ljava/net/InetAddress;I)V
    .locals 2
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I

    .line 572
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "accept not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected close()V
    .locals 0

    .line 575
    return-void
.end method

.method protected connect(Ljava/lang/String;I)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I

    .line 586
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "connect not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected connect(Ljava/net/InetAddress;I)V
    .locals 2
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I

    .line 578
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "connect not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected connect(Ljava/net/SocketAddress;I)V
    .locals 2
    .param p1, "address"    # Ljava/net/SocketAddress;
    .param p2, "timeout"    # I

    .line 582
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "connect not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected create(Z)V
    .locals 0
    .param p1, "stream"    # Z

    .line 589
    return-void
.end method

.method protected getInputStream()Ljava/io/InputStream;
    .locals 2

    .line 592
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "getInputStream not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getOption(I)Ljava/lang/Object;
    .locals 2
    .param p1, "optID"    # I

    .line 608
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "getOption not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getOutputStream()Ljava/io/OutputStream;
    .locals 2

    .line 596
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "getOutputStream not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected listen(I)V
    .locals 2
    .param p1, "backlog"    # I

    .line 600
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "listen not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected sendUrgentData(I)V
    .locals 2
    .param p1, "data"    # I

    .line 604
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "sendUrgentData not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOption(ILjava/lang/Object;)V
    .locals 2
    .param p1, "optID"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .line 612
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "setOption not implemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
