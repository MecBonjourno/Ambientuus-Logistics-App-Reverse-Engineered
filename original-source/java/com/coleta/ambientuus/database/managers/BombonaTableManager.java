package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.dto.Bombona;
import com.coleta.ambientuus.dto.MovimentoBombona;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public class BombonaTableManager {
    public static final String COL_CAPACIDADE = "capacidade";
    public static final String COL_COD_BARRAS = "cod_barras";
    public static final String COL_ID = "id";
    public static final String COL_ID_BOMBONA = "id_bombona";
    public static final String COL_ID_CLIENTE = "id_cliente";
    public static final String COL_ID_TERCEIRO = "id_terceiro";
    public static final String COL_ID_VOLUME = "id_volume";
    public static final String COL_STATUS = "status";
    public static final String TABLE_NAME = "BF_BOMBONAS_CADASTRADAS";
    private final SQLiteDatabase db;

    public BombonaTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE BF_BOMBONAS_CADASTRADAS (id INTEGER PRIMARY KEY AUTOINCREMENT, id_bombona INTEGER, cod_barras TEXT, id_volume INTEGER, status TEXT, id_cliente INTEGER, capacidade TEXT, id_terceiro INTEGER)");
    }

    public String validaCadastroBombona(String codBarras) {
        Cursor cursor = this.db.rawQuery("SELECT 1 FROM BF_BOMBONAS_CADASTRADAS WHERE COD_BARRAS = ?", new String[]{codBarras});
        boolean existe = cursor.moveToFirst();
        cursor.close();
        if (existe) {
            return null;
        }
        return "Bombona informada não existe no cadastro";
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0061, code lost:
    
        if (r3.equals("CARREGADA") != false) goto L23;
     */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    java.lang.String verificaStatusSincronizadoBombona(java.lang.String r14, java.lang.String r15) {
        /*
            Method dump skipped, instructions count: 372
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.coleta.ambientuus.database.managers.BombonaTableManager.verificaStatusSincronizadoBombona(java.lang.String, java.lang.String):java.lang.String");
    }

    public Cursor getAllBombonas() {
        return this.db.rawQuery("SELECT B.id_bombona, \n                    B.cod_barras, \n                     ifnull((select case when bmc.data_baixa is not null then \n                     'DISPONIVEL' \n                    when bmc.data_transporte is not null \n                     and bmc.data_alocacao is null \n                     and bmc.data_coleta is null \n                     and bmc.data_terceiro is null \n                     and bmc.data_baixa is null then \n                     'CARREGADO' \n                    when bmc.data_alocacao is not null \n                     and bmc.data_coleta is null \n                     and bmc.data_terceiro is null \n                     and bmc.data_baixa is null then \n                     'EM CLIENTE' \n                    when bmc.data_coleta is not null \n                     and bmc.data_terceiro is null \n                     and bmc.data_baixa is null then \n                     'COLETADO' \n                    when bmc.data_terceiro is not null \n                     and bmc.data_baixa is null then \n                     'DESCARREGADO' \n                   end  status \n                 from BF_MOVIMENTO_BOMBONAS bmc \n                where bmc.cod_barras = B.cod_barras \n                  and bmc.id = (select max(m.id) \n                                  from BF_MOVIMENTO_BOMBONAS m \n                                 where m.cod_barras = B.cod_barras)),B.status) STATUS, \n                  B.id_cliente,               \n                  B.capacidade               \n                FROM BF_BOMBONAS_CADASTRADAS B", null);
    }

    public Cursor getInfoBombona(String cod_barras) {
        return this.db.rawQuery("SELECT    IFNULL((SELECT bmc.id_cliente           FROM BF_MOVIMENTO_BOMBONAS bmc            WHERE bmc.cod_barras = b.cod_barras             AND bmc.id = (                 SELECT MAX(m.id)                  FROM BF_MOVIMENTO_BOMBONAS m                  WHERE m.cod_barras = b.cod_barras           )), B.id_cliente) AS ID_CLIENTE,    IFNULL((SELECT cmr.cod_pessoa || ' - ' || cmr.razao_social           FROM BF_MOVIMENTO_BOMBONAS bmc, bf_cliente_emite_mtr cmr            WHERE bmc.cod_barras = b.cod_barras             AND bmc.id_cliente = cmr.id_pessoa             AND bmc.id = (                 SELECT MAX(m.id)                  FROM BF_MOVIMENTO_BOMBONAS m                  WHERE m.cod_barras = b.cod_barras           )),            C.cod_pessoa || ' - ' || C.razao_social) AS RAZAO_SOCIAL,    B.id_volume,    V.descricao,    V.tara FROM BF_BOMBONAS_CADASTRADAS B LEFT JOIN bf_cliente_emite_mtr C ON B.id_cliente = C.id_pessoa LEFT JOIN bf_volume V ON B.id_volume = V.id_volume WHERE B.cod_barras = ?", new String[]{cod_barras});
    }

    public ArrayList<String> selectBombonasCarregadas() {
        ArrayList<String> arrayBombonas = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT  COUNT(BC.id), BC.capacidade FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB WHERE MB.cod_barras = BC.cod_barras AND MB.data_transporte IS NOT NULL AND MB.enviado = 'N' GROUP BY BC.capacidade", null);
        if (cursor.moveToFirst()) {
            do {
                arrayBombonas.add(cursor.getInt(0) + " de " + cursor.getString(1));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return arrayBombonas;
    }

    public ArrayList<String> selectBombonasBaixadas() {
        ArrayList<String> arrayBombonas = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT  COUNT(BC.id), BC.capacidade FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB WHERE MB.cod_barras = BC.cod_barras AND MB.data_baixa IS NOT NULL AND MB.enviado = 'N' GROUP BY BC.capacidade", null);
        if (cursor.moveToFirst()) {
            do {
                arrayBombonas.add(cursor.getInt(0) + " de " + cursor.getString(1));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return arrayBombonas;
    }

    public ArrayList<String> selectBombonasAlocadas() {
        ArrayList<String> arrayBombonas = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT  COUNT(BC.id), BC.capacidade, CM.razao_social FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB, bf_cliente_emite_mtr CM WHERE MB.cod_barras = BC.cod_barras AND MB.data_alocacao IS NOT NULL AND MB.enviado = 'N' AND MB.id_cliente = + id_pessoa GROUP BY BC.capacidade, CM.id_pessoa", null);
        if (cursor.moveToFirst()) {
            do {
                arrayBombonas.add(cursor.getString(2) + " - " + cursor.getInt(0) + " de " + cursor.getString(1));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return arrayBombonas;
    }

    public ArrayList<String> selectBombonasAlocadasTerceiros() {
        ArrayList<String> lista = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT COUNT(BC.id), BC.capacidade, T.razao_social FROM BF_BOMBONAS_CADASTRADAS BC, BF_MOVIMENTO_BOMBONAS MB, BF_TERCEIROS T WHERE MB.cod_barras = BC.cod_barras AND MB.data_terceiro IS NOT NULL AND MB.enviado = 'N' AND MB.id_terceiro = T.id_pessoa GROUP BY BC.capacidade", null);
        while (cursor.moveToNext()) {
            String capacidade = cursor.getString(1);
            String razaoSocial = cursor.getString(2);
            int quantidade = cursor.getInt(0);
            lista.add(razaoSocial + " - " + quantidade + " de " + capacidade);
        }
        cursor.close();
        return lista;
    }

    public Integer selectCapacidadeBombonas(String codBarras) {
        Integer capacidade = null;
        Cursor cursor = this.db.rawQuery("SELECT id_volume FROM BF_BOMBONAS_CADASTRADAS WHERE cod_barras = ?", new String[]{codBarras});
        if (cursor.moveToFirst()) {
            capacidade = Integer.valueOf(cursor.getInt(0));
        }
        cursor.close();
        return capacidade;
    }

    public Cursor getClienteBombona(String codBarras) {
        return this.db.rawQuery("SELECT B.id_cliente , IFNULL((SELECT CASE WHEN bmc.data_transporte IS NOT NULL                      AND bmc.data_alocacao IS NULL                      AND bmc.data_coleta IS NULL                      AND bmc.data_terceiro IS NULL                      AND bmc.data_baixa IS NULL THEN 'CARREGADO'                  WHEN bmc.data_alocacao IS NOT NULL                      AND bmc.data_coleta IS NULL                      AND bmc.data_baixa IS NULL THEN 'EM CLIENTE'                  WHEN bmc.data_alocacao IS NOT NULL                      AND bmc.data_coleta IS NOT NULL                      AND bmc.data_baixa IS NULL THEN 'COLETADO'                  WHEN bmc.data_terceiro IS NOT NULL                      AND bmc.data_baixa IS NULL THEN 'DESCARREGADO'                  WHEN bmc.data_baixa IS NOT NULL THEN 'DISPONIVEL'                  END status FROM BF_MOVIMENTO_BOMBONAS bmc WHERE bmc.cod_barras = B.cod_barras AND bmc.id = (SELECT MAX(m.id)             FROM BF_MOVIMENTO_BOMBONAS m             WHERE m.cod_barras = B.cod_barras)), B.status) STATUS, IFNULL((SELECT cmr.razao_social         FROM BF_MOVIMENTO_BOMBONAS bmc              , BF_BOMBONAS_CADASTRADAS cmr         WHERE bmc.cod_barras = B.cod_barras           AND bmc.id_cliente = cmr.id_pessoa           AND bmc.id = (SELECT MAX(m.id)                                                      FROM BF_MOVIMENTO_BOMBONAS m                                                      WHERE m.cod_barras = B.cod_barras)), C.razao_social) RAZAO_SOCIAL, IFNULL((SELECT t.razao_social         FROM BF_MOVIMENTO_BOMBONAS bmc              , BF_TERCEIROS t         WHERE bmc.cod_barras = B.cod_barras           AND bmc.id_terceiro = t.id_pessoa           AND bmc.id = (SELECT MAX(m.id)                                                      FROM BF_MOVIMENTO_BOMBONAS m                                                      WHERE m.cod_barras = B.cod_barras)), T.razao_social) RAZAO_SOCIAL_TERCEIRO FROM BF_BOMBONAS_CADASTRADAS B LEFT OUTER JOIN bf_cliente_emite_mtr C ON B.id_cliente = C.id_pessoa LEFT OUTER JOIN BF_TERCEIROS T ON B.id_terceiro = T.id_pessoa WHERE B.cod_barras = ?", new String[]{codBarras});
    }

    public long insert(Bombona bombona) {
        ContentValues cv = new ContentValues();
        cv.put(COL_ID_BOMBONA, Integer.valueOf(bombona.getID_BOMBONA()));
        cv.put("cod_barras", bombona.getCOD_BARRAS());
        cv.put("id_volume", Integer.valueOf(bombona.getID_VOLUME()));
        cv.put("status", bombona.getStatus());
        cv.put("id_cliente", Integer.valueOf(bombona.getID_Cliente()));
        cv.put(COL_CAPACIDADE, bombona.getCapacidade());
        cv.put("id_terceiro", Integer.valueOf(bombona.getId_terceiro()));
        return this.db.insert(TABLE_NAME, null, cv);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void updateMovto(MovimentoBombona movimentoBombona) {
        char c;
        ContentValues statusUpdate = new ContentValues();
        String tipo_movto = movimentoBombona.getTipo_movto();
        switch (tipo_movto.hashCode()) {
            case 65:
                if (tipo_movto.equals(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case ConstraintLayout.LayoutParams.Table.LAYOUT_WRAP_BEHAVIOR_IN_PARENT /* 66 */:
                if (tipo_movto.equals("B")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            case ConstraintLayout.LayoutParams.Table.GUIDELINE_USE_RTL /* 67 */:
                if (tipo_movto.equals("C")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 2671:
                if (tipo_movto.equals("TC")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case 2686:
                if (tipo_movto.equals("TR")) {
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                statusUpdate.put("STATUS", "EM CLIENTE");
                break;
            case 1:
                statusUpdate.put("STATUS", "COLETADO");
                break;
            case 2:
                statusUpdate.put("STATUS", "DESCARREGADO");
                break;
            case 3:
                statusUpdate.put("STATUS", "DISPONIVEL");
                break;
            case 4:
                statusUpdate.put("STATUS", "CARREGADO");
                break;
        }
        this.db.update(TABLE_NAME, statusUpdate, "cod_barras = ?", new String[]{movimentoBombona.getCod_barras()});
    }

    public static void deleteAll(SQLiteDatabase db) {
        db.delete(TABLE_NAME, null, null);
    }
}
