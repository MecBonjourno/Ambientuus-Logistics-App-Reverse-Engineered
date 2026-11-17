package com.coleta.ambientuus.adapters;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.dto.Etiqueta;
import java.util.List;

/* loaded from: classes12.dex */
public class EtiquetaAdapter extends RecyclerView.Adapter<ViewHolder> {
    private final List<Etiqueta> etiquetas;

    public EtiquetaAdapter(List<Etiqueta> etiquetas) {
        this.etiquetas = etiquetas;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        ImageButton btnExcluir;
        Context context;
        TextView tvEtiqueta;

        public ViewHolder(View itemView) {
            super(itemView);
            this.tvEtiqueta = (TextView) itemView.findViewById(R.id.tvEtiqueta);
            this.btnExcluir = (ImageButton) itemView.findViewById(R.id.btnExcluir);
            this.context = itemView.getContext();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_etiqueta, parent, false);
        return new ViewHolder(view);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(final ViewHolder holder, final int position) {
        Etiqueta etiqueta = this.etiquetas.get(position);
        holder.tvEtiqueta.setText(etiqueta.getCod_etiqueta());
        holder.btnExcluir.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.adapters.EtiquetaAdapter$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                EtiquetaAdapter.this.lambda$onBindViewHolder$2(holder, position, view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onBindViewHolder$2(final ViewHolder holder, final int position, View v) {
        AlertDialog alertDialog = new AlertDialog.Builder(holder.context).create();
        alertDialog.setTitle("Deseja excluir a etiqueta?");
        alertDialog.setMessage("Deseja deletar a etiqueta vinculada ao Manifesto?");
        alertDialog.setButton(-1, "Sim", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.adapters.EtiquetaAdapter$$ExternalSyntheticLambda0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                EtiquetaAdapter.this.lambda$onBindViewHolder$0(position, holder, dialogInterface, i);
            }
        });
        alertDialog.setButton(-2, "Não", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.adapters.EtiquetaAdapter$$ExternalSyntheticLambda1
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        });
        alertDialog.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onBindViewHolder$0(int position, ViewHolder holder, DialogInterface dialog, int which) {
        dialog.dismiss();
        Etiqueta etiquetaExclusao = this.etiquetas.get(position);
        EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(new DatabaseHelper(holder.context).getDatabase());
        etiquetaTableManager.deleteEtiqueta(etiquetaExclusao.getId_etiqueta());
        this.etiquetas.remove(position);
        notifyItemRemoved(position);
        notifyItemRangeChanged(position, this.etiquetas.size());
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.etiquetas.size();
    }
}
