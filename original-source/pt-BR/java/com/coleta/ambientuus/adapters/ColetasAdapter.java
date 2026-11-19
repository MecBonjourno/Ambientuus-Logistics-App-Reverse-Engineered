package com.coleta.ambientuus.adapters;

import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ClienteMTRTableManager;
import com.coleta.ambientuus.dto.Coleta;
import java.text.DecimalFormat;
import java.util.ArrayList;

/* carregado de: classes12.dex */
public class ColetasAdapter extends ArrayAdapter<Coleta> {
    private ArrayList<Coleta> coletas;
    private LayoutInflater mInflater;
    private int mViewResourceId;

    public ColetasAdapter(Context context, int textViewResourceId, ArrayList<Coleta> coletas) {
        super(context, textViewResourceId, coletas);
        this.coletas = coletas;
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mViewResourceId = textViewResourceId;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        Coleta coleta;
        View convertView2 = this.mInflater.inflate(this.mViewResourceId, (ViewGroup) null);
        Coleta coleta2 = this.coletas.get(position);
        if (coleta2 != null) {
            TextView peso = (TextView) convertView2.findViewById(R.id.textPeso);
            TextView pesoLquido = (TextView) convertView2.findViewById(R.id.textPesoLiquido);
            TextView numeroMTR = (TextView) convertView2.findViewById(R.id.textNrMTR);
            TextView codCliente = (TextView) convertView2.findViewById(R.id.textCliente);
            TextView data_hora = (TextView) convertView2.findViewById(R.id.textDataHora);
            TextView bombonas = (TextView) convertView2.findViewById(R.id.textBombona);
            TextView recebeDadosExtra = (TextView) convertView2.findViewById(R.id.textRecebeDadosExtra);
            TextView Etiqueta = (TextView) convertView2.findViewById(R.id.textEtiqueta);
            TextView IdHdCliente = (TextView) convertView2.findViewById(R.id.tvHdIdCliente);
            if (peso != null) {
                peso.setText(coleta2.getPeso());
                if (coleta2.getPeso().isEmpty()) {
                    peso.setText("0,00");
                }
            }
            if (coleta2.getId_volume() != 0) {
                if (peso == null || pesoLquido == null) {
                    coleta = coleta2;
                } else if (!coleta2.getPeso().isEmpty()) {
                    float f1 = Float.parseFloat(coleta2.getPeso().replaceAll(",", "."));
                    if (coleta2.getPeso_liquido().isEmpty()) {
                        coleta = coleta2;
                    } else {
                        float f2 = Float.parseFloat(coleta2.getPeso_liquido());
                        DecimalFormat df = new DecimalFormat("0.00");
                        float resultado = f1 - f2;
                        coleta = coleta2;
                        pesoLquido.setText("Peso Líquido: " + df.format(resultado));
                    }
                } else {
                    coleta = coleta2;
                    pesoLquido.setText("Peso Líquido: 0,00");
                }
            } else {
                coleta = coleta2;
                pesoLquido.setText("Peso Líquido: 0,00");
            }
            if (numeroMTR != null) {
                numeroMTR.setText(coleta.getNumero_mtr());
            }
            if (data_hora != null) {
                data_hora.setText(coleta.getData_coleta());
            }
            if (bombonas != null) {
                bombonas.setText(coleta.getDescVolume());
                if (coleta.getDescVolume() == null) {
                    bombonas.setText("SEM BOMBONA");
                }
            }
            if (codCliente != null && coleta.getId_cliente_mtr() != null) {
                DatabaseHelper databaseHelper = new DatabaseHelper(getContext().getApplicationContext());
                ClienteMTRTableManager clienteMTRTableManager = new ClienteMTRTableManager(databaseHelper.getWritableDatabase());
                String clienteMTRCod = clienteMTRTableManager.getClienteMTRCod(coleta.getId_cliente_mtr());
                String codClienteText = "Cliente " + (!clienteMTRCod.isEmpty() ? clienteMTRCod : String.valueOf(coleta.getId_cliente_mtr()));
                codCliente.setText(codClienteText);
                IdHdCliente.setText(String.valueOf(coleta.getId_cliente_mtr()));
            }
            if (recebeDadosExtra != null) {
                String cl_ausente = coleta.getCliente_ausente();
                String cl_extra = coleta.getColeta_extra();
                String cl_sem_residuo = coleta.getColeta_sem_residuo();
                if (cl_ausente.equals("N") && cl_extra.equals("N") && cl_sem_residuo.equals("N")) {
                    convertView2.setBackgroundColor(Color.parseColor("#C9FFCE"));
                    recebeDadosExtra.setVisibility(8);
                } else if (cl_ausente.equals(ExifInterface.LATITUDE_SOUTH)) {
                    recebeDadosExtra.setText("CLIENTE AUSENTE");
                    convertView2.setBackgroundColor(Color.parseColor("#FF665A"));
                } else if (cl_extra.equals(ExifInterface.LATITUDE_SOUTH)) {
                    recebeDadosExtra.setText("COLETA EXTRA");
                    convertView2.setBackgroundColor(Color.parseColor("#66D170"));
                } else if (cl_sem_residuo.equals(ExifInterface.LATITUDE_SOUTH)) {
                    recebeDadosExtra.setText("COLETA SEM RESIDUOS");
                    convertView2.setBackgroundColor(Color.parseColor("#FFF587"));
                }
            }
            String etiqueta = coleta.getCod_Etiqueta();
            if (etiqueta == null) {
                Etiqueta.setVisibility(8);
            } else if (etiqueta.isEmpty()) {
                Etiqueta.setVisibility(8);
            }
            Etiqueta.setText("Etiqueta: " + etiqueta);
        }
        return convertView2;
    }
}
