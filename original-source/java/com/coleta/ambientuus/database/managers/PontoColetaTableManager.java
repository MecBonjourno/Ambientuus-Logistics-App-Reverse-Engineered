package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.coleta.ambientuus.dto.Etiqueta;
import com.coleta.ambientuus.dto.PontoColeta;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes4.dex */
public class PontoColetaTableManager {
    public static final String COL_CLIENTE_EMITE_MTR = "cliente_emite_mtr";
    public static final String COL_CLIENTE_NOVO = "cliente_novo";
    public static final String COL_COD_CLIENTE = "cod_cliente";
    public static final String COL_COLETA_EXTRA = "coleta_extra";
    public static final String COL_DESTINO = "unidest_razao_social";
    public static final String COL_ENDERECO = "endereco";
    public static final String COL_ID = "id";
    public static final String COL_ID_CLIENTE = "id_cliente";
    public static final String COL_ID_COLETA_LOGRADOURO = "id_coleta_logradouro";
    public static final String COL_ID_DIA_COLETA = "id_dia_coleta";
    public static final String COL_ID_MANIFESTO = "id_manifesto";
    public static final String COL_NUMERO_MANIFESTO = "numero_manifesto";
    public static final String COL_OBSERVACAO_MTR = "observacao_mtr";
    public static final String COL_ORDEM = "ordem";
    public static final String COL_PERIODICIDADE = "periodicidade";
    public static final String COL_RAZAO_SOCIAL = "razao_social";
    public static final String COL_STATUS = "status";
    public static final String COL_TIPO_RESIDUO = "tipo_residuo";
    public static final String STATUS_CLIENTE_AUSENTE = "600";
    public static final String STATUS_COLETADO = "200";
    public static final String STATUS_COLETA_REALIZADA = "900";
    public static final String STATUS_EDITAVEL = "100";
    public static final String STATUS_PENDENTE = "000";
    public static final String STATUS_SEM_RESIDUO = "500";
    public static final String TABLE_NAME = "bf_ponto_coleta";
    private final SQLiteDatabase db;

