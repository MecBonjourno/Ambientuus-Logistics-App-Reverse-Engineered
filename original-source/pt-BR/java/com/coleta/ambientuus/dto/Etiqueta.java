package com.coleta.ambientuus.dto;

/* carregado de: classes14.dex */
public class Etiqueta {
    private String cod_etiqueta;
    private Integer id_etiqueta;
    private Integer id_manifesto;
    private String status;

    public Etiqueta(Integer idEtiqueta, String codEtiqueta, Integer idManifesto, String status) {
        this.id_etiqueta = idEtiqueta;
        this.cod_etiqueta = codEtiqueta;
        this.id_manifesto = idManifesto;
        this.status = status;
    }

    public Integer getId_etiqueta() {
        return this.id_etiqueta;
    }

    public String getCod_etiqueta() {
        return this.cod_etiqueta;
    }

    public Integer getId_manifesto() {
        return this.id_manifesto;
    }

    public String getStatus() {
        return this.status;
    }
}
