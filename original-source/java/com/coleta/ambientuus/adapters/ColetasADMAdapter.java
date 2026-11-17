package com.coleta.ambientuus.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.dto.Coleta;
import java.util.ArrayList;

/* loaded from: classes12.dex */
public class ColetasADMAdapter extends ArrayAdapter<Coleta> {
    private final LayoutInflater mInflater;
    private final int mViewResourceId;
    private final ArrayList<Coleta> users;

    public ColetasADMAdapter(Context context, int textViewResourceId, ArrayList<Coleta> users) {
        super(context, textViewResourceId, users);
        this.users = users;
        this.mInflater = (LayoutInflater) context.getSystemService("layout_inflater");
        this.mViewResourceId = textViewResourceId;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        View convertView2 = this.mInflater.inflate(this.mViewResourceId, (ViewGroup) null);
        Coleta user = this.users.get(position);
        if (user != null) {
            TextView peso = (TextView) convertView2.findViewById(R.id.textPeso);
            TextView numeroMTR = (TextView) convertView2.findViewById(R.id.textNrMTR);
            TextView data_hora = (TextView) convertView2.findViewById(R.id.textDataHora);
            TextView bombonas = (TextView) convertView2.findViewById(R.id.textBombona);
            TextView recebeDadosExtra = (TextView) convertView2.findViewById(R.id.textRecebeDadosExtra);
            TextView idRota = (TextView) convertView2.findViewById(R.id.textIdRota);
            TextView enviarSN = (TextView) convertView2.findViewById(R.id.textEnviado);
            if (peso != null) {
                peso.setText(user.getPeso() + "kg");
            }
            if (numeroMTR != null) {
                numeroMTR.setText(user.getNumero_mtr());
            }
            if (data_hora != null) {
                data_hora.setText(user.getData_coleta());
            }
            if (bombonas != null) {
                bombonas.setText(user.getDescVolume());
            }
            if (recebeDadosExtra != null) {
                String cl_ausente = user.getCliente_ausente();
                String cl_extra = user.getColeta_extra();
                String cl_sem_residuo = user.getColeta_sem_residuo();
                if (cl_ausente.equals(ExifInterface.LATITUDE_SOUTH)) {
                    recebeDadosExtra.setText("CLIENTE AUSENTE");
                } else if (cl_extra.equals(ExifInterface.LATITUDE_SOUTH)) {
                    recebeDadosExtra.setText("COLETA EXTRA");
                } else if (cl_sem_residuo.equals(ExifInterface.LATITUDE_SOUTH)) {
                    recebeDadosExtra.setText("COLETA SEM RESIDUOS");
                }
            }
            if (idRota != null) {
                idRota.setText("ID ROTA:" + user.getId_rota());
            }
            if (enviarSN != null) {
                String foiEnviado = user.getEnviado();
                if (foiEnviado.equals(ExifInterface.LATITUDE_SOUTH)) {
                    enviarSN.setText("ENVIADO JSON");
                } else if (foiEnviado.equals("N")) {
                    enviarSN.setText("NÃO ENVIADO JSON");
                }
            }
        }
        return convertView2;
    }
}
