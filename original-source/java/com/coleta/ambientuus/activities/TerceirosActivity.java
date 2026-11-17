package com.coleta.ambientuus.activities;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.bombona.LeitorBombonaActivity;
import com.coleta.ambientuus.activities.main.SelecaoActivity;
import com.coleta.ambientuus.adapters.BombonasListagemAdapter;
import com.coleta.ambientuus.adapters.TerceirosAdapter;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.database.managers.MovimentoBombonaTableManager;
import com.coleta.ambientuus.database.managers.TerceiroTableManager;
import com.coleta.ambientuus.dto.Bombona;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.coleta.ambientuus.dto.Terceiro;
import com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.single.PermissionListener;
import j$.util.function.Function$CC;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.function.Function;

/* loaded from: classes3.dex */
public class TerceirosActivity extends AppCompatActivity {
    private static final String ARQUIVO_PREFERENCIA = "ArquivoPreferencia";
    private TerceirosAdapter adapter;
    private Button btnTerceirosDigitarBombona;
    private Button btnTerceirosLerBombona;
    private TextView spinnerTerceirosBombona;
    private Integer spinnerTerceirosBombonaSel;

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_terceiros);
        boolean z = true;
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.btnTerceirosLerBombona = (Button) findViewById(R.id.btnTerceirosLerBombona);
        this.btnTerceirosDigitarBombona = (Button) findViewById(R.id.btnTerceirosDigitarBombona);
        this.spinnerTerceirosBombona = (TextView) findViewById(R.id.spinnerTerceirosBombona);
        loadSpinnerCliente();
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            this.spinnerTerceirosBombona.setText(extras.getString("ClienteSelectinado"));
            this.spinnerTerceirosBombonaSel = Integer.valueOf(extras.getInt("IdPessoaClienteSelecionado"));
            if (extras.getString("lido") != null) {
                Intent intent = new Intent(this, (Class<?>) LeitorBombonaActivity.class);
                intent.putExtra("ORIGEM", "TC");
                intent.putExtra("ClienteSelectinado", this.spinnerTerceirosBombona.getText());
                intent.putExtra("IdPessoaClienteSelecionado", this.spinnerTerceirosBombonaSel);
                startActivity(intent);
            }
        }
        habilitaRecycleView();
        this.btnTerceirosLerBombona.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                TerceirosActivity.this.spinnerTerceirosBombonaSel = Integer.valueOf((TerceirosActivity.this.spinnerTerceirosBombonaSel == null || TerceirosActivity.this.spinnerTerceirosBombonaSel.intValue() == 0) ? 0 : TerceirosActivity.this.spinnerTerceirosBombonaSel.intValue());
                if (TerceirosActivity.this.spinnerTerceirosBombonaSel.intValue() == 0) {
                    Toast toast = Toast.makeText(TerceirosActivity.this, "Selecione um terceiro para destinar a Bombona", 1);
                    toast.show();
                } else {
                    Dexter.withActivity(TerceirosActivity.this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.1.1
                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionGranted(PermissionGrantedResponse response) {
                            Intent intent2 = new Intent(TerceirosActivity.this, (Class<?>) LeitorBombonaActivity.class);
                            intent2.putExtra("ORIGEM", "TC");
                            intent2.putExtra("ClienteSelectinado", TerceirosActivity.this.spinnerTerceirosBombona.getText());
                            intent2.putExtra("IdPessoaClienteSelecionado", TerceirosActivity.this.spinnerTerceirosBombonaSel);
                            TerceirosActivity.this.startActivity(intent2);
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionDenied(PermissionDeniedResponse response) {
                            Toast toast2 = Toast.makeText(TerceirosActivity.this, "Precisa da permissao da camera", 1);
                            toast2.show();
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                        }
                    }).check();
                }
            }
        });
        this.btnTerceirosDigitarBombona.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                TerceirosActivity.this.lambda$onCreate$0(view);
            }
        });
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // from class: com.coleta.ambientuus.activities.TerceirosActivity.2
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                TerceirosActivity.this.startActivity(new Intent(TerceirosActivity.this, (Class<?>) SelecaoActivity.class));
                TerceirosActivity.this.finish();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onCreate$0(View view) {
        digitarBombona();
    }

    public void digitarBombona() {
        final InputMethodManager imm = (InputMethodManager) getSystemService("input_method");
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Código de Barras Bombona");
        final EditText input = new EditText(this);
        input.setInputType(1);
        builder.setView(input);
        builder.setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
                TerceirosActivity.this.verificaBombona(input.getText().toString(), dialog);
            }
        });
        builder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.4
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
                dialog.dismiss();
            }
        });
        builder.show();
        input.requestFocus();
        imm.toggleSoftInput(2, 1);
    }

    public void verificaBombona(String codBarras, DialogInterface dialog) {
        DatabaseHelper myDb = new DatabaseHelper(this);
        String erroCad = new BombonaTableManager(myDb.getDatabase()).validaCadastroBombona(codBarras);
        String erroMensagem = "";
        if (this.spinnerTerceirosBombonaSel.intValue() != 0) {
            if (erroCad == null) {
                String validaBombona = new MovimentoBombonaTableManager(myDb.getDatabase()).validaBombona(codBarras, "TC");
                if (validaBombona == null) {
                    SharedPreferences preferences = getSharedPreferences("ArquivoPreferencia", 0);
                    int spinner_id_rota = preferences.getInt("id_rota", 0);
                    int spinner_id_frota_veiculo = preferences.getInt("id_frota_veiculo", 0);
                    MovimentoBombona movimentoBombona = new MovimentoBombona(codBarras, this.spinnerTerceirosBombonaSel, "TC", null, String.valueOf(spinner_id_rota), Integer.valueOf(spinner_id_frota_veiculo));
                    MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(myDb.getDatabase());
                    movimentoBombonaTableManager.insert(movimentoBombona);
                    Toast toast = Toast.makeText(this, "Bombona Alocada em Terceiro!", 1);
                    toast.show();
                    refazRecycleView();
                } else {
                    erroMensagem = validaBombona;
                }
            } else {
                erroMensagem = erroCad;
            }
        } else {
            erroMensagem = "Selecione um cliente para destinar a Bombona";
        }
        if (!erroMensagem.isEmpty()) {
            AlertDialog alertDialog = new AlertDialog.Builder(this).create();
            alertDialog.setTitle("Erro");
            alertDialog.setMessage(erroMensagem);
            alertDialog.setButton(-3, "OK", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.5
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog2, int which) {
                    dialog2.dismiss();
                }
            });
            alertDialog.show();
            return;
        }
        dialog.dismiss();
    }

    private RecyclerView preparaRecyclerView() {
        DatabaseHelper myDb = new DatabaseHelper(getApplicationContext());
        ArrayList<String> arrayBombonasTerceiro = new BombonaTableManager(myDb.getDatabase()).selectBombonasAlocadasTerceiros();
        RecyclerView listagemCodigo = (RecyclerView) findViewById(R.id.rvBombonasTerceiros);
        listagemCodigo.setHasFixedSize(true);
        listagemCodigo.setLayoutManager(new LinearLayoutManager(this));
        this.adapter = new TerceirosAdapter(arrayBombonasTerceiro);
        return listagemCodigo;
    }

    public void habilitaRecycleView() {
        preparaRecyclerView().setAdapter(this.adapter);
    }

    public void refazRecycleView() {
        preparaRecyclerView().swapAdapter(this.adapter, true);
    }

    private void loadSpinnerCliente() {
        DatabaseHelper db = new DatabaseHelper(getApplicationContext());
        final List<Terceiro> labels = new TerceiroTableManager(db.getDatabase()).getAllTerceiros();
        final SearchableSpinnerDialogHelper<Terceiro> helper = new SearchableSpinnerDialogHelper<>();
        this.spinnerTerceirosBombona.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                TerceirosActivity.this.lambda$loadSpinnerCliente$2(helper, labels, view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$loadSpinnerCliente$2(SearchableSpinnerDialogHelper helper, List labels, View v) {
        helper.showDialog(this, labels, "Selecione o Terceiro", new Function() { // from class: com.coleta.ambientuus.activities.TerceirosActivity$$ExternalSyntheticLambda2
            @Override // java.util.function.Function
            public /* synthetic */ Function andThen(Function function) {
                return Function$CC.$default$andThen(this, function);
            }

            @Override // java.util.function.Function
            public final Object apply(Object obj) {
                return ((Terceiro) obj).getRazao_Social();
            }

            @Override // java.util.function.Function
            public /* synthetic */ Function compose(Function function) {
                return Function$CC.$default$compose(this, function);
            }
        }, this.spinnerTerceirosBombona, this.spinnerTerceirosBombona.getText().toString(), new SearchableSpinnerDialogHelper.OnItemSelectedListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity$$ExternalSyntheticLambda3
            @Override // com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.OnItemSelectedListener
            public final void onItemSelected(Object obj) {
                TerceirosActivity.this.lambda$loadSpinnerCliente$1((Terceiro) obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$loadSpinnerCliente$1(Terceiro selectedTerceiro) {
        this.spinnerTerceirosBombonaSel = Integer.valueOf(selectedTerceiro.getId_Pessoa());
    }

    public static class ListBombonaViewActivity extends AppCompatActivity {
        private BombonasListagemAdapter adapter;
        private String bombonaSel;
        private Bombona bombonas;
        private ArrayList<Bombona> bombonasLista;
        private Button btnLerBombonaListagem;
        private String codigoBarrasBombonaLida;
        private DatabaseHelper db;
        private androidx.appcompat.app.AlertDialog dialog;
        private AlertDialog.Builder dialogBuilder;
        private ListView listView;
        private DatabaseHelper myDB;

        @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_listagem_bombonas);
            boolean z = true;
            getSupportActionBar().setDisplayShowHomeEnabled(true);
            getSupportActionBar().setIcon(R.mipmap.ic_launcher);
            this.btnLerBombonaListagem = (Button) findViewById(R.id.btnLerBombonaListagem);
            this.btnLerBombonaListagem.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.ListBombonaViewActivity.1
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    Dexter.withActivity(ListBombonaViewActivity.this).withPermission("android.permission.CAMERA").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.ListBombonaViewActivity.1.1
                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionGranted(PermissionGrantedResponse response) {
                            Intent intent = new Intent(ListBombonaViewActivity.this, (Class<?>) LeitorBombonaActivity.class);
                            intent.putExtra("ORIGEM", "L");
                            ListBombonaViewActivity.this.startActivity(intent);
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionDenied(PermissionDeniedResponse response) {
                            Toast toast = Toast.makeText(ListBombonaViewActivity.this, "Precisa da permissao da camera", 1);
                            toast.show();
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                        }
                    }).check();
                }
            });
            Bundle extras = getIntent().getExtras();
            if (extras != null) {
                this.codigoBarrasBombonaLida = extras.getString("codigoBarrasBombona");
            }
            this.db = new DatabaseHelper(this);
            this.bombonasLista = new ArrayList<>();
            Cursor cursor = new BombonaTableManager(this.db.getDatabase()).getAllBombonas();
            int i = cursor.getCount();
            if (i == 0) {
                Toast toast = Toast.makeText(this, "Banco de Dados Vazio", 1);
                toast.show();
            } else {
                int j = 0;
                while (cursor.moveToNext()) {
                    this.bombonas = new Bombona(cursor.getInt(0), cursor.getString(1), cursor.getString(2), cursor.getInt(3), cursor.getString(4));
                    this.bombonasLista.add(j, this.bombonas);
                    j++;
                }
                this.adapter = new BombonasListagemAdapter(this, R.layout.list_bombonas_row, this.bombonasLista);
                this.listView = (ListView) findViewById(R.id.rv_Bombonas);
                this.listView.setAdapter((ListAdapter) this.adapter);
                registerForContextMenu(this.listView);
                this.listView.setClickable(true);
                this.listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.ListBombonaViewActivity.2
                    @Override // android.widget.AdapterView.OnItemClickListener
                    public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                        ListBombonaViewActivity.this.bombonaSel = ((TextView) arg1.findViewById(R.id.tv_CodBarrasBombona_LR)).getText().toString();
                        ListBombonaViewActivity.this.createDialogGroup();
                    }
                });
            }
            initSearchView();
            getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // from class: com.coleta.ambientuus.activities.TerceirosActivity.ListBombonaViewActivity.3
                @Override // androidx.activity.OnBackPressedCallback
                public void handleOnBackPressed() {
                    ListBombonaViewActivity.this.startActivity(new Intent(ListBombonaViewActivity.this, (Class<?>) SelecaoActivity.class));
                    ListBombonaViewActivity.this.finish();
                }
            });
        }

        private void initSearchView() {
            EditText editText = (EditText) findViewById(R.id.etPesquisarBombona);
            editText.addTextChangedListener(new TextWatcher() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.ListBombonaViewActivity.4
                @Override // android.text.TextWatcher
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override // android.text.TextWatcher
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    if (s != null) {
                        ArrayList<Bombona> bombonasFiltradas = new ArrayList<>();
                        Iterator it = ListBombonaViewActivity.this.bombonasLista.iterator();
                        while (it.hasNext()) {
                            Bombona bombona = (Bombona) it.next();
                            String status = bombona.getStatus();
                            if (status == null) {
                                status = "disponivel";
                            }
                            if (bombona.getCOD_BARRAS().toLowerCase().contains(s.toString().toLowerCase()) || status.toLowerCase().contains(s.toString().toLowerCase())) {
                                bombonasFiltradas.add(bombona);
                            }
                        }
                        BombonasListagemAdapter adapterFiltrada = new BombonasListagemAdapter(ListBombonaViewActivity.this.getApplicationContext(), R.layout.list_bombonas_row, bombonasFiltradas);
                        ListBombonaViewActivity.this.listView.setAdapter((ListAdapter) adapterFiltrada);
                        return;
                    }
                    BombonasListagemAdapter adapterFiltrada2 = new BombonasListagemAdapter(ListBombonaViewActivity.this.getApplicationContext(), R.layout.list_bombonas_row, ListBombonaViewActivity.this.bombonasLista);
                    ListBombonaViewActivity.this.listView.setAdapter((ListAdapter) adapterFiltrada2);
                }

                @Override // android.text.TextWatcher
                public void afterTextChanged(Editable s) {
                }
            });
            if (this.codigoBarrasBombonaLida != null) {
                editText.setText(this.codigoBarrasBombonaLida);
            }
        }

        public void createDialogGroup() {
            this.dialogBuilder = new AlertDialog.Builder(this);
            View bombonaPopupView = getLayoutInflater().inflate(R.layout.popup_cliente_bombona, (ViewGroup) null);
            TextView BombonaGroup = (TextView) bombonaPopupView.findViewById(R.id.BombonaGroup);
            TextView clienteBombonaGroup = (TextView) bombonaPopupView.findViewById(R.id.clienteBombonaGroup);
            TextView terceiroBombonaGroup = (TextView) bombonaPopupView.findViewById(R.id.terceiroBombonaGroup);
            Button btnOkGroup = (Button) bombonaPopupView.findViewById(R.id.fecharPopUpGroupBombona);
            this.dialogBuilder.setView(bombonaPopupView);
            this.dialog = this.dialogBuilder.create();
            BombonaGroup.setText("Bombona: " + this.bombonaSel);
            this.myDB = new DatabaseHelper(this);
            Cursor data = new BombonaTableManager(this.myDB.getDatabase()).getClienteBombona(this.bombonaSel);
            data.moveToFirst();
            while (!data.isAfterLast()) {
                String status = data.getString(data.getColumnIndex("STATUS"));
                if (status != null && status != "") {
                    if (!status.equals("DISPONIVEL")) {
                        String cliente = data.getString(data.getColumnIndex("RAZAO_SOCIAL"));
                        String terceiro = data.getString(data.getColumnIndex("RAZAO_SOCIAL_TERCEIRO"));
                        if (cliente != null) {
                            clienteBombonaGroup.setText("Cliente: " + cliente);
                        } else {
                            clienteBombonaGroup.setText(" ");
                        }
                        if (terceiro != null) {
                            terceiroBombonaGroup.setText("Descarregado em: " + terceiro);
                        } else {
                            terceiroBombonaGroup.setText("");
                        }
                    } else {
                        clienteBombonaGroup.setText(" ");
                        terceiroBombonaGroup.setText("");
                    }
                } else {
                    clienteBombonaGroup.setText(" ");
                    terceiroBombonaGroup.setText("");
                }
                data.moveToNext();
            }
            data.close();
            this.dialog.show();
            btnOkGroup.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.activities.TerceirosActivity.ListBombonaViewActivity.5
                @Override // android.view.View.OnClickListener
                public void onClick(View v) {
                    ListBombonaViewActivity.this.dialog.dismiss();
                }
            });
        }
    }
}
