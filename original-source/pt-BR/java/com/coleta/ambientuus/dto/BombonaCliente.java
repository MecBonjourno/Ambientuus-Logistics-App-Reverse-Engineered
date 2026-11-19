package com.coleta.ambientuus.dto;

import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.google.gson.annotations.SerializedName;

/* carregado de: classes14.dex */
public class BombonaCliente {

    @SerializedName(PontoColetaTableManager.COL_COD_CLIENTE)
    String codCliente;

    @SerializedName("data_coleta")
    String dataColeta;

    @SerializedName("etiquetas")
    String etiquetas;

    @SerializedName("nome_cliente")
    String nomeCliente;

    @SerializedName(ColetaTableManager.COL_NUMERO_MTR)
    String numeroManifesto;

    @SerializedName("peso_liquido")
    String peso;

    @SerializedName("quantidade")
    String quantidade;

    protected boolean canEqual(Object other) {
        return other instanceof BombonaCliente;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof BombonaCliente)) {
            return false;
        }
        BombonaCliente other = (BombonaCliente) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$codCliente = getCodCliente();
        Object other$codCliente = other.getCodCliente();
        if (this$codCliente != null ? !this$codCliente.equals(other$codCliente) : other$codCliente != null) {
            return false;
        }
        Object this$nomeCliente = getNomeCliente();
        Object other$nomeCliente = other.getNomeCliente();
        if (this$nomeCliente != null ? !this$nomeCliente.equals(other$nomeCliente) : other$nomeCliente != null) {
            return false;
        }
        Object this$dataColeta = getDataColeta();
        Object other$dataColeta = other.getDataColeta();
        if (this$dataColeta != null ? !this$dataColeta.equals(other$dataColeta) : other$dataColeta != null) {
            return false;
        }
        Object this$quantidade = getQuantidade();
        Object other$quantidade = other.getQuantidade();
        if (this$quantidade != null ? !this$quantidade.equals(other$quantidade) : other$quantidade != null) {
            return false;
        }
        Object this$peso = getPeso();
        Object other$peso = other.getPeso();
        if (this$peso != null ? !this$peso.equals(other$peso) : other$peso != null) {
            return false;
        }
        Object this$numeroManifesto = getNumeroManifesto();
        Object other$numeroManifesto = other.getNumeroManifesto();
        if (this$numeroManifesto != null ? !this$numeroManifesto.equals(other$numeroManifesto) : other$numeroManifesto != null) {
            return false;
        }
        Object this$etiquetas = getEtiquetas();
        Object other$etiquetas = other.getEtiquetas();
        return this$etiquetas != null ? this$etiquetas.equals(other$etiquetas) : other$etiquetas == null;
    }

    public int hashCode() {
        Object $codCliente = getCodCliente();
        int result = (1 * 59) + ($codCliente == null ? 43 : $codCliente.hashCode());
        Object $nomeCliente = getNomeCliente();
        int result2 = (result * 59) + ($nomeCliente == null ? 43 : $nomeCliente.hashCode());
        Object $dataColeta = getDataColeta();
        int result3 = (result2 * 59) + ($dataColeta == null ? 43 : $dataColeta.hashCode());
        Object $quantidade = getQuantidade();
        int result4 = (result3 * 59) + ($quantidade == null ? 43 : $quantidade.hashCode());
        Object $peso = getPeso();
        int result5 = (result4 * 59) + ($peso == null ? 43 : $peso.hashCode());
        Object $numeroManifesto = getNumeroManifesto();
        int result6 = (result5 * 59) + ($numeroManifesto == null ? 43 : $numeroManifesto.hashCode());
        Object $etiquetas = getEtiquetas();
        return (result6 * 59) + ($etiquetas != null ? $etiquetas.hashCode() : 43);
    }

    public void setCodCliente(String codCliente) {
        this.codCliente = codCliente;
    }

    public void setDataColeta(String dataColeta) {
        this.dataColeta = dataColeta;
    }

    public void setEtiquetas(String etiquetas) {
        this.etiquetas = etiquetas;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public void setNumeroManifesto(String numeroManifesto) {
        this.numeroManifesto = numeroManifesto;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public void setQuantidade(String quantidade) {
        this.quantidade = quantidade;
    }

    public String toString() {
        return "BombonaCliente(codCliente=" + getCodCliente() + ", nomeCliente=" + getNomeCliente() + ", dataColeta=" + getDataColeta() + ", quantidade=" + getQuantidade() + ", peso=" + getPeso() + ", numeroManifesto=" + getNumeroManifesto() + ", etiquetas=" + getEtiquetas() + ")";
    }

    public BombonaCliente(String codCliente, String nomeCliente, String dataColeta, String quantidade, String peso, String numeroManifesto, String etiquetas) {
        this.codCliente = codCliente;
        this.nomeCliente = nomeCliente;
        this.dataColeta = dataColeta;
        this.quantidade = quantidade;
        this.peso = peso;
        this.numeroManifesto = numeroManifesto;
        this.etiquetas = etiquetas;
    }

    public String getCodCliente() {
        return this.codCliente;
    }

    public String getNomeCliente() {
        return this.nomeCliente;
    }

    public String getDataColeta() {
        return this.dataColeta;
    }

    public String getQuantidade() {
        return this.quantidade;
    }

    public String getPeso() {
        return this.peso;
    }

    public String getNumeroManifesto() {
        return this.numeroManifesto;
    }

    public String getEtiquetas() {
        return this.etiquetas;
    }
}
