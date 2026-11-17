package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.dto.Coleta;
import com.coleta.ambientuus.dto.PontoColeta;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/* loaded from: classes4.dex */
public class ColetaTableManager {
    public static final String COL_CLIENTE_AUSENTE = "cliente_ausente";
    public static final String COL_COD_BOMBONA = "cod_bombona";
    public static final String COL_COD_ETIQUETA = "cod_etiqueta";
    public static final String COL_COLETA_EXTRA = "coleta_extra";
    public static final String COL_COLETA_SEM_RESIDUO = "coleta_sem_residuo";
    public static final String COL_DATA_COLETA = "data_coleta";
    public static final String COL_DATA_ENVIO = "data_envio";
    public static final String COL_ENVIADO = "enviado";
    public static final String COL_ID_CLIENTE_EMITE_MTR = "id_cliente_emite_mtr";
    public static final String COL_ID_COLETA = "id_coleta";
    public static final String COL_ID_COLETA_CONTROLADO = "id_coleta_controlado";
    public static final String COL_ID_COLETA_LOGRADOURO = "id_coleta_logradouro";
    public static final String COL_ID_COLETA_SERVIDOR = "id_coleta_servidor";
    public static final String COL_ID_DIA_COLETA = "id_dia_coleta";
    public static final String COL_ID_RESIDUO = "id_tipo_residuo";
    public static final String COL_ID_ROTA = "id_rota";
    public static final String COL_ID_VOLUME = "id_volume";
    public static final String COL_ID_VOLUME_EXTRA = "id_volume_extra";
    public static final String COL_NUMERO_MTR = "numero_mtr";
    public static final String COL_OBSERVACAO = "observacao";
    public static final String COL_PESO = "peso";
    public static final String COL_TIPO_COLETA = "tipo_coleta";
    public static final String TABLE_NAME = "bf_coleta";
    private final SQLiteDatabase db;

