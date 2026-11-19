package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.dto.Bombona;
import com.coleta.ambientuus.dto.list.BombonaList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class BombonasService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(BombonaTableManager manager) throws IOException {
        Response<BombonaList> response = this.api.getBombonas().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (Bombona b : response.body().getBfBombonas()) {
                manager.insert(b);
            }
            return;
        }
        throw new IOException("Erro ao sincronizar bombonas");
    }
}
