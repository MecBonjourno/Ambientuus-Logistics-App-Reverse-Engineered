package org.chromium.net.httpflags;

import com.google.protobuf.ByteString;
import com.google.protobuf.CodedInputStream;
import com.google.protobuf.ExtensionRegistryLite;
import com.google.protobuf.GeneratedMessageLite;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.MapEntryLite;
import com.google.protobuf.MapFieldLite;
import com.google.protobuf.MessageLiteOrBuilder;
import com.google.protobuf.Parser;
import com.google.protobuf.WireFormat;
import j$.util.DesugarCollections;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Map;

/* loaded from: classes17.dex */
public final class BaseFeatureOverrides extends GeneratedMessageLite<BaseFeatureOverrides, Builder> implements BaseFeatureOverridesOrBuilder {
    private static final BaseFeatureOverrides DEFAULT_INSTANCE;
    public static final int FEATURE_STATES_FIELD_NUMBER = 1;
    private static volatile Parser<BaseFeatureOverrides> PARSER;
    private MapFieldLite<String, FeatureState> featureStates_ = MapFieldLite.emptyMapField();

    public interface FeatureStateOrBuilder extends MessageLiteOrBuilder {
        boolean containsParams(String str);

        boolean getEnabled();

        @Deprecated
        Map<String, ByteString> getParams();

        int getParamsCount();

        Map<String, ByteString> getParamsMap();

        ByteString getParamsOrDefault(String str, ByteString byteString);

        ByteString getParamsOrThrow(String str);

        boolean hasEnabled();
    }

    private BaseFeatureOverrides() {
    }

    public static final class FeatureState extends GeneratedMessageLite<FeatureState, Builder> implements FeatureStateOrBuilder {
        private static final FeatureState DEFAULT_INSTANCE;
        public static final int ENABLED_FIELD_NUMBER = 1;
        public static final int PARAMS_FIELD_NUMBER = 2;
        private static volatile Parser<FeatureState> PARSER;
        private int bitField0_;
        private boolean enabled_;
        private MapFieldLite<String, ByteString> params_ = MapFieldLite.emptyMapField();

        private FeatureState() {
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public boolean hasEnabled() {
            return (this.bitField0_ & 1) != 0;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public boolean getEnabled() {
            return this.enabled_;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setEnabled(boolean value) {
            this.bitField0_ |= 1;
            this.enabled_ = value;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearEnabled() {
            this.bitField0_ &= -2;
            this.enabled_ = false;
        }

        private static final class ParamsDefaultEntryHolder {
            static final MapEntryLite<String, ByteString> defaultEntry = MapEntryLite.newDefaultInstance(WireFormat.FieldType.STRING, "", WireFormat.FieldType.BYTES, ByteString.EMPTY);

            private ParamsDefaultEntryHolder() {
            }
        }

        private MapFieldLite<String, ByteString> internalGetParams() {
            return this.params_;
        }

        private MapFieldLite<String, ByteString> internalGetMutableParams() {
            if (!this.params_.isMutable()) {
                this.params_ = this.params_.mutableCopy();
            }
            return this.params_;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public int getParamsCount() {
            return internalGetParams().size();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public boolean containsParams(String key) {
            key.getClass();
            return internalGetParams().containsKey(key);
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        @Deprecated
        public Map<String, ByteString> getParams() {
            return getParamsMap();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public Map<String, ByteString> getParamsMap() {
            return DesugarCollections.unmodifiableMap(internalGetParams());
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public ByteString getParamsOrDefault(String key, ByteString defaultValue) {
            key.getClass();
            Map<String, ByteString> map = internalGetParams();
            return map.containsKey(key) ? map.get(key) : defaultValue;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
        public ByteString getParamsOrThrow(String key) {
            key.getClass();
            Map<String, ByteString> map = internalGetParams();
            if (!map.containsKey(key)) {
                throw new IllegalArgumentException();
            }
            return map.get(key);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Map<String, ByteString> getMutableParamsMap() {
            return internalGetMutableParams();
        }

        public static FeatureState parseFrom(ByteBuffer data) throws InvalidProtocolBufferException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
        }

        public static FeatureState parseFrom(ByteBuffer data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
        }

        public static FeatureState parseFrom(ByteString data) throws InvalidProtocolBufferException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
        }

        public static FeatureState parseFrom(ByteString data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
        }

        public static FeatureState parseFrom(byte[] data) throws InvalidProtocolBufferException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
        }

        public static FeatureState parseFrom(byte[] data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
        }

        public static FeatureState parseFrom(InputStream input) throws IOException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input);
        }

        public static FeatureState parseFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input, extensionRegistry);
        }

        public static FeatureState parseDelimitedFrom(InputStream input) throws IOException {
            return (FeatureState) parseDelimitedFrom(DEFAULT_INSTANCE, input);
        }

        public static FeatureState parseDelimitedFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            return (FeatureState) parseDelimitedFrom(DEFAULT_INSTANCE, input, extensionRegistry);
        }

        public static FeatureState parseFrom(CodedInputStream input) throws IOException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input);
        }

        public static FeatureState parseFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
            return (FeatureState) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input, extensionRegistry);
        }

