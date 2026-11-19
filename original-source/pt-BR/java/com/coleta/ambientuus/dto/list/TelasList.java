package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.Telas;
import com.google.gson.annotations.SerializedName;
import java.util.List;

/* carregado de: classes10.dex */
public class TelasList {

    @SerializedName("Telas")
    private List<Telas> telas;

    protected boolean canEqual(Object other) {
        return other instanceof TelasList;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof TelasList)) {
            return false;
        }
        TelasList other = (TelasList) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$telas = getTelas();
        Object other$telas = other.getTelas();
        return this$telas != null ? this$telas.equals(other$telas) : other$telas == null;
    }

    public int hashCode() {
        Object $telas = getTelas();
        int result = (1 * 59) + ($telas == null ? 43 : $telas.hashCode());
        return result;
    }

    public void setTelas(List<Telas> telas) {
        this.telas = telas;
    }

    public String toString() {
        return "TelasList(telas=" + getTelas() + ")";
    }

    public List<Telas> getTelas() {
        return this.telas;
    }
}
