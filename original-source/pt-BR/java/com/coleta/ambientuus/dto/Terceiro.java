package com.coleta.ambientuus.dto;

import j$.util.Objects;

/* carregado de: classes14.dex */
public class Terceiro {
    private String cod_pessoa;
    private String id_pessoa;
    private String razao_social;

    public Terceiro(String id_pessoa, String razao_social) {
        this.id_pessoa = id_pessoa;
        this.razao_social = razao_social;
    }

    public String getId_Pessoa() {
        return this.id_pessoa;
    }

    public void setId_Pessoa(String id_pessoa) {
        this.id_pessoa = id_pessoa;
    }

    public String getCod_Pessoa() {
        return this.cod_pessoa;
    }

    public void setCod_Pessoa(String cod_pessoa) {
        this.cod_pessoa = cod_pessoa;
    }

    public String getRazao_Social() {
        return this.razao_social;
    }

    public void setRazao_Social(String razao_social) {
        this.razao_social = razao_social;
    }

    public String toString() {
        return this.razao_social;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Terceiro that = (Terceiro) o;
        if (Objects.equals(this.id_pessoa, that.id_pessoa) && Objects.equals(this.razao_social, that.razao_social)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(this.id_pessoa, this.razao_social);
    }
}
