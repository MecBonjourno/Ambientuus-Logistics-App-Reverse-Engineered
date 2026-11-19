package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.VolumeTableManager;
import com.coleta.ambientuus.dto.Volume;
import com.coleta.ambientuus.dto.list.VolumeList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class VolumeService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(VolumeTableManager manager) throws IOException {
        Response<VolumeList> response = this.api.getVolumes().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (Volume v : response.body().getVOLUMES()) {
                manager.insert(v);
            }
            return;
        }
        throw new IOException("Erro ao sincronizar volumes");
    }
}
