package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Motorista;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes4.dex */
public class MotoristaTableManager {
    private static final String COL_ID = "id";
    private static final String COL_ID_MOTORISTA = "id_motorista";
    private static final String COL_NOME = "nome";
    private static final String TABLE_NAME = "bf_motorista";
    private SQLiteDatabase db;

    public MotoristaTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_motorista (id INTEGER PRIMARY KEY AUTOINCREMENT, id_motorista TEXT, nome TEXT)");
    }

    public List<Motorista> getAllMotoristas() {
        List<Motorista> motoristas = new ArrayList<>();
        Cursor cursor = this.db.query(TABLE_NAME, null, null, null, null, null, null);
        while (cursor.moveToNext()) {
            String id = cursor.getString(cursor.getColumnIndexOrThrow("id_motorista"));
            String nome = cursor.getString(cursor.getColumnIndexOrThrow(COL_NOME));
            motoristas.add(new Motorista(id, nome));
        }
        cursor.close();
        return motoristas;
    }

    public void insert(Motorista motorista) {
        ContentValues values = new ContentValues();
        values.put("id_motorista", motorista.getId_motorista());
        values.put(COL_NOME, motorista.getNome());
        this.db.insert(TABLE_NAME, null, values);
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