        public static Builder newBuilder() {
            return DEFAULT_INSTANCE.createBuilder();
        }

        public static Builder newBuilder(FeatureState prototype) {
            return DEFAULT_INSTANCE.createBuilder(prototype);
        }

        public static final class Builder extends GeneratedMessageLite.Builder<FeatureState, Builder> implements FeatureStateOrBuilder {
            private Builder() {
                super(FeatureState.DEFAULT_INSTANCE);
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public boolean hasEnabled() {
                return ((FeatureState) this.instance).hasEnabled();
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public boolean getEnabled() {
                return ((FeatureState) this.instance).getEnabled();
            }

            public Builder setEnabled(boolean value) {
                copyOnWrite();
                ((FeatureState) this.instance).setEnabled(value);
                return this;
            }

            public Builder clearEnabled() {
                copyOnWrite();
                ((FeatureState) this.instance).clearEnabled();
                return this;
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public int getParamsCount() {
                return ((FeatureState) this.instance).getParamsMap().size();
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public boolean containsParams(String key) {
                key.getClass();
                return ((FeatureState) this.instance).getParamsMap().containsKey(key);
            }

            public Builder clearParams() {
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().clear();
                return this;
            }

            public Builder removeParams(String key) {
                key.getClass();
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().remove(key);
                return this;
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            @Deprecated
            public Map<String, ByteString> getParams() {
                return getParamsMap();
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public Map<String, ByteString> getParamsMap() {
                return DesugarCollections.unmodifiableMap(((FeatureState) this.instance).getParamsMap());
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public ByteString getParamsOrDefault(String key, ByteString defaultValue) {
                key.getClass();
                Map<String, ByteString> map = ((FeatureState) this.instance).getParamsMap();
                return map.containsKey(key) ? map.get(key) : defaultValue;
            }

            @Override // org.chromium.net.httpflags.BaseFeatureOverrides.FeatureStateOrBuilder
            public ByteString getParamsOrThrow(String key) {
                key.getClass();
                Map<String, ByteString> map = ((FeatureState) this.instance).getParamsMap();
                if (!map.containsKey(key)) {
                    throw new IllegalArgumentException();
                }
                return map.get(key);
            }

            public Builder putParams(String key, ByteString value) {
                key.getClass();
                value.getClass();
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().put(key, value);
                return this;
            }

            public Builder putAllParams(Map<String, ByteString> values) {
                copyOnWrite();
                ((FeatureState) this.instance).getMutableParamsMap().putAll(values);
                return this;
            }
        }

        @Override // com.google.protobuf.GeneratedMessageLite
        protected final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke method, Object arg0, Object arg1) {
            switch (method) {
                case NEW_MUTABLE_INSTANCE:
                    return new FeatureState();
                case NEW_BUILDER:
                    return new Builder();
                case BUILD_MESSAGE_INFO:
                    Object[] objects = {"bitField0_", "enabled_", "params_", ParamsDefaultEntryHolder.defaultEntry};
                    return newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0001\u0000\u0000\u0001ဇ\u0000\u00022", objects);
                case GET_DEFAULT_INSTANCE:
                    return DEFAULT_INSTANCE;
                case GET_PARSER:
                    Parser<FeatureState> parser = PARSER;
                    if (parser == null) {
                        synchronized (FeatureState.class) {
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
            FeatureState defaultInstance = new FeatureState();
            DEFAULT_INSTANCE = defaultInstance;
            GeneratedMessageLite.registerDefaultInstance(FeatureState.class, defaultInstance);
        }

        public static FeatureState getDefaultInstance() {
            return DEFAULT_INSTANCE;
        }

        public static Parser<FeatureState> parser() {
            return DEFAULT_INSTANCE.getParserForType();
        }
    }

    private static final class FeatureStatesDefaultEntryHolder {
        static final MapEntryLite<String, FeatureState> defaultEntry = MapEntryLite.newDefaultInstance(WireFormat.FieldType.STRING, "", WireFormat.FieldType.MESSAGE, FeatureState.getDefaultInstance());

        private FeatureStatesDefaultEntryHolder() {
        }
    }

    private MapFieldLite<String, FeatureState> internalGetFeatureStates() {
        return this.featureStates_;
    }

    private MapFieldLite<String, FeatureState> internalGetMutableFeatureStates() {
        if (!this.featureStates_.isMutable()) {
            this.featureStates_ = this.featureStates_.mutableCopy();
        }
        return this.featureStates_;
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public int getFeatureStatesCount() {
        return internalGetFeatureStates().size();
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public boolean containsFeatureStates(String key) {
        key.getClass();
        return internalGetFeatureStates().containsKey(key);
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    @Deprecated
    public Map<String, FeatureState> getFeatureStates() {
        return getFeatureStatesMap();
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public Map<String, FeatureState> getFeatureStatesMap() {
        return DesugarCollections.unmodifiableMap(internalGetFeatureStates());
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public FeatureState getFeatureStatesOrDefault(String key, FeatureState defaultValue) {
        key.getClass();
        Map<String, FeatureState> map = internalGetFeatureStates();
        return map.containsKey(key) ? map.get(key) : defaultValue;
    }

    @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
    public FeatureState getFeatureStatesOrThrow(String key) {
        key.getClass();
        Map<String, FeatureState> map = internalGetFeatureStates();
        if (!map.containsKey(key)) {
            throw new IllegalArgumentException();
        }
        return map.get(key);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Map<String, FeatureState> getMutableFeatureStatesMap() {
        return internalGetMutableFeatureStates();
    }

    public static BaseFeatureOverrides parseFrom(ByteBuffer data) throws InvalidProtocolBufferException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
    }

    public static BaseFeatureOverrides parseFrom(ByteBuffer data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
    }

    public static BaseFeatureOverrides parseFrom(ByteString data) throws InvalidProtocolBufferException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
    }

    public static BaseFeatureOverrides parseFrom(ByteString data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
    }

    public static BaseFeatureOverrides parseFrom(byte[] data) throws InvalidProtocolBufferException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data);
    }

    public static BaseFeatureOverrides parseFrom(byte[] data, ExtensionRegistryLite extensionRegistry) throws InvalidProtocolBufferException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, data, extensionRegistry);
    }

    public static BaseFeatureOverrides parseFrom(InputStream input) throws IOException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input);
    }

    public static BaseFeatureOverrides parseFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input, extensionRegistry);
    }

    public static BaseFeatureOverrides parseDelimitedFrom(InputStream input) throws IOException {
        return (BaseFeatureOverrides) parseDelimitedFrom(DEFAULT_INSTANCE, input);
    }

    public static BaseFeatureOverrides parseDelimitedFrom(InputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
        return (BaseFeatureOverrides) parseDelimitedFrom(DEFAULT_INSTANCE, input, extensionRegistry);
    }

    public static BaseFeatureOverrides parseFrom(CodedInputStream input) throws IOException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input);
    }

    public static BaseFeatureOverrides parseFrom(CodedInputStream input, ExtensionRegistryLite extensionRegistry) throws IOException {
        return (BaseFeatureOverrides) GeneratedMessageLite.parseFrom(DEFAULT_INSTANCE, input, extensionRegistry);
    }

    public static Builder newBuilder() {
        return DEFAULT_INSTANCE.createBuilder();
    }

    public static Builder newBuilder(BaseFeatureOverrides prototype) {
        return DEFAULT_INSTANCE.createBuilder(prototype);
    }

    public static final class Builder extends GeneratedMessageLite.Builder<BaseFeatureOverrides, Builder> implements BaseFeatureOverridesOrBuilder {
        private Builder() {
            super(BaseFeatureOverrides.DEFAULT_INSTANCE);
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public int getFeatureStatesCount() {
            return ((BaseFeatureOverrides) this.instance).getFeatureStatesMap().size();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public boolean containsFeatureStates(String key) {
            key.getClass();
            return ((BaseFeatureOverrides) this.instance).getFeatureStatesMap().containsKey(key);
        }

        public Builder clearFeatureStates() {
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().clear();
            return this;
        }

        public Builder removeFeatureStates(String key) {
            key.getClass();
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().remove(key);
            return this;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        @Deprecated
        public Map<String, FeatureState> getFeatureStates() {
            return getFeatureStatesMap();
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public Map<String, FeatureState> getFeatureStatesMap() {
            return DesugarCollections.unmodifiableMap(((BaseFeatureOverrides) this.instance).getFeatureStatesMap());
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public FeatureState getFeatureStatesOrDefault(String key, FeatureState defaultValue) {
            key.getClass();
            Map<String, FeatureState> map = ((BaseFeatureOverrides) this.instance).getFeatureStatesMap();
            return map.containsKey(key) ? map.get(key) : defaultValue;
        }

        @Override // org.chromium.net.httpflags.BaseFeatureOverridesOrBuilder
        public FeatureState getFeatureStatesOrThrow(String key) {
            key.getClass();
            Map<String, FeatureState> map = ((BaseFeatureOverrides) this.instance).getFeatureStatesMap();
            if (!map.containsKey(key)) {
                throw new IllegalArgumentException();
            }
            return map.get(key);
        }

        public Builder putFeatureStates(String key, FeatureState value) {
            key.getClass();
            value.getClass();
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().put(key, value);
            return this;
        }

        public Builder putAllFeatureStates(Map<String, FeatureState> values) {
            copyOnWrite();
            ((BaseFeatureOverrides) this.instance).getMutableFeatureStatesMap().putAll(values);
            return this;
        }
    }

    @Override // com.google.protobuf.GeneratedMessageLite
    protected final Object dynamicMethod(GeneratedMessageLite.MethodToInvoke method, Object arg0, Object arg1) {
        switch (method) {
            case NEW_MUTABLE_INSTANCE:
                return new BaseFeatureOverrides();
            case NEW_BUILDER:
                return new Builder();
            case BUILD_MESSAGE_INFO:
                Object[] objects = {"featureStates_", FeatureStatesDefaultEntryHolder.defaultEntry};
                return newMessageInfo(DEFAULT_INSTANCE, "\u0001\u0001\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u00012", objects);
            case GET_DEFAULT_INSTANCE:
                return DEFAULT_INSTANCE;
            case GET_PARSER:
                Parser<BaseFeatureOverrides> parser = PARSER;
                if (parser == null) {
                    synchronized (BaseFeatureOverrides.class) {
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
        BaseFeatureOverrides defaultInstance = new BaseFeatureOverrides();
        DEFAULT_INSTANCE = defaultInstance;
        GeneratedMessageLite.registerDefaultInstance(BaseFeatureOverrides.class, defaultInstance);
    }

    public static BaseFeatureOverrides getDefaultInstance() {
        return DEFAULT_INSTANCE;
    }

    public static Parser<BaseFeatureOverrides> parser() {
        return DEFAULT_INSTANCE.getParserForType();
    }
}
