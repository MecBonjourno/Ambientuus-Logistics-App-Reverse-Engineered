package com.coleta.ambientuus.activities.pontoColeta;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.TextView;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.widget.SwitchCompat;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.BuscaDispositivoActivity;
import com.coleta.ambientuus.activities.main.BaseActivity;
import com.coleta.ambientuus.adapters.EtiquetaPontoColetaAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.domain.model.TipoPesagem;
import com.coleta.ambientuus.dto.Etiqueta;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.utils.ButtonStyles;
import com.coleta.ambientuus.utils.PesagemPreferences;
import com.coleta.ambientuus.utils.TextStyles;
import com.google.android.material.button.MaterialButton;
import j$.util.Objects;
import java.util.ArrayList;

/* carregado de: classes14.dex */
public class CapaPontoColetaActivity extends BaseActivity {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private EtiquetaPontoColetaAdapter adapter;
    private MaterialButton btnColetarPonto;
    private MaterialButton btnIniciarColetaCapa;
    private Boolean editando;
    private Boolean finaliza;
    private Boolean pendente;
    private PontoColeta pontoColeta;
    private SwitchCompat smClienteAusente;
    private SwitchCompat smSemResiduo;

    @Override // com.coleta.ambientuus.activities.main.BaseActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle saveInstanceState) {
        super.onCreate(saveInstanceState);
        setContentView(R.layout.activity_ponto_coleta_capa);
        ((ActionBar) Objects.requireNonNull(getSupportActionBar())).setIcon(R.mipmap.ic_launcher);
        this.pontoColeta = (PontoColeta) getIntent().getParcelableExtra("ponto");
        this.finaliza = Boolean.valueOf(getIntent().getBooleanExtra("finaliza", false));
        this.pendente = Boolean.valueOf(getIntent().getBooleanExtra("pendente", false));
        this.editando = Boolean.valueOf(getIntent().getBooleanExtra("editando", false));
        initInfoPontoColeta();
        initButtons();
        initSwitchs();
        createRecyclerView();
        verifyEditando();
        verifyColetaState();
    }

    private void initInfoPontoColeta() {
        TextView tvNomeCliente = (TextView) findViewById(R.id.tvNomeCliente);
        tvNomeCliente.setText(TextStyles.getTextWithBoldPrefix("Cliente: ", this.pontoColeta.getCodCliente() + " - " + this.pontoColeta.getRazaoSocial()));
        TextView tvEndereco = (TextView) findViewById(R.id.tvEndereco);
        tvEndereco.setText(TextStyles.getTextWithBoldPrefix("Endereço: ", this.pontoColeta.getEndereco()));
        TextView tvMtr = (TextView) findViewById(R.id.tvMtr);
        tvMtr.setText(TextStyles.getTextWithBoldPrefix("MTR: ", this.pontoColeta.getNumeroManifesto()));
        if ("N".equals(this.pontoColeta.getClienteEmiteMtr())) {
            String numeroManifesto = this.pontoColeta.getNumeroManifesto();
            if (!numeroManifesto.contains("DC")) {
                tvMtr.setText(TextStyles.getTextWithBoldPrefix("MTR: ", numeroManifesto));
            } else {
                tvMtr.setText(TextStyles.getTextWithBoldPrefix("DC: ", numeroManifesto.replace("DC", "")));
            }
        } else {
            tvMtr.setText(TextStyles.getTextBold("Cliente MTR"));
        }
        TextView tvDestinador = (TextView) findViewById(R.id.tvDestinador);
        tvDestinador.setText(TextStyles.getTextWithBoldPrefix("Destinador: ", this.pontoColeta.getDestino()));
        TextView tvResiduo = (TextView) findViewById(R.id.tvResiduo);
        tvResiduo.setText(TextStyles.getTextWithBoldPrefix("Resíduo: ", this.pontoColeta.getTipoResiduo()));
        TextView tvPeriodicidade = (TextView) findViewById(R.id.tvPeriodicidade);
        tvPeriodicidade.setText(TextStyles.getTextWithBoldPrefix("Periodicidade: ", this.pontoColeta.getPeriodicidade()));
        TextView tvObservacoes = (TextView) findViewById(R.id.tvObservacoes);
        if (this.pontoColeta.getObservacaoMtr() != null) {
            String Observacao = this.pontoColeta.getObservacaoMtr().substring(0, 1).toUpperCase() + this.pontoColeta.getObservacaoMtr().substring(1).toLowerCase();
            String textoFormatado = Observacao.replace("\\n", "\n");
            tvObservacoes.setText(textoFormatado);
        }
    }

    private void initButtons() {
        this.btnIniciarColetaCapa = (MaterialButton) findViewById(R.id.btnIniciarColetaCapa);
        this.btnIniciarColetaCapa.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.CapaPontoColetaActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                CapaPontoColetaActivity.this.lambda$initButtons$1(view);
            }
        });
        ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnIniciarColetaCapa, this);
        this.btnColetarPonto = (MaterialButton) findViewById(R.id.btnColetarPonto);
        this.btnColetarPonto.setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.CapaPontoColetaActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                CapaPontoColetaActivity.this.lambda$initButtons$2(view);
            }
        });
        disableButton();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$1(View v) {
        if (!this.editando.booleanValue()) {
            Intent intent = new Intent(this, (Class<?>) PontoColetaEtiquetaActivity.class);
            intent.putExtra("ponto", this.pontoColeta);
            startActivity(intent);
            return;
        }
        PesagemPreferences.verifyPreferences(this, new PesagemPreferences.TipoPesagemCallback() { // da classe: com.coleta.ambientuus.activities.pontoColeta.CapaPontoColetaActivity$$ExternalSyntheticLambda4
            @Override // com.coleta.ambientuus.utils.PesagemPreferences.TipoPesagemCallback
            public final void onTipoPesagemSelecionado(TipoPesagem tipoPesagem) {
                CapaPontoColetaActivity.this.lambda$initButtons$0(tipoPesagem);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$0(TipoPesagem tipo) {
        Intent intent;
        if (Objects.equals(tipo.getValor(), TipoPesagem.BLUETOOTH.getValor())) {
            intent = new Intent(this, (Class<?>) BuscaDispositivoActivity.class);
        } else {
            intent = new Intent(this, (Class<?>) IniciarColetaActivity.class);
        }
        intent.setFlags(603979776);
        intent.putExtra("ponto", this.pontoColeta);
        intent.putExtra("tipo", tipo.getValor());
        startActivity(intent);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initButtons$2(View v) {
        finalizeColetaButtonAction();
    }

    private void initSwitchs() {
        this.smSemResiduo = (SwitchCompat) findViewById(R.id.smSemResiduo);
        this.smClienteAusente = (SwitchCompat) findViewById(R.id.smClienteAusente);
        CompoundButton.OnCheckedChangeListener listener = new CompoundButton.OnCheckedChangeListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.CapaPontoColetaActivity$$ExternalSyntheticLambda5
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public final void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                CapaPontoColetaActivity.this.lambda$initSwitchs$3(compoundButton, z);
            }
        };
        this.smSemResiduo.setOnCheckedChangeListener(listener);
        this.smClienteAusente.setOnCheckedChangeListener(listener);
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$initSwitchs$3(CompoundButton v, boolean isChecked) {
        if (v == this.smSemResiduo && isChecked) {
            this.smClienteAusente.setChecked(false);
        } else if (v == this.smClienteAusente && isChecked) {
            this.smSemResiduo.setChecked(false);
        }
        if (this.smSemResiduo.isChecked() || this.smClienteAusente.isChecked()) {
            enableButton();
            this.btnIniciarColetaCapa.setEnabled(false);
            ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnIniciarColetaCapa, this);
        } else {
            disableButton();
            this.btnIniciarColetaCapa.setEnabled(true);
            ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnIniciarColetaCapa, this);
        }
    }

    private void enableButton() {
        this.btnColetarPonto.setEnabled(true);
        ButtonStyles.aplicarEstiloFullWidthColoredButton(this.btnColetarPonto, this);
    }

    private void disableButton() {
        this.btnColetarPonto.setEnabled(false);
        ButtonStyles.aplicarEstiloFullWidthColoredButtonDisabled(this.btnColetarPonto, this);
    }

    private void verifyEditando() {
        if (this.editando.booleanValue()) {
            findViewById(R.id.llColetaSemResiduoClienteAusente).setVisibility(8);
        }
    }

    private void verifyColetaState() {
        if (this.pendente.booleanValue()) {
            preparePendente();
        } else if (this.finaliza.booleanValue()) {
            prepareFinaliza();
        }
    }

    private void finalizeColetaButtonAction() {
        DatabaseHelper databaseHelper = new DatabaseHelper(this);
        ColetaTableManager coletaTableManager = new ColetaTableManager(databaseHelper.getDatabase());
        SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
        int IdRotaStatico = preferences.getInt("id_rota", 0);
        PontoColetaTableManager pontoColetaTableManager = new PontoColetaTableManager(databaseHelper.getDatabase());
        if (this.smSemResiduo.isChecked()) {
            coletaTableManager.insertSemResiduo(this.pontoColeta, IdRotaStatico);
            pontoColetaTableManager.updateStatus(this.pontoColeta.getId(), PontoColetaTableManager.STATUS_SEM_RESIDUO);
        } else if (this.smClienteAusente.isChecked()) {
            coletaTableManager.insertClienteAusente(this.pontoColeta, IdRotaStatico);
            pontoColetaTableManager.updateStatus(this.pontoColeta.getId(), PontoColetaTableManager.STATUS_CLIENTE_AUSENTE);
        }
        if (this.finaliza.booleanValue()) {
            pontoColetaTableManager.updateStatus(this.pontoColeta.getId(), PontoColetaTableManager.STATUS_COLETADO);
        }
        Intent intent = new Intent(this, (Class<?>) ListagemPontoColetaActivity.class);
        intent.setFlags(603979776);
        startActivity(intent);
        finish();
    }

    private void hideInfoColetaReturn() {
        findViewById(R.id.llColetaSemResiduoClienteAusente).setVisibility(8);
        findViewById(R.id.clObservacao).setVisibility(8);
        this.btnIniciarColetaCapa.setVisibility(8);
    }

    private void prepareFinaliza() {
        hideInfoColetaReturn();
        enableButton();
    }

    private void preparePendente() {
        hideInfoColetaReturn();
        this.btnColetarPonto.setVisibility(8);
        findViewById(R.id.llColetaPendenteMensagem).setVisibility(0);
        findViewById(R.id.llColetaPendenteBotoes).setVisibility(0);
        findViewById(R.id.btnColetarSalvarPendente).setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.CapaPontoColetaActivity$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                CapaPontoColetaActivity.this.lambda$preparePendente$4(view);
            }
        });
        findViewById(R.id.btnColetarPontoPendente).setOnClickListener(new View.OnClickListener() { // da classe: com.coleta.ambientuus.activities.pontoColeta.CapaPontoColetaActivity$$ExternalSyntheticLambda3
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                CapaPontoColetaActivity.this.lambda$preparePendente$5(view);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$preparePendente$4(View V) {
        DatabaseHelper databaseHelper = new DatabaseHelper(this);
        PontoColetaTableManager pontoColetaTableManager = new PontoColetaTableManager(databaseHelper.getDatabase());
        pontoColetaTableManager.updateStatus(this.pontoColeta.getId(), PontoColetaTableManager.STATUS_EDITAVEL);
        Intent intent = new Intent(this, (Class<?>) ListagemPontoColetaActivity.class);
        intent.setFlags(603979776);
        startActivity(intent);
        finish();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$preparePendente$5(View v) {
        finalizeColetaButtonAction();
    }

    private void createRecyclerView() {
        ArrayList<Etiqueta> etiquetas = new EtiquetaTableManager(new DatabaseHelper(this).getDatabase()).selectEtiquetaManifesto(this.pontoColeta.getIdManifesto());
        if (!etiquetas.isEmpty()) {
            RecyclerView listagemEtiqueta = (RecyclerView) findViewById(R.id.rvEtiquetasPontoColeta);
            listagemEtiqueta.setHasFixedSize(true);
            listagemEtiqueta.setLayoutManager(new LinearLayoutManager(this));
            DividerItemDecoration dividerItemDecoration = new DividerItemDecoration(listagemEtiqueta.getContext(), 1);
            listagemEtiqueta.addItemDecoration(dividerItemDecoration);
            this.adapter = new EtiquetaPontoColetaAdapter(etiquetas);
            listagemEtiqueta.setAdapter(this.adapter);
            return;
        }
        findViewById(R.id.listagemEtiquetasPontosColetas).setVisibility(8);
    }
}
