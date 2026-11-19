package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.PlacasTableManager;
import com.coleta.ambientuus.dto.Placas;
import com.coleta.ambientuus.dto.list.PlacasList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class PlacasService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(PlacasTableManager manager) throws IOException {
        Response<PlacasList> response = this.api.getPlacas().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (Placas p : response.body().getPLACAS()) {
                manager.insert(p);
            }
            return;
        }
        throw new IOException("Erro ao sincronizar placas");
    }
}
