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
public class BaixaBombonaAdapter extends RecyclerView.Adapter<ViewHolder> {
    private ArrayList<String> arrayBombonasBaixadas;

    public BaixaBombonaAdapter(ArrayList<String> arrayBombonasBaixadas) {
        this.arrayBombonasBaixadas = arrayBombonasBaixadas;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View listItem = layoutInflater.inflate(R.layout.activity_baixa_bombona_row, parent, false);
        ViewHolder viewHolder = new ViewHolder(listItem);
        return viewHolder;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder holder, int position) {
        if (!this.arrayBombonasBaixadas.isEmpty() && this.arrayBombonasBaixadas != null) {
            holder.tvBombonasBaixadas.setText(this.arrayBombonasBaixadas.get(position));
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.arrayBombonasBaixadas.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        public RelativeLayout rlBombonasBaixadas;
        public TextView tvBombonasBaixadas;

        public ViewHolder(View itemView) {
            super(itemView);
            this.tvBombonasBaixadas = (TextView) itemView.findViewById(R.id.tvBombonasBaixadas);
            this.rlBombonasBaixadas = (RelativeLayout) itemView.findViewById(R.id.rlBombonasBaixadas);
        }
    }
}
