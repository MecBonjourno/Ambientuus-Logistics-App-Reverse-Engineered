package com.google.api.client.googleapis.json;

import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.HttpResponseException;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.Preconditions;
import java.io.IOException;

/* loaded from: classes16.dex */
public class GoogleJsonResponseException extends HttpResponseException {
    private static final long serialVersionUID = 409811126989994864L;
    private final transient GoogleJsonError details;

    public GoogleJsonResponseException(HttpResponseException.Builder builder, GoogleJsonError details) {
        super(builder);
        this.details = details;
    }

    public final GoogleJsonError getDetails() {
        return this.details;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x008a, code lost:
    
        if (r1 == null) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x007d, code lost:
    
        r3.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x007b, code lost:
    
        if (r1 == null) goto L29;
     */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00af  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static com.google.api.client.googleapis.json.GoogleJsonResponseException from(com.google.api.client.json.JsonFactory r7, com.google.api.client.http.HttpResponse r8) {
        /*
            com.google.api.client.http.HttpResponseException$Builder r0 = new com.google.api.client.http.HttpResponseException$Builder
            int r1 = r8.getStatusCode()
            java.lang.String r2 = r8.getStatusMessage()
            com.google.api.client.http.HttpHeaders r3 = r8.getHeaders()
            r0.<init>(r1, r2, r3)
            com.google.api.client.util.Preconditions.checkNotNull(r7)
            r1 = 0
            r2 = 0
            boolean r3 = r8.isSuccessStatusCode()     // Catch: java.io.IOException -> La1
            if (r3 != 0) goto L9b
            java.lang.String r3 = "application/json; charset=UTF-8"
            java.lang.String r4 = r8.getContentType()     // Catch: java.io.IOException -> La1
            boolean r3 = com.google.api.client.http.HttpMediaType.equalsIgnoreParameters(r3, r4)     // Catch: java.io.IOException -> La1
            if (r3 == 0) goto L9b
            java.io.InputStream r3 = r8.getContent()     // Catch: java.io.IOException -> La1
            if (r3 == 0) goto L9b
            r3 = 0
            java.io.InputStream r4 = r8.getContent()     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            com.google.api.client.json.JsonParser r4 = r7.createJsonParser(r4)     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            r3 = r4
            com.google.api.client.json.JsonToken r4 = r3.getCurrentToken()     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            if (r4 != 0) goto L43
            com.google.api.client.json.JsonToken r5 = r3.nextToken()     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            r4 = r5
        L43:
            if (r4 == 0) goto L75
            java.lang.String r5 = "error"
            r3.skipToKey(r5)     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            com.google.api.client.json.JsonToken r5 = r3.getCurrentToken()     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            com.google.api.client.json.JsonToken r6 = com.google.api.client.json.JsonToken.VALUE_STRING     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            if (r5 != r6) goto L58
            java.lang.String r5 = r3.getText()     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            r2 = r5
            goto L75
        L58:
            com.google.api.client.json.JsonToken r5 = r3.getCurrentToken()     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            com.google.api.client.json.JsonToken r6 = com.google.api.client.json.JsonToken.START_OBJECT     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            if (r5 != r6) goto L75
            java.lang.Class<com.google.api.client.googleapis.json.GoogleJsonError> r5 = com.google.api.client.googleapis.json.GoogleJsonError.class
            java.lang.Object r5 = r3.parseAndClose(r5)     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            com.google.api.client.googleapis.json.GoogleJsonError r5 = (com.google.api.client.googleapis.json.GoogleJsonError) r5     // Catch: java.lang.Throwable -> L81 java.io.IOException -> L83
            java.lang.String r1 = r5.toPrettyString()     // Catch: java.lang.Throwable -> L6f java.io.IOException -> L72
            r2 = r1
            r1 = r5
            goto L75
        L6f:
            r4 = move-exception
            r1 = r5
            goto L8e
        L72:
            r4 = move-exception
            r1 = r5
            goto L84
        L75:
            if (r3 != 0) goto L7b
        L77:
            r8.ignore()     // Catch: java.io.IOException -> La1
            goto L8d
        L7b:
            if (r1 != 0) goto L8d
        L7d:
            r3.close()     // Catch: java.io.IOException -> La1
            goto L8d
        L81:
            r4 = move-exception
            goto L8e
        L83:
            r4 = move-exception
        L84:
            r4.printStackTrace()     // Catch: java.lang.Throwable -> L81
            if (r3 != 0) goto L8a
            goto L77
        L8a:
            if (r1 != 0) goto L8d
            goto L7d
        L8d:
            goto La0
        L8e:
            if (r3 == 0) goto L96
            if (r1 != 0) goto L99
            r3.close()     // Catch: java.io.IOException -> La1
            goto L99
        L96:
            r8.ignore()     // Catch: java.io.IOException -> La1
        L99:
            throw r4     // Catch: java.io.IOException -> La1
        L9b:
            java.lang.String r3 = r8.parseAsString()     // Catch: java.io.IOException -> La1
            r2 = r3
        La0:
            goto La5
        La1:
            r3 = move-exception
            r3.printStackTrace()
        La5:
            java.lang.StringBuilder r3 = com.google.api.client.http.HttpResponseException.computeMessageBuffer(r8)
            boolean r4 = com.google.api.client.util.Strings.isNullOrEmpty(r2)
            if (r4 != 0) goto Lbb
            java.lang.String r4 = com.google.api.client.util.StringUtils.LINE_SEPARATOR
            java.lang.StringBuilder r4 = r3.append(r4)
            r4.append(r2)
            r0.setContent(r2)
        Lbb:
            java.lang.String r4 = r3.toString()
            r0.setMessage(r4)
            com.google.api.client.googleapis.json.GoogleJsonResponseException r4 = new com.google.api.client.googleapis.json.GoogleJsonResponseException
            r4.<init>(r0, r1)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.api.client.googleapis.json.GoogleJsonResponseException.from(com.google.api.client.json.JsonFactory, com.google.api.client.http.HttpResponse):com.google.api.client.googleapis.json.GoogleJsonResponseException");
    }

    public static HttpResponse execute(JsonFactory jsonFactory, HttpRequest request) throws GoogleJsonResponseException, IOException {
        Preconditions.checkNotNull(jsonFactory);
        boolean originalThrowExceptionOnExecuteError = request.getThrowExceptionOnExecuteError();
        if (originalThrowExceptionOnExecuteError) {
            request.setThrowExceptionOnExecuteError(false);
        }
        HttpResponse response = request.execute();
        request.setThrowExceptionOnExecuteError(originalThrowExceptionOnExecuteError);
        if (!originalThrowExceptionOnExecuteError || response.isSuccessStatusCode()) {
            return response;
        }
        throw from(jsonFactory, response);
    }
}
