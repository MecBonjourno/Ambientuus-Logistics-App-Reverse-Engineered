.class Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$2;
.super Ljava/lang/Object;
.source "LeitorBombonaActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->handleResult(Lcom/google/zxing/Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    .line 106
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 108
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 109
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    const-class v2, Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 110
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    const/16 v2, 0x7b

    invoke-virtual {v1, v2, v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->setResult(ILandroid/content/Intent;)V

    .line 111
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->finish()V

    .line 112
    return-void
.end method
