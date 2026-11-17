.class Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "ListagemPontoColetaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initScreen()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;
    .param p2, "enabled"    # Z

    .line 100
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 4

    .line 103
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    const-class v3, Lcom/coleta/ambientuus/activities/main/SelecaoActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 104
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->finish()V

    .line 105
    return-void
.end method
