.class Lcom/coleta/ambientuus/activities/main/SelecaoActivity$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "SelecaoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/main/SelecaoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/main/SelecaoActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/main/SelecaoActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/main/SelecaoActivity;
    .param p2, "enabled"    # Z

    .line 98
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/main/SelecaoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 3

    .line 101
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/SelecaoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 102
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/SelecaoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-virtual {v1, v0}, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;->startActivity(Landroid/content/Intent;)V

    .line 103
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/main/SelecaoActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;->finish()V

    .line 104
    return-void
.end method
