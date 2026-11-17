package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Manifesto;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public class ManifestoTableManager {
    public static final String COL_DATA_COLETA = "data_coleta";
    public static final String COL_GERADOR = "gerador";
    public static final String COL_ID = "id";
    public static final String COL_ID_MANIFESTO = "id_manifesto";
    public static final String COL_ID_PESSOA = "id_pessoa";
    public static final String COL_ID_ROTA = "id_rota";
    public static final String COL_NUMERO_MANIFESTO = "numero_manifesto";
    public static final String TABLE_NAME = "bf_manifesto";
    private final SQLiteDatabase db;

    public ManifestoTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_manifesto (id INTEGER PRIMARY KEY AUTOINCREMENT, id_manifesto INTEGER, numero_manifesto TEXT, data_coleta TEXT, gerador TEXT, id_rota INTEGER, id_pessoa INTEGER )");
    }

    public static void onUpgrade(SQLiteDatabase db, int oldVersion) {
        if (oldVersion < 6) {
            createTable(db);
        } else if (oldVersion < 10) {
            db.execSQL("ALTER TABLE bf_manifesto ADD COLUMN id_pessoa INTEGER ");
        }
    }

    public ArrayList<Manifesto> selectManifestos() {
        ArrayList<Manifesto> manifestos = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT id_manifesto, numero_manifesto, data_coleta, gerador, id_rota, id_pessoa FROM bf_manifesto", null);
        if (cursor.moveToFirst()) {
            do {
                Manifesto manifesto = new Manifesto(Integer.valueOf(cursor.getInt(0)), cursor.getString(1), cursor.getString(2), cursor.getString(3), Integer.valueOf(cursor.getInt(4)), Integer.valueOf(cursor.getInt(5)));
                manifestos.add(manifesto);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return manifestos;
    }

    public ArrayList<Manifesto> selectManifestosCliente(String idPessoa) {
        String[] selectionArgs = {idPessoa};
        Cursor cursor = this.db.query(TABLE_NAME, null, "id_pessoa = ?", selectionArgs, null, null, null);
        ArrayList<Manifesto> manifestos = new ArrayList<>();
        if (cursor.moveToFirst()) {
            do {
                Manifesto manifesto = new Manifesto(Integer.valueOf(cursor.getInt(1)), cursor.getString(2), cursor.getString(3), cursor.getString(4), Integer.valueOf(cursor.getInt(5)), Integer.valueOf(cursor.getInt(6)));
                manifestos.add(manifesto);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return manifestos;
    }

    public Manifesto selectManifestoCod(String codManifesto) {
        Manifesto manifesto = null;
        String[] selectionArgs = {String.valueOf(codManifesto)};
        Cursor cursor = this.db.query(TABLE_NAME, null, "numero_manifesto = ?", selectionArgs, null, null, null);
        if (cursor.moveToFirst()) {
            manifesto = new Manifesto(Integer.valueOf(cursor.getInt(1)), cursor.getString(2), cursor.getString(3), cursor.getString(4), Integer.valueOf(cursor.getInt(5)), Integer.valueOf(cursor.getInt(6)));
        }
        cursor.close();
        return manifesto;
    }

    public void insert(Manifesto manifesto) {
        ContentValues values = new ContentValues();
        values.put("id_manifesto", manifesto.getId_manifesto());
        values.put("numero_manifesto", manifesto.getNumero_manifesto());
        values.put("data_coleta", manifesto.getData_coleta());
        values.put(COL_GERADOR, manifesto.getGerador());
        values.put("id_rota", manifesto.getId_rota());
        values.put("id_pessoa", manifesto.getId_pessoa());
        this.db.insert(TABLE_NAME, null, values);
    }

    public void deleteAll() {
        this.db.delete(TABLE_NAME, null, null);
    }
}
