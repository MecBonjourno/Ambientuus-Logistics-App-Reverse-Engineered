package j$.sun.nio.cs;

import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import org.apache.commons.lang.CharEncoding;

/* carregado de: classes15.dex */
public class UTF_16 extends Unicode {
    @Override // j$.sun.nio.cs.Unicode, java.nio.charset.Charset
    public /* bridge */ /* sintético */ boolean contains(Charset charset) {
        return super.contains(charset);
    }

    public UTF_16() {
        super(CharEncoding.UTF_16, StandardCharsets.aliases_UTF_16());
    }

    @Override // j$.sun.nio.cs.HistoricallyNamedCharset
    public String historicalName() {
        return CharEncoding.UTF_16;
    }

    @Override // java.nio.charset.Charset
    public CharsetDecoder newDecoder() {
        return new Decoder(this);
    }

    @Override // java.nio.charset.Charset
    public CharsetEncoder newEncoder() {
        return new Encoder(this);
    }

    private static class Decoder extends UnicodeDecoder {
        public Decoder(Charset cs) {
            super(cs, 0);
        }
    }

    private static class Encoder extends UnicodeEncoder {
        public Encoder(Charset cs) {
            super(cs, 0, true);
        }
    }
}
