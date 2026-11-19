package com.coleta.ambientuus.activities;

import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.ContextMenu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.main.SelecaoActivity;
import com.coleta.ambientuus.adapters.ColetasAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.VolumeTableManager;
import com.coleta.ambientuus.dto.Coleta;
import java.text.DecimalFormat;
import java.util.ArrayList;

/* carregado de: classes3.dex */
public class ListagemColetasActivity extends AppCompatActivity {
    private String MTR_DC;
    ColetasAdapter adapterDC;
    ColetasAdapter adapterMTR;
    private String clienteSel;
    private ColetaTableManager coletaTableManager;
    private AlertDialog dialog;
    private int idListViewDC;
    private int idListViewHolderMenu;
    private int idListViewMTR;
    ListView listViewDC;
    ListView listViewMTR;
    DatabaseHelper myDB;
    private String numeroMtrSel;
    private TextView tvNroDC;
    private TextView tvNroMtr;
    private TextView tvPesoDC;
    private TextView tvPesoMtr;
    Coleta userDC;
    ArrayList<Coleta> userListDC;
    ArrayList<Coleta> userListMTR;
    Coleta userMTR;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_listagem_coletas);
        boolean z = true;
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.tvNroMtr = (TextView) findViewById(R.id.txtConsultasNroMtrStaticoID);
        this.tvPesoMtr = (TextView) findViewById(R.id.txtConsultasDataHoraStaticoID);
        this.tvNroDC = (TextView) findViewById(R.id.txtConsultasNroDCStaticoID);
        this.tvPesoDC = (TextView) findViewById(R.id.txtConsultasDCDataHoraStaticoID);
        this.listViewMTR = (ListView) findViewById(R.id.listView);
        this.listViewDC = (ListView) findViewById(R.id.listViewDC);
        this.myDB = new DatabaseHelper(this);
        this.coletaTableManager = new ColetaTableManager(this.myDB.getDatabase());
        this.userListMTR = new ArrayList<>();
        Cursor dataMTR = this.coletaTableManager.getAllColetasMTR();
        int numRowsMTR = dataMTR.getCount();
        int i = 12;
        int i2 = 2;
        int i3 = 0;
        int i4 = 3;
        if (numRowsMTR != 0) {
            int i5 = 0;
            while (dataMTR.moveToNext()) {
                this.userMTR = new Coleta(dataMTR.getString(i3), dataMTR.getString(1), dataMTR.getString(i2), dataMTR.getString(3), Integer.valueOf((int) dataMTR.getLong(5)), dataMTR.getString(6), dataMTR.getString(7), dataMTR.getString(8), dataMTR.getString(10), dataMTR.getString(11), Integer.valueOf(dataMTR.getInt(12)), dataMTR.getString(13));
                this.userListMTR.add(i5, this.userMTR);
                i5++;
                i2 = 2;
                i3 = 0;
            }
            this.adapterMTR = new ColetasAdapter(this, R.layout.list_adapter_view, this.userListMTR);
            this.listViewMTR.setAdapter((ListAdapter) this.adapterMTR);
            registerForContextMenu(this.listViewMTR);
            this.idListViewMTR = this.listViewMTR.getId();
            this.listViewMTR.setClickable(true);
            this.listViewMTR.setOnItemClickListener(new AdapterView.OnItemClickListener() { // da classe: com.coleta.ambientuus.activities.ListagemColetasActivity$$ExternalSyntheticLambda0
                @Override // android.widget.AdapterView.OnItemClickListener
                public final void onItemClick(AdapterView adapterView, View view, int i6, long j) {
                    ListagemColetasActivity.this.lambda$onCreate$0(adapterView, view, i6, j);
                }
            });
        } else {
            this.tvNroMtr.setVisibility(4);
            this.tvPesoMtr.setVisibility(4);
        }
        this.userListDC = new ArrayList<>();
        Cursor dataDC = this.coletaTableManager.getAllColetasDC();
        int numRowsDC = dataDC.getCount();
        if (numRowsDC != 0) {
            int i6 = 0;
            while (dataDC.moveToNext()) {
                this.userDC = new Coleta(dataDC.getString(0), dataDC.getString(1), dataDC.getString(2), dataDC.getString(i4), Integer.valueOf((int) dataDC.getLong(5)), dataDC.getString(6), dataDC.getString(7), dataDC.getString(8), dataDC.getString(10), dataDC.getString(11), Integer.valueOf(dataDC.getInt(i)), dataDC.getString(13));
                this.userListDC.add(i6, this.userDC);
                i6++;
                i = 12;
                i4 = 3;
            }
            this.adapterDC = new ColetasAdapter(this, R.layout.list_adapter_view, this.userListDC);
            this.listViewDC.setAdapter((ListAdapter) this.adapterDC);
            registerForContextMenu(this.listViewDC);
            this.idListViewDC = this.listViewDC.getId();
            this.listViewDC.setClickable(true);
            this.listViewDC.setOnItemClickListener(new AdapterView.OnItemClickListener() { // da classe: com.coleta.ambientuus.activities.ListagemColetasActivity$$ExternalSyntheticLambda1
                @Override // android.widget.AdapterView.OnItemClickListener
                public final void onItemClick(AdapterView adapterView, View view, int i7, long j) {
                    ListagemColetasActivity.this.lambda$onCreate$1(adapterView, view, i7, j);
                }
            });
        } else {
            this.tvNroDC.setVisibility(4);
            this.tvPesoDC.setVisibility(4);
        }
        if (numRowsMTR == 0 && numRowsDC == 0) {
            showToast(this, "Banco de dados vazio.");
        } else if (numRowsMTR >= 3 && numRowsDC >= 1) {
            parametrosDimensoes(this);
        }
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // da classe: com.coleta.ambientuus.activities.ListagemColetasActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                ListagemColetasActivity.this.startActivity(new Intent(ListagemColetasActivity.this, (Class<?>) SelecaoActivity.class));
                ListagemColetasActivity.this.finish();
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$onCreate$0(AdapterView arg0, View arg1, int position, long arg3) {
        this.numeroMtrSel = ((TextView) arg1.findViewById(R.id.textNrMTR)).getText().toString();
        this.clienteSel = ((TextView) arg1.findViewById(R.id.tvHdIdCliente)).getText().toString();
        this.MTR_DC = "MTR";
        createDialogGroup();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$onCreate$1(AdapterView arg0, View arg1, int position, long arg3) {
        this.numeroMtrSel = ((TextView) arg1.findViewById(R.id.textNrMTR)).getText().toString();
        this.clienteSel = ((TextView) arg1.findViewById(R.id.tvHdIdCliente)).getText().toString();
        this.MTR_DC = "DC";
        createDialogGroup();
    }

    @Override // android.app.Activity, android.view.View.OnCreateContextMenuListener
    public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        getMenuInflater().inflate(R.menu.menu_context, menu);
        this.idListViewHolderMenu = v.getId();
    }

    @Override // android.app.Activity
    public boolean onContextItemSelected(MenuItem item) {
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        if (item.getItemId() == R.id.opcaodeletar) {
            if (this.idListViewHolderMenu == this.idListViewMTR) {
                String id = this.userListMTR.get(info.position).getId_coleta();
                this.coletaTableManager.deleteDataColeta(Integer.parseInt(id));
                this.userListMTR.remove(info.position);
                this.adapterMTR.notifyDataSetChanged();
                Cursor dataMTR = this.coletaTableManager.getAllColetasMTR();
                int numRowsMTR = dataMTR.getCount();
                Cursor dataDC = this.coletaTableManager.getAllColetasDC();
                int numRowsDC = dataDC.getCount();
                if (numRowsMTR >= 3 && numRowsDC >= 1) {
                    parametrosDimensoes(this);
                } else if (numRowsMTR == 0) {
                    this.tvNroMtr.setVisibility(4);
                    this.tvPesoMtr.setVisibility(4);
                }
                return true;
            }
            if (this.idListViewHolderMenu == this.idListViewDC) {
                String id2 = this.userListDC.get(info.position).getId_coleta();
                this.coletaTableManager.deleteDataColeta(Integer.parseInt(id2));
                this.userListDC.remove(info.position);
                this.adapterDC.notifyDataSetChanged();
                Cursor dataDC2 = this.coletaTableManager.getAllColetasDC();
                int numRowsDC2 = dataDC2.getCount();
                Cursor dataMTR2 = this.coletaTableManager.getAllColetasMTR();
                if (dataMTR2.getCount() >= 3 && numRowsDC2 >= 1) {
                    parametrosDimensoes(this);
                } else if (numRowsDC2 == 0) {
                    this.tvNroDC.setVisibility(4);
                    this.tvPesoDC.setVisibility(4);
                }
                return true;
            }
        }
        return super.onContextItemSelected(item);
    }

    public void showToast(Context context, String message) {
        Toast toast = Toast.makeText(context, message, 1);
        toast.show();
    }

    public void createDialogGroup() {
        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(this);
        View senhaPopupView = getLayoutInflater().inflate(R.layout.popup_total_peso, (ViewGroup) null);
        TextView NroMtrGroup = (TextView) senhaPopupView.findViewById(R.id.NroMtrGroup);
        TextView pesoBrutoGroup = (TextView) senhaPopupView.findViewById(R.id.pesoBrutoGroup);
        TextView pesoLiqGroup = (TextView) senhaPopupView.findViewById(R.id.pesoLiqGroup);
        TextView contadorGroup = (TextView) senhaPopupView.findViewById(R.id.contadorGroup);
        TextView clienteMTRGroup = (TextView) senhaPopupView.findViewById(R.id.clienteMTRGroup);
        Button btnOkGroup = (Button) senhaPopupView.findViewById(R.id.fecharPopUpGroup);
        float totalPesoBruto = 0.0f;
        float pesobrutoAux = 0.0f;
        float totalPesoLiquido = 0.0f;
        int contadorPesos = 0;
        DecimalFormat df = new DecimalFormat("0.00");
        Integer clienteSelInt = Integer.valueOf(this.clienteSel);
        dialogBuilder.setView(senhaPopupView);
        this.dialog = dialogBuilder.create();
        this.myDB = new DatabaseHelper(this);
        Cursor data = this.coletaTableManager.getListGrouped(this.numeroMtrSel, clienteSelInt);
        data.moveToFirst();
        while (!data.isAfterLast()) {
            pesobrutoAux = Float.parseFloat(data.getString(data.getColumnIndex("peso_bruto")).replaceAll(",", "."));
            totalPesoBruto += pesobrutoAux;
            totalPesoLiquido += pesobrutoAux - data.getFloat(data.getColumnIndex(VolumeTableManager.COL_TARA));
            contadorPesos++;
            data.moveToNext();
            senhaPopupView = senhaPopupView;
        }
        data.close();
        if (this.MTR_DC.equals("MRT")) {
            NroMtrGroup.setText("MTR: " + this.numeroMtrSel);
        } else if (this.MTR_DC.equals("DC")) {
            NroMtrGroup.setText("DC: " + this.numeroMtrSel);
        }
        pesoBrutoGroup.setText("Total Peso Bruto: " + df.format(totalPesoBruto));
        pesoLiqGroup.setText("Total Peso Líquido: " + df.format(totalPesoLiquido));
        contadorGroup.setText("QTD. Lançamentos: " + contadorPesos);
        clienteMTRGroup.setText(this.clienteSel);
        this.dialog.show();
        btnOkGroup.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.ListagemColetasActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ListagemColetasActivity.this.dialog.dismiss();
            }
        });
    }

    private void parametrosDimensoes(Context context) {
        DisplayMetrics displayMetricsH = getResources().getDisplayMetrics();
        float screenHeightDpH = displayMetricsH.heightPixels / displayMetricsH.density;
        int heigthElmt = (Math.round(screenHeightDpH) / 2) - 75;
        DisplayMetrics displayMetricsW = getResources().getDisplayMetrics();
        float screenHeightDpW = displayMetricsW.widthPixels / displayMetricsW.density;
        int widthElmt = Math.round(screenHeightDpW);
        int heightPx = (int) TypedValue.applyDimension(1, heigthElmt, getResources().getDisplayMetrics());
        int widthPx = (int) TypedValue.applyDimension(1, widthElmt, getResources().getDisplayMetrics());
        ViewGroup.LayoutParams params = new LinearLayout.LayoutParams(widthPx, heightPx);
        this.listViewMTR.setLayoutParams(params);
        this.listViewDC.setLayoutParams(params);
    }
}
