package com.coleta.ambientuus.dto;

import com.coleta.ambientuus.database.managers.ColetaTableManager;
import com.google.gson.annotations.SerializedName;

/* loaded from: classes14.dex */
public class Coleta {
    private String cliente_ausente;
    private String cod_bombona;
    private String cod_etiqueta;
    private String coleta_extra;
    private String coleta_sem_residuo;
    private String data_coleta;
    private String data_envio;
    private String descVolume;
    private String enviado;

    @SerializedName("id_coleta_logradouro")
    private Integer idColetaLogradouro;

    @SerializedName("id_dia_coleta")
    private Integer idDiaColeta;

    @SerializedName("id_tipo_residuo")
    private Integer idTipoResiduo;

    @SerializedName(ColetaTableManager.COL_ID_VOLUME_EXTRA)
    private Integer idVolumeExtra;
    private Integer id_app_coleta;
    private Integer id_cliente_mtr;
    private String id_coleta;
    private String id_coleta_aplicativo;
    private Integer id_rota;
    private Integer id_volume;
    private String numero_mtr;
    private String observacao;
    private String peso;
    private String peso_liquido;
    private String tipo_coleta;

    public void setCliente_ausente(String cliente_ausente) {
        this.cliente_ausente = cliente_ausente;
    }

    public void setCod_bombona(String cod_bombona) {
        this.cod_bombona = cod_bombona;
    }

    public void setColeta_extra(String coleta_extra) {
        this.coleta_extra = coleta_extra;
    }

    public void setColeta_sem_residuo(String coleta_sem_residuo) {
        this.coleta_sem_residuo = coleta_sem_residuo;
    }

    public void setData_coleta(String data_coleta) {
        this.data_coleta = data_coleta;
    }

    public void setData_envio(String data_envio) {
        this.data_envio = data_envio;
    }

    public void setDescVolume(String descVolume) {
        this.descVolume = descVolume;
    }

    public void setEnviado(String enviado) {
        this.enviado = enviado;
    }

    public void setIdColetaLogradouro(Integer idColetaLogradouro) {
        this.idColetaLogradouro = idColetaLogradouro;
    }

    public void setIdDiaColeta(Integer idDiaColeta) {
        this.idDiaColeta = idDiaColeta;
    }

    public void setIdTipoResiduo(Integer idTipoResiduo) {
        this.idTipoResiduo = idTipoResiduo;
    }

    public void setIdVolumeExtra(Integer idVolumeExtra) {
        this.idVolumeExtra = idVolumeExtra;
    }

    public void setId_app_coleta(Integer id_app_coleta) {
        this.id_app_coleta = id_app_coleta;
    }

    public void setId_cliente_mtr(Integer id_cliente_mtr) {
        this.id_cliente_mtr = id_cliente_mtr;
    }

    public void setId_coleta(String id_coleta) {
        this.id_coleta = id_coleta;
    }

    public void setId_coleta_aplicativo(String id_coleta_aplicativo) {
        this.id_coleta_aplicativo = id_coleta_aplicativo;
    }

    public void setId_rota(Integer id_rota) {
        this.id_rota = id_rota;
    }

    public void setId_volume(Integer id_volume) {
        this.id_volume = id_volume;
    }

