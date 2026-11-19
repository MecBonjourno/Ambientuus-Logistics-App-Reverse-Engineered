package com.google.api.client.googleapis.services.json;

import com.google.api.client.googleapis.batch.BatchRequest;
import com.google.api.client.googleapis.batch.json.JsonBatchCallback;
import com.google.api.client.googleapis.json.GoogleJsonErrorContainer;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.googleapis.services.AbstractGoogleClientRequest;
import com.google.api.client.http.HttpHeaders;
import com.google.api.client.http.HttpResponse;
import java.io.IOException;

/* carregado de: classes16.dex */
public abstract class AbstractGoogleJsonClientRequest<T> extends AbstractGoogleClientRequest<T> {
    private final Object jsonContent;

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected AbstractGoogleJsonClientRequest(com.google.api.client.googleapis.services.json.AbstractGoogleJsonClient r8, java.lang.String r9, java.lang.String r10, java.lang.Object r11, java.lang.Class<T> r12) {
        /*
            r7 = this;
            r0 = 0
            if (r11 != 0) goto L5
            r5 = r0
            goto L24
        L5:
            com.google.api.client.http.json.JsonHttpContent r1 = new com.google.api.client.http.json.JsonHttpContent
            com.google.api.client.json.JsonFactory r2 = r8.getJsonFactory()
            r1.<init>(r2, r11)
            com.google.api.client.json.JsonObjectParser r2 = r8.getObjectParser()
            java.util.Set r2 = r2.getWrapperKeys()
            boolean r2 = r2.isEmpty()
            if (r2 == 0) goto L1d
            goto L1f
        L1d:
            java.lang.String r0 = "data"
        L1f:
            com.google.api.client.http.json.JsonHttpContent r0 = r1.setWrapperKey(r0)
            r5 = r0
        L24:
            r1 = r7
            r2 = r8
            r3 = r9
            r4 = r10
            r6 = r12
            r1.<init>(r2, r3, r4, r5, r6)
            r1.jsonContent = r11
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.googleapis.services.json.AbstractGoogleJsonClientRequest.<init>(com.google.api.client.googleapis.services.json.AbstractGoogleJsonClient, java.lang.String, java.lang.String, java.lang.Object, java.lang.Class):void");
    }

    @Override // com.google.api.client.googleapis.services.AbstractGoogleClientRequest
    public AbstractGoogleJsonClient getAbstractGoogleClient() {
        return (AbstractGoogleJsonClient) super.getAbstractGoogleClient();
    }

    @Override // com.google.api.client.googleapis.services.AbstractGoogleClientRequest
    public AbstractGoogleJsonClientRequest<T> setDisableGZipContent(boolean disableGZipContent) {
        return (AbstractGoogleJsonClientRequest) super.setDisableGZipContent(disableGZipContent);
    }

    @Override // com.google.api.client.googleapis.services.AbstractGoogleClientRequest
    public AbstractGoogleJsonClientRequest<T> setRequestHeaders(HttpHeaders headers) {
        return (AbstractGoogleJsonClientRequest) super.setRequestHeaders(headers);
    }

    public final void queue(BatchRequest batchRequest, JsonBatchCallback<T> callback) throws IOException {
        super.queue(batchRequest, GoogleJsonErrorContainer.class, callback);
    }

    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // com.google.api.client.googleapis.services.AbstractGoogleClientRequest
    public GoogleJsonResponseException newExceptionOnError(HttpResponse response) {
        return GoogleJsonResponseException.from(getAbstractGoogleClient().getJsonFactory(), response);
    }

    public Object getJsonContent() {
        return this.jsonContent;
    }

    @Override // com.google.api.client.googleapis.services.AbstractGoogleClientRequest, com.google.api.client.util.GenericData
    public AbstractGoogleJsonClientRequest<T> set(String fieldName, Object value) {
        return (AbstractGoogleJsonClientRequest) super.set(fieldName, value);
    }
}
