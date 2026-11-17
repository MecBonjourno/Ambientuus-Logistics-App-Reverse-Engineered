.class Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$2;
.super Landroidx/activity/OnBackPressedCallback;
.source "BaixaBombonaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;
    .param p2, "enabled"    # Z

    .line 90
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 3

    .line 93
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 94
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 95
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;->finish()V

    .line 96
    return-void
.end method
