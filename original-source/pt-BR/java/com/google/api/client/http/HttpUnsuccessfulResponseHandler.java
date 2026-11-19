package com.google.api.client.http;

import java.io.IOException;

/* carregado de: classes16.dex */
public interface HttpUnsuccessfulResponseHandler {
    boolean handleResponse(HttpRequest httpRequest, HttpResponse httpResponse, boolean z) throws IOException;
}
