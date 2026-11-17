.class Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$2;
.super Ljava/lang/Object;
.source "ListagemPontoColetaActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initSearchView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    .line 281
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "editable"    # Landroid/text/Editable;

    .line 299
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 285
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 289
    if-eqz p1, :cond_0

    .line 290
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->-$$Nest$mfilterPontosColeta(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 292
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$2;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->-$$Nest$fgetpontoColetas(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->-$$Nest$mrefreshRecyclerView(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Ljava/util/ArrayList;)V

    .line 294
    :goto_0
    return-void
.end method
