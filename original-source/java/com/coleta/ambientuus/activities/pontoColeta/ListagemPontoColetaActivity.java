package com.coleta.ambientuus.activities.pontoColeta;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.widget.SwitchCompat;
import androidx.lifecycle.Observer;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.BuscaDispositivoActivity;
import com.coleta.ambientuus.activities.main.BaseActivity;
import com.coleta.ambientuus.activities.main.SelecaoActivity;
import com.coleta.ambientuus.adapters.PontoColetaAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.domain.model.SyncState;
import com.coleta.ambientuus.domain.model.TipoPesagem;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.ui.MaterialAlertUtil;
import com.coleta.ambientuus.utils.ButtonStyles;
import com.coleta.ambientuus.utils.PesagemPreferences;
import com.coleta.ambientuus.utils.SyncStatus;
import com.google.android.material.textfield.TextInputEditText;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes14.dex */
public class ListagemPontoColetaActivity extends BaseActivity {
    private PontoColetaAdapter adapter;
    private Button btnColetarPonto;
    private Button btnColetarPontoExtra;
    private Button btnEditarColeta;
    private Button btnExcluirColeta;
    private DatabaseHelper db;
    private LinearLayout layoutAguarde;
    private RecyclerView listagemPontoColeta;
    private PontoColeta pontoColetaSelecionado;
    private ArrayList<PontoColeta> pontoColetas;
    private SwitchCompat swColetasPendente;
    private TextInputEditText tiePesquisar;

