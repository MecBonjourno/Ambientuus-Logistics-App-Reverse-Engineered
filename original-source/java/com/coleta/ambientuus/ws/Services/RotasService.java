package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.RotaTableManager;
import com.coleta.ambientuus.dto.Rota;
import com.coleta.ambientuus.dto.list.RotaList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* loaded from: classes6.dex */
public class RotasService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(RotaTableManager manager) throws IOException {
        Response<RotaList> response = this.api.getRotas().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (Rota r : response.body().getROTAS()) {
                manager.insert(r);
            }
            return;
        }
        throw new IOException("Erro ao sincronizar rotas");
    }
}
