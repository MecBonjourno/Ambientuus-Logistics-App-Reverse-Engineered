package com.google.android.datatransport;

/* carregado de: classes.dex */
public interface Transport<T> {
    void schedule(Event<T> event, TransportScheduleCallback transportScheduleCallback);

    void send(Event<T> event);
}
