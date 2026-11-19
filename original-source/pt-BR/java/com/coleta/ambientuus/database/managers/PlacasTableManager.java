package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Placas;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes4.dex */
public class PlacasTableManager {
    public static final String COL_ID = "id";
    public static final String COL_ID_FROTA_VEICULO = "id_frota_veiculo";
    public static final String COL_PLACA_VEICULO = "placa_veiculo";
    public static final String TABLE_NAME = "BF_PLACAS";
    private final SQLiteDatabase db;

    public PlacasTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE BF_PLACAS (id INTEGER PRIMARY KEY AUTOINCREMENT, id_frota_veiculo INTEGER, placa_veiculo TEXT)");
    }

    public List<Placas> getAllPlacas() {
        List<Placas> lista = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT id_frota_veiculo, placa_veiculo FROM BF_PLACAS", null);
        while (cursor.moveToNext()) {
            int idFrota = cursor.getInt(0);
            String placa = cursor.getString(1);
            lista.add(new Placas(Integer.valueOf(idFrota), placa));
        }
        cursor.close();
        return lista;
    }

    public void insert(Placas placas) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id_frota_veiculo", placas.getId_frota_veiculo());
        contentValues.put(COL_PLACA_VEICULO, placas.getPlaca_veiculo());
        this.db.insert(TABLE_NAME, null, contentValues);
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
