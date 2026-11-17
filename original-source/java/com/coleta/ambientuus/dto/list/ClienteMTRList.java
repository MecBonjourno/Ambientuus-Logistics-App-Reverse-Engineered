package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.ClienteMTR;
import java.util.List;

/* loaded from: classes10.dex */
public class ClienteMTRList {
    private List<ClienteMTR> CLIENTESMTR;
    private String MSG;

    public ClienteMTRList(List<ClienteMTR> CLIENTESMTR, String MSG) {
        this.CLIENTESMTR = CLIENTESMTR;
        this.MSG = MSG;
    }

    public List<ClienteMTR> getCLIENTESMTR() {
        return this.CLIENTESMTR;
    }

    public void setCLIENTESMTR(List<ClienteMTR> CLIENTESMTR) {
        this.CLIENTESMTR = CLIENTESMTR;
    }

    public String getMSG() {
        return this.MSG;
    }

    public void setMSG(String MSG) {
        this.MSG = MSG;
    }
}
