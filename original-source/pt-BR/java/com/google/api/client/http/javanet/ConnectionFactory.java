package com.google.api.client.http.javanet;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

/* carregado de: classes16.dex */
public interface ConnectionFactory {
    HttpURLConnection openConnection(URL url) throws IOException, ClassCastException;
}
