package okhttp3.internal.connection;

import com.google.api.client.http.HttpMethods;
import java.io.IOException;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.internal.http.RealInterceptorChain;

/* carregado de: classes17.dex */
public final class ConnectInterceptor implements Interceptor {
    public final OkHttpClient client;

    public ConnectInterceptor(OkHttpClient client) {
        this.client = client;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws IOException {
        RealInterceptorChain realChain = (RealInterceptorChain) chain;
        Request request = realChain.request();
        Transmitter transmitter = realChain.transmitter();
        boolean doExtensiveHealthChecks = !request.method().equals(HttpMethods.GET);
        Exchange exchange = transmitter.newExchange(chain, doExtensiveHealthChecks);
        return realChain.proceed(request, transmitter, exchange);
    }
}
