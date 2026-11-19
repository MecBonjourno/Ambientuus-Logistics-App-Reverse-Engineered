package com.coleta.ambientuus.dto;

/* carregado de: classes14.dex */
public class Rota {
    private String descricao;
    private Integer id_frota_veiculo;
    private String id_motorista;
    private String id_rota;
    private String ordem;

    public Rota(String id_rota, String descricao, String id_motorista, Integer id_frota_veiculo, String ordem) {
        this.id_rota = id_rota;
        this.descricao = descricao;
        this.id_motorista = id_motorista;
        this.id_frota_veiculo = id_frota_veiculo;
        this.ordem = ordem;
    }

    public Rota(String id_rota, String descricao, String id_motorista) {
        this.id_rota = id_rota;
        this.descricao = descricao;
        this.id_motorista = id_motorista;
    }

    public String getId_rota() {
        return this.id_rota;
    }

    public void setId_rota(String id_rota) {
        this.id_rota = id_rota;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getId_motorista() {
        return this.id_motorista;
    }

    public void setId_motorista(String id_motorista) {
        this.id_motorista = id_motorista;
    }

    public Integer getId_frota_veiculo() {
        return this.id_frota_veiculo;
    }

    public void setId_frota_veiculo(Integer id_frota_veiculo) {
        this.id_frota_veiculo = id_frota_veiculo;
    }

    public String getOrdem() {
        return this.ordem;
    }

    public void setOrdem(String ordem) {
        this.ordem = ordem;
    }

    public String toString() {
        return this.descricao;
    }
}
