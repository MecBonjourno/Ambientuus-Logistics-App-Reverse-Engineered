package com.coleta.ambientuus.activities;

import android.app.AlertDialog;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.OnBackPressedCallback;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.activities.BuscaDispositivoActivity;
import com.coleta.ambientuus.activities.main.SelecaoActivity;
import com.coleta.ambientuus.activities.pontoColeta.IniciarColetaActivity;
import com.coleta.ambientuus.domain.model.TipoPesagem;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.utils.PesagemPreferences;
import com.karumi.dexter.Dexter;
import com.karumi.dexter.MultiplePermissionsReport;
import com.karumi.dexter.PermissionToken;
import com.karumi.dexter.listener.PermissionDeniedResponse;
import com.karumi.dexter.listener.PermissionGrantedResponse;
import com.karumi.dexter.listener.PermissionRequest;
import com.karumi.dexter.listener.multi.MultiplePermissionsListener;
import com.karumi.dexter.listener.single.PermissionListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/* loaded from: classes3.dex */
public class BuscaDispositivoActivity extends AppCompatActivity {
    private static final int BT_ENABLE_REQUEST = 10;
    public static final String BUFFER_SIZE = "br.com.urano.buffersize";
    public static final String DEVICE_EXTRA = "br.com.urano.SOCKET";
    private static final String DEVICE_LIST = "br.com.urano.devicelist";
    private static final String DEVICE_LIST_SELECTED = "br.com.urano.devicelistselected";
    public static final String DEVICE_UUID = "br.com.urano.uuid";
    private static final int SETTINGS = 20;
    private static final String TAG = "BlueTest5-Homescreen";
    private Button mBtnConnect;
    private Button mBtnSearch;
    private ListView mLstDevices;
    private PontoColeta pontoColeta;
    private BluetoothAdapter mBTAdapter = BluetoothAdapter.getDefaultAdapter();
    private List<BluetoothDevice> listaDevicesDisponiveis = new ArrayList();
    private UUID mDeviceUUID = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
    private int mBufferSize = 50000;
    private BroadcastReceiver mReceiver = new BroadcastReceiver() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.6
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if ("android.bluetooth.adapter.action.DISCOVERY_STARTED".equals(action)) {
                BuscaDispositivoActivity.this.msg("Procurando Dispositivos! Pode levar até 15 segundos");
                return;
            }
            if ("android.bluetooth.adapter.action.DISCOVERY_FINISHED".equals(action)) {
                if (BuscaDispositivoActivity.this.listaDevicesDisponiveis.isEmpty()) {
                    BuscaDispositivoActivity.this.msg("Nenhum dispositivo emparelhado encontrado, emparelhe seu dispositivo e tente novamente");
                    return;
                } else {
                    BuscaDispositivoActivity.this.msg("Busca Concluida!");
                    return;
                }
            }
            if ("android.bluetooth.device.action.FOUND".equals(action)) {
                BluetoothDevice device = (BluetoothDevice) intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                if (!BuscaDispositivoActivity.this.listaDevicesDisponiveis.contains(device)) {
                    BuscaDispositivoActivity.this.listaDevicesDisponiveis.add(device);
                    new Handler().postDelayed(new Runnable() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.6.1
                        @Override // java.lang.Runnable
                        public void run() {
                            new SearchDevices().execute(new Void[0]);
                        }
                    }, 1000L);
                }
            }
        }
    };

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_busca_dispositivo);
        boolean z = true;
        getSupportActionBar().setDisplayShowHomeEnabled(true);
        getSupportActionBar().setIcon(R.mipmap.ic_launcher);
        this.mBtnSearch = (Button) findViewById(R.id.btnSearch);
        this.mBtnConnect = (Button) findViewById(R.id.btnConnect);
        this.mLstDevices = (ListView) findViewById(R.id.lstDevices);
        this.pontoColeta = (PontoColeta) getIntent().getParcelableExtra("ponto");
        if (savedInstanceState != null) {
            ArrayList<BluetoothDevice> list = savedInstanceState.getParcelableArrayList(DEVICE_LIST);
            if (list != null) {
                initList(list);
                MyAdapter adapter = (MyAdapter) this.mLstDevices.getAdapter();
                int selectedIndex = savedInstanceState.getInt(DEVICE_LIST_SELECTED);
                if (selectedIndex != -1) {
                    adapter.setSelectedIndex(selectedIndex);
                    this.mBtnConnect.setEnabled(true);
                }
            } else {
                initList(new ArrayList());
            }
        } else {
            initList(new ArrayList());
        }
        Dexter.withActivity(this).withPermissions("android.permission.BLUETOOTH_CONNECT", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION", "android.permission.BLUETOOTH_SCAN").withListener(new MultiplePermissionsListener() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.1
            @Override // com.karumi.dexter.listener.multi.MultiplePermissionsListener
            public void onPermissionsChecked(MultiplePermissionsReport report) {
            }

            @Override // com.karumi.dexter.listener.multi.MultiplePermissionsListener
            public void onPermissionRationaleShouldBeShown(List<PermissionRequest> permissions, PermissionToken token) {
            }
        }).check();
        this.mBtnSearch.setOnClickListener(new AnonymousClass2());
        this.mBtnConnect.setOnClickListener(new AnonymousClass3());
        getOnBackPressedDispatcher().addCallback(this, new OnBackPressedCallback(z) { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.4
            @Override // androidx.activity.OnBackPressedCallback
            public void handleOnBackPressed() {
                BuscaDispositivoActivity.this.startActivity(new Intent(BuscaDispositivoActivity.this, (Class<?>) SelecaoActivity.class));
                BuscaDispositivoActivity.this.finish();
            }
        });
    }

    /* renamed from: com.coleta.ambientuus.activities.BuscaDispositivoActivity$2, reason: invalid class name */
    class AnonymousClass2 implements View.OnClickListener {
        AnonymousClass2() {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View arg0) {
            AlertDialog alertDialog = new AlertDialog.Builder(BuscaDispositivoActivity.this).create();
            alertDialog.setTitle("Você está com o Bluetooth e Localização do Celular ligado?");
            alertDialog.setButton(-1, "Sim", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.2.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    if (BuscaDispositivoActivity.this.mBTAdapter == null) {
                        BuscaDispositivoActivity.this.msg("O Bluetooth não foi encontrado");
                    } else if (!BuscaDispositivoActivity.this.mBTAdapter.isEnabled()) {
                        Dexter.withActivity(BuscaDispositivoActivity.this).withPermission("android.permission.BLUETOOTH_SCAN").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.2.1.1
                            @Override // com.karumi.dexter.listener.single.PermissionListener
                            public void onPermissionGranted(PermissionGrantedResponse response) {
                                Intent enableBT = new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE");
                                BuscaDispositivoActivity.this.startActivityForResult(enableBT, 10);
                            }

                            @Override // com.karumi.dexter.listener.single.PermissionListener
                            public void onPermissionDenied(PermissionDeniedResponse response) {
                            }

                            @Override // com.karumi.dexter.listener.single.PermissionListener
                            public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                            }
                        }).check();
                    } else {
                        BuscaDispositivoActivity.this.listaDevicesDisponiveis.clear();
                        BuscaDispositivoActivity.this.mBTAdapter.startDiscovery();
                    }
                    dialog.dismiss();
                }
            });
            alertDialog.setButton(-2, "Não", new DialogInterface.OnClickListener() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.2.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    BuscaDispositivoActivity.this.msg("É necessário ligar Bluetooth e a Localização do celular!");
                    dialog.dismiss();
                }
            });
            alertDialog.show();
        }
    }

    /* renamed from: com.coleta.ambientuus.activities.BuscaDispositivoActivity$3, reason: invalid class name */
    class AnonymousClass3 implements View.OnClickListener {
        AnonymousClass3() {
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View arg0) {
            PesagemPreferences.verifyPreferences(BuscaDispositivoActivity.this, new PesagemPreferences.TipoPesagemCallback() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity$3$$ExternalSyntheticLambda0
                @Override // com.coleta.ambientuus.utils.PesagemPreferences.TipoPesagemCallback
                public final void onTipoPesagemSelecionado(TipoPesagem tipoPesagem) {
                    BuscaDispositivoActivity.AnonymousClass3.this.lambda$onClick$0(tipoPesagem);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public /* synthetic */ void lambda$onClick$0(TipoPesagem tipo) {
            BluetoothDevice device = ((MyAdapter) BuscaDispositivoActivity.this.mLstDevices.getAdapter()).getSelectedItem();
            Intent intent = new Intent(BuscaDispositivoActivity.this.getApplicationContext(), (Class<?>) IniciarColetaActivity.class);
            intent.putExtra("ponto", BuscaDispositivoActivity.this.pontoColeta);
            intent.putExtra(BuscaDispositivoActivity.DEVICE_EXTRA, device);
            intent.putExtra(BuscaDispositivoActivity.DEVICE_UUID, BuscaDispositivoActivity.this.mDeviceUUID.toString());
            intent.putExtra(BuscaDispositivoActivity.BUFFER_SIZE, BuscaDispositivoActivity.this.mBufferSize);
            intent.putExtra("CONECTADO", true);
            if (ActivityCompat.checkSelfPermission(BuscaDispositivoActivity.this, "android.permission.BLUETOOTH_SCAN") != 0) {
                return;
            }
            if (BuscaDispositivoActivity.this.mBTAdapter.isDiscovering()) {
                BuscaDispositivoActivity.this.mBTAdapter.cancelDiscovery();
            }
            intent.putExtra("tipo", tipo.getValor());
            BuscaDispositivoActivity.this.startActivity(intent);
        }
    }

    @Override // androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        MyAdapter adapter = (MyAdapter) this.mLstDevices.getAdapter();
        ArrayList<BluetoothDevice> list = (ArrayList) adapter.getEntireList();
        if (list != null) {
            outState.putParcelableArrayList(DEVICE_LIST, list);
            int selectedIndex = adapter.selectedIndex;
            outState.putInt(DEVICE_LIST_SELECTED, selectedIndex);
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onPause() {
        super.onPause();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch (requestCode) {
            case 10:
                if (resultCode == -1) {
                    msg("O Bluetooth foi ativado com sucesso");
                    new SearchDevices().execute(new Void[0]);
                    break;
                } else {
                    msg("Não foi possivel ativar o Bluetooth");
                    break;
                }
            case 20:
                SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
                String uuid = prefs.getString("prefUuid", "Null");
                this.mDeviceUUID = UUID.fromString(uuid);
                String bufSize = prefs.getString("prefTextBuffer", "Null");
                this.mBufferSize = Integer.parseInt(bufSize);
                prefs.getString("prefOrientation", "Null");
                break;
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void msg(String str) {
        Toast toast = Toast.makeText(getApplicationContext(), str, 1);
        toast.show();
    }

    private void initList(List<BluetoothDevice> objects) {
        final MyAdapter adapter = new MyAdapter(getApplicationContext(), R.layout.list_item, R.id.lstContent, objects);
        this.mLstDevices.setAdapter((ListAdapter) adapter);
        this.mLstDevices.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.5
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                adapter.setSelectedIndex(position);
                BuscaDispositivoActivity.this.mBtnConnect.setEnabled(true);
            }
        });
    }

    private class SearchDevices extends AsyncTask<Void, Void, List<BluetoothDevice>> {
        private SearchDevices() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public List<BluetoothDevice> doInBackground(Void... params) {
            final List<BluetoothDevice> listDevices = new ArrayList<>();
            Dexter.withActivity(BuscaDispositivoActivity.this).withPermission("android.permission.BLUETOOTH_CONNECT").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.SearchDevices.1
                @Override // com.karumi.dexter.listener.single.PermissionListener
                public void onPermissionGranted(PermissionGrantedResponse response) {
                    Dexter.withActivity(BuscaDispositivoActivity.this).withPermission("android.permission.BLUETOOTH_SCAN").withListener(new PermissionListener() { // from class: com.coleta.ambientuus.activities.BuscaDispositivoActivity.SearchDevices.1.1
                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionGranted(PermissionGrantedResponse response2) {
                            if (ActivityCompat.checkSelfPermission(BuscaDispositivoActivity.this, "android.permission.BLUETOOTH_CONNECT") != 0) {
                                return;
                            }
                            Set<BluetoothDevice> pairedDevices = BuscaDispositivoActivity.this.mBTAdapter.getBondedDevices();
                            for (BluetoothDevice device : pairedDevices) {
                                if (BuscaDispositivoActivity.this.listaDevicesDisponiveis.contains(device)) {
                                    listDevices.add(device);
                                }
                            }
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionDenied(PermissionDeniedResponse response2) {
                            Toast toast = Toast.makeText(BuscaDispositivoActivity.this, "Para utilizar é preciso permitir acesso ao BlueTooth", 1);
                            toast.show();
                        }

                        @Override // com.karumi.dexter.listener.single.PermissionListener
                        public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                        }
                    }).check();
                }

                @Override // com.karumi.dexter.listener.single.PermissionListener
                public void onPermissionDenied(PermissionDeniedResponse response) {
                    Toast toast = Toast.makeText(BuscaDispositivoActivity.this, "Para utilizar é preciso permitir acesso ao BlueTooth", 1);
                    toast.show();
                }

                @Override // com.karumi.dexter.listener.single.PermissionListener
                public void onPermissionRationaleShouldBeShown(PermissionRequest permission, PermissionToken token) {
                }
            }).check();
            return listDevices;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(List<BluetoothDevice> listDevices) {
            super.onPostExecute((SearchDevices) listDevices);
            if (listDevices.size() > 0) {
                MyAdapter adapter = (MyAdapter) BuscaDispositivoActivity.this.mLstDevices.getAdapter();
                adapter.replaceItems(listDevices);
            }
        }
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStart() {
        super.onStart();
        IntentFilter filter = new IntentFilter();
        filter.addAction("android.bluetooth.device.action.FOUND");
        filter.addAction("android.bluetooth.device.extra.DEVICE");
        filter.addAction("android.bluetooth.adapter.action.DISCOVERY_STARTED");
        filter.addAction("android.bluetooth.adapter.action.DISCOVERY_FINISHED");
        if (Build.VERSION.SDK_INT >= 26) {
            registerReceiver(this.mReceiver, filter, 2);
        }
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        unregisterReceiver(this.mReceiver);
        super.onDestroy();
    }

    private class MyAdapter extends ArrayAdapter<BluetoothDevice> {
        private Context context;
        private List<BluetoothDevice> myList;
        private int selectedColor;
        private int selectedIndex;

        public MyAdapter(Context ctx, int resource, int textViewResourceId, List<BluetoothDevice> objects) {
            super(ctx, resource, textViewResourceId, objects);
            this.selectedColor = Color.parseColor("#abcdef");
            this.context = ctx;
            this.myList = objects;
            this.selectedIndex = -1;
        }

        public void setSelectedIndex(int position) {
            this.selectedIndex = position;
            notifyDataSetChanged();
        }

        public BluetoothDevice getSelectedItem() {
            return this.myList.get(this.selectedIndex);
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public int getCount() {
            return this.myList.size();
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public BluetoothDevice getItem(int position) {
            return this.myList.get(position);
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public long getItemId(int position) {
            return position;
        }

        private class ViewHolder {
            TextView tv;

            private ViewHolder() {
            }
        }

        public void replaceItems(List<BluetoothDevice> list) {
            this.myList = list;
            notifyDataSetChanged();
        }

        public List<BluetoothDevice> getEntireList() {
            return this.myList;
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            ViewHolder holder;
            View vi = convertView;
            if (convertView == null) {
                vi = LayoutInflater.from(this.context).inflate(R.layout.list_item, (ViewGroup) null);
                holder = new ViewHolder();
                holder.tv = (TextView) vi.findViewById(R.id.lstContent);
                vi.setTag(holder);
            } else {
                holder = (ViewHolder) vi.getTag();
            }
            if (this.selectedIndex != -1 && position == this.selectedIndex) {
                holder.tv.setBackgroundColor(this.selectedColor);
            } else {
                holder.tv.setBackgroundColor(-1);
            }
            BluetoothDevice device = this.myList.get(position);
            holder.tv.setText(device.getName() + "\n   " + device.getAddress());
            return vi;
        }
    }
}
