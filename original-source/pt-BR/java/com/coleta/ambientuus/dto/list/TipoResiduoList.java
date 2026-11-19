package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.TipoResiduo;
import com.google.gson.annotations.SerializedName;
import java.util.List;

/* carregado de: classes10.dex */
public class TipoResiduoList {

    @SerializedName("tipos_residuos")
    private List<TipoResiduo> tipoResiduos;

    protected boolean canEqual(Object other) {
        return other instanceof TipoResiduoList;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof TipoResiduoList)) {
            return false;
        }
        TipoResiduoList other = (TipoResiduoList) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$tipoResiduos = getTipoResiduos();
        Object other$tipoResiduos = other.getTipoResiduos();
        return this$tipoResiduos != null ? this$tipoResiduos.equals(other$tipoResiduos) : other$tipoResiduos == null;
    }

    public int hashCode() {
        Object $tipoResiduos = getTipoResiduos();
        int result = (1 * 59) + ($tipoResiduos == null ? 43 : $tipoResiduos.hashCode());
        return result;
    }

    public void setTipoResiduos(List<TipoResiduo> tipoResiduos) {
        this.tipoResiduos = tipoResiduos;
    }

    public String toString() {
        return "TipoResiduoList(tipoResiduos=" + getTipoResiduos() + ")";
    }

    public List<TipoResiduo> getTipoResiduos() {
        return this.tipoResiduos;
    }
}
