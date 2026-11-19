package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.Bombona;
import java.util.List;

/* carregado de: classes10.dex */
public class BombonaList {
    private List<Bombona> BOMBONAS;
    private String MSG;

    public BombonaList(List<Bombona> bfBombonas, String MSG) {
        this.BOMBONAS = bfBombonas;
        this.MSG = MSG;
    }

    public List<Bombona> getBfBombonas() {
        return this.BOMBONAS;
    }

    public String getMSG() {
        return this.MSG;
    }

    public void setBfBombonas(List<Bombona> bfBombonas) {
        this.BOMBONAS = bfBombonas;
    }

    public void setMSG(String MSG) {
        this.MSG = MSG;
    }
}