    public ColetaTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_coleta (id_coleta INTEGER PRIMARY KEY AUTOINCREMENT, peso TEXT, numero_mtr TEXT, data_coleta TEXT, id_rota TEXT, id_volume TEXT, cliente_ausente TEXT, coleta_sem_residuo TEXT, coleta_extra TEXT, observacao TEXT, enviado TEXT, id_cliente_emite_mtr INTEGER, tipo_coleta TEXT, cod_bombona TEXT, data_envio TEXT, id_coleta_controlado TEXT, id_coleta_servidor INTEGER, cod_etiqueta TEXT, id_tipo_residuo INTEGER, id_volume_extra INTEGER, id_coleta_logradouro INTEGER, id_dia_coleta INTEGER )");
    }

    public static void onUpgrade(SQLiteDatabase db, int oldVersion) {
        if (oldVersion < 6) {
            db.execSQL("ALTER TABLE bf_coleta ADD COLUMN cod_etiqueta TEXT");
        }
        if (oldVersion < 18) {
            db.execSQL("ALTER TABLE bf_coleta ADD COLUMN id_tipo_residuo INTEGER ");
        }
        if (oldVersion < 19) {
            db.execSQL("ALTER TABLE bf_coleta ADD COLUMN id_volume_extra INTEGER ");
        }
        if (oldVersion < 20) {
            db.execSQL("ALTER TABLE bf_coleta ADD COLUMN id_coleta_logradouro INTEGER ");
        }
        if (oldVersion < 22) {
            db.execSQL("ALTER TABLE bf_coleta ADD COLUMN id_dia_coleta INTEGER ");
        }
    }

    public List<Coleta> getAllColetasJson() {
        List<Coleta> labels;
        Cursor cursor;
        List<Coleta> labels2 = new ArrayList<>();
        String selectQuery = "SELECT  peso , numero_mtr , data_coleta , id_rota , id_volume , cliente_ausente , coleta_sem_residuo , coleta_extra , observacao , id_cliente_emite_mtr , tipo_coleta, cod_bombona, id_coleta_controlado, cod_etiqueta, id_tipo_residuo, id_volume_extra, id_coleta_logradouro, id_dia_coleta FROM bf_coleta WHERE enviado='N'";
        Cursor cursor2 = this.db.rawQuery(selectQuery, null);
        if (cursor2.moveToFirst()) {
            while (true) {
                String selectQuery2 = selectQuery;
                cursor = cursor2;
                labels = labels2;
                labels.add(new Coleta(cursor2.getString(0), cursor2.getString(1), cursor2.getString(2), Integer.valueOf(cursor2.getInt(3)), Integer.valueOf(cursor2.getInt(4)), cursor2.getString(5), cursor2.getString(6), cursor2.getString(7), cursor2.getString(8), "N", Integer.valueOf(cursor2.getInt(9)), cursor2.getString(10), cursor2.getString(11), null, cursor2.getString(12), null, cursor2.getString(13), Integer.valueOf(cursor2.getInt(14)), Integer.valueOf(cursor2.getInt(15)), Integer.valueOf(cursor2.getInt(16)), Integer.valueOf(cursor2.getInt(17))));
                if (!cursor.moveToNext()) {
                    break;
                }
                labels2 = labels;
                cursor2 = cursor;
                selectQuery = selectQuery2;
            }
        } else {
            labels = labels2;
            cursor = cursor2;
        }
        cursor.close();
        return labels;
    }

    public Cursor getAllColetasAdm() {
        Cursor data = this.db.rawQuery("SELECT  bf_coleta.peso,bf_coleta.numero_mtr,bf_coleta.data_coleta,bf_coleta.id_rota,bf_coleta.id_volume,bf_coleta.cliente_ausente,bf_coleta.coleta_sem_residuo,bf_coleta.coleta_extra,bf_coleta.observacao,bf_coleta.enviado,bf_volume.id_volume,bf_volume.descricao,bf_coleta.id_cliente_emite_mtr FROM bf_coleta LEFT JOIN bf_volume ON bf_coleta.id_volume = bf_volume.id_volume  ORDER BY DATA_COLETA DESC", null);
        return data;
    }

    public Cursor getAllColetasMTR() {
        Cursor data = this.db.rawQuery("SELECT  bf_coleta.id_coleta,bf_coleta.peso,bf_coleta.numero_mtr,bf_coleta.data_coleta,bf_coleta.id_rota,bf_coleta.id_volume,bf_coleta.cliente_ausente,bf_coleta.coleta_sem_residuo,bf_coleta.coleta_extra,bf_volume.id_volume,bf_volume.descricao,bf_volume.tara,bf_coleta.id_cliente_emite_mtr,bf_coleta.cod_etiqueta FROM bf_coleta LEFT JOIN bf_volume ON bf_coleta.id_volume = bf_volume.id_volume WHERE enviado = 'N' AND " + TABLE_NAME + "." + COL_NUMERO_MTR + " NOT LIKE 'DC%' ORDER BY DATA_COLETA DESC", null);
        return data;
    }

    public Cursor getAllColetasDC() {
        Cursor data = this.db.rawQuery("SELECT  bf_coleta.id_coleta,bf_coleta.peso,bf_coleta.numero_mtr,bf_coleta.data_coleta,bf_coleta.id_rota,bf_coleta.id_volume,bf_coleta.cliente_ausente,bf_coleta.coleta_sem_residuo,bf_coleta.coleta_extra,bf_volume.id_volume,bf_volume.descricao,bf_volume.tara,bf_coleta.id_cliente_emite_mtr,bf_coleta.cod_etiqueta FROM bf_coleta LEFT JOIN bf_volume ON bf_coleta.id_volume = bf_volume.id_volume WHERE enviado = 'N' AND " + TABLE_NAME + "." + COL_NUMERO_MTR + " LIKE 'DC%' ORDER BY DATA_COLETA DESC", null);
        return data;
    }

    public Cursor getListGrouped(String NroMtr, Integer cliente) {
        String select = "SELECT bf_coleta.peso as peso_bruto   ,bf_volume.tara as tara FROM bf_coleta  LEFT JOIN  bf_volume ON bf_coleta.id_volume = bf_volume.id_volume WHERE numero_mtr= '" + NroMtr + "' AND " + COL_ID_CLIENTE_EMITE_MTR + "= '" + cliente + "'";
        Cursor data = this.db.rawQuery(select, null);
        return data;
    }

    public String insert(Coleta coleta) {
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormatColetaContr = new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault());
        String dataContr = dateFormatColetaContr.format(dataAtual);
        Cursor contador = this.db.rawQuery("SELECT 1 FROM bf_coleta", null);
        String VAL_ID_COLETA_CONTROLADO = dataContr + (contador.getCount() + 1);
        contador.close();
        ContentValues values = new ContentValues();
        values.put(COL_PESO, coleta.getPeso());
        values.put(COL_NUMERO_MTR, coleta.getNumero_mtr());
        values.put("data_coleta", coleta.getData_coleta());
        values.put("id_rota", Integer.valueOf(coleta.getId_rota()));
        values.put("id_volume", Integer.valueOf(coleta.getId_volume()));
        values.put(COL_CLIENTE_AUSENTE, coleta.getCliente_ausente());
        values.put(COL_COLETA_SEM_RESIDUO, coleta.getColeta_sem_residuo());
        values.put("coleta_extra", coleta.getColeta_extra());
        values.put(COL_OBSERVACAO, coleta.getObservacao());
        values.put("enviado", coleta.getEnviado());
        values.put(COL_ID_CLIENTE_EMITE_MTR, coleta.getId_cliente_mtr());
        values.put(COL_TIPO_COLETA, coleta.getTipo_coleta());
        values.put(COL_COD_BOMBONA, coleta.getCod_bombona());
        values.put(COL_DATA_ENVIO, coleta.getData_envio());
        values.put("id_coleta_controlado", VAL_ID_COLETA_CONTROLADO);
        values.put(COL_ID_COLETA_SERVIDOR, coleta.getId_app_coleta());
        values.put("cod_etiqueta", coleta.getCod_Etiqueta());
        values.put("id_tipo_residuo", coleta.getIdTipoResiduo());
        values.put(COL_ID_VOLUME_EXTRA, coleta.getIdVolumeExtra());
        values.put("id_coleta_logradouro", coleta.getIdColetaLogradouro());
        values.put("id_dia_coleta", coleta.getIdDiaColeta());
        long result = this.db.insert(TABLE_NAME, null, values);
        if (result == -1) {
            return "NULL";
        }
        return coleta.getId_coleta_aplicativo();
    }

    public void updateReturnColeta(Coleta coleta) {
        ContentValues cv = new ContentValues();
        cv.put(COL_ID_COLETA_SERVIDOR, coleta.getId_app_coleta());
        this.db.update(TABLE_NAME, cv, "id_coleta_controlado = " + coleta.getId_coleta_aplicativo(), null);
    }

    public boolean updateListJson() {
        ContentValues cv = new ContentValues();
        cv.put("enviado", ExifInterface.LATITUDE_SOUTH);
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        String hoje = dateFormat.format(dataAtual);
        cv.put(COL_DATA_ENVIO, hoje);
        long result = this.db.update(TABLE_NAME, cv, "enviado='N' AND " + COL_ID_COLETA_SERVIDOR + " IS NOT NULL", null);
        return result != 0;
    }

    public void deleteOldColeta() {
        this.db.delete(TABLE_NAME, "strftime(substr(data_coleta,7,4)    ||substr(data_coleta,4,2)     ||substr(data_coleta,1,2))  <= strftime('%Y%m%d', DATETIME('now', '-30 day'))", null);
    }

    public void deleteDataColeta(int id) {
        String codBarras = "";
        String select = "SELECT COD_BOMBONA  FROM bf_coleta WHERE id_coleta='" + id + "'";
        Cursor cursor = this.db.rawQuery(select, null);
        if (cursor.moveToFirst()) {
            do {
                codBarras = cursor.getString(0);
            } while (cursor.moveToNext());
        }
        cursor.close();
        String[] whereArgs = {String.valueOf(id)};
        this.db.delete(TABLE_NAME, "id_coleta = ?", whereArgs);
        MovimentoBombonaTableManager movimentoBombonaTableManager = new MovimentoBombonaTableManager(this.db);
        movimentoBombonaTableManager.updateDeleteColeta(codBarras);
    }

    public void deleteAll() {
        this.db.delete(TABLE_NAME, null, null);
    }

    public void deleteAllColetasManifesto(String codManifesto, Integer idCliente) {
        String[] whereArgs = {codManifesto, String.valueOf(idCliente)};
        this.db.delete(TABLE_NAME, "numero_mtr = ? and id_cliente_emite_mtr = ? ", whereArgs);
    }

    public void emptyInsert(ContentValues values, PontoColeta pontoColeta) {
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.getDefault());
        String hoje = dateFormat.format(dataAtual);
        DateFormat dateFormatColetaContr = new SimpleDateFormat("yyyyMMddHHmmss", Locale.getDefault());
        String dataContr = dateFormatColetaContr.format(dataAtual);
        Cursor contador = this.db.rawQuery("SELECT 1 FROM bf_coleta", null);
        String VAL_ID_COLETA_CONTROLADO = dataContr + (contador.getCount() + 1);
        contador.close();
        values.put(COL_PESO, "0");
        values.put(COL_NUMERO_MTR, pontoColeta.getNumeroManifesto());
        values.put("data_coleta", hoje);
        values.put("id_volume", (Integer) 0);
        values.put("coleta_extra", pontoColeta.getColetaExtra());
        values.put("enviado", "N");
        values.put(COL_TIPO_COLETA, "QTD");
        values.put("id_coleta_controlado", VAL_ID_COLETA_CONTROLADO);
        values.put(COL_ID_CLIENTE_EMITE_MTR, pontoColeta.getIdCliente());
        values.put("id_coleta_logradouro", pontoColeta.getIdColetaLogradouro());
        values.put("id_dia_coleta", pontoColeta.getIdDiaColeta());
        this.db.insert(TABLE_NAME, null, values);
    }

    public void insertSemResiduo(PontoColeta pontoColeta, int idRota) {
        ContentValues values = new ContentValues();
        values.put(COL_COLETA_SEM_RESIDUO, ExifInterface.LATITUDE_SOUTH);
        values.put(COL_CLIENTE_AUSENTE, "N");
        values.put("id_rota", Integer.valueOf(idRota));
        emptyInsert(values, pontoColeta);
    }

    public void insertClienteAusente(PontoColeta pontoColeta, int idRota) {
        ContentValues values = new ContentValues();
        values.put(COL_CLIENTE_AUSENTE, ExifInterface.LATITUDE_SOUTH);
        values.put(COL_COLETA_SEM_RESIDUO, "N");
        values.put("id_rota", Integer.valueOf(idRota));
        emptyInsert(values, pontoColeta);
    }

    public boolean existeColetaEtiqueta(String codEtiqueta) {
        String[] selectionArgs = {codEtiqueta};
        Cursor cursor = this.db.query(TABLE_NAME, null, "cod_etiqueta = ?", selectionArgs, null, null, null);
        if (cursor.moveToFirst()) {
            cursor.close();
            return true;
        }
        cursor.close();
        return false;
    }

    public boolean existeColetaDia(Integer idDiaColeta) {
        String[] selectionArgs = {String.valueOf(idDiaColeta)};
        Cursor cursor = this.db.query(TABLE_NAME, null, "id_dia_coleta = ? and enviado = 'N'", selectionArgs, null, null, null);
        if (cursor.moveToFirst()) {
            cursor.close();
            return true;
        }
        cursor.close();
        return false;
    }
}
