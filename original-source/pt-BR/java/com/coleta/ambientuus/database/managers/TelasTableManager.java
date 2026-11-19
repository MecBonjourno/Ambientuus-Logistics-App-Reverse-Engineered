package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Telas;

/* carregado de: classes4.dex */
public class TelasTableManager {
    public static final String COL_ALOCAR_BOMBONA = "ALOCAR_BOMBONA";
    public static final String COL_CARREGAR_VEICULO = "CARREGAR_VEICULO";
    public static final String COL_COLETAR_BLUETOOTH = "COLETAR_BLUETOOTH";
    public static final String COL_COLETAR_MANUAL = "COLETAR_MANUAL";
    public static final String COL_CONSULTAR_BOMBONAS = "CONSULTAR_BOMBONAS";
    public static final String COL_CONSULTAR_COLETAS = "CONSULTAR_COLETAS";
    public static final String COL_CONSULTAR_MANIFESTOS = "CONSULTAR_MANIFESTOS";
    public static final String COL_DESCARREGAR_VEICULO = "DESCARREGAR_VEICULO";
    public static final String COL_ID = "id";
    public static final String COL_LIBERAR_BOMBONA = "LIBERAR_BOMBONA";
    public static final String TABLE_NAME = "bf_telas";
    private final SQLiteDatabase db;

    public TelasTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_telas (id INTEGER PRIMARY KEY AUTOINCREMENT, CARREGAR_VEICULO TEXT, ALOCAR_BOMBONA TEXT, COLETAR_BLUETOOTH TEXT, COLETAR_MANUAL TEXT, DESCARREGAR_VEICULO TEXT, LIBERAR_BOMBONA TEXT, CONSULTAR_BOMBONAS TEXT, CONSULTAR_COLETAS TEXT, CONSULTAR_MANIFESTOS TEXT) ");
    }

    public static void onUpgrade(SQLiteDatabase db, int oldVersion) {
        if (oldVersion < 7) {
            createTable(db);
        }
    }

    public Telas selectTelas() {
        Cursor cursor = this.db.rawQuery("SELECT CARREGAR_VEICULO, ALOCAR_BOMBONA, COLETAR_BLUETOOTH, COLETAR_MANUAL, DESCARREGAR_VEICULO, LIBERAR_BOMBONA, CONSULTAR_BOMBONAS, CONSULTAR_COLETAS, CONSULTAR_MANIFESTOS FROM bf_telas", null);
        if (!cursor.moveToFirst()) {
            return null;
        }
        Telas telas = new Telas(cursor.getString(0), cursor.getString(1), cursor.getString(2), cursor.getString(3), cursor.getString(4), cursor.getString(5), cursor.getString(6), cursor.getString(7), cursor.getString(8));
        return telas;
    }

    public void insert(Telas telas) {
        ContentValues values = new ContentValues();
        values.put(COL_CARREGAR_VEICULO, telas.getCARREGAR_VEICULO());
        values.put(COL_ALOCAR_BOMBONA, telas.getALOCAR_BOMBONA());
        values.put(COL_COLETAR_BLUETOOTH, telas.getCOLETAR_BLUETOOTH());
        values.put(COL_COLETAR_MANUAL, telas.getCOLETAR_MANUAL());
        values.put(COL_DESCARREGAR_VEICULO, telas.getDESCARREGAR_VEICULO());
        values.put(COL_LIBERAR_BOMBONA, telas.getLIBERAR_BOMBONA());
        values.put(COL_CONSULTAR_BOMBONAS, telas.getCONSULTAR_BOMBONAS());
        values.put(COL_CONSULTAR_COLETAS, telas.getCONSULTAR_COLETAS());
        values.put(COL_CONSULTAR_MANIFESTOS, telas.getCONSULTAR_MANIFESTOS());
        this.db.insert(TABLE_NAME, null, values);
    }

    public void deleteAll() {
        this.db.delete(TABLE_NAME, null, null);
    }
}
