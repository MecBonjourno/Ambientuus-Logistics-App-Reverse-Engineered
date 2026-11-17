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

/* loaded from: classes12.dex */
public class EtiquetaPontoColetaAdapter extends RecyclerView.Adapter<ViewHolder> {
    private final List<Etiqueta> etiquetas;

    public EtiquetaPontoColetaAdapter(List<Etiqueta> etiquetas) {
        this.etiquetas = etiquetas;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        Context context;
        TextView tvEtiqueta;

        public ViewHolder(View itemView) {
            super(itemView);
            this.tvEtiqueta = (TextView) itemView.findViewById(R.id.tvEtiquetaPontoColeta);
            this.context = itemView.getContext();
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_etiqueta_ponto_coleta, parent, false);
        return new ViewHolder(view);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder holder, int position) {
        Etiqueta etiqueta = this.etiquetas.get(position);
        holder.tvEtiqueta.setText(etiqueta.getCod_etiqueta());
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.etiquetas.size();
    }
}
