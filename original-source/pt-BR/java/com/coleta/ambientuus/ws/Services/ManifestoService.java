package com.coleta.ambientuus.ws.Services;

import android.util.Log;
import com.coleta.ambientuus.database.managers.ManifestoTableManager;
import com.coleta.ambientuus.dto.Manifesto;
import com.coleta.ambientuus.dto.list.ManifestoList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class ManifestoService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);
    private final String dataColeta;
    private final Integer idRota;

    public ManifestoService(Integer idRota, String dataColeta) {
        this.idRota = idRota;
        this.dataColeta = dataColeta;
    }

    public void sincronizar(final ManifestoTableManager manager) {
        this.api.getManifesto(this.idRota.intValue(), this.dataColeta).enqueue(new Callback<ManifestoList>() { // da classe: com.coleta.ambientuus.ws.Services.ManifestoService.1
            @Override // retrofit2.Callback
            public void onResponse(Call<ManifestoList> call, Response<ManifestoList> response) {
                if (response.isSuccessful() && response.body() != null) {
                    manager.deleteAll();
                    for (Manifesto m : response.body().getManifestos()) {
                        if (m.getId_manifesto() != null) {
                            manager.insert(m);
                        }
                    }
                    return;
                }
                try {
                    Log.e("MANIFESTO_ERRO", "Erro na resposta: " + response.errorBody().string());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            @Override // retrofit2.Callback
            public void onFailure(Call<ManifestoList> call, Throwable t) {
                Log.e("MANIFESTO_FALHA", "Falha na requisição: " + t.getMessage(), t);
            }
        });
    }
}
