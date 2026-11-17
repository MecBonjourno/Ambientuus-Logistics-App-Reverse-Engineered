package com.coleta.ambientuus.dto;

import android.os.Parcel;
import android.os.Parcelable;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.google.gson.annotations.SerializedName;

/* loaded from: classes14.dex */
public class PontoColeta implements Parcelable {
    public static final Parcelable.Creator<PontoColeta> CREATOR = new Parcelable.Creator<PontoColeta>() { // from class: com.coleta.ambientuus.dto.PontoColeta.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public PontoColeta createFromParcel(Parcel in) {
            return new PontoColeta(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public PontoColeta[] newArray(int size) {
            return new PontoColeta[size];
        }
    };

    @SerializedName("atualizado")
    private String atualizado;

    @SerializedName(PontoColetaTableManager.COL_CLIENTE_EMITE_MTR)
    private String clienteEmiteMtr;

    @SerializedName(PontoColetaTableManager.COL_CLIENTE_NOVO)
    private String clienteNovo;

    @SerializedName(PontoColetaTableManager.COL_COD_CLIENTE)
    private String codCliente;

    @SerializedName("coleta_extra")
    private String coletaExtra;

    @SerializedName(PontoColetaTableManager.COL_DESTINO)
    private String destino;

    @SerializedName(PontoColetaTableManager.COL_ENDERECO)
    private String endereco;
    private Integer id;

    @SerializedName("id_cliente")
    private Integer idCliente;

    @SerializedName("id_coleta_logradouro")
    private Integer idColetaLogradouro;

    @SerializedName("id_dia_coleta")
    private Integer idDiaColeta;

    @SerializedName("id_manifesto")
    private Integer idManifesto;

    @SerializedName("numero_manifesto")
    private String numeroManifesto;

    @SerializedName(PontoColetaTableManager.COL_OBSERVACAO_MTR)
    private String observacaoMtr;

    @SerializedName("ordem")
    private Integer ordem;

    @SerializedName(PontoColetaTableManager.COL_PERIODICIDADE)
    private String periodicidade;

    @SerializedName("razao_social")
    private String razaoSocial;
    private String status;

    @SerializedName(PontoColetaTableManager.COL_TIPO_RESIDUO)
    private String tipoResiduo;

    protected boolean canEqual(Object other) {
        return other instanceof PontoColeta;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof PontoColeta)) {
            return false;
        }
        PontoColeta other = (PontoColeta) o;
        if (!other.canEqual(this)) {
            return false;
        }
        Object this$id = getId();
        Object other$id = other.getId();
        if (this$id != null ? !this$id.equals(other$id) : other$id != null) {
            return false;
        }
        Object this$idCliente = getIdCliente();
        Object other$idCliente = other.getIdCliente();
        if (this$idCliente != null ? !this$idCliente.equals(other$idCliente) : other$idCliente != null) {
            return false;
        }
        Object this$ordem = getOrdem();
        Object other$ordem = other.getOrdem();
        if (this$ordem != null ? !this$ordem.equals(other$ordem) : other$ordem != null) {
            return false;
        }
        Object this$idManifesto = getIdManifesto();
        Object other$idManifesto = other.getIdManifesto();
        if (this$idManifesto != null ? !this$idManifesto.equals(other$idManifesto) : other$idManifesto != null) {
            return false;
        }
        Object this$idColetaLogradouro = getIdColetaLogradouro();
        Object other$idColetaLogradouro = other.getIdColetaLogradouro();
        if (this$idColetaLogradouro != null ? !this$idColetaLogradouro.equals(other$idColetaLogradouro) : other$idColetaLogradouro != null) {
            return false;
        }
        Object this$idDiaColeta = getIdDiaColeta();
        Object other$idDiaColeta = other.getIdDiaColeta();
        if (this$idDiaColeta != null ? !this$idDiaColeta.equals(other$idDiaColeta) : other$idDiaColeta != null) {
            return false;
        }
        Object this$codCliente = getCodCliente();
        Object other$codCliente = other.getCodCliente();
        if (this$codCliente != null ? !this$codCliente.equals(other$codCliente) : other$codCliente != null) {
            return false;
        }
        Object this$razaoSocial = getRazaoSocial();
        Object other$razaoSocial = other.getRazaoSocial();
        if (this$razaoSocial != null ? !this$razaoSocial.equals(other$razaoSocial) : other$razaoSocial != null) {
            return false;
        }
        Object this$endereco = getEndereco();
        Object other$endereco = other.getEndereco();
        if (this$endereco != null ? !this$endereco.equals(other$endereco) : other$endereco != null) {
            return false;
        }
        Object this$numeroManifesto = getNumeroManifesto();
        Object other$numeroManifesto = other.getNumeroManifesto();
        if (this$numeroManifesto != null ? !this$numeroManifesto.equals(other$numeroManifesto) : other$numeroManifesto != null) {
            return false;
        }
        Object this$observacaoMtr = getObservacaoMtr();
        Object other$observacaoMtr = other.getObservacaoMtr();
        if (this$observacaoMtr != null ? !this$observacaoMtr.equals(other$observacaoMtr) : other$observacaoMtr != null) {
            return false;
        }
        Object this$destino = getDestino();
        Object other$destino = other.getDestino();
        if (this$destino != null ? !this$destino.equals(other$destino) : other$destino != null) {
            return false;
        }
        Object this$coletaExtra = getColetaExtra();
        Object other$coletaExtra = other.getColetaExtra();
        if (this$coletaExtra != null ? !this$coletaExtra.equals(other$coletaExtra) : other$coletaExtra != null) {
            return false;
        }
        Object this$tipoResiduo = getTipoResiduo();
        Object other$tipoResiduo = other.getTipoResiduo();
        if (this$tipoResiduo != null ? !this$tipoResiduo.equals(other$tipoResiduo) : other$tipoResiduo != null) {
            return false;
        }
        Object this$periodicidade = getPeriodicidade();
        Object other$periodicidade = other.getPeriodicidade();
        if (this$periodicidade != null ? !this$periodicidade.equals(other$periodicidade) : other$periodicidade != null) {
            return false;
        }
        Object this$clienteNovo = getClienteNovo();
        Object other$clienteNovo = other.getClienteNovo();
        if (this$clienteNovo != null ? !this$clienteNovo.equals(other$clienteNovo) : other$clienteNovo != null) {
            return false;
        }
        Object this$status = getStatus();
        Object other$status = other.getStatus();
        if (this$status != null ? !this$status.equals(other$status) : other$status != null) {
            return false;
        }
        Object this$clienteEmiteMtr = getClienteEmiteMtr();
        Object other$clienteEmiteMtr = other.getClienteEmiteMtr();
        if (this$clienteEmiteMtr != null ? !this$clienteEmiteMtr.equals(other$clienteEmiteMtr) : other$clienteEmiteMtr != null) {
            return false;
        }
        Object this$atualizado = getAtualizado();
        Object other$atualizado = other.getAtualizado();
        return this$atualizado != null ? this$atualizado.equals(other$atualizado) : other$atualizado == null;
    }

    public int hashCode() {
        Object $id = getId();
        int result = (1 * 59) + ($id == null ? 43 : $id.hashCode());
        Object $idCliente = getIdCliente();
        int result2 = (result * 59) + ($idCliente == null ? 43 : $idCliente.hashCode());
        Object $ordem = getOrdem();
        int result3 = (result2 * 59) + ($ordem == null ? 43 : $ordem.hashCode());
        Object $idManifesto = getIdManifesto();
        int result4 = (result3 * 59) + ($idManifesto == null ? 43 : $idManifesto.hashCode());
        Object $idColetaLogradouro = getIdColetaLogradouro();
        int result5 = (result4 * 59) + ($idColetaLogradouro == null ? 43 : $idColetaLogradouro.hashCode());
        Object $idDiaColeta = getIdDiaColeta();
        int result6 = (result5 * 59) + ($idDiaColeta == null ? 43 : $idDiaColeta.hashCode());
        Object $codCliente = getCodCliente();
        int result7 = (result6 * 59) + ($codCliente == null ? 43 : $codCliente.hashCode());
        Object $razaoSocial = getRazaoSocial();
        int result8 = (result7 * 59) + ($razaoSocial == null ? 43 : $razaoSocial.hashCode());
        Object $endereco = getEndereco();
        int result9 = (result8 * 59) + ($endereco == null ? 43 : $endereco.hashCode());
        Object $numeroManifesto = getNumeroManifesto();
        int result10 = (result9 * 59) + ($numeroManifesto == null ? 43 : $numeroManifesto.hashCode());
        Object $observacaoMtr = getObservacaoMtr();
        int result11 = (result10 * 59) + ($observacaoMtr == null ? 43 : $observacaoMtr.hashCode());
        Object $destino = getDestino();
        int result12 = (result11 * 59) + ($destino == null ? 43 : $destino.hashCode());
        Object $coletaExtra = getColetaExtra();
        int result13 = (result12 * 59) + ($coletaExtra == null ? 43 : $coletaExtra.hashCode());
        Object $tipoResiduo = getTipoResiduo();
        int result14 = (result13 * 59) + ($tipoResiduo == null ? 43 : $tipoResiduo.hashCode());
        Object $periodicidade = getPeriodicidade();
        int result15 = (result14 * 59) + ($periodicidade == null ? 43 : $periodicidade.hashCode());
        Object $clienteNovo = getClienteNovo();
        int result16 = (result15 * 59) + ($clienteNovo == null ? 43 : $clienteNovo.hashCode());
        Object $status = getStatus();
        int result17 = (result16 * 59) + ($status == null ? 43 : $status.hashCode());
        Object $clienteEmiteMtr = getClienteEmiteMtr();
        int result18 = (result17 * 59) + ($clienteEmiteMtr == null ? 43 : $clienteEmiteMtr.hashCode());
        Object $atualizado = getAtualizado();
        return (result18 * 59) + ($atualizado != null ? $atualizado.hashCode() : 43);
    }

    public void setAtualizado(String atualizado) {
        this.atualizado = atualizado;
    }

    public void setClienteEmiteMtr(String clienteEmiteMtr) {
        this.clienteEmiteMtr = clienteEmiteMtr;
    }

    public void setClienteNovo(String clienteNovo) {
        this.clienteNovo = clienteNovo;
    }

    public void setCodCliente(String codCliente) {
        this.codCliente = codCliente;
    }

    public void setColetaExtra(String coletaExtra) {
        this.coletaExtra = coletaExtra;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public void setIdColetaLogradouro(Integer idColetaLogradouro) {
        this.idColetaLogradouro = idColetaLogradouro;
    }

    public void setIdDiaColeta(Integer idDiaColeta) {
        this.idDiaColeta = idDiaColeta;
    }

    public void setIdManifesto(Integer idManifesto) {
        this.idManifesto = idManifesto;
    }

    public void setNumeroManifesto(String numeroManifesto) {
        this.numeroManifesto = numeroManifesto;
    }

    public void setObservacaoMtr(String observacaoMtr) {
        this.observacaoMtr = observacaoMtr;
    }

    public void setOrdem(Integer ordem) {
        this.ordem = ordem;
    }

    public void setPeriodicidade(String periodicidade) {
        this.periodicidade = periodicidade;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTipoResiduo(String tipoResiduo) {
        this.tipoResiduo = tipoResiduo;
    }

    public String toString() {
        return "PontoColeta(id=" + getId() + ", idCliente=" + getIdCliente() + ", codCliente=" + getCodCliente() + ", razaoSocial=" + getRazaoSocial() + ", endereco=" + getEndereco() + ", numeroManifesto=" + getNumeroManifesto() + ", observacaoMtr=" + getObservacaoMtr() + ", destino=" + getDestino() + ", coletaExtra=" + getColetaExtra() + ", tipoResiduo=" + getTipoResiduo() + ", ordem=" + getOrdem() + ", periodicidade=" + getPeriodicidade() + ", clienteNovo=" + getClienteNovo() + ", idManifesto=" + getIdManifesto() + ", status=" + getStatus() + ", idColetaLogradouro=" + getIdColetaLogradouro() + ", clienteEmiteMtr=" + getClienteEmiteMtr() + ", atualizado=" + getAtualizado() + ", idDiaColeta=" + getIdDiaColeta() + ")";
    }

    public PontoColeta(Integer id, Integer idCliente, String codCliente, String razaoSocial, String endereco, String numeroManifesto, String observacaoMtr, String destino, String coletaExtra, String tipoResiduo, Integer ordem, String periodicidade, String clienteNovo, Integer idManifesto, String status, Integer idColetaLogradouro, String clienteEmiteMtr, String atualizado, Integer idDiaColeta) {
        this.id = id;
        this.idCliente = idCliente;
        this.codCliente = codCliente;
        this.razaoSocial = razaoSocial;
        this.endereco = endereco;
        this.numeroManifesto = numeroManifesto;
        this.observacaoMtr = observacaoMtr;
        this.destino = destino;
        this.coletaExtra = coletaExtra;
        this.tipoResiduo = tipoResiduo;
        this.ordem = ordem;
        this.periodicidade = periodicidade;
        this.clienteNovo = clienteNovo;
        this.idManifesto = idManifesto;
        this.status = status;
        this.idColetaLogradouro = idColetaLogradouro;
        this.clienteEmiteMtr = clienteEmiteMtr;
        this.atualizado = atualizado;
        this.idDiaColeta = idDiaColeta;
    }

    public PontoColeta() {
    }

    public Integer getId() {
        return this.id;
    }

    public Integer getIdCliente() {
        return this.idCliente;
    }

    public String getCodCliente() {
        return this.codCliente;
    }

    public String getRazaoSocial() {
        return this.razaoSocial;
    }

    public String getEndereco() {
        return this.endereco;
    }

    public String getNumeroManifesto() {
        return this.numeroManifesto;
    }

    public String getObservacaoMtr() {
        return this.observacaoMtr;
    }

    public String getDestino() {
        return this.destino;
    }

    public String getColetaExtra() {
        return this.coletaExtra;
    }

    public String getTipoResiduo() {
        return this.tipoResiduo;
    }

    public Integer getOrdem() {
        return this.ordem;
    }

    public String getPeriodicidade() {
        return this.periodicidade;
    }

    public String getClienteNovo() {
        return this.clienteNovo;
    }

    public Integer getIdManifesto() {
        return this.idManifesto;
    }

    public String getStatus() {
        return this.status;
    }

    public Integer getIdColetaLogradouro() {
        return this.idColetaLogradouro;
    }

    public String getClienteEmiteMtr() {
        return this.clienteEmiteMtr;
    }

    public String getAtualizado() {
        return this.atualizado;
    }

    public Integer getIdDiaColeta() {
        return this.idDiaColeta;
    }

    protected PontoColeta(Parcel in) {
        if (in.readByte() == 0) {
            this.id = null;
        } else {
            this.id = Integer.valueOf(in.readInt());
        }
        if (in.readByte() == 0) {
            this.idCliente = null;
        } else {
            this.idCliente = Integer.valueOf(in.readInt());
        }
        this.codCliente = in.readString();
        this.razaoSocial = in.readString();
        this.endereco = in.readString();
        this.numeroManifesto = in.readString();
        this.observacaoMtr = in.readString();
        this.destino = in.readString();
        this.coletaExtra = in.readString();
        this.tipoResiduo = in.readString();
        if (in.readByte() == 0) {
            this.ordem = null;
        } else {
            this.ordem = Integer.valueOf(in.readInt());
        }
        this.periodicidade = in.readString();
        this.clienteNovo = in.readString();
        if (in.readByte() == 0) {
            this.idManifesto = null;
        } else {
            this.idManifesto = Integer.valueOf(in.readInt());
        }
        if (in.readByte() == 0) {
            this.idColetaLogradouro = null;
        } else {
            this.idColetaLogradouro = Integer.valueOf(in.readInt());
        }
        this.clienteEmiteMtr = in.readString();
        if (in.readByte() == 0) {
            this.idDiaColeta = null;
        } else {
            this.idDiaColeta = Integer.valueOf(in.readInt());
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        if (this.id == null) {
            parcel.writeByte((byte) 0);
        } else {
            parcel.writeByte((byte) 1);
            parcel.writeInt(this.id.intValue());
        }
        if (this.idCliente == null) {
            parcel.writeByte((byte) 0);
        } else {
            parcel.writeByte((byte) 1);
            parcel.writeInt(this.idCliente.intValue());
        }
        parcel.writeString(this.codCliente);
        parcel.writeString(this.razaoSocial);
        parcel.writeString(this.endereco);
        parcel.writeString(this.numeroManifesto);
        parcel.writeString(this.observacaoMtr);
        parcel.writeString(this.destino);
        parcel.writeString(this.coletaExtra);
        parcel.writeString(this.tipoResiduo);
        if (this.ordem == null) {
            parcel.writeByte((byte) 0);
        } else {
            parcel.writeByte((byte) 1);
            parcel.writeInt(this.ordem.intValue());
        }
        parcel.writeString(this.periodicidade);
        parcel.writeString(this.clienteNovo);
        if (this.idManifesto == null) {
            parcel.writeByte((byte) 0);
        } else {
            parcel.writeByte((byte) 1);
            parcel.writeInt(this.idManifesto.intValue());
        }
        if (this.idColetaLogradouro == null) {
            parcel.writeByte((byte) 0);
        } else {
            parcel.writeByte((byte) 1);
            parcel.writeInt(this.idColetaLogradouro.intValue());
        }
        parcel.writeString(this.clienteEmiteMtr);
        if (this.idDiaColeta == null) {
            parcel.writeByte((byte) 0);
        } else {
            parcel.writeByte((byte) 1);
            parcel.writeInt(this.idDiaColeta.intValue());
        }
    }

    public boolean contemTexto(String texto) {
        String texto2 = texto.toLowerCase();
        return this.codCliente.toLowerCase().contains(texto2) || this.razaoSocial.toLowerCase().contains(texto2) || this.endereco.toLowerCase().contains(texto2);
    }
}
