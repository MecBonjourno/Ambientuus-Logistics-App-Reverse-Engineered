package org.chromium.net.httpflags;

import com.google.protobuf.ByteString;
import com.google.protobuf.CodedInputStream;
import com.google.protobuf.ExtensionRegistryLite;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.MapEntryLite;
import com.google.protobuf.MapFieldLite;
import com.google.protobuf.Parser;
import com.google.protobuf.WireFormat;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Map;

/* loaded from: classes17.dex */
public final class Flags extends GeneratedMessageLite<Flags, Builder> implements FlagsOrBuilder {
    private static final Flags DEFAULT_INSTANCE;
    public static final int FLAGS_FIELD_NUMBER = 1;
    private static volatile Parser<Flags> PARSER;
    private MapFieldLite<String, FlagValue> flags_ = MapFieldLite.emptyMapField();

    private Flags() {
    }

    private static final class FlagsDefaultEntryHolder {
        static final MapEntryLite<String, FlagValue> defaultEntry = MapEntryLite.newDefaultInstance(WireFormat.FieldType.STRING, "", WireFormat.FieldType.MESSAGE, FlagValue.getDefaultInstance());

        private FlagsDefaultEntryHolder() {
        }
    }

    private MapFieldLite<String, FlagValue> internalGetFlags() {
        return this.flags_;
    }

    private MapFieldLite<String, FlagValue> internalGetMutableFlags() {
        if (!this.flags_.isMutable()) {
            this.flags_ = this.flags_.mutableCopy();
        }
        return this.flags_;
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public int getFlagsCount() {
        return internalGetFlags().size();
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public boolean containsFlags(String key) {
        key.getClass();
        return internalGetFlags().containsKey(key);
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    @Deprecated
    public Map<String, FlagValue> getFlags() {
        return getFlagsMap();
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public Map<String, FlagValue> getFlagsMap() {
        return DesugarCollections.unmodifiableMap(internalGetFlags());
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public FlagValue getFlagsOrDefault(String key, FlagValue defaultValue) {
        key.getClass();
        Map<String, FlagValue> map = internalGetFlags();
        return map.containsKey(key) ? map.get(key) : defaultValue;
    }

    @Override // org.chromium.net.httpflags.FlagsOrBuilder
    public FlagValue getFlagsOrThrow(String key) {
        key.getClass();
        Map<String, FlagValue> map = internalGetFlags();
        if (!map.containsKey(key)) {
            throw new IllegalArgumentException();
        }
        return map.get(key);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Map<String, FlagValue> getMutableFlagsMap() {
        return internalGetMutableFlags();
    }

    public static Flags parseFrom(ByteBuffer data) throws InvalidProtocolBufferException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
    }

    public static Flags parseFrom(ByteBuffer data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
    }

    public static Flags parseFrom(ByteString data) throws InvalidProtocolBufferException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
    }

    public static Flags parseFrom(ByteString data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
    }

    public static Flags parseFrom(byte[] data) throws InvalidProtocolBufferException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
    }

    public static Flags parseFrom(byte[] data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
    }

    public static Flags parseFrom(InputStream input) throws IOException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input);
    }

    public static Flags parseFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input, extensionRegistry);
    }

    public static Flags parseDelimitedFrom(InputStream input) throws IOException {
        return (Flags) parseDelimitedFrom(DEFAULT_INSTANCE, input);
    }

    public static Flags parseDelimitedFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
        return (Flags) parseDelimitedFrom(DEFAULT_INSTANCE, input, extensionRegistry);
    }

    public static Flags parseFrom(CodedInputStream input) throws IOException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input);
    }

    public static Flags parseFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
        return (Flags) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input, extensionRegistry);
    }

    public static Builder newBuilder() {
        return DEFAULT_INSTANCE.createBuilder();
    }

    public static Builder newBuilder(Flags prototype) {
        return DEFAULT_INSTANCE.createBuilder(prototype);
    }

    public static final class Builder extends GeneratedMessageLite.Builder<Flags, Builder> implements FlagsOrBuilder {
        private Builder() {
            super(Flags.DEFAULT_INSTANCE);
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public int getFlagsCount() {
            return ((Flags) this.instance).getFlagsMap().size();
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public boolean containsFlags(String key) {
            key.getClass();
            return ((Flags) this.instance).getFlagsMap().containsKey(key);
        }

        public Builder clearFlags() {
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().clear();
            return this;
        }

        public Builder removeFlags(String key) {
            key.getClass();
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().remove(key);
            return this;
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        @Deprecated
        public Map<String, FlagValue> getFlags() {
            return getFlagsMap();
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public Map<String, FlagValue> getFlagsMap() {
            return DesugarCollections.unmodifiableMap(((Flags) this.instance).getFlagsMap());
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public FlagValue getFlagsOrDefault(String key, FlagValue defaultValue) {
            key.getClass();
            Map<String, FlagValue> map = ((Flags) this.instance).getFlagsMap();
            return map.containsKey(key) ? map.get(key) : defaultValue;
        }

        @Override // org.chromium.net.httpflags.FlagsOrBuilder
        public FlagValue getFlagsOrThrow(String key) {
            key.getClass();
            Map<String, FlagValue> map = ((Flags) this.instance).getFlagsMap();
            if (!map.containsKey(key)) {
                throw new IllegalArgumentException();
            }
            return map.get(key);
        }

        public Builder putFlags(String key, FlagValue value) {
            key.getClass();
            value.getClass();
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().put(key, value);
            return this;
        }

        public Builder putAllFlags(Map<String, FlagValue> values) {
            copyOnWrite();
            ((Flags) this.instance).getMutableFlagsMap().putAll(values);
            return this;
        }
    }

    @Override // com.google.protobuf.GeneratedMessageLite
    protected final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke method, Object arg0, Object arg1) {
        switch (method) {
            case NEW_MUTABLE_INSTANCE:
                return new Flags();
            case NEW_BUILDER:
                return new Builder();
            case BUILD_MESSAGE_INFO:
                Object[] objects = {"flags_", FlagsDefaultEntryHolder.defaultEntry};
                return newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", objects);
            case GET_DEFAULT_INSTANCE:
                return DEFAULT_INSTANCE;
            case GET_PARSER:
                Parser<Flags> parser = PARSER;
                if (parser == null) {
                    synchronized (Flags.class) {
                        parser = PARSER;
                        if (parser == null) {
                            parser = new GeneratedMessageLite.DefaultInstanceBasedParser(DEFAULT_INSTANCE);
                            PARSER = parser;
                        }
                    }
                }
                return parser;
            case GET_MEMOIZED_IS_INITIALIZED:
                return (byte) 1;
            case SET_MEMOIZED_IS_INITIALIZED:
                return null;
            default:
                throw new UnsupportedOperationException();
        }
    }

    static {
        Flags defaultInstance = new Flags();
        DEFAULT_INSTANCE = defaultInstance;
        GeneratedMessageLite.registerDefaultInstance(Flags.class, defaultInstance);
    }

    public static Flags getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static Parser<Flags> parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }
}
