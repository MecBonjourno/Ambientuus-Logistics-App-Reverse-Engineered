package retrofit2;

import java.io.IOException;
import okhttp3.Request;
import okio.Timeout;

/* carregado de: classes17.dex */
public interface Call<T> extends Cloneable {
    void cancel();

    /* renomeado de: clone */
    Call<T> mo2741clone();

    void enqueue(Callback<T> callback);

    Response<T> execute() throws IOException;

    boolean isCanceled();

    boolean isExecuted();

    Request request();

    Timeout timeout();
}
