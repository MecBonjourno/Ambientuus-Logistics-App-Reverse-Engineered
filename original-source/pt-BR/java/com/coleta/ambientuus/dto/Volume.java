package com.coleta.ambientuus.dto;

import j$.util.Objects;

/* carregado de: classes14.dex */
public class Volume {
    private String descricao;
    private String id_volume;
    private Float tara;

    public Volume(String id_volume, String descricao, Float peso_liquido) {
        this.id_volume = id_volume;
        this.descricao = descricao;
        this.tara = peso_liquido;
    }

    public String getId_volume() {
        return this.id_volume;
    }

    public void setId_volume(String id_volume) {
        this.id_volume = id_volume;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Float getTara() {
        return this.tara;
    }

    public void setTara(Float peso_liquido) {
        this.tara = peso_liquido;
    }

    public String toString() {
        return this.descricao;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Volume volume = (Volume) o;
        if (Objects.equals(this.id_volume, volume.id_volume) && Objects.equals(this.descricao, volume.descricao) && Objects.equals(this.tara, volume.tara)) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        return Objects.hash(this.id_volume, this.descricao, this.tara);
    }
}
