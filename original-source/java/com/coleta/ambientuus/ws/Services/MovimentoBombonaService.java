package com.coleta.ambientuus.ws.Services;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.widget.Toast;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.coleta.ambientuus.dto.list.MovimentoBombonaList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.util.List;
import retrofit2.Call;
import retrofit2.Response;

/* loaded from: classes6.dex */
public class MovimentoBombonaService {
    private final Activity activity;
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);
    private final Context context;
    private final List<MovimentoBombona> movimentoBombonaList;

    public MovimentoBombonaService(Context context, List<MovimentoBombona> movimentoBombonaList, Activity activity) {
        this.context = context;
        this.movimentoBombonaList = movimentoBombonaList;
        this.activity = activity;
    }

    public void enviarMovimentos() {
        try {
            MovimentoBombonaList requestList = new MovimentoBombonaList();
            requestList.setBOMBONAS(this.movimentoBombonaList);
            Call<MovimentoBombonaList> call = this.api.postBombona(requestList);
            Response<MovimentoBombonaList> response = call.execute();
            if (response.isSuccessful() && response.body() != null) {
                this.activity.runOnUiThread(new Runnable() { // from class: com.coleta.ambientuus.ws.Services.MovimentoBombonaService$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        MovimentoBombonaService.this.lambda$enviarMovimentos$0();
                    }
                });
            } else {
                Log.e("BOMBONA_ERRO", "Erro na resposta: " + (response.errorBody() != null ? response.errorBody().string() : "Erro desconhecido"));
            }
        } catch (Exception e) {
            Log.e("BOMBONA_FALHA", "Falha na requisição: " + e.getMessage(), e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$enviarMovimentos$0() {
        Toast.makeText(this.context, "Movimentos enviados com sucesso!", 1).show();
    }
}
