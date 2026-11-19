package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Rota;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes4.dex */
public class RotaTableManager {
    public static final String COL_DESCRICAO = "descricao";
    public static final String COL_ID = "id";
    public static final String COL_ID_FROTA_VEICULO = "id_frota_veiculo";
    public static final String COL_ID_MOTORISTA = "id_motorista";
    public static final String COL_ID_ROTA = "id_rota";
    public static final String COL_ORDEM = "ordem";
    public static final String TABLE_NAME = "bf_rota";
    private final SQLiteDatabase db;

    public RotaTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_rota (id INTEGER PRIMARY KEY AUTOINCREMENT, id_rota TEXT, descricao TEXT, id_motorista TEXT, id_frota_veiculo INTEGER, ordem TEXT)");
    }

    public List<Rota> getAllRotasDia(String Dia) {
        List<Rota> labels = new ArrayList<>();
        String selectQuery = "SELECT  * FROM bf_rota WHERE ordem = " + Dia + " ORDER BY descricao ASC ";
        Cursor cursor = this.db.rawQuery(selectQuery, null);
        if (cursor.moveToFirst()) {
            do {
                labels.add(new Rota(cursor.getString(1), cursor.getString(2), cursor.getString(3)));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return labels;
    }

    public void insert(Rota rota) {
        ContentValues values = new ContentValues();
        values.put("id_rota", rota.getId_rota());
        values.put("descricao", rota.getDescricao());
        values.put(COL_ID_MOTORISTA, rota.getId_motorista());
        values.put("id_frota_veiculo", rota.getId_frota_veiculo());
        values.put("ordem", rota.getOrdem());
        this.db.insert(TABLE_NAME, null, values);
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
