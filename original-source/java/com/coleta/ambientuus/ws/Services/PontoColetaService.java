package com.coleta.ambientuus.ws.Services;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.domain.model.SyncState;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.dto.list.PontoColetaList;
import com.coleta.ambientuus.utils.SyncStatus;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/* loaded from: classes6.dex */
public class PontoColetaService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);
    private final String dataColeta;
    private final Integer idRota;

    public PontoColetaService(Integer idRota, String dataColeta) {
        this.idRota = idRota;
        this.dataColeta = dataColeta;
    }

    public void sincronizar(final PontoColetaTableManager manager, final Context context) {
        this.api.getPontoColeta(this.idRota.intValue(), this.dataColeta).enqueue(new Callback<PontoColetaList>() { // from class: com.coleta.ambientuus.ws.Services.PontoColetaService.1
            @Override // retrofit2.Callback
            public void onResponse(Call<PontoColetaList> call, Response<PontoColetaList> response) {
                if (response.isSuccessful() && response.body() != null) {
                    manager.deleteAll();
                    for (PontoColeta p : response.body().getPontosColeta()) {
                        if (p.getCodCliente() != null) {
                            manager.insert(p);
                        }
                    }
                    SharedPreferences prefs = context.getSharedPreferences("SYNC_PREFS", 0);
                    prefs.edit().putBoolean("pontosColetaSincronizado", true).apply();
                    SyncStatus.setStatus(SyncState.SUCCESS);
                    return;
                }
                try {
                    Log.e("PONTO_COLETA_ERRO", "Erro na resposta: " + response.errorBody().string());
                    SyncStatus.setStatus(SyncState.ERROR);
                } catch (Exception e) {
                    e.printStackTrace();
                    SyncStatus.setStatus(SyncState.ERROR);
                }
            }

            @Override // retrofit2.Callback
            public void onFailure(Call<PontoColetaList> call, Throwable t) {
                Log.e("PONTO_COLETA_FALHA", "Falha na requisição: " + t.getMessage(), t);
                SyncStatus.setStatus(SyncState.ERROR);
            }
        });
    }
}