    public PontoColetaTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE bf_ponto_coleta (id INTEGER PRIMARY KEY AUTOINCREMENT, cod_cliente TEXT, razao_social TEXT, endereco TEXT, numero_manifesto TEXT, observacao_mtr TEXT, unidest_razao_social TEXT, coleta_extra TEXT, tipo_residuo TEXT, ordem INTEGER, periodicidade TEXT, cliente_novo TEXT, id_manifesto INTEGER, status TEXT, id_cliente INTEGER, id_coleta_logradouro INTEGER, cliente_emite_mtr TEXT, id_dia_coleta INTEGER )");
    }

    public static void onUpgrade(SQLiteDatabase db, int oldVersion) {
        if (oldVersion < 11) {
            createTable(db);
        }
        if (oldVersion < 12) {
            db.execSQL("ALTER TABLE bf_ponto_coleta ADD COLUMN cliente_novo TEXT ");
        }
        if (oldVersion < 13) {
            db.execSQL("ALTER TABLE bf_ponto_coleta ADD COLUMN id_manifesto INTEGER ");
        }
        if (oldVersion < 14) {
            db.execSQL("ALTER TABLE bf_ponto_coleta ADD COLUMN status TEXT ");
        }
        if (oldVersion < 15) {
            db.execSQL("ALTER TABLE bf_ponto_coleta ADD COLUMN id_cliente INTEGER ");
        }
        if (oldVersion < 20) {
            db.execSQL("ALTER TABLE bf_ponto_coleta ADD COLUMN id_coleta_logradouro INTEGER ");
        }
        if (oldVersion < 21) {
            db.execSQL("ALTER TABLE bf_ponto_coleta ADD COLUMN cliente_emite_mtr TEXT ");
        }
        if (oldVersion < 22) {
            db.execSQL("ALTER TABLE bf_ponto_coleta ADD COLUMN id_dia_coleta INTEGER ");
        }
    }

    public ArrayList<PontoColeta> selectPontoColetaPendente() {
        String[] selectionArgs = {STATUS_SEM_RESIDUO, STATUS_CLIENTE_AUSENTE, STATUS_COLETADO, STATUS_COLETA_REALIZADA};
        Cursor cursor = this.db.query(TABLE_NAME, null, "status NOT IN (?, ?, ?, ?)", selectionArgs, null, null, "ordem, substr(endereco, instr(endereco, '-')+1, instr(endereco, '-')-1) DESC, substr( substr(endereco, instr(endereco, ',') +1 ) , instr(substr(endereco, instr(endereco, ',') +1 ), ',') +1 ) ASC");
        ArrayList<PontoColeta> pontoColetas = new ArrayList<>();
        if (cursor.moveToFirst()) {
            do {
                PontoColeta pontoColeta = new PontoColeta(Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id"))), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_cliente"))), cursor.getString(cursor.getColumnIndexOrThrow(COL_COD_CLIENTE)), cursor.getString(cursor.getColumnIndexOrThrow("razao_social")), cursor.getString(cursor.getColumnIndexOrThrow(COL_ENDERECO)), cursor.getString(cursor.getColumnIndexOrThrow("numero_manifesto")), cursor.getString(cursor.getColumnIndexOrThrow(COL_OBSERVACAO_MTR)), cursor.getString(cursor.getColumnIndexOrThrow(COL_DESTINO)), cursor.getString(cursor.getColumnIndexOrThrow("coleta_extra")), cursor.getString(cursor.getColumnIndexOrThrow(COL_TIPO_RESIDUO)), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("ordem"))), cursor.getString(cursor.getColumnIndexOrThrow(COL_PERIODICIDADE)), cursor.getString(cursor.getColumnIndexOrThrow(COL_CLIENTE_NOVO)), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_manifesto"))), cursor.getString(cursor.getColumnIndexOrThrow("status")), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_coleta_logradouro"))), cursor.getString(cursor.getColumnIndexOrThrow(COL_CLIENTE_EMITE_MTR)), null, Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_dia_coleta"))));
                pontoColetas.add(pontoColeta);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return pontoColetas;
    }

    public ArrayList<PontoColeta> selectPontoColeta() {
        Cursor cursor = this.db.query(TABLE_NAME, null, null, null, null, null, "ordem, substr(endereco, instr(endereco, '-')+1, instr(endereco, '-')-1) DESC, substr( substr(endereco, instr(endereco, ',') +1 ) , instr(substr(endereco, instr(endereco, ',') +1 ), ',') +1 ) ASC");
        ArrayList<PontoColeta> pontoColetas = new ArrayList<>();
        if (cursor.moveToFirst()) {
            do {
                PontoColeta pontoColeta = new PontoColeta(Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id"))), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_cliente"))), cursor.getString(cursor.getColumnIndexOrThrow(COL_COD_CLIENTE)), cursor.getString(cursor.getColumnIndexOrThrow("razao_social")), cursor.getString(cursor.getColumnIndexOrThrow(COL_ENDERECO)), cursor.getString(cursor.getColumnIndexOrThrow("numero_manifesto")), cursor.getString(cursor.getColumnIndexOrThrow(COL_OBSERVACAO_MTR)), cursor.getString(cursor.getColumnIndexOrThrow(COL_DESTINO)), cursor.getString(cursor.getColumnIndexOrThrow("coleta_extra")), cursor.getString(cursor.getColumnIndexOrThrow(COL_TIPO_RESIDUO)), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("ordem"))), cursor.getString(cursor.getColumnIndexOrThrow(COL_PERIODICIDADE)), cursor.getString(cursor.getColumnIndexOrThrow(COL_CLIENTE_NOVO)), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_manifesto"))), cursor.getString(cursor.getColumnIndexOrThrow("status")), Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_coleta_logradouro"))), cursor.getString(cursor.getColumnIndexOrThrow(COL_CLIENTE_EMITE_MTR)), null, Integer.valueOf(cursor.getInt(cursor.getColumnIndexOrThrow("id_dia_coleta"))));
                pontoColetas.add(pontoColeta);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return pontoColetas;
    }

    public void insert(PontoColeta pontoColeta) {
        ContentValues values = new ContentValues();
        values.put("id_cliente", pontoColeta.getIdCliente());
        values.put(COL_COD_CLIENTE, pontoColeta.getCodCliente());
        values.put("razao_social", pontoColeta.getRazaoSocial());
        values.put(COL_ENDERECO, pontoColeta.getEndereco());
        values.put("numero_manifesto", pontoColeta.getNumeroManifesto());
        values.put(COL_OBSERVACAO_MTR, pontoColeta.getObservacaoMtr());
        values.put(COL_DESTINO, pontoColeta.getDestino());
        values.put("coleta_extra", pontoColeta.getColetaExtra());
        values.put(COL_TIPO_RESIDUO, pontoColeta.getTipoResiduo());
        values.put("ordem", pontoColeta.getOrdem());
        values.put(COL_PERIODICIDADE, pontoColeta.getPeriodicidade());
        values.put(COL_CLIENTE_NOVO, pontoColeta.getClienteNovo());
        values.put("id_manifesto", pontoColeta.getIdManifesto());
        values.put("status", verificarEtiquetaEColetaPorManifesto(pontoColeta));
        values.put("id_coleta_logradouro", pontoColeta.getIdColetaLogradouro());
        values.put(COL_CLIENTE_EMITE_MTR, pontoColeta.getClienteEmiteMtr());
        values.put("id_dia_coleta", pontoColeta.getIdDiaColeta());
        this.db.insert(TABLE_NAME, null, values);
    }

    public void updateStatus(Integer id, String STATUS) {
        ContentValues values = new ContentValues();
        String[] selectionArgs = {String.valueOf(id)};
        values.put("status", STATUS);
        this.db.update(TABLE_NAME, values, "id = ?", selectionArgs);
    }

    public String verificarEtiquetaEColetaPorManifesto(PontoColeta pontoColeta) {
        String retorno = STATUS_PENDENTE;
        if ("N".equals(pontoColeta.getAtualizado())) {
            EtiquetaTableManager etiquetaTableManager = new EtiquetaTableManager(this.db);
            ArrayList<Etiqueta> etiquetas = etiquetaTableManager.selectEtiquetaManifesto(pontoColeta.getIdManifesto());
            ColetaTableManager coletaTableManager = new ColetaTableManager(this.db);
            if (!etiquetas.isEmpty()) {
                Iterator<Etiqueta> it = etiquetas.iterator();
                while (it.hasNext()) {
                    Etiqueta etiqueta = it.next();
                    if (!coletaTableManager.existeColetaEtiqueta(etiqueta.getCod_etiqueta())) {
                        return STATUS_EDITAVEL;
                    }
                    if (coletaTableManager.existeColetaDia(pontoColeta.getIdDiaColeta())) {
                        retorno = STATUS_COLETADO;
                    }
                }
                return retorno;
            }
            if (!coletaTableManager.existeColetaDia(pontoColeta.getIdDiaColeta())) {
                return STATUS_PENDENTE;
            }
            return STATUS_COLETADO;
        }
        return STATUS_COLETA_REALIZADA;
    }

    public void deleteAll() {
        this.db.delete(TABLE_NAME, null, null);
    }
}
