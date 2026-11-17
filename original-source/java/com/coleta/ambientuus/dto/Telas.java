package com.coleta.ambientuus.dto;

/* loaded from: classes14.dex */
public class Telas {
    private final String ALOCAR_BOMBONA;
    private final String CARREGAR_VEICULO;
    private final String COLETAR_BLUETOOTH;
    private final String COLETAR_MANUAL;
    private final String CONSULTAR_BOMBONAS;
    private final String CONSULTAR_COLETAS;
    private final String CONSULTAR_MANIFESTOS;
    private final String DESCARREGAR_VEICULO;
    private final String LIBERAR_BOMBONA;

    public Telas(String carregarVeiculo, String alocarBombona, String coletarBluetooth, String coletarManual, String descarregarVeiculo, String liberarBombona, String consultarBombonas, String consultarColetas, String consultarManifestos) {
        this.CARREGAR_VEICULO = carregarVeiculo;
        this.ALOCAR_BOMBONA = alocarBombona;
        this.COLETAR_BLUETOOTH = coletarBluetooth;
        this.COLETAR_MANUAL = coletarManual;
        this.DESCARREGAR_VEICULO = descarregarVeiculo;
        this.LIBERAR_BOMBONA = liberarBombona;
        this.CONSULTAR_BOMBONAS = consultarBombonas;
        this.CONSULTAR_COLETAS = consultarColetas;
        this.CONSULTAR_MANIFESTOS = consultarManifestos;
    }

    public String getCARREGAR_VEICULO() {
        return this.CARREGAR_VEICULO;
    }

    public String getALOCAR_BOMBONA() {
        return this.ALOCAR_BOMBONA;
    }

    public String getCOLETAR_BLUETOOTH() {
        return this.COLETAR_BLUETOOTH;
    }

    public String getCOLETAR_MANUAL() {
        return this.COLETAR_MANUAL;
    }

    public String getDESCARREGAR_VEICULO() {
        return this.DESCARREGAR_VEICULO;
    }

    public String getLIBERAR_BOMBONA() {
        return this.LIBERAR_BOMBONA;
    }

    public String getCONSULTAR_BOMBONAS() {
        return this.CONSULTAR_BOMBONAS;
    }

    public String getCONSULTAR_COLETAS() {
        return this.CONSULTAR_COLETAS;
    }

    public String getCONSULTAR_MANIFESTOS() {
        return this.CONSULTAR_MANIFESTOS;
    }
}
