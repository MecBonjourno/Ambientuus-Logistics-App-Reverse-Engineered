package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.TipoResiduoTableManager;
import com.coleta.ambientuus.dto.TipoResiduo;
import com.coleta.ambientuus.dto.list.TipoResiduoList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class TipoResiduoService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(TipoResiduoTableManager manager) throws IOException {
        Response<TipoResiduoList> response = this.api.getTipoResiduo().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (TipoResiduo t : response.body().getTipoResiduos()) {
                manager.insert(t);
            }
            return;
        }
        throw new IOException("Erro ao sincronizar Tipos de Residuos");
    }
}
