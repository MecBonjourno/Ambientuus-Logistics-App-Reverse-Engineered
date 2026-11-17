package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.Placas;
import java.util.List;

/* loaded from: classes10.dex */
public class PlacasList {
    private String MSG;
    private List<Placas> PLACAS;

    public PlacasList(List<Placas> PLACAS, String MSG) {
        this.PLACAS = PLACAS;
        this.MSG = MSG;
    }

    public List<Placas> getPLACAS() {
        return this.PLACAS;
    }

    public void setPLACAS(List<Placas> PLACAS) {
        this.PLACAS = PLACAS;
    }

    public String getMSG() {
        return this.MSG;
    }

    public void setMSG(String MSG) {
        this.MSG = MSG;
    }
}
