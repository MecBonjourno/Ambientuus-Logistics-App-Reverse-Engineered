package com.coleta.ambientuus.dto;

/* loaded from: classes14.dex */
public class MovimentoBombona {
    private String cod_barras;
    private String data_alocacao;
    private String data_baixa;
    private String data_coleta;
    private String data_terceiro;
    private String data_transporte;
    private Integer id_cliente;
    private String id_coleta_controlado;
    private Integer id_frota_veiculo;
    private String id_rota;
    private Integer id_terceiro;
    private String tipo_movto;

    public MovimentoBombona(String cod_barras, Integer id_cliente, String data_alocacao, String data_coleta, String data_baixa, String data_transporte, String id_coleta_controlado, String id_rota, String data_terceiro, Integer id_terceiro, Integer id_frota_veiculo) {
        this.cod_barras = cod_barras;
        this.id_cliente = id_cliente;
        this.data_alocacao = data_alocacao;
        this.data_coleta = data_coleta;
        this.data_baixa = data_baixa;
        this.data_transporte = data_transporte;
        this.id_coleta_controlado = id_coleta_controlado;
        this.id_rota = id_rota;
        this.data_terceiro = data_terceiro;
        this.id_terceiro = id_terceiro;
        this.id_frota_veiculo = id_frota_veiculo;
    }

    public MovimentoBombona(String cod_barras, Integer id_cliente, String tipo_movto, String id_coleta_controlado, String id_rota, Integer id_frota_veiculo) {
        this.cod_barras = cod_barras;
        this.id_cliente = id_cliente;
        this.id_coleta_controlado = id_coleta_controlado;
        this.id_rota = id_rota;
        this.id_frota_veiculo = id_frota_veiculo;
        this.tipo_movto = tipo_movto;
    }

    public Integer getId_cliente() {
        return this.id_cliente;
    }

    public Integer getId_frota_veiculo() {
        return this.id_frota_veiculo;
    }

    public Integer getId_terceiro() {
        return this.id_terceiro;
    }

    public String getCod_barras() {
        return this.cod_barras;
    }

    public String getData_alocacao() {
        return this.data_alocacao;
    }

    public String getData_baixa() {
        return this.data_baixa;
    }

    public String getData_coleta() {
        return this.data_coleta;
    }

    public String getData_terceiro() {
        return this.data_terceiro;
    }

    public String getData_transporte() {
        return this.data_transporte;
    }

    public String getId_coleta_controlado() {
        return this.id_coleta_controlado;
    }

    public String getId_rota() {
        return this.id_rota;
    }

    public String getTipo_movto() {
        return this.tipo_movto;
    }
}
