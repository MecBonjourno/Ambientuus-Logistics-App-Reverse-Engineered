package com.coleta.ambientuus.utils;

import com.coleta.ambientuus.dto.list.BombonaClienteList;

/* carregado de: classes5.dex */
public interface ConsultaEtiquetaCallback {
    void onErro(Throwable th);

    void onSucesso(BombonaClienteList bombonaClienteList);
}
