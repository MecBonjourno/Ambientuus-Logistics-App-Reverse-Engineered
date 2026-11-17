package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.Motorista;
import java.util.List;

/* loaded from: classes10.dex */
public class MotoristaList {
    private List<Motorista> MOTORISTAS;
    private String MSG;

    public MotoristaList(List<Motorista> MOTORISTAS, String MSG) {
        this.MOTORISTAS = MOTORISTAS;
        this.MSG = MSG;
    }

    public List<Motorista> getMOTORISTAS() {
        return this.MOTORISTAS;
    }

    public void setMOTORISTAS(List<Motorista> MOTORISTAS) {
        this.MOTORISTAS = MOTORISTAS;
    }

    public String getMSG() {
        return this.MSG;
    }

    public void setMSG(String MSG) {
        this.MSG = MSG;
    }
}
