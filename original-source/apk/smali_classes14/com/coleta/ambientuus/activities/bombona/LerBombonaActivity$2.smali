.class Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$2;
.super Landroidx/activity/OnBackPressedCallback;
.source "LerBombonaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;
    .param p2, "enabled"    # Z

    .line 108
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 4

    .line 111
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 112
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->finish()V

    .line 113
    return-void
.end method