    @Override // com.coleta.ambientuus.activities.main.BaseActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle saveInstanceState) {
        super.onCreate(saveInstanceState);
        setContentView(R.layout.activity_listagem_ponto_coleta);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.layoutAguarde = (LinearLayout) findViewById(R.id.layoutAguarde);
        this.layoutAguarde.setVisibility(0);
        SyncStatus.clearObservars(this);
        SyncStatus.getStatus().observe(this, new Observer() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda0
            @Override // androidx.lifecycle.Observer
            public final void onChanged(Object obj) {
                ListagemPontoColetaActivity.this.lambda$onCreate$0((SyncState) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onCreate$0(SyncState status) {
        Log.i("TESTE", status.name());
        switch (status) {
            case LOADING:
                this.layoutAguarde.setVisibility(0);
                break;
            case SUCCESS:
                this.layoutAguarde.setVisibility(8);
                initScreen();
                break;
            case ERROR:
                this.layoutAguarde.setVisibility(8);
                Toast.makeText(this, "Erro ao sincronizar", 1).show();
                break;
        }
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        initScreen();
    }

    private void initScreen() {
        initButton();
        getDatabase();
        createRecyclerView();
        initSearchView();
        initSwitch();
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(true) { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity.1
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                ListagemPontoColetaActivity.this.startActivity(new Intent(ListagemPontoColetaActivity.this, (Class<?>) SelecaoActivity.class));
                ListagemPontoColetaActivity.this.finish();
            }
        });
    }

    private void initButton() {
        this.btnColetarPonto = (Button) findViewById(R.id.btnColetarPonto);
        this.btnColetarPonto.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda7
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ListagemPontoColetaActivity.this.lambda$initButton$1(view);
            }
        });
        this.btnColetarPontoExtra = (Button) findViewById(R.id.btnColetarPontoExtra);
        this.btnColetarPontoExtra.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda8
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ListagemPontoColetaActivity.this.lambda$initButton$3(view);
            }
        });
        this.btnEditarColeta = (Button) findViewById(R.id.btnEditarColeta);
        this.btnEditarColeta.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda9
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ListagemPontoColetaActivity.this.lambda$initButton$4(view);
            }
        });
        this.btnExcluirColeta = (Button) findViewById(R.id.btnExcluirColeta);
        this.btnExcluirColeta.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda10
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                ListagemPontoColetaActivity.this.lambda$initButton$7(view);
            }
        });
        disableButtons();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$1(View v) {
        Intent intent = new Intent(this, (Class<?>) CapaPontoColetaActivity.class);
        intent.putExtra("ponto", this.pontoColetaSelecionado);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$3(View v) {
        PesagemPreferences.verifyPreferences(this, new PesagemPreferences.TipoPesagemCallback() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda1
            @Override // com.coleta.ambientuus.utils.PesagemPreferences.TipoPesagemCallback
            public final void onTipoPesagemSelecionado(TipoPesagem tipoPesagem) {
                ListagemPontoColetaActivity.this.lambda$initButton$2(tipoPesagem);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$2(TipoPesagem tipo) {
        Intent intent;
        if (Objects.equals(tipo.getValor(), TipoPesagem.BLUETOOTH.getValor())) {
            intent = new Intent(this, (Class<?>) BuscaDispositivoActivity.class);
            intent.putExtra("EXTRA", true);
        } else {
            intent = new Intent(this, (Class<?>) IniciarColetaExtraActivity.class);
        }
        intent.setFlags(603979776);
        intent.putExtra("ponto", this.pontoColetaSelecionado);
        intent.putExtra("tipo", tipo.getValor());
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$4(View v) {
        Intent intent = new Intent(this, (Class<?>) CapaPontoColetaActivity.class);
        intent.putExtra("ponto", this.pontoColetaSelecionado);
        intent.putExtra("editando", true);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$7(View v) {
        MaterialAlertUtil.mostrarConfirmacao(this, "Deseja Excluir?", "Todas as coletas e etiquetas vinculadas a este ponto de coleta serão excluídas.", "Sim", "Não", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda4
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                ListagemPontoColetaActivity.this.lambda$initButton$5(dialogInterface, i);
            }
        }, new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda5
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$5(DialogInterface dialog, int which) {
        deleteAllEtiquetaAndColetaFromPonto();
        refreshPontoColeta(Boolean.valueOf(this.swColetasPendente.isChecked()));
        refreshRecyclerView(this.pontoColetas);
        dialog.dismiss();
    }

    private void getDatabase() {
        this.db = new DatabaseHelper(this);
    }

    private void enableButtons() {
        if (Objects.equals(this.pontoColetaSelecionado.getStatus(), PontoColetaTableManager.STATUS_PENDENTE)) {
            this.btnColetarPonto.setEnabled(true);
            ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnColetarPonto, this);
        }
        if (!Objects.equals(this.pontoColetaSelecionado.getStatus(), PontoColetaTableManager.STATUS_SEM_RESIDUO) && !Objects.equals(this.pontoColetaSelecionado.getStatus(), PontoColetaTableManager.STATUS_CLIENTE_AUSENTE)) {
            this.btnColetarPontoExtra.setEnabled(true);
            ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnColetarPontoExtra, this);
        }
        if (Objects.equals(this.pontoColetaSelecionado.getStatus(), PontoColetaTableManager.STATUS_EDITAVEL)) {
            this.btnEditarColeta.setEnabled(true);
            ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnEditarColeta, this);
        }
        if (!Objects.equals(this.pontoColetaSelecionado.getStatus(), PontoColetaTableManager.STATUS_PENDENTE)) {
            this.btnExcluirColeta.setEnabled(true);
            ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnExcluirColeta, this);
        }
        if (PontoColetaTableManager.STATUS_COLETA_REALIZADA.equals(this.pontoColetaSelecionado.getStatus())) {
            disableButtons();
        }
    }

    private void disableButtons() {
        this.btnColetarPonto.setEnabled(false);
        ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnColetarPonto, this);
        this.btnColetarPontoExtra.setEnabled(false);
        ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnColetarPontoExtra, this);
        this.btnEditarColeta.setEnabled(false);
        ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnEditarColeta, this);
        this.btnExcluirColeta.setEnabled(false);
        ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnExcluirColeta, this);
    }

    private RecyclerView prepareRecyclerView() {
        refreshPontoColeta(true);
        this.listagemPontoColeta = (RecyclerView) findViewById(R.id.rv_PontoColeta);
        this.listagemPontoColeta.setHasFixedSize(true);
        this.listagemPontoColeta.setLayoutManager(new LinearLayoutManager(this));
        this.listagemPontoColeta.setAdapter(this.adapter);
        this.adapter = new PontoColetaAdapter(this.pontoColetas);
        actionOnAdpaterClick(this.adapter);
        return this.listagemPontoColeta;
    }

    private void createRecyclerView() {
        prepareRecyclerView().setAdapter(this.adapter);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        SyncStatus.clearObservars(this);
        SyncStatus.getStatus().observe(this, new Observer() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda2
            @Override // androidx.lifecycle.Observer
            public final void onChanged(Object obj) {
                ListagemPontoColetaActivity.this.lambda$onResume$8((SyncState) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onResume$8(SyncState status) {
        Log.i("TESTE", status.name());
        switch (status) {
            case LOADING:
                this.layoutAguarde.setVisibility(0);
                break;
            case SUCCESS:
                this.layoutAguarde.setVisibility(8);
                initScreen();
                break;
            case ERROR:
                this.layoutAguarde.setVisibility(8);
                Toast.makeText(this, "Erro ao sincronizar", 1).show();
                break;
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
    }

    private void actionOnAdpaterClick(PontoColetaAdapter adapter) {
        adapter.setOnItemSelectListener(new PontoColetaAdapter.OnItemSelectListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda3
            @Override // com.coleta.ambientuus.adapters.PontoColetaAdapter.OnItemSelectListener
            public final void onItemSelected(PontoColeta pontoColeta) {
                ListagemPontoColetaActivity.this.lambda$actionOnAdpaterClick$9(pontoColeta);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$actionOnAdpaterClick$9(PontoColeta selecionado) {
        this.pontoColetaSelecionado = selecionado;
        disableButtons();
        enableButtons();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void filterPontosColeta(String filter) {
        ArrayList<PontoColeta> pontoColetasFiltrados = new ArrayList<>();
        Iterator<PontoColeta> it = this.pontoColetas.iterator();
        while (it.hasNext()) {
            PontoColeta pontoColeta = it.next();
            if (pontoColeta.contemTexto(filter)) {
                pontoColetasFiltrados.add(pontoColeta);
            }
        }
        refreshRecyclerView(pontoColetasFiltrados);
    }

    private void initSearchView() {
        this.tiePesquisar = (TextInputEditText) findViewById(R.id.tiePesquisar);
        this.tiePesquisar.addTextChangedListener(new TextWatcher() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity.2
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int i, int i1, int i2) {
                if (s != null) {
                    ListagemPontoColetaActivity.this.filterPontosColeta(s.toString());
                } else {
                    ListagemPontoColetaActivity.this.refreshRecyclerView(ListagemPontoColetaActivity.this.pontoColetas);
                }
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
            }
        });
    }

    private void initSwitch() {
        this.swColetasPendente = (SwitchCompat) findViewById(R.id.swColetasPendente);
        this.swColetasPendente.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.coleta.ambientuus.activities.pontoColeta.ListagemPontoColetaActivity$$ExternalSyntheticLambda6
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                ListagemPontoColetaActivity.this.lambda$initSwitch$10(compoundButton, z);
            }
        });
        this.swColetasPendente.setChecked(true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initSwitch$10(CompoundButton v, boolean isChecked) {
        refreshPontoColeta(Boolean.valueOf(isChecked));
        String filtro = this.tiePesquisar.getText().toString();
        if (!filtro.isEmpty()) {
            filterPontosColeta(filtro);
        } else {
            refreshRecyclerView(this.pontoColetas);
        }
    }

    private void refreshPontoColeta(Boolean isChecked) {
        if (isChecked.booleanValue()) {
            this.pontoColetas = new PontoColetaTableManager(this.db.getDatabase()).selectPontoColetaPendente();
        } else {
            this.pontoColetas = new PontoColetaTableManager(this.db.getDatabase()).selectPontoColeta();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void refreshRecyclerView(ArrayList<PontoColeta> pontoColetas) {
        this.adapter = new PontoColetaAdapter(pontoColetas);
        actionOnAdpaterClick(this.adapter);
        this.listagemPontoColeta.swapAdapter(this.adapter, true);
    }

    private void deleteAllEtiquetaAndColetaFromPonto() {
        new ColetaTableManager(this.db.getDatabase()).deleteAllColetasManifesto(this.pontoColetaSelecionado.getNumeroManifesto(), this.pontoColetaSelecionado.getIdCliente());
        new EtiquetaTableManager(this.db.getDatabase()).deleteAllManifesto(this.pontoColetaSelecionado.getIdManifesto());
        new PontoColetaTableManager(this.db.getDatabase()).updateStatus(this.pontoColetaSelecionado.getId(), PontoColetaTableManager.STATUS_PENDENTE);
    }
}
