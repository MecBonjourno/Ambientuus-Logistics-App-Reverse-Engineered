package com.coleta.ambientuus.ws.Services;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.util.Log;
import android.widget.Toast;
import androidx.appcompat.app.AlertDialog;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.dto.Coleta;
import com.coleta.ambientuus.dto.list.ColetaList;
import com.coleta.ambientuus.ws.ApiService;
import com.coleta.ambientuus.ws.RetrofitClient;
import java.util.List;
import retrofit2.Call;
import retrofit2.Response;

/* carregado de: classes6.dex */
public class ColetasService {
    private final Activity activity;
    private final ApiService api = (ApiService) RetrofitClient.getClient().create(ApiService.class);
    private final List<Coleta> coletaList;
    private final ColetaTableManager coletaTableManager;
    private final Context context;

    public ColetasService(Context context, List<Coleta> coletaList, Activity activity) {
        this.context = context;
        this.coletaList = coletaList;
        this.coletaTableManager = new ColetaTableManager(new DatabaseHelper(context).getDatabase());
        this.activity = activity;
    }

    public void enviarColetas() {
        try {
            ColetaList requestList = new ColetaList();
            requestList.setCOLETA(this.coletaList);
            Call<ColetaList> call = this.api.postColeta(requestList);
            Response<ColetaList> response = call.execute();
            if (response.isSuccessful() && response.body() != null) {
                for (Coleta coleta : response.body().getCOLETAS()) {
                    if (coleta.getId_app_coleta() != null) {
                        this.coletaTableManager.updateReturnColeta(coleta);
                    }
                }
                boolean resultado = this.coletaTableManager.updateListJson();
                this.coletaTableManager.deleteOldColeta();
                if (!resultado) {
                    this.activity.runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.ws.Services.ColetasService$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            ColetasService.this.lambda$enviarColetas$1();
                        }
                    });
                } else {
                    this.activity.runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.ws.Services.ColetasService$$ExternalSyntheticLambda1
                        @Override // java.lang.Runnable
                        public final void run() {
                            ColetasService.this.lambda$enviarColetas$2();
                        }
                    });
                }
                return;
            }
            Log.e("COLETA_ERRO", "Erro na resposta: " + (response.errorBody() != null ? response.errorBody().string() : "Erro desconhecido"));
        } catch (Exception e) {
            Log.e("COLETA_FALHA", "Falha na requisição: " + e.getMessage(), e);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$enviarColetas$1() {
        new AlertDialog.Builder(this.context).setTitle("Não foi possível atualizar a base").setMessage("Reinicie o aplicativo e tente novamente.").setIcon(R.drawable.ic_alert_dialog_error).setPositiveButton("Ok", new DialogInterface.OnClickListener() { // da classe: com.coleta.ambientuus.ws.Services.ColetasService$$ExternalSyntheticLambda2
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                ColetasService.lambda$enviarColetas$0(dialogInterface, i);
            }
        }).create().show();
    }

    static /* sintético */ void lambda$enviarColetas$0(DialogInterface dialog, int which) {
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$enviarColetas$2() {
        Toast.makeText(this.context, "Base atualizada com sucesso!", 1).show();
    }
}
