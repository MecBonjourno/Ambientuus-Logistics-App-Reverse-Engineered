.class Lcom/coleta/ambientuus/activities/main/MainActivity$6;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/main/MainActivity;->createDialogSenha()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/main/MainActivity;

    .line 720
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$6;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 723
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$6;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetsenhaAdm(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 724
    .local v0, "verificaSenha":Ljava/lang/String;
    const-string v1, "@tenas66"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 725
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$6;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/TelaAdmActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 726
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$6;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-virtual {v2, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 727
    .end local v1    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 728
    :cond_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$6;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetdialog(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 730
    :goto_0
    return-void
.end method
