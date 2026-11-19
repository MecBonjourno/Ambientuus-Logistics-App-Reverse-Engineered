package com.coleta.ambientuus.adapters;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.dto.Manifesto;
import java.util.List;

/* carregado de: classes12.dex */
public class ManifestosClienteAdapter extends RecyclerView.Adapter<ViewHolder> {
    private OnItemClickListener listener;
    private final List<Manifesto> manifestos;

    public interface OnItemClickListener {
        void onClick(String str);
    }

    public ManifestosClienteAdapter(List<Manifesto> manifestos, OnItemClickListener listener) {
        this.manifestos = manifestos;
        this.listener = listener;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        private final LinearLayout llManifestoCliente;
        private final TextView tvIdManifesto;
        private final TextView tvIdRota;
        private final TextView tvNumeroManifesto;

        public ViewHolder(View view) {
            super(view);
            this.tvIdManifesto = (TextView) view.findViewById(R.id.tvIdManifesto);
            this.tvNumeroManifesto = (TextView) view.findViewById(R.id.tvNumeroManifesto);
            this.tvIdRota = (TextView) view.findViewById(R.id.tvIdRota);
            this.llManifestoCliente = (LinearLayout) view.findViewById(R.id.llManifestoCliente);
        }

        public TextView getTvIdManifesto() {
            return this.tvIdManifesto;
        }

        public TextView getTvNumeroManifesto() {
            return this.tvNumeroManifesto;
        }

        public TextView getTvIdRota() {
            return this.tvIdRota;
        }

        public LinearLayout getLlManifestoCliente() {
            return this.llManifestoCliente;
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_manifesto_cliente, viewGroup, false);
        return new ViewHolder(view);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder viewHolder, int position) {
        final Manifesto manifesto = this.manifestos.get(position);
        viewHolder.getTvIdManifesto().setText("ID: " + manifesto.getId_manifesto().toString());
        viewHolder.getTvNumeroManifesto().setText("Manifesto: " + manifesto.getNumero_manifesto());
        viewHolder.getTvIdRota().setText("Rota: " + manifesto.getId_rota().toString());
        viewHolder.getLlManifestoCliente().setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.adapters.ManifestosClienteAdapter$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ManifestosClienteAdapter.this.lambda$onBindViewHolder$0(manifesto, view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$onBindViewHolder$0(Manifesto manifesto, View v) {
        this.listener.onClick(manifesto.getNumero_manifesto());
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.manifestos.size();
    }
}
