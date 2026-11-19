package com.coleta.ambientuus.ui;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.coleta.ambientuus.R;
import j$.util.Objects;
import java.util.List;
import java.util.function.Function;

/* carregado de: classes7.dex */
public class SearchableSpinnerDialogHelper<T> {

    public interface OnItemSelectedListener<T> {
        void onItemSelected(T t);
    }

    public void showDialog(final Context context, List<T> items, String title, final Function<T, String> itemToString, final TextView targetView, final String InitValue, final OnItemSelectedListener<T> listener) {
        final Dialog dialog = new Dialog(context);
        dialog.setContentView(R.layout.dialog_searchable_spinner);
        WindowManager wm = (WindowManager) context.getSystemService("window");
        DisplayMetrics metrics = new DisplayMetrics();
        wm.getDefaultDisplay().getMetrics(metrics);
        int screenWidth = metrics.widthPixels;
        int dialogWidth = (int) (screenWidth * 0.8d);
        int screenHeight = metrics.heightPixels;
        int dialogHeight = (int) (screenHeight * 0.8d);
        ((Window) Objects.requireNonNull(dialog.getWindow())).setLayout(dialogWidth, dialogHeight);
        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(0));
        if (!title.isEmpty()) {
            TextView dialogTitleTextView = (TextView) dialog.findViewById(R.id.tvTituloSpinner);
            dialogTitleTextView.setText(title);
        } else {
            TextView dialogTitleTextView2 = (TextView) dialog.findViewById(R.id.tvTituloSpinner);
            dialogTitleTextView2.setText("Selecione");
        }
        dialog.show();
        EditText etPesquisarDialog = (EditText) dialog.findViewById(R.id.etPesquisarDialog);
        ListView listViewDialog = (ListView) dialog.findViewById(R.id.listViewDialog);
        final ArrayAdapter<T> adapter = new ArrayAdapter<T>(context, android.R.layout.simple_list_item_1, items) { // da classe: com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.1

            /* renomeado de: com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper$1$ViewHolder */
            static class ViewHolder {
                TextView textView;

                ViewHolder() {
                }
            }

            @Override // android.widget.ArrayAdapter, android.widget.Adapter
            public View getView(int position, View convertView, ViewGroup parent) {
                ViewHolder holder;
                if (convertView == null) {
                    convertView = LayoutInflater.from(context).inflate(android.R.layout.simple_list_item_1, parent, false);
                    holder = new ViewHolder();
                    holder.textView = (TextView) convertView.findViewById(android.R.id.text1);
                    convertView.setTag(holder);
                } else {
                    holder = (ViewHolder) convertView.getTag();
                }
                T item = getItem(position);
                if (item != null) {
                    String itemText = null;
                    if (Build.VERSION.SDK_INT >= 24) {
                        itemText = (String) itemToString.apply(item);
                    }
                    holder.textView.setText(itemText);
                    if (!itemText.equals(InitValue)) {
                        holder.textView.setBackgroundColor(0);
                    } else {
                        holder.textView.setBackgroundColor(Color.argb(80, 1, 85, 61));
                    }
                }
                return convertView;
            }
        };
        listViewDialog.setAdapter((ListAdapter) adapter);
        etPesquisarDialog.addTextChangedListener(new TextWatcher() { // da classe: com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper.2
            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                adapter.getFilter().filter(s);
            }

            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
            }
        });
        listViewDialog.setOnItemClickListener(new AdapterView.OnItemClickListener() { // da classe: com.coleta.ambientuus.ui.SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0
            @Override // android.widget.AdapterView.OnItemClickListener
            public final void onItemClick(AdapterView adapterView, View view, int i, long j) {
                SearchableSpinnerDialogHelper.lambda$showDialog$0(adapter, targetView, itemToString, listener, dialog, adapterView, view, i, j);
            }
        });
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    static /* sintético */ void lambda$showDialog$0(ArrayAdapter adapter, TextView targetView, Function function, OnItemSelectedListener onItemSelectedListener, Dialog dialog, AdapterView parent, View view, int position, long id) {
        Object item = adapter.getItem(position);
        if (item != null) {
            if (Build.VERSION.SDK_INT >= 24) {
                targetView.setText((CharSequence) function.apply(item));
            }
            onItemSelectedListener.onItemSelected(item);
        }
        dialog.dismiss();
    }
}
