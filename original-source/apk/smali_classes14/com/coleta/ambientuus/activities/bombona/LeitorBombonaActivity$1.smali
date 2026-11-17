.class Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "LeitorBombonaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;
    .param p2, "enabled"    # Z

    .line 53
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 5

    .line 56
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetorigem(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "A"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "IdPessoaClienteSelecionado"

    const-string v2, "ClienteSelectinado"

    if-eqz v0, :cond_0

    .line 57
    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    const-class v4, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 59
    .local v0, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetclienteSelectinado(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 60
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetidClienteSel(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 61
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 62
    .end local v0    # "intent":Landroid/content/Intent;
    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetorigem(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "TR"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetorigem(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "B"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 65
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 69
    :cond_2
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetorigem(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "TC"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 70
    new-instance v0, Landroid/content/Intent;

    iget-object v3, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    const-class v4, Lcom/coleta/ambientuus/activities/TerceirosActivity;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 72
    .restart local v0    # "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetclienteSelectinado(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 73
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetidClienteSel(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 74
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 75
    :cond_3
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$fgetorigem(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "L"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 76
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 75
    :cond_4
    :goto_0
    nop

    .line 78
    :goto_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->finish()V

    .line 79
    return-void
.end method
