package org.chromium.net.apihelpers;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Future;
import org.chromium.net.CronetException;
import org.chromium.net.UrlResponseInfo;
import org.json.JSONObject;

/* carregado de: classes17.dex */
public class UrlRequestCallbacks {
    public static ByteArrayCronetCallback forByteArrayBody(RedirectHandler redirectHandler, CronetRequestCompletionListener<byte[]> listener) {
        return newByteArrayCallback(redirectHandler).addCompletionListener((CronetRequestCompletionListener<? super byte[]>) listener);
    }

    public static CallbackAndResponseFuturePair<byte[], ByteArrayCronetCallback> forByteArrayBody(RedirectHandler redirectHandler) {
        ByteArrayCronetCallback callback = newByteArrayCallback(redirectHandler);
        Future<CronetResponse<byte[]>> future = addResponseFutureListener(callback);
        return new CallbackAndResponseFuturePair<>(future, callback);
    }

    public static StringCronetCallback forStringBody(RedirectHandler redirectHandler, CronetRequestCompletionListener<String> listener) {
        return newStringCallback(redirectHandler).addCompletionListener((CronetRequestCompletionListener<? super String>) listener);
    }

    public static CallbackAndResponseFuturePair<String, StringCronetCallback> forStringBody(RedirectHandler redirectHandler) {
        StringCronetCallback callback = newStringCallback(redirectHandler);
        Future<CronetResponse<String>> future = addResponseFutureListener(callback);
        return new CallbackAndResponseFuturePair<>(future, callback);
    }

    public static JsonCronetCallback forJsonBody(RedirectHandler redirectHandler, CronetRequestCompletionListener<JSONObject> listener) {
        return newJsonCallback(redirectHandler).addCompletionListener((CronetRequestCompletionListener<? super JSONObject>) listener);
    }

    public static CallbackAndResponseFuturePair<JSONObject, JsonCronetCallback> forJsonBody(RedirectHandler redirectHandler) {
        JsonCronetCallback callback = newJsonCallback(redirectHandler);
        Future<CronetResponse<JSONObject>> future = addResponseFutureListener(callback);
        return new CallbackAndResponseFuturePair<>(future, callback);
    }

    private static ByteArrayCronetCallback newByteArrayCallback(final RedirectHandler redirectHandler) {
        return new ByteArrayCronetCallback() { // da classe: org.chromium.net.apihelpers.UrlRequestCallbacks.1
            @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
            protected boolean shouldFollowRedirect(UrlResponseInfo info, String newLocationUrl) throws Exception {
                return RedirectHandler.this.shouldFollowRedirect(info, newLocationUrl);
            }
        };
    }

    private static StringCronetCallback newStringCallback(final RedirectHandler redirectHandler) {
        return new StringCronetCallback() { // da classe: org.chromium.net.apihelpers.UrlRequestCallbacks.2
            @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
            protected boolean shouldFollowRedirect(UrlResponseInfo info, String newLocationUrl) throws Exception {
                return RedirectHandler.this.shouldFollowRedirect(info, newLocationUrl);
            }
        };
    }

    private static JsonCronetCallback newJsonCallback(final RedirectHandler redirectHandler) {
        return new JsonCronetCallback() { // da classe: org.chromium.net.apihelpers.UrlRequestCallbacks.3
            @Override // org.chromium.net.apihelpers.ImplicitFlowControlCallback
            protected boolean shouldFollowRedirect(UrlResponseInfo info, String newLocationUrl) throws Exception {
                return RedirectHandler.this.shouldFollowRedirect(info, newLocationUrl);
            }
        };
    }

    private static <T> Future<CronetResponse<T>> addResponseFutureListener(InMemoryTransformCronetCallback<T> callback) {
        final CompletableFuture<CronetResponse<T>> completableFuture = new CompletableFuture<>();
        callback.addCompletionListener(new CronetRequestCompletionListener<T>() { // da classe: org.chromium.net.apihelpers.UrlRequestCallbacks.4
            @Override // org.chromium.net.apihelpers.CronetRequestCompletionListener
            public void onFailed(UrlResponseInfo info, CronetException exception) {
                completableFuture.completeExceptionally(exception);
            }

            @Override // org.chromium.net.apihelpers.CronetRequestCompletionListener
            public void onCanceled(UrlResponseInfo info) {
                completableFuture.completeExceptionally(new CronetException("The request was canceled!", null) { // da classe: org.chromium.net.apihelpers.UrlRequestCallbacks.4.1
                });
            }

            @Override // org.chromium.net.apihelpers.CronetRequestCompletionListener
            public void onSucceeded(UrlResponseInfo info, T body) {
                completableFuture.complete(new CronetResponse(info, body));
            }
        });
        return completableFuture;
    }

    public static class CallbackAndResponseFuturePair<ResponseBodyT, CallbackT extends InMemoryTransformCronetCallback<ResponseBodyT>> {
        private final CallbackT mCallback;
        private final Future<CronetResponse<ResponseBodyT>> mFuture;

        CallbackAndResponseFuturePair(Future<CronetResponse<ResponseBodyT>> future, CallbackT callback) {
            this.mFuture = future;
            this.mCallback = callback;
        }

        public Future<CronetResponse<ResponseBodyT>> getFuture() {
            return this.mFuture;
        }

        public CallbackT getCallback() {
            return this.mCallback;
        }
    }

    private UrlRequestCallbacks() {
    }
}
