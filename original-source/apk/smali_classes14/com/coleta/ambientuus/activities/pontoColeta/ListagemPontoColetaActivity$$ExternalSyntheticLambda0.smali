.class public final synthetic Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/lifecycle/Observer;


# instance fields
.field public final synthetic f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda0;->f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    return-void
.end method


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda0;->f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    check-cast p1, Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-static {v0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->$r8$lambda$KCZ0y0Edfvs8oPm9Ujtr0xRc1v0(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Lcom/coleta/ambientuus/domain/model/SyncState;)V

    return-void
.end method
