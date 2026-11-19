package com.google.common.eventbus;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public interface SubscriberExceptionHandler {
    void handleException(Throwable th, SubscriberExceptionContext subscriberExceptionContext);
}
