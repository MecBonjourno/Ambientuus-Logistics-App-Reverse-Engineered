package com.coleta.ambientuus.ws.Services;

import com.coleta.ambientuus.database.managers.ClienteMTRTableManager;
import com.coleta.ambientuus.dto.ClienteMTR;
import com.coleta.ambientuus.dto.list.ClienteMTRList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.io.IOException;
import retrofit2.Response;

/* loaded from: classes6.dex */
public class ClientesMTRService {
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);

    public void sincronizar(ClienteMTRTableManager manager) throws IOException {
        Response<ClienteMTRList> response = this.api.getClientesMTR().execute();
        if (response.isSuccessful() && response.body() != null) {
            for (ClienteMTR c : response.body().getCLIENTESMTR()) {
                if (!c.getId_pessoa().isEmpty()) {
                    manager.insert(c);
                }
            }
            return;
        }
        throw new IOException("Erro ao sincronizar clientes");
    }
}
