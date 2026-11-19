package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Volume;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes4.dex */
public class VolumeTableManager {
    public static final String COL_DESCRICAO = "descricao";
    public static final String COL_ID = "id";
    public static final String COL_ID_VOLUME = "id_volume";
    public static final String COL_TARA = "tara";
    public static final String TABLE_NAME = "bf_volume";
    private final SQLiteDatabase db;

    public VolumeTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_volume (id INTEGER PRIMARY KEY AUTOINCREMENT, id_volume TEXT, descricao TEXT, tara REAL)");
    }

    public List<Volume> getAllVolumes() {
        List<Volume> volumes = new ArrayList<>();
        Cursor cursor = this.db.query(TABLE_NAME, null, null, null, null, null, null);
        while (cursor.moveToNext()) {
            String idVolume = cursor.getString(cursor.getColumnIndexOrThrow("id_volume"));
            String descricao = cursor.getString(cursor.getColumnIndexOrThrow("descricao"));
            volumes.add(new Volume(idVolume, descricao, Float.valueOf(0.0f)));
        }
        cursor.close();
        return volumes;
    }

    public void insert(Volume volume) {
        ContentValues values = new ContentValues();
        values.put("id_volume", volume.getId_volume());
        values.put("descricao", volume.getDescricao());
        values.put(COL_TARA, volume.getTara());
        this.db.insert(TABLE_NAME, null, values);
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
