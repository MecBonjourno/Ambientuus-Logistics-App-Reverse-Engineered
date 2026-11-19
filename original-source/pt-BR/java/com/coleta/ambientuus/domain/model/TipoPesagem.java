package com.coleta.ambientuus.domain.model;

/* carregado de: classes7.dex */
public enum TipoPesagem {
    MANUAL("MANUAL"),
    BLUETOOTH("BLUETOOTH");

    private final String valor;

    TipoPesagem(String valor) {
        this.valor = valor;
    }

    public String getValor() {
        return this.valor;
    }

    public static TipoPesagem fromString(String valor) {
        for (TipoPesagem tipo : values()) {
            if (tipo.getValor().equalsIgnoreCase(valor)) {
                return tipo;
            }
        }
        return null;
    }
}
