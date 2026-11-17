package com.coleta.ambientuus.ws;

import java.util.concurrent.TimeUnit;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/* loaded from: classes4.dex */
public class RetrofitClient {
    private static final String BASE_URL = "http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/";
    private static Retrofit retrofit = null;

    public static Retrofit getClient() {
        if (retrofit == null) {
            OkHttpClient client = new OkHttpClient.Builder().connectTimeout(30L, TimeUnit.SECONDS).readTimeout(90L, TimeUnit.SECONDS).writeTimeout(60L, TimeUnit.SECONDS).build();
            retrofit = new Retrofit.Builder().baseUrl("http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/").client(client).addConverterFactory(GsonConverterFactory.create()).build();
        }
        return retrofit;
    }
}
