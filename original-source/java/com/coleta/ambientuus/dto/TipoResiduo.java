package com.coleta.ambientuus.dto;

import com.coleta.ambientuus.database.managers.TipoResiduoTableManager;
import com.google.gson.annotations.SerializedName;

/* loaded from: classes14.dex */
public class TipoResiduo {

    @SerializedName(TipoResiduoTableManager.COL_COD_TIPO_RESIDUO)
    private String codigo;

    @SerializedName("descricao")
    private String descricao;
    private Integer id;

    @SerializedName("id_tipo_residuo")
    private Integer id_tipo_residuo;

    protected boolean canEqual(Object other) {
        return other instanceof TipoResiduo;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof TipoResiduo)) {
            return false;
        }
        TipoResiduo other = (TipoResiduo) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$id = getId();
        Object other$id = other.getId();
        if (this$id != null ? !this$id.equals(other$id) : other$id != null) {
            return false;
        }
        Object this$id_tipo_residuo = getId_tipo_residuo();
        Object other$id_tipo_residuo = other.getId_tipo_residuo();
        if (this$id_tipo_residuo != null ? !this$id_tipo_residuo.equals(other$id_tipo_residuo) : other$id_tipo_residuo != null) {
            return false;
        }
        Object this$codigo = getCodigo();
        Object other$codigo = other.getCodigo();
        if (this$codigo != null ? !this$codigo.equals(other$codigo) : other$codigo != null) {
            return false;
        }
        Object this$descricao = getDescricao();
        Object other$descricao = other.getDescricao();
        return this$descricao != null ? this$descricao.equals(other$descricao) : other$descricao == null;
    }

    public int hashCode() {
        Object $id = getId();
        int result = (1 * 59) + ($id == null ? 43 : $id.hashCode());
        Object $id_tipo_residuo = getId_tipo_residuo();
        int result2 = (result * 59) + ($id_tipo_residuo == null ? 43 : $id_tipo_residuo.hashCode());
        Object $codigo = getCodigo();
        int result3 = (result2 * 59) + ($codigo == null ? 43 : $codigo.hashCode());
        Object $descricao = getDescricao();
        return (result3 * 59) + ($descricao != null ? $descricao.hashCode() : 43);
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setId_tipo_residuo(Integer id_tipo_residuo) {
        this.id_tipo_residuo = id_tipo_residuo;
    }

    public String toString() {
        return "TipoResiduo(id=" + getId() + ", id_tipo_residuo=" + getId_tipo_residuo() + ", codigo=" + getCodigo() + ", descricao=" + getDescricao() + ")";
    }

    public TipoResiduo(Integer id, Integer id_tipo_residuo, String codigo, String descricao) {
        this.id = id;
        this.id_tipo_residuo = id_tipo_residuo;
        this.codigo = codigo;
        this.descricao = descricao;
    }

    public TipoResiduo() {
    }

    public Integer getId() {
        return this.id;
    }

    public Integer getId_tipo_residuo() {
        return this.id_tipo_residuo;
    }

    public String getCodigo() {
        return this.codigo;
    }

    public String getDescricao() {
        return this.descricao;
    }
}
