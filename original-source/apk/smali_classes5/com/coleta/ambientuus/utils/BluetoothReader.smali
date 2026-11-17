.class public Lcom/coleta/ambientuus/utils/BluetoothReader;
.super Ljava/lang/Object;
.source "BluetoothReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;
    }
.end annotation


# instance fields
.field private bStop:Z

.field private final executor:Ljava/util/concurrent/ExecutorService;

.field private final mBTSocket:Landroid/bluetooth/BluetoothSocket;


# direct methods
.method public static synthetic $r8$lambda$tOYadpXGFtjXB-t1IhpFcZZlstU(Lcom/coleta/ambientuus/utils/BluetoothReader;Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/utils/BluetoothReader;->lambda$startReading$0(Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V

    return-void
.end method

.method public constructor <init>(Landroid/bluetooth/BluetoothSocket;)V
    .locals 1
    .param p1, "socket"    # Landroid/bluetooth/BluetoothSocket;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->bStop:Z

    .line 19
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->executor:Ljava/util/concurrent/ExecutorService;

    .line 22
    iput-object p1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    .line 23
    return-void
.end method

.method private synthetic lambda$startReading$0(Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V
    .locals 7
    .param p1, "listener"    # Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;

    .line 28
    const/4 v0, 0x0

    .line 30
    .local v0, "inputStream":Ljava/io/InputStream;
    :try_start_0
    iget-object v1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    move-object v0, v1

    .line 31
    const/16 v1, 0x96

    new-array v1, v1, [B

    .line 33
    .local v1, "buffer":[B
    :goto_0
    iget-boolean v2, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->bStop:Z

    if-nez v2, :cond_1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_1

    .line 34
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v2

    if-lez v2, :cond_0

    .line 35
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 36
    .local v2, "bytesRead":I
    if-lez v2, :cond_0

    .line 37
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4, v2}, Ljava/lang/String;-><init>([BII)V

    .line 38
    .local v3, "rawInput":Ljava/lang/String;
    const-string v4, "."

    const-string v5, ","

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "[^\\d,]"

    const-string v6, " "

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 40
    .local v4, "cleaned":Ljava/lang/String;
    invoke-interface {p1, v4}, Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;->onRead(Ljava/lang/String;)V

    .line 41
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->bStop:Z

    .line 45
    .end local v2    # "bytesRead":I
    .end local v3    # "rawInput":Ljava/lang/String;
    .end local v4    # "cleaned":Ljava/lang/String;
    :cond_0
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 46
    iget-object v2, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 53
    .end local v1    # "buffer":[B
    :cond_1
    if-eqz v0, :cond_2

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 54
    :cond_2
    iget-object v1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 57
    :cond_3
    :goto_1
    goto :goto_2

    .line 55
    :catch_0
    move-exception v1

    .line 56
    .local v1, "e":Ljava/io/IOException;
    invoke-interface {p1, v1}, Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;->onError(Ljava/lang/Exception;)V

    .line 58
    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_2

    .line 52
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 49
    :catch_1
    move-exception v1

    .line 50
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-interface {p1, v1}, Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;->onError(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    .end local v1    # "e":Ljava/lang/Exception;
    if-eqz v0, :cond_4

    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 54
    :cond_4
    iget-object v1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 59
    :goto_2
    return-void

    .line 53
    :goto_3
    if-eqz v0, :cond_5

    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 54
    :cond_5
    iget-object v2, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->mBTSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothSocket;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 57
    :cond_6
    goto :goto_4

    .line 55
    :catch_2
    move-exception v2

    .line 56
    .local v2, "e":Ljava/io/IOException;
    invoke-interface {p1, v2}, Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;->onError(Ljava/lang/Exception;)V

    .line 58
    .end local v2    # "e":Ljava/io/IOException;
    :goto_4
    throw v1
.end method


# virtual methods
.method public startReading(Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->bStop:Z

    .line 27
    iget-object v0, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->executor:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/coleta/ambientuus/utils/BluetoothReader$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/utils/BluetoothReader$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/utils/BluetoothReader;Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 60
    return-void
.end method

.method public stopReading()V
    .locals 1

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->bStop:Z

    .line 64
    iget-object v0, p0, Lcom/coleta/ambientuus/utils/BluetoothReader;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 65
    return-void
.end method
