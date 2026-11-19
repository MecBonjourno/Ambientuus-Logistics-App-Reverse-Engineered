package com.coleta.ambientuus.database.managers;

import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.Context;
import android.content.DialogInterface;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Handler;
import android.os.Looper;
import com.coleta.ambientuus.dto.Etiqueta;
import com.coleta.ambientuus.dto.Manifesto;
import com.coleta.ambientuus.dto.model.EtiquetaIntervalo;
import java.util.ArrayList;

/* carregado de: classes4.dex */
public class EtiquetaTableManager {
    public static final String COL_COD_ETIQUETA = "cod_etiqueta";
    public static final String COL_ID = "id";
    public static final String COL_ID_ETIQUETA = "id_etiqueta";
    public static final String COL_ID_MANIFESTO = "id_manifesto";
    public static final String COL_STATUS = "status";
    public static final String TABLE_NAME = "bf_etiqueta";
    private final SQLiteDatabase db;

    public EtiquetaTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_etiqueta (id INTEGER PRIMARY KEY AUTOINCREMENT, id_etiqueta INTEGER, cod_etiqueta TEXT, id_manifesto INTEGER, status TEXT) ");
    }

    public static void onUpgrade(SQLiteDatabase db, int oldVersion) {
        if (oldVersion < 8) {
            createTable(db);
        }
    }

    public ArrayList<Etiqueta> selectEtiquetaManifesto(Integer idManifesto) {
        ArrayList<Etiqueta> etiquetas = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT id, cod_etiqueta, id_manifesto, status FROM bf_etiqueta WHERE id_manifesto = ?", new String[]{String.valueOf(idManifesto)});
        if (cursor.moveToFirst()) {
            do {
                Etiqueta etiqueta = new Etiqueta(Integer.valueOf(cursor.getInt(0)), cursor.getString(1), Integer.valueOf(cursor.getInt(2)), cursor.getString(3));
                etiquetas.add(etiqueta);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return etiquetas;
    }

    public boolean verificarEtiquetaEmOutroManifesto(String codEtique, Integer idManifesto) {
        Cursor cursor = this.db.rawQuery("SELECT 1 FROM bf_etiqueta WHERE cod_etiqueta = ? AND id_manifesto != ?", new String[]{codEtique, String.valueOf(idManifesto)});
        if (cursor.moveToFirst()) {
            cursor.close();
            return true;
        }
        cursor.close();
        return false;
    }

    public Manifesto retornaManifestoEtiqueta(String codEtique) {
        Cursor cursor = this.db.rawQuery("SELECT M.id_manifesto, M.numero_manifesto, M.data_coleta, M.gerador, M.id_rota, M.id_pessoa FROM bf_etiqueta E, bf_manifesto M WHERE E.id_manifesto = M.id_manifesto AND E.cod_etiqueta = ?", new String[]{codEtique});
        if (cursor.moveToFirst()) {
            Manifesto manifesto = new Manifesto(Integer.valueOf(cursor.getInt(0)), cursor.getString(1), cursor.getString(2), cursor.getString(3), Integer.valueOf(cursor.getInt(4)), Integer.valueOf(cursor.getInt(5)));
            cursor.close();
            return manifesto;
        }
        cursor.close();
        return null;
    }

    public boolean verificarEtiquetaNoManifesto(String codEtique, Integer idManifesto) {
        Cursor cursor = this.db.rawQuery("SELECT 1 FROM bf_etiqueta WHERE cod_etiqueta = ? AND id_manifesto = ?", new String[]{codEtique, String.valueOf(idManifesto)});
        if (cursor.moveToFirst()) {
            cursor.close();
            return true;
        }
        cursor.close();
        return false;
    }

    public void insert(Etiqueta etiqueta) {
        ContentValues values = new ContentValues();
        values.put(COL_ID_ETIQUETA, etiqueta.getId_etiqueta());
        values.put("cod_etiqueta", etiqueta.getCod_etiqueta());
        values.put("id_manifesto", etiqueta.getId_manifesto());
        values.put("status", etiqueta.getStatus());
        this.db.insert(TABLE_NAME, null, values);
    }

    private boolean validateRange(int idManifesto, long qtd, long primeiroCodigo, final Context context) {
        for (long ultimoCodigo = primeiroCodigo; ultimoCodigo < primeiroCodigo + qtd + 1; ultimoCodigo++) {
            if (verificarEtiquetaEmOutroManifesto(String.valueOf(ultimoCodigo), Integer.valueOf(idManifesto))) {
                final long finalCodigo = ultimoCodigo;
                new Handler(Looper.getMainLooper()).post(new Runnable() { // da classe: com.coleta.ambientuus.database.managers.EtiquetaTableManager$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        new AlertDialog.Builder(context).setTitle("Erro").setMessage("Etiqueta " + finalCodigo + " já está em outro manifesto.").setPositiveButton("OK", (DialogInterface.OnClickListener) null).show();
                    }
                });
                return false;
            }
        }
        return true;
    }

    private void insertRange(int idManifesto, long qtd, long primeiroCodigo) {
        for (long ultimoCodigo = primeiroCodigo; ultimoCodigo < primeiroCodigo + qtd + 1; ultimoCodigo++) {
            Cursor cursor = this.db.rawQuery("SELECT 1 FROM bf_etiqueta WHERE CAST(cod_etiqueta AS INTEGER) = ?", new String[]{String.valueOf(ultimoCodigo)});
            if (!cursor.moveToFirst()) {
                ContentValues values = new ContentValues();
                values.put("cod_etiqueta", Long.valueOf(ultimoCodigo));
                values.put("id_manifesto", Integer.valueOf(idManifesto));
                values.put("status", PontoColetaTableManager.STATUS_PENDENTE);
                this.db.insert(TABLE_NAME, null, values);
            }
            cursor.close();
        }
    }

    public boolean executeRangeInsert(int idManifesto, long qtd, long primeiroCodigo, Context context) {
        if (validateRange(idManifesto, qtd, primeiroCodigo, context)) {
            insertRange(idManifesto, qtd, primeiroCodigo);
            return true;
        }
        return false;
    }

    public EtiquetaIntervalo buscarIntervaloEtiquetas(int idManifesto) {
        Cursor cursor = this.db.rawQuery("SELECT MIN(CAST(cod_etiqueta AS LONG)) AS primeira, MAX(CAST(cod_etiqueta AS LONG)) AS ultima FROM bf_etiqueta WHERE id_manifesto = ?", new String[]{String.valueOf(idManifesto)});
        EtiquetaIntervalo intervalo = null;
        if (cursor.moveToFirst()) {
            long primeira = cursor.getLong(cursor.getColumnIndexOrThrow("primeira"));
            long ultima = cursor.getLong(cursor.getColumnIndexOrThrow("ultima"));
            intervalo = new EtiquetaIntervalo(primeira, ultima);
        }
        cursor.close();
        return intervalo;
    }

    public Long buscaUltimaEtiqueta(int idManifesto, int idColetaLogradouro) {
        Cursor cursor = this.db.rawQuery("SELECT MAX(CAST(bf_etiqueta.cod_etiqueta AS LONG)) AS ultima FROM bf_etiqueta JOIN bf_coleta ON bf_etiqueta.cod_etiqueta = bf_coleta.cod_etiqueta WHERE bf_etiqueta.id_manifesto = ? AND bf_coleta.id_coleta_logradouro = ? ", new String[]{String.valueOf(idManifesto), String.valueOf(idColetaLogradouro)});
        long codEtiqueta = 0;
        if (cursor.moveToFirst()) {
            codEtiqueta = cursor.getLong(cursor.getColumnIndexOrThrow("ultima"));
        }
        cursor.close();
        return Long.valueOf(codEtiqueta);
    }

    public void deleteEtiqueta(Integer idEtiqueta) {
        this.db.delete(TABLE_NAME, "id = ?", new String[]{String.valueOf(idEtiqueta)});
    }

    public void deleteAllManifesto(Integer idManifesto) {
        this.db.delete(TABLE_NAME, "id_manifesto = ?", new String[]{String.valueOf(idManifesto)});
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
