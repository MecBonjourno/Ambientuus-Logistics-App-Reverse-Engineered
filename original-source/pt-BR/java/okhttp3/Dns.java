package okhttp3;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.List;
import okhttp3.Dns;

/* carregado de: classes17.dex */
public interface Dns {
    public static final Dns SYSTEM = new Dns() { // da classe: okhttp3.Dns$$ExternalSyntheticLambda0
        @Override // okhttp3.Dns
        public final List lookup(String str) {
            return Dns.CC.lambda$static$0(str);
        }
    };

    List<InetAddress> lookup(String str) throws UnknownHostException;

    /* renomeado de: okhttp3.Dns$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        static {
            Dns dns = Dns.SYSTEM;
        }

        public static /* sintético */ List lambda$static$0(String hostname) throws UnknownHostException {
            if (hostname == null) {
                throw new UnknownHostException("hostname == null");
            }
            try {
                return Arrays.asList(InetAddress.getAllByName(hostname));
            } catch (NullPointerException e) {
                UnknownHostException unknownHostException = new UnknownHostException("Broken system behaviour for dns lookup of " + hostname);
                unknownHostException.initCause(e);
                throw unknownHostException;
            }
        }
    }
}
