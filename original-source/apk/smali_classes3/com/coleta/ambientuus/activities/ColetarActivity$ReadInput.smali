.class Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;
.super Ljava/lang/Object;
.source "ColetarActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadInput"
.end annotation


# instance fields
.field private t:Ljava/lang/Thread;

.field final synthetic this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;


# direct methods
.method public constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V
    .locals 1

    .line 867
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 868
    new-instance p1, Ljava/lang/Thread;

    const-string v0, "Input Thread"

    invoke-direct {p1, p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->t:Ljava/lang/Thread;

    .line 869
    iget-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->t:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 870
    return-void
.end method


# virtual methods
.method public isRunning()Z
    .locals 1

    .line 873
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->t:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    return v0
.end method

.method public run()V
    .locals 6

    .line 880
    :try_start_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 881
    .local v0, "inputStream":Ljava/io/InputStream;
    :goto_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetbStop(Lcom/coleta/ambientuus/activities/ColetarActivity;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 882
    const/16 v1, 0x96

    new-array v2, v1, [B

    .line 883
    .local v2, "buffer":[B
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v3

    if-lez v3, :cond_0

    .line 884
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    .line 885
    const/4 v3, 0x0

    .line 887
    .local v3, "i":I
    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5, v1}, Ljava/lang/String;-><init>([BII)V

    .line 888
    .local v4, "strInput":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgettvRecPeso(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v5, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;

    invoke-direct {v5, p0, v4}, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 901
    .end local v3    # "i":I
    .end local v4    # "strInput":Ljava/lang/String;
    :cond_0
    const-wide/16 v3, 0x3e8

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 902
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 903
    .end local v2    # "buffer":[B
    goto :goto_0

    .line 910
    :cond_1
    goto :goto_1

    .line 907
    .end local v0    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 908
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "InterruptedException"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 909
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 904
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 905
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "IOException"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 906
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 910
    .end local v0    # "e":Ljava/io/IOException;
    nop

    .line 911
    :goto_1
    return-void
.end method

.method public stop()V
    .locals 2

    .line 914
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputbStop(Lcom/coleta/ambientuus/activities/ColetarActivity;Z)V

    .line 915
    return-void
.end method
