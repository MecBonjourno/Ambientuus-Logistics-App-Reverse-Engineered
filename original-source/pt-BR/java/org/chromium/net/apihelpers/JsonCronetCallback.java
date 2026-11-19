package org.chromium.net.apihelpers;

import org.chromium.net.UrlResponseInfo;
import org.json.JSONException;
import org.json.JSONObject;

/* carregado de: classes17.dex */
public abstract class JsonCronetCallback extends InMemoryTransformCronetCallback<JSONObject> {
    private static final StringCronetCallback STRING_CALLBACK = new StringCronetCallback() { // da classe: org.chromium.net.apihelpers.JsonCronetCallback.1
        @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
        protected boolean shouldFollowRedirect(UrlResponseInfo info, String newLocationUrl) {
            throw new UnsupportedOperationException();
        }
    };

    @Override // org.chromium.net.apihelpers.InMemoryTransformCronetCallback
    public JsonCronetCallback addCompletionListener(CronetRequestCompletionListener<? super JSONObject> listener) {
        super.addCompletionListener((CronetRequestCompletionListener) listener);
        return this;
    }

    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // org.chromium.net.apihelpers.InMemoryTransformCronetCallback
    public JSONObject transformBodyBytes(UrlResponseInfo info, byte[] bodyBytes) {
        String bodyString = STRING_CALLBACK.transformBodyBytes(info, bodyBytes);
        try {
            return new JSONObject(bodyString);
        } catch (JSONException e) {
            throw new IllegalArgumentException("Cannot parse the string as JSON!", e);
        }
    }
}
