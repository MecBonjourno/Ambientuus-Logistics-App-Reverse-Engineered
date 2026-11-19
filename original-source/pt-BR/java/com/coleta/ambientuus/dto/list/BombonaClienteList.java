package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.BombonaCliente;
import com.google.gson.annotations.SerializedName;
import java.util.List;

/* carregado de: classes10.dex */
public class BombonaClienteList {

    @SerializedName("coleta")
    private List<BombonaCliente> bombonaClienteList;

    protected boolean canEqual(Object other) {
        return other instanceof BombonaClienteList;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof BombonaClienteList)) {
            return false;
        }
        BombonaClienteList other = (BombonaClienteList) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$bombonaClienteList = getBombonaClienteList();
        Object other$bombonaClienteList = other.getBombonaClienteList();
        return this$bombonaClienteList != null ? this$bombonaClienteList.equals(other$bombonaClienteList) : other$bombonaClienteList == null;
    }

    public int hashCode() {
        Object $bombonaClienteList = getBombonaClienteList();
        int result = (1 * 59) + ($bombonaClienteList == null ? 43 : $bombonaClienteList.hashCode());
        return result;
    }

    public void setBombonaClienteList(List<BombonaCliente> bombonaClienteList) {
        this.bombonaClienteList = bombonaClienteList;
    }

    public String toString() {
        return "BombonaClienteList(bombonaClienteList=" + getBombonaClienteList() + ")";
    }

    public List<BombonaCliente> getBombonaClienteList() {
        return this.bombonaClienteList;
    }
}