    public void setNumero_mtr(String numero_mtr) {
        this.numero_mtr = numero_mtr;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public void setPeso_liquido(String peso_liquido) {
        this.peso_liquido = peso_liquido;
    }

    public void setTipo_coleta(String tipo_coleta) {
        this.tipo_coleta = tipo_coleta;
    }

    public String getPeso_liquido() {
        return this.peso_liquido;
    }

    public String getDescVolume() {
        return this.descVolume;
    }

    public String getId_coleta() {
        return this.id_coleta;
    }

    public String getPeso() {
        return this.peso;
    }

    public String getNumero_mtr() {
        return this.numero_mtr;
    }

    public String getData_coleta() {
        return this.data_coleta;
    }

    public String getCliente_ausente() {
        return this.cliente_ausente;
    }

    public String getColeta_sem_residuo() {
        return this.coleta_sem_residuo;
    }

    public String getColeta_extra() {
        return this.coleta_extra;
    }

    public String getObservacao() {
        return this.observacao;
    }

    public String getEnviado() {
        return this.enviado;
    }

    public Integer getId_cliente_mtr() {
        return this.id_cliente_mtr;
    }

    public String getTipo_coleta() {
        return this.tipo_coleta;
    }

    public String getCod_bombona() {
        return this.cod_bombona;
    }

    public String getData_envio() {
        return this.data_envio;
    }

    public String getId_coleta_aplicativo() {
        return this.id_coleta_aplicativo;
    }

    public Integer getId_app_coleta() {
        return this.id_app_coleta;
    }

    public Integer getIdTipoResiduo() {
        return this.idTipoResiduo;
    }

    public Integer getIdVolumeExtra() {
        return this.idVolumeExtra;
    }

    public Integer getIdColetaLogradouro() {
        return this.idColetaLogradouro;
    }

    public Integer getIdDiaColeta() {
        return this.idDiaColeta;
    }

    public Coleta(String peso, String numero_mtr, String data_coleta, Integer id_rota, Integer id_volume, String cliente_ausente, String coleta_sem_residuo, String coleta_extra, String observacao, String enviado, Integer id_cliente_mtr, String tipo_coleta, String cod_bombona, String data_envio, String id_coleta_aplicativo, Integer id_app_coleta, String cod_etiqueta, Integer idTipoResiduo, Integer idVolumeExtra, Integer idColetaLogradouro, Integer idDiaColeta) {
        this.peso = peso;
        this.numero_mtr = numero_mtr;
        this.data_coleta = data_coleta;
        this.id_rota = id_rota;
        this.id_volume = id_volume;
        this.cliente_ausente = cliente_ausente;
        this.coleta_sem_residuo = coleta_sem_residuo;
        this.coleta_extra = coleta_extra;
        this.observacao = observacao;
        this.enviado = enviado;
        this.id_cliente_mtr = id_cliente_mtr;
        this.tipo_coleta = tipo_coleta;
        this.cod_bombona = cod_bombona;
        this.data_envio = data_envio;
        this.id_coleta_aplicativo = id_coleta_aplicativo;
        this.id_app_coleta = id_app_coleta;
        this.cod_etiqueta = cod_etiqueta;
        this.idTipoResiduo = idTipoResiduo;
        this.idVolumeExtra = idVolumeExtra;
        this.idColetaLogradouro = idColetaLogradouro;
        this.idDiaColeta = idDiaColeta;
    }

    public Coleta(String peso, String numero_mtr, String data_coleta, Integer id_rota, Integer id_volume, String cliente_ausente, String coleta_sem_residuo, String coleta_extra, String enviado, String descVolume) {
        this.peso = peso;
        this.numero_mtr = numero_mtr;
        this.data_coleta = data_coleta;
        this.id_rota = id_rota;
        this.id_volume = id_volume;
        this.cliente_ausente = cliente_ausente;
        this.coleta_sem_residuo = coleta_sem_residuo;
        this.coleta_extra = coleta_extra;
        this.enviado = enviado;
        this.descVolume = descVolume;
    }

    public Coleta(String id_coleta, String peso, String numero_mtr, String data_coleta, Integer id_volume, String cliente_ausente, String coleta_sem_residuo, String coleta_extra, String descVolume, String peso_liquido, Integer id_cliente_mtr, String cod_etiqueta) {
        this.id_coleta = id_coleta;
        this.peso = peso;
        this.numero_mtr = numero_mtr;
        this.data_coleta = data_coleta;
        this.id_volume = id_volume;
        this.cliente_ausente = cliente_ausente;
        this.coleta_sem_residuo = coleta_sem_residuo;
        this.coleta_extra = coleta_extra;
        this.descVolume = descVolume;
        this.peso_liquido = peso_liquido;
        this.id_cliente_mtr = id_cliente_mtr;
        this.cod_etiqueta = cod_etiqueta;
    }

    public int getId_rota() {
        return this.id_rota.intValue();
    }

    public int getId_volume() {
        return this.id_volume.intValue();
    }

    public String getCod_Etiqueta() {
        return this.cod_etiqueta;
    }

    public void setCod_Etiqueta(String cod_etiqueta) {
        this.cod_etiqueta = cod_etiqueta;
    }
}
