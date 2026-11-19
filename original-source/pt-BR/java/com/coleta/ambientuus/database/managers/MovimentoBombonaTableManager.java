package com.coleta.ambientuus.database.managers;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.exifinterface.media.ExifInterface;
import com.coleta.ambientuus.dto.MovimentoBombona;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/* carregado de: classes4.dex */
public class MovimentoBombonaTableManager {
    public static final String COL_COD_BARRAS = "cod_barras";
    public static final String COL_DATA_ALOCACAO = "data_alocacao";
    public static final String COL_DATA_BAIXA = "data_baixa";
    public static final String COL_DATA_COLETA = "data_coleta";
    public static final String COL_DATA_MOVTO = "data_movto";
    public static final String COL_DATA_TERCEIRO = "data_terceiro";
    public static final String COL_DATA_TRANSPORTE = "data_transporte";
    public static final String COL_ENVIADO = "enviado";
    public static final String COL_ID = "id";
    public static final String COL_ID_CLIENTE = "id_cliente";
    public static final String COL_ID_COLETA_CONTROLADO = "id_coleta_controlado";
    public static final String COL_ID_FROTA_VEICULO = "id_frota_veiculo";
    public static final String COL_ID_ROTA = "id_rota";
    public static final String COL_ID_TERCEIRO = "id_terceiro";
    public static final String TABLE_NAME = "BF_MOVIMENTO_BOMBONAS";
    private final SQLiteDatabase db;

    public MovimentoBombonaTableManager(SQLiteDatabase db) {
        this.db = db;
    }

    public static void createTable(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE BF_MOVIMENTO_BOMBONAS (id INTEGER PRIMARY KEY AUTOINCREMENT, cod_barras TEXT, id_cliente INTEGER, id_terceiro INTEGER, data_alocacao TEXT, data_coleta TEXT, data_baixa TEXT, data_transporte TEXT, data_terceiro TEXT, enviado TEXT, data_movto TEXT, id_coleta_controlado TEXT, id_rota INTEGER, id_frota_veiculo INTEGER)");
    }

    public boolean validaMovtoBombona(String bombona) {
        Cursor cursor = this.db.rawQuery("SELECT 1 FROM BF_MOVIMENTO_BOMBONAS WHERE cod_barras = ? AND enviado = 'N'", new String[]{bombona});
        boolean existe = cursor.getCount() > 0;
        cursor.close();
        return existe;
    }

    public String validaBombona(String bombona, String tipo_movto) {
        Cursor c = this.db.rawQuery("SELECT data_transporte, data_alocacao, data_coleta, data_terceiro, data_baixa FROM BF_MOVIMENTO_BOMBONAS m WHERE m.cod_barras = ? AND m.enviado = 'S' AND m.id = (SELECT MAX(id) FROM BF_MOVIMENTO_BOMBONAS MM  WHERE MM.cod_barras = m.cod_barras)", new String[]{bombona});
        String res = null;
        if (c.moveToFirst()) {
            boolean carregado = !c.isNull(0);
            boolean alocado = !c.isNull(1);
            boolean coletado = !c.isNull(2);
            boolean descarregado = !c.isNull(3);
            boolean baixado = true ^ c.isNull(4);
            if (baixado) {
                res = validaBombonaEnviadoN(bombona, tipo_movto);
            } else if (tipo_movto.startsWith("TR")) {
                if (descarregado) {
                    res = "Bombona já Descarregada!";
                } else if (coletado) {
                    res = "Bombona já Coletada!";
                } else if (alocado) {
                    res = "Bombona já Alocada!";
                } else if (carregado) {
                    res = "Bombona já Carregada!";
                }
            } else if (tipo_movto.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
                if (descarregado) {
                    res = "Bombona já Descarregada!";
                } else if (coletado) {
                    res = "Bombona já Coletada!";
                } else if (alocado) {
                    res = "Bombona já Alocada!";
                } else if (!carregado) {
                    res = "Bombona não Carregada!";
                }
            } else if (tipo_movto.startsWith("C")) {
                if (descarregado) {
                    res = "Bombona já Descarregada!";
                } else if (coletado) {
                    res = "Bombona já Coletada!";
                } else if (!alocado) {
                    res = "Bombona não Alocada!";
                }
            } else if (tipo_movto.startsWith("TC")) {
                if (descarregado) {
                    res = "Bombona já Descarregada!";
                } else if (!coletado) {
                    res = "Bombona não Coletada!";
                }
            }
        } else {
            res = validaBombonaEnviadoN(bombona, tipo_movto);
        }
        c.close();
        return res;
    }

