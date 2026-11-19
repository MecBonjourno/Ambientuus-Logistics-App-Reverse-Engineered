package com.coleta.ambientuus.dto;

/* carregado de: classes14.dex */
public class Manifesto {
    private String data_coleta;
    private String gerador;
    private Integer id_manifesto;
    private Integer id_pessoa;
    private Integer id_rota;
    private String numero_manifesto;

    public Manifesto(Integer id_manifesto, String numero_manifesto, String data_coleta, String gerador, Integer id_rota, Integer id_pessoa) {
        this.id_manifesto = id_manifesto;
        this.numero_manifesto = numero_manifesto;
        this.data_coleta = data_coleta;
        this.gerador = gerador;
        this.id_rota = id_rota;
        this.id_pessoa = id_pessoa;
    }

    public Integer getId_manifesto() {
        return this.id_manifesto;
    }

    public String getNumero_manifesto() {
        return this.numero_manifesto;
    }

    public String getData_coleta() {
        return this.data_coleta;
    }

    public String getGerador() {
        return this.gerador;
    }

    public Integer getId_rota() {
        return this.id_rota;
    }

    public Integer getId_pessoa() {
        return this.id_pessoa;
    }

    public boolean contemTexto(String texto) {
        String texto2 = texto.toLowerCase();
        return this.id_manifesto.toString().toLowerCase().contains(texto2) || this.numero_manifesto.toLowerCase().contains(texto2) || this.data_coleta.toLowerCase().contains(texto2) || this.gerador.toLowerCase().contains(texto2) || this.id_rota.toString().toLowerCase().contains(texto2);
    }
}
