package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.Terceiro;
import java.util.List;

/* loaded from: classes10.dex */
public class TerceiroList {
    private String MSG;
    private List<Terceiro> TERCEIROS;

    public TerceiroList(List<Terceiro> TERCEIROS, String MSG) {
        this.TERCEIROS = TERCEIROS;
        this.MSG = MSG;
    }

    public List<Terceiro> getTERCEIROS() {
        return this.TERCEIROS;
    }

    public void setTERCEIROS(List<Terceiro> TERCEIROS) {
        this.TERCEIROS = TERCEIROS;
    }

    public String getMSG() {
        return this.MSG;
    }

    public void setMSG(String MSG) {
        this.MSG = MSG;
    }
}
