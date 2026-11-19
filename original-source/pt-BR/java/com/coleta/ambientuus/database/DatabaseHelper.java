package com.coleta.ambientuus.database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.database.managers.ClienteMTRTableManager;
import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.EtiquetaTableManager;
import com.coleta.ambientuus.database.managers.ManifestoTableManager;
import com.coleta.ambientuus.database.managers.MotoristaTableManager;
import com.coleta.ambientuus.database.managers.MovimentoBombonaTableManager;
import com.coleta.ambientuus.database.managers.PlacasTableManager;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.database.managers.RotaTableManager;
import com.coleta.ambientuus.database.managers.TelasTableManager;
import com.coleta.ambientuus.database.managers.TerceiroTableManager;
import com.coleta.ambientuus.database.managers.TipoResiduoTableManager;
import com.coleta.ambientuus.database.managers.VolumeTableManager;

/* carregado de: classes3.dex */
public class DatabaseHelper extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "bf_app_ambientus.db";
    public static final Integer DATABASE_VERSION = 22;

    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, DATABASE_VERSION.intValue());
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        ColetaTableManager.createTable(db);
        VolumeTableManager.createTable(db);
        RotaTableManager.createTable(db);
        MotoristaTableManager.createTable(db);
        ClienteMTRTableManager.createTable(db);
        MovimentoBombonaTableManager.createTable(db);
        BombonaTableManager.createTable(db);
        TerceiroTableManager.createTable(db);
        PlacasTableManager.createTable(db);
        ManifestoTableManager.createTable(db);
        EtiquetaTableManager.createTable(db);
        TelasTableManager.createTable(db);
        PontoColetaTableManager.createTable(db);
        TipoResiduoTableManager.createTable(db);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        ColetaTableManager.onUpgrade(db, oldVersion);
        ManifestoTableManager.onUpgrade(db, oldVersion);
        EtiquetaTableManager.onUpgrade(db, oldVersion);
        TelasTableManager.onUpgrade(db, oldVersion);
        PontoColetaTableManager.onUpgrade(db, oldVersion);
        TipoResiduoTableManager.onUpgrade(db, oldVersion);
    }

    public void deleteDataVolumeRotaMotoristaCliente() {
        SQLiteDatabase db = getWritableDatabase();
        VolumeTableManager.deleteAll(db);
        RotaTableManager.deleteAll(db);
        MotoristaTableManager.deleteAll(db);
        ClienteMTRTableManager.deleteAll(db);
        BombonaTableManager.deleteAll(db);
        TerceiroTableManager.deleteAll(db);
        PlacasTableManager.deleteAll(db);
        EtiquetaTableManager.deleteAll(db);
        TipoResiduoTableManager.deleteAll(db);
    }

    public SQLiteDatabase getDatabase() {
        return getWritableDatabase();
    }
}
