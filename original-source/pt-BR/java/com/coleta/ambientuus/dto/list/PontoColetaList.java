package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.PontoColeta;
import com.google.gson.annotations.SerializedName;
import java.util.List;

/* carregado de: classes10.dex */
public class PontoColetaList {

    @SerializedName("pontos")
    private List<PontoColeta> pontosColeta;

    protected boolean canEqual(Object other) {
        return other instanceof PontoColetaList;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof PontoColetaList)) {
            return false;
        }
        PontoColetaList other = (PontoColetaList) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$pontosColeta = getPontosColeta();
        Object other$pontosColeta = other.getPontosColeta();
        return this$pontosColeta != null ? this$pontosColeta.equals(other$pontosColeta) : other$pontosColeta == null;
    }

    public int hashCode() {
        Object $pontosColeta = getPontosColeta();
        int result = (1 * 59) + ($pontosColeta == null ? 43 : $pontosColeta.hashCode());
        return result;
    }

    public void setPontosColeta(List<PontoColeta> pontosColeta) {
        this.pontosColeta = pontosColeta;
    }

    public String toString() {
        return "PontoColetaList(pontosColeta=" + getPontosColeta() + ")";
    }

    public List<PontoColeta> getPontosColeta() {
        return this.pontosColeta;
    }
}