    public String validaBombonaEnviadoN(String bombona, String tipo_movto) {
        String queryMov = "SELECT m.data_transporte, m.data_alocacao, m.data_coleta, m.data_terceiro, m.data_baixa FROM BF_MOVIMENTO_BOMBONAS m WHERE m.cod_barras = '" + bombona + "' AND m.enviado = 'N'";
        Cursor cursor = this.db.rawQuery(queryMov, null);
        if (cursor.moveToFirst()) {
            boolean transporte = !cursor.isNull(0);
            boolean alocacao = !cursor.isNull(1);
            boolean coleta = !cursor.isNull(2);
            boolean terceiro = !cursor.isNull(3);
            boolean baixa = true ^ cursor.isNull(4);
            if (tipo_movto.startsWith("B") && baixa) {
                return "Bombona já Baixada! Favor atualizar base.";
            }
            if (tipo_movto.startsWith("TR")) {
                if (baixa) {
                    return "Bombona já Baixada! Favor atualizar base.";
                }
                if (terceiro) {
                    return "Bombona já Descarregada!";
                }
                if (coleta) {
                    return "Bombona já Coletada!";
                }
                if (alocacao) {
                    return "Bombona já Alocada!";
                }
                if (transporte) {
                    return "Bombona já Carregada!";
                }
            }
            if (tipo_movto.startsWith(ExifInterface.GPS_MEASUREMENT_IN_PROGRESS)) {
                if (baixa) {
                    return "Bombona já Baixada! Favor atualizar base.";
                }
                if (terceiro) {
                    return "Bombona já Descarregada!";
                }
                if (coleta) {
                    return "Bombona já Coletada!";
                }
                if (alocacao) {
                    return "Bombona já Alocada!";
                }
                if (!transporte) {
                    return "Bombona não Carregada!";
                }
            }
            if (tipo_movto.startsWith("C")) {
                if (baixa) {
                    return "Bombona já Baixada! Favor atualizar base.";
                }
                if (terceiro) {
                    return "Bombona já Descarregada!";
                }
                if (coleta) {
                    return "Bombona já Coletada!";
                }
                if (!alocacao) {
                    return "Bombona não Alocada!";
                }
            }
            if (tipo_movto.startsWith("TC")) {
                if (baixa) {
                    return "Bombona já Baixada! Favor atualizar base.";
                }
                if (terceiro) {
                    return "Bombona já Descarregada!";
                }
                if (!coleta) {
                    return "Bombona não Coletada!";
                }
            }
            cursor.close();
            return null;
        }
        BombonaTableManager bombonaTableManager = new BombonaTableManager(this.db);
        return bombonaTableManager.verificaStatusSincronizadoBombona(bombona, tipo_movto);
    }

