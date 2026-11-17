package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.MotoristaTableManager;
import com.coleta.ambientuus.dto.Motorista;
import com.coleta.ambientuus.dto.list.MotoristaList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* loaded from: classes6.dex */
public class MotoristasService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(MotoristaTableManager manager) throws IOException {
        Response<MotoristaList> response = this.api.getMotorista().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (Motorista m : response.body().getMOTORISTAS()) {
                manager.insert(m);
            }
            return;
        }
        throw new IOException("Erro ao sincronizar motoristas");
    }
}
