package okhttp3;

import java.io.IOException;

/* carregado de: classes17.dex */
public interface Callback {
    void onFailure(Call call, IOException iOException);

    void onResponse(Call call, Response response) throws IOException;
}
