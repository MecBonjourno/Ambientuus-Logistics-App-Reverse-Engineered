.class Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;
.super Ljava/lang/Object;
.source "IniciarColetaActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReadInput"
.end annotation


# instance fields
.field private t:Ljava/lang/Thread;

.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;


# direct methods
.method public static synthetic $r8$lambda$eD-HjwWuAfiqipdaNgUuiKLkvXg(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->lambda$run$0(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)V
    .locals 1

    .line 746
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 747
    new-instance p1, Ljava/lang/Thread;

    const-string v0, "Input Thread"

    invoke-direct {p1, p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->t:Ljava/lang/Thread;

    .line 748
    iget-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->t:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 749
    return-void
.end method

.method private synthetic lambda$run$0(Ljava/lang/String;)V
    .locals 5
    .param p1, "strInput"    # Ljava/lang/String;

    .line 766
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/google/android/material/textfield/TextInputEditText;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 767
    const-string v0, "."

    const-string v1, ","

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "[^\\d,]"

    const-string v2, " "

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x21

    const/16 v2, 0x26

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 768
    .local v0, "sanatizedInput":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/google/android/material/textfield/TextInputEditText;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/TextInputEditText;->setText(Ljava/lang/CharSequence;)V

    .line 769
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputbStop(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Z)V

    .line 770
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/google/android/material/textfield/TextInputEditText;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/material/textfield/TextInputEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    .line 771
    .local v1, "txtLength":I
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmMaxChars(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)I

    move-result v2

    if-le v1, v2, :cond_0

    .line 772
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/google/android/material/textfield/TextInputEditText;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/material/textfield/TextInputEditText;->getEditableText()Landroid/text/Editable;

    move-result-object v2

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmMaxChars(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)I

    move-result v3

    sub-int v3, v1, v3

    const/4 v4, 0x0

    invoke-interface {v2, v4, v3}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 774
    :cond_0
    return-void
.end method


# virtual methods
.method public isRunning()Z
    .locals 1

    .line 752
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->t:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    return v0
.end method

.method public run()V
    .locals 5

    .line 759
    :try_start_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 760
    .local v0, "inputStream":Ljava/io/InputStream;
    :goto_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetbStop(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 761
    const/16 v1, 0x96

    new-array v2, v1, [B

    .line 762
    .local v2, "buffer":[B
    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v3

    if-lez v3, :cond_0

    .line 763
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    .line 764
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4, v1}, Ljava/lang/String;-><init>([BII)V

    .line 765
    .local v3, "strInput":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgettiePeso(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Lcom/google/android/material/textfield/TextInputEditText;

    move-result-object v1

    new-instance v4, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, v3}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Lcom/google/android/material/textfield/TextInputEditText;->post(Ljava/lang/Runnable;)Z

    .line 776
    .end local v3    # "strInput":Ljava/lang/String;
    :cond_0
    const-wide/16 v3, 0x3e8

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 777
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fgetmBTSocket(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v1

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 778
    .end local v2    # "buffer":[B
    goto :goto_0

    .line 785
    :cond_1
    goto :goto_1

    .line 782
    .end local v0    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 783
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "InterruptedException"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 784
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 779
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 780
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "IOException"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 781
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 785
    .end local v0    # "e":Ljava/io/IOException;
    nop

    .line 786
    :goto_1
    return-void
.end method

.method public stop()V
    .locals 2

    .line 789
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;->-$$Nest$fputbStop(Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;Z)V

    .line 790
    return-void
.end method
