package com.coleta.ambientuus.dto;

/* carregado de: classes14.dex */
public class Bombona {
    private final String capacidade;
    private String cod_barras;
    private int id_bombona;
    private int id_cliente;
    private int id_terceiro;
    private int id_volume;
    private String status;

    public Bombona(int ID_BOMBONA, String COD_BARRAS, int ID_VOLUME, String STATUS, int ID_CLIENTE, String CAPACIDADE, int ID_TERCEIRO) {
        this.id_bombona = ID_BOMBONA;
        this.cod_barras = COD_BARRAS;
        this.id_volume = ID_VOLUME;
        this.status = STATUS;
        this.id_cliente = ID_CLIENTE;
        this.capacidade = CAPACIDADE;
        this.id_terceiro = ID_TERCEIRO;
    }

    public Bombona(int ID_BOMBONA, String COD_BARRAS, String STATUS, int ID_CLIENTE, String CAPACIDADE) {
        this.id_bombona = ID_BOMBONA;
        this.cod_barras = COD_BARRAS;
        this.status = STATUS;
        this.id_cliente = ID_CLIENTE;
        this.capacidade = CAPACIDADE;
    }

    public int getID_BOMBONA() {
        return this.id_bombona;
    }

    public String getCOD_BARRAS() {
        return this.cod_barras;
    }

    public int getID_VOLUME() {
        return this.id_volume;
    }

    public String getStatus() {
        return this.status;
    }

    public int getID_Cliente() {
        return this.id_cliente;
    }

    public String getCapacidade() {
        return this.capacidade;
    }

    public int getId_terceiro() {
        return this.id_terceiro;
    }

    public void setID_BOMBONA(int ID_BOMBONA) {
        this.id_bombona = ID_BOMBONA;
    }

    public void setCOD_BARRAS(String COD_BARRAS) {
        this.cod_barras = COD_BARRAS;
    }

    public void setID_VOLUME(int ID_VOLUME) {
        this.id_volume = ID_VOLUME;
    }

    public void setStatus(String STATUS) {
        this.status = STATUS;
    }

    public void setId_cliente(int ID_CLIENTE) {
        this.id_cliente = ID_CLIENTE;
    }

    public void setId_terceiro(Integer ID_TERCEIRO) {
        this.id_terceiro = ID_TERCEIRO.intValue();
    }
}