    public List<MovimentoBombona> getMovtosBombonasJson() {
        List<MovimentoBombona> movimentos = new ArrayList<>();
        Cursor cursor = this.db.rawQuery("SELECT cod_barras, id_cliente, data_alocacao, data_coleta, data_baixa, data_transporte, id_coleta_controlado, id_rota, data_terceiro, id_terceiro, id_frota_veiculo FROM BF_MOVIMENTO_BOMBONAS WHERE enviado = 'N'", null);
        if (cursor.moveToFirst()) {
            do {
                String codBarras = cursor.getString(0);
                Integer idCliente = cursor.isNull(1) ? null : Integer.valueOf(cursor.getInt(1));
                String dataAlocacao = cursor.isNull(2) ? null : cursor.getString(2);
                String dataColeta = cursor.isNull(3) ? null : cursor.getString(3);
                String dataBaixa = cursor.isNull(4) ? null : cursor.getString(4);
                String dataTransporte = cursor.isNull(5) ? null : cursor.getString(5);
                String idColetaControlado = cursor.isNull(6) ? null : cursor.getString(6);
                String idRota = cursor.isNull(7) ? null : cursor.getString(7);
                String dataTerceiro = cursor.isNull(8) ? null : cursor.getString(8);
                Integer idTerceiro = cursor.isNull(9) ? null : Integer.valueOf(cursor.getInt(9));
                Integer idFrotaVeiculo = cursor.isNull(10) ? null : Integer.valueOf(cursor.getInt(10));
                MovimentoBombona movimento = new MovimentoBombona(codBarras, idCliente, dataAlocacao, dataColeta, dataBaixa, dataTransporte, idColetaControlado, idRota, dataTerceiro, idTerceiro, idFrotaVeiculo);
                movimentos.add(movimento);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return movimentos;
    }

    public void insert(MovimentoBombona movimentoBombona) {
        long resultado;
        String hoje = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(Calendar.getInstance().getTime());
        ContentValues cv = getContentValues(movimentoBombona, hoje);
        if (!validaMovtoBombona(movimentoBombona.getCod_barras())) {
            resultado = this.db.insert(TABLE_NAME, null, cv);
        } else {
            resultado = this.db.update(TABLE_NAME, cv, "cod_barras = ? AND enviado = 'N'", new String[]{movimentoBombona.getCod_barras()});
        }
        if (resultado != -1) {
            BombonaTableManager bombonaTableManager = new BombonaTableManager(this.db);
            bombonaTableManager.updateMovto(movimentoBombona);
        }
    }

    /* JADX WARN: não é possível corrigir a ordem dos casos do switch; parte do código será duplicada */
    private static ContentValues getContentValues(MovimentoBombona movimentoBombona, String hoje) {
        char c;
        ContentValues cv = new ContentValues();
        cv.put("cod_barras", movimentoBombona.getCod_barras());
        cv.put("enviado", "N");
        cv.put(COL_DATA_MOVTO, hoje);
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
                    c = 2;
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
                    c = 4;
                    break;
                }
                c = 65535;
                break;
            case 2686:
                if (tipo_movto.equals("TR")) {
                    c = 3;
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
                cv.put("DATA_ALOCACAO", hoje);
                cv.put("ID_CLIENTE", movimentoBombona.getId_cliente());
                break;
            case 1:
                cv.put("DATA_COLETA", hoje);
                break;
            case 2:
                cv.put("DATA_BAIXA", hoje);
                break;
            case 3:
                cv.put("DATA_TRANSPORTE", hoje);
                break;
            case 4:
                cv.put("DATA_TERCEIRO", hoje);
                cv.put("ID_TERCEIRO", movimentoBombona.getId_cliente());
                break;
        }
        if (movimentoBombona.getId_coleta_controlado() != null) {
            cv.put("ID_COLETA_CONTROLADO", movimentoBombona.getId_coleta_controlado());
        }
        if (movimentoBombona.getId_rota() != null) {
            cv.put("ID_ROTA", movimentoBombona.getId_rota());
        }
        if (movimentoBombona.getId_frota_veiculo() != null) {
            cv.put("ID_FROTA_VEICULO", movimentoBombona.getId_frota_veiculo());
        }
        return cv;
    }

    public void updateMovtoEnv() {
        Date dataAtual = Calendar.getInstance().getTime();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String hoje = dateFormat.format(dataAtual);
        ContentValues cv = new ContentValues();
        cv.put("enviado", ExifInterface.LATITUDE_SOUTH);
        cv.put(COL_DATA_MOVTO, hoje);
        this.db.update(TABLE_NAME, cv, "enviado = 'N'", null);
    }

    public void updateDeleteColeta(String codBarras) {
        ContentValues contentValues = new ContentValues();
        contentValues.putNull("id_coleta_controlado");
        contentValues.putNull("data_coleta");
        String[] whereArgs2 = {codBarras};
        this.db.update(TABLE_NAME, contentValues, "cod_barras = ?", whereArgs2);
    }

    public void deleteMovtos7days() {
        this.db.execSQL("DELETE FROM BF_MOVIMENTO_BOMBONAS WHERE strftime(substr(data_movto,7,4)    ||substr(data_movto,4,2)    ||substr(data_movto,1,2))  <= strftime('%Y%m%d', DATETIME('now', '-30 day'))AND enviado = 'S' ");
    }
}
