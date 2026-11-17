package com.coleta.ambientuus.ui;

import android.content.Context;
import android.content.DialogInterface;
import com.coleta.ambientuus.R;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;

/* loaded from: classes7.dex */
public class MaterialAlertUtil {

    public interface OnCancelListener {
        void onCancel();
    }

    public interface OnConfirmListener {
        void onConfirm();
    }

    public static void mostrarConfirmacao(Context context, String titulo, String mensagem, String textoConfirmar, String textoCancelar, final DialogInterface.OnClickListener acaoConfirmacao, final DialogInterface.OnClickListener acaoRejeicao) {
        MaterialAlertDialogBuilder builder = new MaterialAlertDialogBuilder(context);
        builder.setTitle((CharSequence) (titulo != null ? titulo : "Confirmação")).setMessage((CharSequence) (mensagem != null ? mensagem : "Deseja continuar?")).setCancelable(false).setPositiveButton((CharSequence) (textoConfirmar != null ? textoConfirmar : "Sim"), new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.ui.MaterialAlertUtil$$ExternalSyntheticLambda0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                MaterialAlertUtil.lambda$mostrarConfirmacao$0(acaoConfirmacao, dialogInterface, i);
            }
        }).setIcon(R.drawable.ic_alert_dialog_question);
        if (textoCancelar != null) {
            builder.setNegativeButton((CharSequence) textoCancelar, new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.ui.MaterialAlertUtil$$ExternalSyntheticLambda1
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    MaterialAlertUtil.lambda$mostrarConfirmacao$1(acaoRejeicao, dialogInterface, i);
                }
            });
        }
        builder.show();
    }

    static /* synthetic */ void lambda$mostrarConfirmacao$0(DialogInterface.OnClickListener acaoConfirmacao, DialogInterface dialog, int which) {
        if (acaoConfirmacao != null) {
            acaoConfirmacao.onClick(dialog, which);
        }
    }

    static /* synthetic */ void lambda$mostrarConfirmacao$1(DialogInterface.OnClickListener acaoRejeicao, DialogInterface dialog, int which) {
        if (acaoRejeicao != null) {
            acaoRejeicao.onClick(dialog, which);
        }
    }

    public static void exibirErro(Context context, String titulo, String mensagem) {
        new MaterialAlertDialogBuilder(context).setTitle((CharSequence) (titulo != null ? titulo : "Erro")).setMessage((CharSequence) (mensagem != null ? mensagem : "Ocorreu um erro.")).setPositiveButton((CharSequence) "OK", (DialogInterface.OnClickListener) null).setIcon(R.drawable.ic_alert_dialog_error).show();
    }

    public static void exibirSucesso(Context context, String mensagem) {
        new MaterialAlertDialogBuilder(context).setTitle((CharSequence) "Sucesso").setMessage((CharSequence) (mensagem != null ? mensagem : "")).setPositiveButton((CharSequence) "OK", (DialogInterface.OnClickListener) null).setIcon(R.drawable.ic_alert_dialog_success).show();
    }

    public static void exibirInformacao(Context context, String titulo, String mensagem) {
        new MaterialAlertDialogBuilder(context).setTitle((CharSequence) (titulo != null ? titulo : "Info")).setMessage((CharSequence) (mensagem != null ? mensagem : "")).setPositiveButton((CharSequence) "OK", (DialogInterface.OnClickListener) null).setIcon(R.drawable.ic_alert_dialog_info).show();
    }
}
