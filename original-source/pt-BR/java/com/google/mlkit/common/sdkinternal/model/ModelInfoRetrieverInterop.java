package com.google.mlkit.common.sdkinternal.model;

import com.google.mlkit.common.MlKitException;
import com.google.mlkit.common.model.RemoteModel;
import com.google.mlkit.common.sdkinternal.ModelInfo;

/* compiled from: com.google.mlkit:common@@18.11.0 */
/* carregado de: classes16.dex */
public interface ModelInfoRetrieverInterop {
    ModelInfo retrieveRemoteModelInfo(RemoteModel remoteModel) throws MlKitException;
}
