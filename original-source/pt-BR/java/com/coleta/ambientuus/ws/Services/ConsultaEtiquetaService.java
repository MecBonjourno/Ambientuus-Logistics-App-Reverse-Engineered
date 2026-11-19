package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.dto.list.BombonaClienteList;
import com.coleta.ambientuus.utils.ConsultaEtiquetaCallback;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class ConsultaEtiquetaService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);
    private final String etiqueta;

    public ConsultaEtiquetaService(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public void consultar(final ConsultaEtiquetaCallback callback) {
        this.api.getConsultaEtiqueta(this.etiqueta).enqueue(new Callback<BombonaClienteList>() { // da classe: com.coleta.ambientuus.ws.Services.ConsultaEtiquetaService.1
            @Override // retrofit2.Callback
            public void onResponse(Call<BombonaClienteList> call, Response<BombonaClienteList> response) {
                if (response.isSuccessful() && response.body() != null) {
                    callback.onSucesso(response.body());
                } else {
                    callback.onErro(new Exception("Resposta inválida da API"));
                }
            }

            @Override // retrofit2.Callback
            public void onFailure(Call<BombonaClienteList> call, Throwable t) {
                callback.onErro(t);
            }
        });
    }
}
