package com.coleta.ambientuus.adapters;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import java.util.ArrayList;

/* loaded from: classes12.dex */
public class TerceirosAdapter extends RecyclerView.Adapter<ViewHolder> {
    private ArrayList<String> arrayBombonasTerceiros;

    public TerceirosAdapter(ArrayList<String> arrayBombonasTerceiros) {
        this.arrayBombonasTerceiros = arrayBombonasTerceiros;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View listItem = layoutInflater.inflate(R.layout.list_terceiros_row, parent, false);
        ViewHolder viewHolder = new ViewHolder(listItem);
        return viewHolder;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder holder, int position) {
        if (!this.arrayBombonasTerceiros.isEmpty() && this.arrayBombonasTerceiros != null) {
            holder.tvBombonasTerceiros.setText(this.arrayBombonasTerceiros.get(position));
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.arrayBombonasTerceiros.size();
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        public RelativeLayout rlBombonasTerceiros;
        public TextView tvBombonasTerceiros;

        public ViewHolder(View itemView) {
            super(itemView);
            this.tvBombonasTerceiros = (TextView) itemView.findViewById(R.id.tvBombonasTerceiros);
            this.rlBombonasTerceiros = (RelativeLayout) itemView.findViewById(R.id.rlBombonasTerceiros);
        }
    }
}
