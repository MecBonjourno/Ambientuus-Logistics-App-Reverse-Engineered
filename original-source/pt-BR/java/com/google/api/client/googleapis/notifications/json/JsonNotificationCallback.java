package com.google.api.client.googleapis.notifications.json;

import com.google.api.client.googleapis.notifications.TypedNotificationCallback;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonObjectParser;
import java.io.IOException;

/* carregado de: classes16.dex */
public abstract class JsonNotificationCallback<T> extends TypedNotificationCallback<T> {
    private static final long serialVersionUID = 1;

    protected abstract JsonFactory getJsonFactory() throws IOException;

    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // com.google.api.client.googleapis.notifications.TypedNotificationCallback
    public final JsonObjectParser getObjectParser() throws IOException {
        return new JsonObjectParser(getJsonFactory());
    }
}
