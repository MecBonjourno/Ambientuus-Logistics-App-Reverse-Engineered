package okhttp3;

import java.io.IOException;
import javax.annotation.Nullable;
import okhttp3.Authenticator;

/* carregado de: classes17.dex */
public interface Authenticator {
    public static final Authenticator NONE = new Authenticator() { // da classe: okhttp3.Authenticator$$ExternalSyntheticLambda0
        @Override // okhttp3.Authenticator
        public final Request authenticate(Route route, Response response) {
            return Authenticator.CC.lambda$static$0(route, response);
        }
    };

    @Nullable
    Request authenticate(@Nullable Route route, Response response) throws IOException;

    /* renomeado de: okhttp3.Authenticator$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        static {
            Authenticator authenticator = Authenticator.NONE;
        }

        public static /* sintético */ Request lambda$static$0(Route route, Response response) throws IOException {
            return null;
        }
    }
}
