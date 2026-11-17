.class Lcom/coleta/ambientuus/activities/TelaAdmActivity$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "TelaAdmActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/TelaAdmActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/TelaAdmActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/TelaAdmActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/TelaAdmActivity;
    .param p2, "enabled"    # Z

    .line 63
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TelaAdmActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TelaAdmActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 4

    .line 66
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TelaAdmActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TelaAdmActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/TelaAdmActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TelaAdmActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->startActivity(Landroid/content/Intent;)V

    .line 67
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TelaAdmActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TelaAdmActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/TelaAdmActivity;->finish()V

    .line 68
    return-void
.end method
