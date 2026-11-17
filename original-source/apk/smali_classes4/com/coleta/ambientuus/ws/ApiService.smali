.class public interface abstract Lcom/coleta/ambientuus/ws/ApiService;
.super Ljava/lang/Object;
.source "ApiService.java"


# virtual methods
.method public abstract getBombonas()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/BombonaList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listaBombonasLiberadas"
    .end annotation
.end method

.method public abstract getClientesMTR()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/ClienteMTRList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listaclientemtr"
    .end annotation
.end method

.method public abstract getConsultaEtiqueta(Ljava/lang/String;)Lretrofit2/Call;
    .param p1    # Ljava/lang/String;
        .annotation runtime Lretrofit2/http/Query;
            value = "etiqueta"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/BombonaClienteList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "consulta-etiqueta"
    .end annotation
.end method

.method public abstract getManifesto(ILjava/lang/String;)Lretrofit2/Call;
    .param p1    # I
        .annotation runtime Lretrofit2/http/Query;
            value = "id_rota"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lretrofit2/http/Query;
            value = "data_coleta"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/ManifestoList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listaManifesto"
    .end annotation
.end method

.method public abstract getMotorista()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/MotoristaList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listamotoristas"
    .end annotation
.end method

.method public abstract getPlacas()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/PlacasList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listaplaca"
    .end annotation
.end method

.method public abstract getPontoColeta(ILjava/lang/String;)Lretrofit2/Call;
    .param p1    # I
        .annotation runtime Lretrofit2/http/Query;
            value = "id_rota"
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Lretrofit2/http/Query;
            value = "data_coleta"
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/PontoColetaList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "pontos-coleta"
    .end annotation
.end method

.method public abstract getRotas()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/RotaList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listarotas"
    .end annotation
.end method

.method public abstract getTelas()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/TelasList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "controleTelas"
    .end annotation
.end method

.method public abstract getTerceiros()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/TerceiroList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listaterceiros"
    .end annotation
.end method

.method public abstract getTipoResiduo()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/TipoResiduoList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "tipos-residuos"
    .end annotation
.end method

.method public abstract getVolumes()Lretrofit2/Call;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/VolumeList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/GET;
        value = "listavolumes"
    .end annotation
.end method

.method public abstract postBombona(Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;)Lretrofit2/Call;
    .param p1    # Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;
        .annotation runtime Lretrofit2/http/Body;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;",
            ")",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/MovimentoBombonaList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "inseriMovimentoBombona"
    .end annotation
.end method

.method public abstract postColeta(Lcom/coleta/ambientuus/dto/list/ColetaList;)Lretrofit2/Call;
    .param p1    # Lcom/coleta/ambientuus/dto/list/ColetaList;
        .annotation runtime Lretrofit2/http/Body;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/coleta/ambientuus/dto/list/ColetaList;",
            ")",
            "Lretrofit2/Call<",
            "Lcom/coleta/ambientuus/dto/list/ColetaList;",
            ">;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "insericoletas"
    .end annotation
.end method
