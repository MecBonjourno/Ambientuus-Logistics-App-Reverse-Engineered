package com.google.firebase.encoders.json;

import com.google.firebase.encoders.DataEncoder;
import com.google.firebase.encoders.EncodingException;
import com.google.firebase.encoders.ObjectEncoder;
import com.google.firebase.encoders.ObjectEncoderContext;
import com.google.firebase.encoders.ValueEncoder;
import com.google.firebase.encoders.ValueEncoderContext;
import com.google.firebase.encoders.config.Configurator;
import com.google.firebase.encoders.config.EncoderConfig;
import j$.util.DesugarTimeZone;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* carregado de: classes16.dex */
public final class JsonDataEncoderBuilder implements EncoderConfig<JsonDataEncoderBuilder> {
    private static final ValueEncoder<Boolean> BOOLEAN_ENCODER;
    private static final ObjectEncoder<Object> DEFAULT_FALLBACK_ENCODER;
    private static final ValueEncoder<String> STRING_ENCODER;
    private static final TimestampEncoder TIMESTAMP_ENCODER;
    private final Map<Class<?>, ObjectEncoder<?>> objectEncoders = new HashMap();
    private final Map<Class<?>, ValueEncoder<?>> valueEncoders = new HashMap();
    private ObjectEncoder<Object> fallbackEncoder = DEFAULT_FALLBACK_ENCODER;
    private boolean ignoreNullValues = false;

    static {
        ObjectEncoder<Object> objectEncoder;
        ValueEncoder<Boolean> valueEncoder;
        objectEncoder = JsonDataEncoderBuilder$$Lambda$1.instance;
        DEFAULT_FALLBACK_ENCODER = objectEncoder;
        STRING_ENCODER = JsonDataEncoderBuilder$$Lambda$4.instance;
        valueEncoder = JsonDataEncoderBuilder$$Lambda$5.instance;
        BOOLEAN_ENCODER = valueEncoder;
        TIMESTAMP_ENCODER = new TimestampEncoder();
    }

    static /* sintético */ void lambda$static$0(Object o, ObjectEncoderContext ctx) throws IOException {
        throw new EncodingException("Couldn't find encoder for type " + o.getClass().getCanonicalName());
    }

    private static final class TimestampEncoder implements ValueEncoder<Date> {
        private static final DateFormat rfc339 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);

        private TimestampEncoder() {
        }

        static {
            rfc339.setTimeZone(DesugarTimeZone.getTimeZone("UTC"));
        }

        @Override // com.google.firebase.encoders.Encoder
        public void encode(Date o, ValueEncoderContext ctx) throws IOException {
            ctx.add(rfc339.format(o));
        }
    }

    static /* sintético */ void lambda$static$2(Boolean o, ValueEncoderContext ctx) throws IOException {
        ctx.add(o.booleanValue());
    }

    public JsonDataEncoderBuilder() {
        registerEncoder(String.class, (ValueEncoder) STRING_ENCODER);
        registerEncoder(Boolean.class, (ValueEncoder) BOOLEAN_ENCODER);
        registerEncoder(Date.class, (ValueEncoder) TIMESTAMP_ENCODER);
    }

    @Override // com.google.firebase.encoders.config.EncoderConfig
    public <T> JsonDataEncoderBuilder registerEncoder(Class<T> clazz, ObjectEncoder<? super T> objectEncoder) {
        this.objectEncoders.put(clazz, objectEncoder);
        this.valueEncoders.remove(clazz);
        return this;
    }

    @Override // com.google.firebase.encoders.config.EncoderConfig
    public <T> JsonDataEncoderBuilder registerEncoder(Class<T> clazz, ValueEncoder<? super T> encoder) {
        this.valueEncoders.put(clazz, encoder);
        this.objectEncoders.remove(clazz);
        return this;
    }

    public JsonDataEncoderBuilder registerFallbackEncoder(ObjectEncoder<Object> fallbackEncoder) {
        this.fallbackEncoder = fallbackEncoder;
        return this;
    }

    public JsonDataEncoderBuilder configureWith(Configurator config) {
        config.configure(this);
        return this;
    }

    public JsonDataEncoderBuilder ignoreNullValues(boolean ignore) {
        this.ignoreNullValues = ignore;
        return this;
    }

    public DataEncoder build() {
        return new DataEncoder() { // da classe: com.google.firebase.encoders.json.JsonDataEncoderBuilder.1
            @Override // com.google.firebase.encoders.DataEncoder
            public void encode(Object o, Writer writer) throws IOException {
                JsonValueObjectEncoderContext encoderContext = new JsonValueObjectEncoderContext(writer, JsonDataEncoderBuilder.this.objectEncoders, JsonDataEncoderBuilder.this.valueEncoders, JsonDataEncoderBuilder.this.fallbackEncoder, JsonDataEncoderBuilder.this.ignoreNullValues);
                encoderContext.add(o, false);
                encoderContext.close();
            }

            @Override // com.google.firebase.encoders.DataEncoder
            public String encode(Object o) {
                StringWriter stringWriter = new StringWriter();
                try {
                    encode(o, stringWriter);
                } catch (IOException e) {
                }
                return stringWriter.toString();
            }
        };
    }
}
