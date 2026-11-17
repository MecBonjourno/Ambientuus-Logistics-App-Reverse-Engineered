.class Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$3;
.super Landroidx/activity/OnBackPressedCallback;
.source "TerceirosActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;
    .param p2, "enabled"    # Z

    .line 328
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$3;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 4

    .line 331
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$3;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$3;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->startActivity(Landroid/content/Intent;)V

    .line 332
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$3;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->finish()V

    .line 333
    return-void
.end method
