package com.coleta.ambientuus.dto;

import j$.util.Objects;

/* carregado de: classes14.dex */
public class Placas {
    private Integer id_frota_veiculo;
    private String placa_veiculo;

    public Placas(Integer id_frota_veiculo, String placa_veiculo) {
        this.id_frota_veiculo = id_frota_veiculo;
        this.placa_veiculo = placa_veiculo;
    }

    public Integer getId_frota_veiculo() {
        return this.id_frota_veiculo;
    }

    public void setId_frota_veiculo(Integer id_frota_veiculo) {
        this.id_frota_veiculo = id_frota_veiculo;
    }

    public String getPlaca_veiculo() {
        return this.placa_veiculo;
    }

    public void setPlaca_veiculo(String placa_veiculo) {
        this.placa_veiculo = placa_veiculo;
    }

    public String toString() {
        return this.placa_veiculo;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Placas placas = (Placas) o;
        return this.id_frota_veiculo.equals(placas.id_frota_veiculo);
    }

    public int hashCode() {
        return Objects.hash(this.id_frota_veiculo, this.placa_veiculo);
    }
}
