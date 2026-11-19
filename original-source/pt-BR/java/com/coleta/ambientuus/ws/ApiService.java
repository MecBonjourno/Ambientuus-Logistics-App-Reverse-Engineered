package com.coleta.ambientuus.ws;

import com.coleta.ambientuus.dto.list.BombonaClienteList;
import com.coleta.ambientuus.dto.list.BombonaList;
import com.coleta.ambientuus.dto.list.ClienteMTRList;
import com.coleta.ambientuus.dto.list.ColetaList;
import com.coleta.ambientuus.dto.list.ManifestoList;
import com.coleta.ambientuus.dto.list.MotoristaList;
import com.coleta.ambientuus.dto.list.MovimentoBombonaList;
import com.coleta.ambientuus.dto.list.PlacasList;
import com.coleta.ambientuus.dto.list.PontoColetaList;
import com.coleta.ambientuus.dto.list.RotaList;
import com.coleta.ambientuus.dto.list.TelasList;
import com.coleta.ambientuus.dto.list.TerceiroList;
import com.coleta.ambientuus.dto.list.TipoResiduoList;
import com.coleta.ambientuus.dto.list.VolumeList;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Query;

/* carregado de: classes4.dex */
public interface ApiService {
    @GET("listaBombonasLiberadas")
    Call<BombonaList> getBombonas();

    @GET("listaclientemtr")
    Call<ClienteMTRList> getClientesMTR();

    @GET("consulta-etiqueta")
    Call<BombonaClienteList> getConsultaEtiqueta(@Query("etiqueta") String str);

    @GET("listaManifesto")
    Call<ManifestoList> getManifesto(@Query("id_rota") int i, @Query("data_coleta") String str);

    @GET("listamotoristas")
    Call<MotoristaList> getMotorista();

    @GET("listaplaca")
    Call<PlacasList> getPlacas();

    @GET("pontos-coleta")
    Call<PontoColetaList> getPontoColeta(@Query("id_rota") int i, @Query("data_coleta") String str);

    @GET("listarotas")
    Call<RotaList> getRotas();

    @GET("controleTelas")
    Call<TelasList> getTelas();

    @GET("listaterceiros")
    Call<TerceiroList> getTerceiros();

    @GET("tipos-residuos")
    Call<TipoResiduoList> getTipoResiduo();

    @GET("listavolumes")
    Call<VolumeList> getVolumes();

    @POST("inseriMovimentoBombona")
    Call<MovimentoBombonaList> postBombona(@Body MovimentoBombonaList movimentoBombonaList);

    @POST("insericoletas")
    Call<ColetaList> postColeta(@Body ColetaList coletaList);
}
