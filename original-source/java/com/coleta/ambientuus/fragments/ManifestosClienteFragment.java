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
import com.coleta.ambientuus.adapters.ManifestosClienteAdapter;
import com.coleta.ambientuus.dto.Manifesto;
import com.coleta.ambientuus.fragments.ManifestosClienteFragment;
import com.google.android.material.bottomsheet.BottomSheetDialogFragment;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

/* loaded from: classes12.dex */
public class ManifestosClienteFragment extends BottomSheetDialogFragment {
    private ManifestosClienteAdapter adapter;
    private OnItemSelecionadoListener listener;
    private List<Manifesto> manifestos;
    private RecyclerView rvManifestosCliente;

    public interface OnItemSelecionadoListener {
        void onItemSelecionado(String str);
    }

    public void setOnItemSelecionadoListener(OnItemSelecionadoListener listener) {
        this.listener = listener;
    }

    public ManifestosClienteFragment(List<Manifesto> manifestos) {
        this.manifestos = manifestos;
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@Nonnull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_manifestos_cliente_bottom_sheet, container, false);
        this.rvManifestosCliente = (RecyclerView) view.findViewById(R.id.rvManifestosCliente);
        this.rvManifestosCliente.setLayoutManager(new LinearLayoutManager(getContext()));
        this.adapter = new ManifestosClienteAdapter(this.manifestos, new ManifestosClienteAdapter.OnItemClickListener() { // from class: com.coleta.ambientuus.fragments.ManifestosClienteFragment$$ExternalSyntheticLambda0
            @Override // com.coleta.ambientuus.adapters.ManifestosClienteAdapter.OnItemClickListener
            public final void onClick(String str) {
                ManifestosClienteFragment.this.lambda$onCreateView$0(str);
            }
        });
        this.rvManifestosCliente.setAdapter(this.adapter);
        initSearchView(view);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onCreateView$0(String item) {
        if (this.listener != null) {
            this.listener.onItemSelecionado(item);
        }
        dismiss();
    }

    /* renamed from: com.coleta.ambientuus.fragments.ManifestosClienteFragment$1, reason: invalid class name */
    class AnonymousClass1 implements TextWatcher {
        AnonymousClass1() {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int i, int i1, int i2) {
            if (s != null) {
                ArrayList<Manifesto> manifestosFiltrados = new ArrayList<>();
                for (Manifesto manifesto : ManifestosClienteFragment.this.manifestos) {
                    if (manifesto.contemTexto(s.toString())) {
                        manifestosFiltrados.add(manifesto);
                    }
                }
                ManifestosClienteFragment.this.adapter = new ManifestosClienteAdapter(manifestosFiltrados, new ManifestosClienteAdapter.OnItemClickListener() { // from class: com.coleta.ambientuus.fragments.ManifestosClienteFragment$1$$ExternalSyntheticLambda0
                    @Override // com.coleta.ambientuus.adapters.ManifestosClienteAdapter.OnItemClickListener
                    public final void onClick(String str) {
                        ManifestosClienteFragment.AnonymousClass1.this.lambda$onTextChanged$0(str);
                    }
                });
                ManifestosClienteFragment.this.rvManifestosCliente.swapAdapter(ManifestosClienteFragment.this.adapter, true);
                return;
            }
            ManifestosClienteFragment.this.adapter = new ManifestosClienteAdapter(ManifestosClienteFragment.this.manifestos, new ManifestosClienteAdapter.OnItemClickListener() { // from class: com.coleta.ambientuus.fragments.ManifestosClienteFragment$1$$ExternalSyntheticLambda1
                @Override // com.coleta.ambientuus.adapters.ManifestosClienteAdapter.OnItemClickListener
                public final void onClick(String str) {
                    ManifestosClienteFragment.AnonymousClass1.this.lambda$onTextChanged$1(str);
                }
            });
            ManifestosClienteFragment.this.rvManifestosCliente.swapAdapter(ManifestosClienteFragment.this.adapter, true);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onTextChanged$0(String item) {
            if (ManifestosClienteFragment.this.listener != null) {
                ManifestosClienteFragment.this.listener.onItemSelecionado(item);
            }
            ManifestosClienteFragment.this.dismiss();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onTextChanged$1(String item) {
            if (ManifestosClienteFragment.this.listener != null) {
                ManifestosClienteFragment.this.listener.onItemSelecionado(item);
            }
            ManifestosClienteFragment.this.dismiss();
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable editable) {
        }
    }

    private void initSearchView(View view) {
        EditText etPesquisarManifesto = (EditText) view.findViewById(R.id.etPesquisarMTRsClientes);
        etPesquisarManifesto.addTextChangedListener(new AnonymousClass1());
    }
}
