package com.coleta.ambientuus.fragments;

import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.adapters.EtiquetaManifestoAdapter;
import com.coleta.ambientuus.dto.Etiqueta;
import com.coleta.ambientuus.fragments.EtiquetasManifestoFragment;
import com.google.android.material.bottomsheet.BottomSheetDialogFragment;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes12.dex */
public class EtiquetasManifestoFragment extends BottomSheetDialogFragment {
    private EtiquetaManifestoAdapter adapter;
    private List<Etiqueta> etiquetas;
    private OnItemSelecionadoListener listener;
    private RecyclerView rvEtiquetas;

    public interface OnItemSelecionadoListener {
        void onItemSelecionado(String str);
    }

    public void setOnItemSelecionadoListener(OnItemSelecionadoListener listener) {
        this.listener = listener;
    }

    public EtiquetasManifestoFragment(List<Etiqueta> etiquetas) {
        this.etiquetas = etiquetas;
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_etiquetas_manifestos_bottom_sheet, container, false);
        this.rvEtiquetas = (RecyclerView) view.findViewById(R.id.rvEtiquetasManifesto);
        this.rvEtiquetas.setLayoutManager(new LinearLayoutManager(getContext()));
        this.adapter = new EtiquetaManifestoAdapter(this.etiquetas, new EtiquetaManifestoAdapter.OnItemClickListener() { // da classe: com.coleta.ambientuus.fragments.EtiquetasManifestoFragment$$ExternalSyntheticLambda0
            @Override // com.coleta.ambientuus.adapters.EtiquetaManifestoAdapter.OnItemClickListener
            public final void onClick(String str) {
                EtiquetasManifestoFragment.this.lambda$onCreateView$0(str);
            }
        });
        this.rvEtiquetas.setAdapter(this.adapter);
        initSearchView(view);
        return view;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$onCreateView$0(String item) {
        if (this.listener != null) {
            this.listener.onItemSelecionado(item);
        }
        dismiss();
    }

    /* renomeado de: com.coleta.ambientuus.fragments.EtiquetasManifestoFragment$1, motivo: nome de classe inválido */
    class AnonymousClass1 implements TextWatcher {
        AnonymousClass1() {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int i, int i1, int i2) {
            if (s != null) {
                ArrayList<Etiqueta> etiquetasFiltradas = new ArrayList<>();
                for (Etiqueta etiqueta : EtiquetasManifestoFragment.this.etiquetas) {
                    if (etiqueta.getCod_etiqueta().toLowerCase().contains(s.toString().toLowerCase())) {
                        etiquetasFiltradas.add(etiqueta);
                    }
                }
                EtiquetasManifestoFragment.this.adapter = new EtiquetaManifestoAdapter(etiquetasFiltradas, new EtiquetaManifestoAdapter.OnItemClickListener() { // da classe: com.coleta.ambientuus.fragments.EtiquetasManifestoFragment$1$$ExternalSyntheticLambda0
                    @Override // com.coleta.ambientuus.adapters.EtiquetaManifestoAdapter.OnItemClickListener
                    public final void onClick(String str) {
                        EtiquetasManifestoFragment.AnonymousClass1.this.lambda$onTextChanged$0(str);
                    }
                });
                EtiquetasManifestoFragment.this.rvEtiquetas.swapAdapter(EtiquetasManifestoFragment.this.adapter, true);
                return;
            }
            EtiquetasManifestoFragment.this.adapter = new EtiquetaManifestoAdapter(EtiquetasManifestoFragment.this.etiquetas, new EtiquetaManifestoAdapter.OnItemClickListener() { // da classe: com.coleta.ambientuus.fragments.EtiquetasManifestoFragment$1$$ExternalSyntheticLambda1
                @Override // com.coleta.ambientuus.adapters.EtiquetaManifestoAdapter.OnItemClickListener
                public final void onClick(String str) {
                    EtiquetasManifestoFragment.AnonymousClass1.this.lambda$onTextChanged$1(str);
                }
            });
            EtiquetasManifestoFragment.this.rvEtiquetas.swapAdapter(EtiquetasManifestoFragment.this.adapter, true);
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public /* sintético */ void lambda$onTextChanged$0(String item) {
            if (EtiquetasManifestoFragment.this.listener != null) {
                EtiquetasManifestoFragment.this.listener.onItemSelecionado(item);
            }
            EtiquetasManifestoFragment.this.dismiss();
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public /* sintético */ void lambda$onTextChanged$1(String item) {
            if (EtiquetasManifestoFragment.this.listener != null) {
                EtiquetasManifestoFragment.this.listener.onItemSelecionado(item);
            }
            EtiquetasManifestoFragment.this.dismiss();
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable editable) {
        }
    }

    private void initSearchView(View view) {
        EditText etPesquisarEtiqueta = (EditText) view.findViewById(R.id.etPesquisarEtiquetaMTR);
        etPesquisarEtiqueta.addTextChangedListener(new AnonymousClass1());
    }
}
