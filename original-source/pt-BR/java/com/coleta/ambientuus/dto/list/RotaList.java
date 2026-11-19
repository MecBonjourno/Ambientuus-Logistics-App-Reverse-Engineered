package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.Rota;
import java.util.List;

/* carregado de: classes10.dex */
public class RotaList {
    private String MSG;
    private List<Rota> ROTAS;

    public RotaList(List<Rota> ROTAS, String MSG) {
        this.ROTAS = ROTAS;
        this.MSG = MSG;
    }

    public List<Rota> getROTAS() {
        return this.ROTAS;
    }

    public void setROTAS(List<Rota> ROTAS) {
        this.ROTAS = ROTAS;
    }

    public String getMSG() {
        return this.MSG;
    }

    public void setMSG(String MSG) {
        this.MSG = MSG;
    }
}
