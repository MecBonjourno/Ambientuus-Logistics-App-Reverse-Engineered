package com.coleta.ambientuus.utils;

import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import com.coleta.ambientuus.domain.model.TipoPesagem;
import com.coleta.ambientuus.ui.MaterialAlertUtil;

/* loaded from: classes5.dex */
public class PesagemPreferences {
    private static final String CHAVE_TIPO = "TIPO_PESAGEM";
    private static final String PREF_NAME = "TIPO_PESAGEM";

    public interface TipoPesagemCallback {
        void onTipoPesagemSelecionado(TipoPesagem tipoPesagem);
    }

    public static void deleteTipoPesagem(Context context) {
        SharedPreferences.Editor editor = context.getSharedPreferences("TIPO_PESAGEM", 0).edit();
        editor.remove("TIPO_PESAGEM");
        editor.apply();
    }

    public static void salvarTipoPesagem(Context context, TipoPesagem tipo) {
        SharedPreferences.Editor editor = context.getSharedPreferences("TIPO_PESAGEM", 0).edit();
        editor.putString("TIPO_PESAGEM", tipo.getValor());
        editor.apply();
    }

    public static TipoPesagem obterTipoPesagem(Context context) {
        SharedPreferences prefs = context.getSharedPreferences("TIPO_PESAGEM", 0);
        String valor = prefs.getString("TIPO_PESAGEM", "");
        TipoPesagem tipo = TipoPesagem.fromString(valor);
        return tipo;
    }

    public static void verifyPreferences(final Context context, final TipoPesagemCallback callback) {
        TipoPesagem tipo = obterTipoPesagem(context);
        if (tipo == null || tipo.getValor().isEmpty()) {
            MaterialAlertUtil.mostrarConfirmacao(context, "Selecionar Tipo de Coleta", "Como deseja realizar a pesagem?", "Manual", "Bluetooth", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.utils.PesagemPreferences$$ExternalSyntheticLambda0
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    PesagemPreferences.lambda$verifyPreferences$0(context, callback, dialogInterface, i);
                }
            }, new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.utils.PesagemPreferences$$ExternalSyntheticLambda1
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    PesagemPreferences.lambda$verifyPreferences$1(context, callback, dialogInterface, i);
                }
            });
        } else {
            callback.onTipoPesagemSelecionado(tipo);
        }
    }

    static /* synthetic */ void lambda$verifyPreferences$0(Context context, TipoPesagemCallback callback, DialogInterface dialog, int which) {
        salvarTipoPesagem(context, TipoPesagem.MANUAL);
        dialog.dismiss();
        callback.onTipoPesagemSelecionado(TipoPesagem.MANUAL);
    }

    static /* synthetic */ void lambda$verifyPreferences$1(Context context, TipoPesagemCallback callback, DialogInterface dialog, int which) {
        salvarTipoPesagem(context, TipoPesagem.BLUETOOTH);
        dialog.dismiss();
        callback.onTipoPesagemSelecionado(TipoPesagem.BLUETOOTH);
    }
}
