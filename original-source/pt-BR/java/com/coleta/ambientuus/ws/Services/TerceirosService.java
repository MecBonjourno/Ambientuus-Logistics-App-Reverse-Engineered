package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.TerceiroTableManager;
import com.coleta.ambientuus.dto.Terceiro;
import com.coleta.ambientuus.dto.list.TerceiroList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class TerceirosService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(TerceiroTableManager manager) throws IOException {
        Response<TerceiroList> response = this.api.getTerceiros().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (Terceiro t : response.body().getTERCEIROS()) {
                manager.insert(t);
            }
            return;
        }
        throw new IOException("Erro ao sincronizar terceiros");
    }
}
