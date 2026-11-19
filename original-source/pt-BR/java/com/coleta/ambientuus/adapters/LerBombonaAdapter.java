package com.coleta.ambientuus.adapters;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import java.util.ArrayList;

/* carregado de: classes12.dex */
public class LerBombonaAdapter extends RecyclerView.Adapter<ViewHolder> {
    private ArrayList<String> arrayBombonasAlocadas;

    public LerBombonaAdapter(ArrayList<String> arrayBombonasAlocadas) {
        this.arrayBombonasAlocadas = arrayBombonasAlocadas;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View listItem = layoutInflater.inflate(R.layout.activity_ler_bombona_row, parent, false);
        ViewHolder viewHolder = new ViewHolder(listItem);
        return viewHolder;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder holder, int position) {
        if (!this.arrayBombonasAlocadas.isEmpty() && this.arrayBombonasAlocadas != null) {
            holder.tvBombonasAlocadasCliente.setText(this.arrayBombonasAlocadas.get(position));
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.arrayBombonasAlocadas.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        public RelativeLayout rlBombonasAlocadas;
        public TextView tvBombonasAlocadasCliente;

        public ViewHolder(View itemView) {
            super(itemView);
            this.tvBombonasAlocadasCliente = (TextView) itemView.findViewById(R.id.tvBombonasAlocadasCliente);
            this.rlBombonasAlocadas = (RelativeLayout) itemView.findViewById(R.id.rlBombonasAlocadas);
        }
    }
}
