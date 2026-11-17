package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.TipoResiduo;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes4.dex */
public class TipoResiduoTableManager {
    public static final String COL_COD_TIPO_RESIDUO = "codigo";
    public static final String COL_DESCRICAO_TIPO_RESIDUO = "descricao";
    public static final String COL_ID = "id";
    public static final String COL_ID_TIPO_RESIDUO = "id_tipo_residuo";
    public static final String TABLE_NAME = "bf_tipo_residuo";
    private final SQLiteDatabase db;

    public TipoResiduoTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_tipo_residuo (id INTEGER PRIMARY KEY AUTOINCREMENT, id_tipo_residuo INTEGER, codigo TEXT, descricao TEXT) ");
    }

    public List<TipoResiduo> getAllTipoResiduo() {
        List<TipoResiduo> tipoResiduos = new ArrayList<>();
        Cursor cursor = this.db.query(TABLE_NAME, null, null, null, null, null, "descricao");
        if (cursor.moveToFirst()) {
            do {
                tipoResiduos.add(new TipoResiduo(Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id"))), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_tipo_residuo"))), cursor.getString(cursor.getColumnIndexOrThrow(COL_COD_TIPO_RESIDUO)), cursor.getString(cursor.getColumnIndexOrThrow("descricao"))));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return tipoResiduos;
    }

    public static void onUpgrade(SQLiteDatabase db, int oldVersion) {
        if (oldVersion < 17) {
            createTable(db);
        }
    }

    public void insert(TipoResiduo tipoResiduo) {
        ContentValues values = new ContentValues();
        values.put("id_tipo_residuo", tipoResiduo.getId_tipo_residuo());
        values.put(COL_COD_TIPO_RESIDUO, tipoResiduo.getCodigo());
        values.put("descricao", tipoResiduo.getDescricao());
        this.db.insert(TABLE_NAME, null, values);
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
