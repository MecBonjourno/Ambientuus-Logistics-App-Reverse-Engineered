package com.coleta.ambientuus.dto;

/* loaded from: classes14.dex */
public class Motorista {
    private String id_motorista;
    private String nome;

    public Motorista(String id_motorista, String nome) {
        this.id_motorista = id_motorista;
        this.nome = nome;
    }

    public String getId_motorista() {
        return this.id_motorista;
    }

    public void setId_motorista(String id_motorista) {
        this.id_motorista = id_motorista;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String toString() {
        return this.nome;
    }
}
