package com.coleta.ambientuus.adapters;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filterable;
import android.widget.TextView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.dto.Bombona;
import java.util.ArrayList;

/* loaded from: classes12.dex */
public class BombonasListagemAdapter extends ArrayAdapter<Bombona> implements Filterable {
    private ArrayList<Bombona> bombonas;
    private LayoutInflater layoutInflater;
    private DatabaseHelper myDB;
    private int resourceID;

    public BombonasListagemAdapter(Context context, int resource, ArrayList<Bombona> bombonas) {
        super(context, resource, bombonas);
        this.bombonas = bombonas;
        this.layoutInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.resourceID = resource;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int pos, View convertView, ViewGroup parent) {
        View convertView2 = this.layoutInflater.inflate(this.resourceID, (ViewGroup) null);
        Bombona bombona = this.bombonas.get(pos);
        if (bombona != null) {
            TextView tv_CodBarrasBombona_LR = (TextView) convertView2.findViewById(R.id.tv_CodBarrasBombona_LR);
            TextView tv_StatusBombonas = (TextView) convertView2.findViewById(R.id.tv_StatusBombona);
            TextView tv_Capacidade_LR = (TextView) convertView2.findViewById(R.id.tv_Capacidade_LR);
            if (!bombona.getCOD_BARRAS().isEmpty()) {
                tv_CodBarrasBombona_LR.setText(bombona.getCOD_BARRAS());
                tv_Capacidade_LR.setText(bombona.getCapacidade());
                String Status = bombona.getStatus();
                if (Status == null) {
                    Status = "DISPONIVEL";
                }
                tv_StatusBombonas.setText(Status);
                if (Status.equals("DISPONIVEL")) {
                    tv_StatusBombonas.setTextColor(Color.parseColor("#537d4f"));
                }
                if (Status.equals("EM CLIENTE")) {
                    tv_StatusBombonas.setTextColor(Color.parseColor("#f0b354"));
                }
                if (Status.equals("COLETADO")) {
                    tv_StatusBombonas.setTextColor(Color.parseColor("#3e9cca"));
                }
                if (Status.equals("EM TERCEIRO")) {
                    tv_StatusBombonas.setTextColor(Color.parseColor("#d74920"));
                }
            }
        }
        return convertView2;
    }
}
