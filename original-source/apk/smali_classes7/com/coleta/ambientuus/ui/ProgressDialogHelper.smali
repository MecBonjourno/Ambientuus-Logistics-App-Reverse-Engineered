.class public Lcom/coleta/ambientuus/ui/ProgressDialogHelper;
.super Ljava/lang/Object;
.source "ProgressDialogHelper.java"


# instance fields
.field private dialog:Landroid/app/AlertDialog;

.field private messageText:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dismissProgress()V
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    iget-object v0, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 41
    :cond_0
    return-void
.end method

.method public showProgress(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .line 16
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 17
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    .line 19
    .local v1, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lcom/coleta/ambientuus/R$layout;->progress_dialog:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 20
    .local v2, "dialogView":Landroid/view/View;
    sget v3, Lcom/coleta/ambientuus/R$id;->progress_message:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->messageText:Landroid/widget/TextView;

    .line 21
    iget-object v3, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->messageText:Landroid/widget/TextView;

    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 24
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 25
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 27
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    iput-object v3, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dialog:Landroid/app/AlertDialog;

    .line 28
    iget-object v3, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 29
    return-void
.end method

.method public updateMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "newMessage"    # Ljava/lang/String;

    .line 32
    iget-object v0, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->messageText:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->messageText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    :cond_0
    return-void
.end method
