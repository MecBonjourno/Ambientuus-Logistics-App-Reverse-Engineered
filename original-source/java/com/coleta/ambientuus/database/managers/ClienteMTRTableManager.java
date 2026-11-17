package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.ClienteMTR;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes4.dex */
public class ClienteMTRTableManager {
    public static final String COL_COD_PESSOA = "cod_pessoa";
    public static final String COL_ID = "id";
    public static final String COL_ID_PESSOA = "id_pessoa";
    public static final String COL_RAZAO_SOCIAL = "razao_social";
    public static final String TABLE_NAME = "bf_cliente_emite_mtr";
    private final SQLiteDatabase db;

    public ClienteMTRTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_cliente_emite_mtr (id INTEGER PRIMARY KEY AUTOINCREMENT, id_pessoa TEXT, cod_pessoa TEXT, razao_social TEXT)");
    }

    public List<ClienteMTR> getAllClientesMTR() {
        List<ClienteMTR> clientes = new ArrayList<>();
        Cursor cursor = this.db.query(TABLE_NAME, null, null, null, null, null, null);
        while (cursor.moveToNext()) {
            String idPessoa = cursor.getString(cursor.getColumnIndexOrThrow("id_pessoa"));
            String descricao = cursor.getString(cursor.getColumnIndexOrThrow("cod_pessoa")) + " - " + cursor.getString(cursor.getColumnIndexOrThrow("razao_social"));
            clientes.add(new ClienteMTR(idPessoa, descricao));
        }
        cursor.close();
        return clientes;
    }

    public ClienteMTR getClienteMTR(Integer idPessoa) {
        ClienteMTR cliente = null;
        String[] selectionArgs = {String.valueOf(idPessoa)};
        Cursor cursor = this.db.query(TABLE_NAME, null, "id_pessoa = ?", selectionArgs, null, null, null);
        if (cursor.moveToFirst()) {
            cliente = new ClienteMTR(String.valueOf(idPessoa), cursor.getString(2) + " - " + cursor.getString(3));
        }
        cursor.close();
        return cliente;
    }

    public String getClienteMTRCod(Integer idPessoa) {
        String[] selectionArgs = {String.valueOf(idPessoa)};
        Cursor cursor = this.db.query(TABLE_NAME, null, "id_pessoa = ?", selectionArgs, null, null, null);
        String codCliente = "";
        if (cursor.moveToFirst()) {
            codCliente = cursor.getString(2);
        }
        cursor.close();
        return codCliente;
    }

    public long insert(ClienteMTR clienteMTR) {
        ContentValues values = new ContentValues();
        values.put("id_pessoa", clienteMTR.getId_pessoa());
        values.put("cod_pessoa", clienteMTR.getCod_pessoa());
        values.put("razao_social", clienteMTR.getRazao_social());
        return this.db.insert(TABLE_NAME, null, values);
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }

    public SQLiteDatabase getDb() {
        return this.db;
    }
}
