package com.coleta.ambientuus.ws.Services;

import android.util.Log;
import com.coleta.ambientuus.database.managers.TelasTableManager;
import com.coleta.ambientuus.dto.Telas;
import com.coleta.ambientuus.dto.list.TelasList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/* loaded from: classes6.dex */
public class TelasService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(final TelasTableManager manager) {
        this.api.getTelas().enqueue(new Callback<TelasList>() { // from class: com.coleta.ambientuus.ws.Services.TelasService.1
            @Override // retrofit2.Callback
            public void onResponse(Call<TelasList> call, Response<TelasList> response) {
                if (response.isSuccessful() && response.body() != null) {
                    manager.deleteAll();
                    for (Telas t : response.body().getTelas()) {
                        if (!t.getCOLETAR_MANUAL().isEmpty()) {
                            manager.insert(t);
                        }
                    }
                    return;
                }
                try {
                    Log.e("ERRO", "Erro na resposta: " + response.errorBody().string());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            @Override // retrofit2.Callback
            public void onFailure(Call<TelasList> call, Throwable t) {
                Log.e("ERRO", "Falha na requisição: " + t.getMessage(), t);
            }
        });
    }
}
