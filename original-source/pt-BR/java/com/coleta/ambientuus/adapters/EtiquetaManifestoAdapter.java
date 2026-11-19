package com.coleta.ambientuus.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.dto.Etiqueta;
import java.util.List;

/* carregado de: classes12.dex */
public class EtiquetaManifestoAdapter extends RecyclerView.Adapter<ViewHolder> {
    private final List<Etiqueta> etiquetas;
    private OnItemClickListener listener;

    public interface OnItemClickListener {
        void onClick(String str);
    }

    public EtiquetaManifestoAdapter(List<Etiqueta> etiquetas, OnItemClickListener listener) {
        this.etiquetas = etiquetas;
        this.listener = listener;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        Context context;
        TextView tvEtiqueta;

        public ViewHolder(View itemView) {
            super(itemView);
            this.tvEtiqueta = (TextView) itemView.findViewById(R.id.tvEtiqueta);
            this.context = itemView.getContext();
            itemView.findViewById(R.id.btnExcluir).setVisibility(8);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_etiqueta, parent, false);
        return new ViewHolder(view);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder holder, int position) {
        final Etiqueta etiqueta = this.etiquetas.get(position);
        holder.tvEtiqueta.setText(etiqueta.getCod_etiqueta());
        holder.tvEtiqueta.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.adapters.EtiquetaManifestoAdapter$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                EtiquetaManifestoAdapter.this.lambda$onBindViewHolder$0(etiqueta, view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$onBindViewHolder$0(Etiqueta etiqueta, View v) {
        this.listener.onClick(etiqueta.getCod_etiqueta());
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.etiquetas.size();
    }
}
