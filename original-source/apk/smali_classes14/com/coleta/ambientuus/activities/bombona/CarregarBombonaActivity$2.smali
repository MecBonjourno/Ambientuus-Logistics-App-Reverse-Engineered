.class Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$2;
.super Landroidx/activity/OnBackPressedCallback;
.source "CarregarBombonaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;
    .param p2, "enabled"    # Z

    .line 87
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 4

    .line 90
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 91
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->finish()V

    .line 92
    return-void
.end method
