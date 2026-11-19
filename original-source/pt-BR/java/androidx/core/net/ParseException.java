package androidx.core.net;

/* carregado de: classes.dex */
public class ParseException extends RuntimeException {
    public final String response;

    ParseException(String response) {
        super(response);
        this.response = response;
    }
}
