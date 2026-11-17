package com.coleta.ambientuus.fragments;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.exifinterface.media.ExifInterface;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.LeitorEtiquetaActivity;
import com.coleta.ambientuus.adapters.EtiquetaAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.dto.Etiqueta;
import com.google.android.material.bottomsheet.BottomSheetDialogFragment;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import java.util.List;

/* loaded from: classes12.dex */
public class EtiquetasFragment extends BottomSheetDialogFragment {
    private EtiquetaAdapter adapter;
    private List<Etiqueta> etiquetas;
    private Integer idManifesto;
    private ActivityResultLauncher<Intent> leitorEtiquetaLauncher;

    public EtiquetasFragment(List<Etiqueta> etiquetas, Integer idManifesto) {
        this.etiquetas = etiquetas;
        this.idManifesto = idManifesto;
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_etiquetas_bottom_sheet, container, false);
        RecyclerView rvEtiquetas = (RecyclerView) view.findViewById(R.id.rvEtiquetas);
        rvEtiquetas.setLayoutManager(new LinearLayoutManager(getContext()));
        this.adapter = new EtiquetaAdapter(this.etiquetas);
        rvEtiquetas.setAdapter(this.adapter);
        prepareReader();
        initButton(view);
        return view;
    }

    public void prepareReader() {
        this.leitorEtiquetaLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment$$ExternalSyntheticLambda0
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                EtiquetasFragment.this.lambda$prepareReader$2((ActivityResult) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$prepareReader$2(ActivityResult result) {
        Intent data;
        if (result.getResultCode() == 200 && (data = result.getData()) != null) {
            Etiqueta etiqueta = new Etiqueta(null, data.getStringExtra("codigoEtiqueta"), this.idManifesto, ExifInterface.GPS_MEASUREMENT_IN_PROGRESS);
            EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(new DatabaseHelper(getContext()).getDatabase());
            if (!etiquetaTableManager.verificarEtiquetaEmOutroManifesto(etiqueta.getCod_etiqueta(), etiqueta.getId_manifesto())) {
                if (!etiquetaTableManager.verificarEtiquetaNoManifesto(etiqueta.getCod_etiqueta(), etiqueta.getId_manifesto())) {
                    etiquetaTableManager.insert(etiqueta);
                    MediaPlayer mediaPlayer = MediaPlayer.create(getContext(), R.raw.beep_ok);
                    mediaPlayer.start();
                    this.etiquetas.add(etiqueta);
                    this.adapter.notifyItemInserted(this.etiquetas.size() - 1);
                    return;
                }
                MediaPlayer mediaPlayer2 = MediaPlayer.create(getContext(), R.raw.beep_erro);
                mediaPlayer2.start();
                AlertDialog alertDialog = new AlertDialog.Builder(getContext()).create();
                alertDialog.setTitle("Erro");
                alertDialog.setMessage("Etiqueta " + etiqueta.getCod_etiqueta() + " já vinculada a este manifesto!");
                alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment$$ExternalSyntheticLambda5
                    @Override // android.content.DialogInterface.OnClickListener
                    public final void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                    }
                });
                alertDialog.setIcon(R.drawable.ic_alert_dialog_error);
                alertDialog.show();
                return;
            }
            MediaPlayer mediaPlayer3 = MediaPlayer.create(getContext(), R.raw.beep_erro);
            mediaPlayer3.start();
            AlertDialog alertDialog2 = new AlertDialog.Builder(getContext()).create();
            alertDialog2.setTitle("Erro");
            alertDialog2.setMessage("Etiqueta " + etiqueta.getCod_etiqueta() + " já vinculada a outro manifesto(Nro: " + etiquetaTableManager.retornaManifestoEtiqueta(etiqueta.getCod_etiqueta()).getNumero_manifesto() + ")!");
            alertDialog2.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment$$ExternalSyntheticLambda6
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.dismiss();
                }
            });
            alertDialog2.setIcon(R.drawable.ic_alert_dialog_error);
            alertDialog2.show();
        }
    }

    public void initButton(View view) {
        view.findViewById(R.id.btnLerCodigo).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view2) {
                EtiquetasFragment.this.lambda$initButton$3(view2);
            }
        });
        view.findViewById(R.id.btnExcluirTodas).setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view2) {
                EtiquetasFragment.this.lambda$initButton$6(view2);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$3(View v) {
        Dexter.withActivity(getActivity()).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment.1
            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionGranted(PermissionGrantedResponse response) {
                Intent intent = new Intent(EtiquetasFragment.this.getActivity(), (Class<?>) LeitorEtiquetaActivity.class);
                EtiquetasFragment.this.leitorEtiquetaLauncher.launch(intent);
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionDenied(PermissionDeniedResponse response) {
                Toast.makeText(EtiquetasFragment.this.getActivity(), "Precisa da permissão da câmera", 1).show();
            }

            @Override // com.karumi.dexter.listener.single.PermissionListener
            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
            }
        }).check();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$6(View v) {
        AlertDialog alertDialog = new AlertDialog.Builder(getContext()).create();
        alertDialog.setTitle("Deseja excluir todas?");
        alertDialog.setMessage("Deseja deletar todas as etiquetas vinculadas ao Manifesto?");
        alertDialog.setButton(-1, "Sim", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment$$ExternalSyntheticLambda3
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                EtiquetasFragment.this.lambda$initButton$4(dialogInterface, i);
            }
        });
        alertDialog.setButton(-2, "Não", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.fragments.EtiquetasFragment$$ExternalSyntheticLambda4
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        });
        alertDialog.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$initButton$4(DialogInterface dialog, int which) {
        dialog.dismiss();
        EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(new DatabaseHelper(getContext()).getDatabase());
        etiquetaTableManager.deleteAllManifesto(this.idManifesto);
        this.etiquetas.clear();
        this.adapter.notifyDataSetChanged();
    }
}
