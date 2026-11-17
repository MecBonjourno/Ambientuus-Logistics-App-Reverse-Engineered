package com.coleta.ambientuus.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.dto.Etiqueta;
import com.coleta.ambientuus.dto.Manifesto;
import com.coleta.ambientuus.fragments.EtiquetasFragment;
import java.util.ArrayList;

/* loaded from: classes12.dex */
public class ManifestoAdapter extends RecyclerView.Adapter<ViewHolder> {
    private final Context context;
    private final ArrayList<Manifesto> manifestos;

    public static class ViewHolder extends RecyclerView.ViewHolder {
        private final ImageButton btnEtiquetas;
        private final TextView tvDataColeta;
        private final TextView tvGerador;
        private final TextView tvIdManifesto;
        private final TextView tvIdRota;
        private final TextView tvNumeroManifesto;

        public TextView getTvIdManifesto() {
            return this.tvIdManifesto;
        }

        public TextView getTvNumeroManifesto() {
            return this.tvNumeroManifesto;
        }

        public TextView getTvDataColeta() {
            return this.tvDataColeta;
        }

        public TextView getTvGerador() {
            return this.tvGerador;
        }

        public TextView getTvIdRota() {
            return this.tvIdRota;
        }

        public ImageButton getBtnEtiquetas() {
            return this.btnEtiquetas;
        }

        public ViewHolder(View view) {
            super(view);
            this.tvIdManifesto = (TextView) view.findViewById(R.id.tvIdManifesto);
            this.tvNumeroManifesto = (TextView) view.findViewById(R.id.tvNumeroManifesto);
            this.tvDataColeta = (TextView) view.findViewById(R.id.tvDataColeta);
            this.tvGerador = (TextView) view.findViewById(R.id.tvGerador);
            this.tvIdRota = (TextView) view.findViewById(R.id.tvIdRota);
            this.btnEtiquetas = (ImageButton) view.findViewById(R.id.btnEtiquetas);
        }
    }

    public ManifestoAdapter(ArrayList<Manifesto> manifestos, Context context) {
        this.manifestos = manifestos;
        this.context = context;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        View view = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.list_manifesto_row, viewGroup, false);
        return new ViewHolder(view);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder viewHolder, int position) {
        final Manifesto manifesto = this.manifestos.get(position);
        viewHolder.getTvIdManifesto().setText("ID: " + manifesto.getId_manifesto().toString());
        viewHolder.getTvNumeroManifesto().setText("Manifesto: " + manifesto.getNumero_manifesto());
        viewHolder.getTvDataColeta().setText(manifesto.getData_coleta());
        viewHolder.getTvGerador().setText("Gerador: " + manifesto.getGerador());
        viewHolder.getTvIdRota().setText("Rota: " + manifesto.getId_rota().toString());
        viewHolder.getBtnEtiquetas().setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.adapters.ManifestoAdapter$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ManifestoAdapter.this.lambda$onBindViewHolder$0(manifesto, view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onBindViewHolder$0(Manifesto manifesto, View v) {
        ArrayList<Etiqueta> etiquetas = new EtiquetaTableManager(new DatabaseHelper(v.getContext()).getDatabase()).selectEtiquetaManifesto(manifesto.getId_manifesto());
        EtiquetasFragment bottomSheet = new EtiquetasFragment(etiquetas, manifesto.getId_manifesto());
        FragmentManager fm = ((AppCompatActivity) this.context).getSupportFragmentManager();
        bottomSheet.show(fm, "EtiquetasBottomSheet");
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.manifestos.size();
    }
}
