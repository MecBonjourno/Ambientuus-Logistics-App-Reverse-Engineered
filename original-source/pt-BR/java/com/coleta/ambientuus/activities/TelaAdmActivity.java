package com.coleta.ambientuus.activities;

import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.widget.ListAdapter;
import android.widget.ListView;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AppCompatActivity;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.main.MainActivity;
import com.coleta.ambientuus.adapters.ColetasADMAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.dto.Coleta;
import java.util.ArrayList;

/* carregado de: classes3.dex */
public class TelaAdmActivity extends AppCompatActivity {
    ColetasADMAdapter adapter;
    ListView listView;
    DatabaseHelper myDB;
    Coleta user;
    ArrayList<Coleta> userList;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tela_adm);
        this.myDB = new DatabaseHelper(this);
        ColetaTableManager coletaTableManager = new ColetaTableManager(this.myDB.getDatabase());
        this.userList = new ArrayList<>();
        Cursor data = coletaTableManager.getAllColetasAdm();
        int numRows = data.getCount();
        boolean z = true;
        if (numRows != 0) {
            int i = 0;
            while (data.moveToNext()) {
                this.user = new Coleta(data.getString(0), data.getString(1), data.getString(2), Integer.valueOf((int) data.getLong(3)), Integer.valueOf((int) data.getLong(4)), data.getString(5), data.getString(6), data.getString(7), data.getString(9), data.getString(11));
                this.userList.add(i, this.user);
                i++;
            }
            this.adapter = new ColetasADMAdapter(this, R.layout.list_adapter_view_adm, this.userList);
            this.listView = (ListView) findViewById(R.id.listviewADM);
            this.listView.setAdapter((ListAdapter) this.adapter);
            registerForContextMenu(this.listView);
        }
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // da classe: com.coleta.ambientuus.activities.TelaAdmActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                TelaAdmActivity.this.startActivity(new Intent(TelaAdmActivity.this, (Class<?>) MainActivity.class));
                TelaAdmActivity.this.finish();
            }
        });
    }
}
