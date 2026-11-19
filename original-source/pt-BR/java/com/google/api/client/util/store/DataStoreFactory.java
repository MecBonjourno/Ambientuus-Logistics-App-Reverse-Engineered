package com.google.api.client.util.store;

import java.io.IOException;
import java.io.Serializable;

/* carregado de: classes16.dex */
public interface DataStoreFactory {
    <V extends Serializable> DataStore<V> getDataStore(String str) throws IOException;
}
