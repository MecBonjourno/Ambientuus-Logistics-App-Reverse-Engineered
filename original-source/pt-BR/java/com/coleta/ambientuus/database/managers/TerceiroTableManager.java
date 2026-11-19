package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Terceiro;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes4.dex */
public class TerceiroTableManager {
    public static final String COL_COD_PESSOA = "cod_pessoa";
    public static final String COL_ID = "id";
    public static final String COL_ID_PESSOA = "id_pessoa";
    public static final String COL_RAZAO_SOCIAL = "razao_social";
    public static final String TABLE_NAME = "BF_TERCEIROS";
    private final SQLiteDatabase db;

    public TerceiroTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE BF_TERCEIROS (id INTEGER PRIMARY KEY AUTOINCREMENT, id_pessoa TEXT, cod_pessoa TEXT, razao_social TEXT)");
    }

    public List<Terceiro> getAllTerceiros() {
        List<Terceiro> lista = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT * FROM BF_TERCEIROS", null);
        while (cursor.moveToNext()) {
            String idPessoa = cursor.getString(1);
            String descricao = cursor.getString(2) + " - " + cursor.getString(3);
            lista.add(new Terceiro(idPessoa, descricao));
        }
        cursor.close();
        return lista;
    }

    public void insert(Terceiro terceiro) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("id_pessoa", terceiro.getId_Pessoa());
        contentValues.put("cod_pessoa", terceiro.getCod_Pessoa());
        contentValues.put("razao_social", terceiro.getRazao_Social());
        this.db.insert(TABLE_NAME, null, contentValues);
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
