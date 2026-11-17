package com.coleta.ambientuus.activities;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.adapters.ManifestoAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ManifestoTableManager;
import com.coleta.ambientuus.dto.Manifesto;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public class ListagemManifestoActivity extends AppCompatActivity {
    private ManifestoAdapter adapter;
    private DatabaseHelper db;
    private RecyclerView listagemManifesto;
    private ArrayList<Manifesto> manifestos;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_listagem_manifesto);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        getDatabase();
        createRecyclerView();
        initSearchView();
    }

    private void getDatabase() {
        this.db = new DatabaseHelper(this);
    }

    private RecyclerView prepareRecyclerView() {
        this.manifestos = new ManifestoTableManager(this.db.getDatabase()).selectManifestos();
        this.listagemManifesto = (RecyclerView) findViewById(R.id.rv_Manifesto);
        this.listagemManifesto.setHasFixedSize(true);
        this.listagemManifesto.setLayoutManager(new LinearLayoutManager(this));
        this.listagemManifesto.setAdapter(this.adapter);
        this.adapter = new ManifestoAdapter(this.manifestos, this);
        return this.listagemManifesto;
    }

    private void createRecyclerView() {
        prepareRecyclerView().setAdapter(this.adapter);
    }

    private void initSearchView() {
        EditText etPesquisarManifesto = (EditText) findViewById(R.id.etPesquisarManifesto);
        etPesquisarManifesto.addTextChangedListener(new TextWatcher() { // from class: com.coleta.ambientuus.activities.ListagemManifestoActivity.1
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int i, int i1, int i2) {
                if (s != null) {
                    ArrayList<Manifesto> manifestosFiltrados = new ArrayList<>();
                    Iterator it = ListagemManifestoActivity.this.manifestos.iterator();
                    while (it.hasNext()) {
                        Manifesto manifesto = (Manifesto) it.next();
                        if (manifesto.contemTexto(s.toString())) {
                            manifestosFiltrados.add(manifesto);
                        }
                    }
                    ListagemManifestoActivity.this.adapter = new ManifestoAdapter(manifestosFiltrados, ListagemManifestoActivity.this);
                    ListagemManifestoActivity.this.listagemManifesto.swapAdapter(ListagemManifestoActivity.this.adapter, true);
                    return;
                }
                ListagemManifestoActivity.this.adapter = new ManifestoAdapter(ListagemManifestoActivity.this.manifestos, ListagemManifestoActivity.this);
                ListagemManifestoActivity.this.listagemManifesto.swapAdapter(ListagemManifestoActivity.this.adapter, true);
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
            }
        });
    }
}
