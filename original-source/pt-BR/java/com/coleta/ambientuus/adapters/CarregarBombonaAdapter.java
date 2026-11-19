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
public class CarregarBombonaAdapter extends RecyclerView.Adapter<ViewHolder> {
    private ArrayList<String> arrayBombonasCarregadas;

    public CarregarBombonaAdapter(ArrayList<String> arrayBombonasCarregadas) {
        this.arrayBombonasCarregadas = arrayBombonasCarregadas;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View listItem = layoutInflater.inflate(R.layout.activity_carregar_bombona_row, parent, false);
        ViewHolder viewHolder = new ViewHolder(listItem);
        return viewHolder;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder holder, int position) {
        if (!this.arrayBombonasCarregadas.isEmpty() && this.arrayBombonasCarregadas != null) {
            holder.tvBombonasCarregadas.setText(this.arrayBombonasCarregadas.get(position));
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.arrayBombonasCarregadas.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        public RelativeLayout rlBombonasCarregadas;
        public TextView tvBombonasCarregadas;

        public ViewHolder(View itemView) {
            super(itemView);
            this.tvBombonasCarregadas = (TextView) itemView.findViewById(R.id.tvBombonasCarregadas);
            this.rlBombonasCarregadas = (RelativeLayout) itemView.findViewById(R.id.rlBombonasCarregadas);
        }
    }
}
