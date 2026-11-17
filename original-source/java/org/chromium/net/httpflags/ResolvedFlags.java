package org.chromium.net.httpflags;

import com.google.protobuf.ByteString;
import j$.util.DesugarCollections;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;
import org.chromium.net.httpflags.FlagValue;

/* loaded from: classes17.dex */
public final class ResolvedFlags {
    private final Map<String, Value> mFlags;

    public static final class Value {
        private final Object mValue;

        public enum Type {
            BOOL,
            INT,
            FLOAT,
            STRING,
            BYTES
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static Value resolve(FlagValue flagValue, String appId, int[] cronetVersion) {
            for (FlagValue.ConstrainedValue constrainedValue : flagValue.getConstrainedValuesList()) {
                if (!constrainedValue.hasAppId() || constrainedValue.getAppId().equals(appId)) {
                    if (!constrainedValue.hasMinVersion() || matchesVersion(cronetVersion, ResolvedFlags.parseVersionString(constrainedValue.getMinVersion()))) {
                        return fromConstrainedValue(constrainedValue);
                    }
                }
            }
            return null;
        }

        private static boolean matchesVersion(int[] cronetVersion, int[] minVersion) {
            int i = 0;
            while (i < Math.max(cronetVersion.length, minVersion.length)) {
                int cronetComponent = i < cronetVersion.length ? cronetVersion[i] : 0;
                int minComponent = i < minVersion.length ? minVersion[i] : 0;
                if (cronetComponent > minComponent) {
                    return true;
                }
                if (cronetComponent < minComponent) {
                    return false;
                }
                i++;
            }
            return true;
        }

        private static Value fromConstrainedValue(FlagValue.ConstrainedValue constrainedValue) {
            FlagValue.ConstrainedValue.ValueCase valueCase = constrainedValue.getValueCase();
            switch (valueCase) {
                case BOOL_VALUE:
                    return new Value(constrainedValue.getBoolValue());
                case INT_VALUE:
                    return new Value(constrainedValue.getIntValue());
                case FLOAT_VALUE:
                    return new Value(constrainedValue.getFloatValue());
                case STRING_VALUE:
                    return new Value(constrainedValue.getStringValue());
                case BYTES_VALUE:
                    return new Value(constrainedValue.getBytesValue());
                case VALUE_NOT_SET:
                    return null;
                default:
                    throw new IllegalArgumentException("Flag value uses unknown value type " + valueCase);
            }
        }

        public Value(boolean value) {
            this.mValue = Boolean.valueOf(value);
        }

        public Value(long value) {
            this.mValue = Long.valueOf(value);
        }

        public Value(float value) {
            this.mValue = Float.valueOf(value);
        }

        public Value(String value) {
            this.mValue = value;
        }

        public Value(ByteString value) {
            this.mValue = value;
        }

        public Type getType() {
            if (this.mValue instanceof Boolean) {
                return Type.BOOL;
            }
            if (this.mValue instanceof Long) {
                return Type.INT;
            }
            if (this.mValue instanceof Float) {
                return Type.FLOAT;
            }
            if (this.mValue instanceof String) {
                return Type.STRING;
            }
            if (this.mValue instanceof ByteString) {
                return Type.BYTES;
            }
            throw new IllegalStateException("Unexpected flag value type: " + this.mValue.getClass().getName());
        }

        private void checkType(Type requestedType) {
            Type actualType = getType();
            if (requestedType != actualType) {
                throw new IllegalStateException("Attempted to access flag value as " + requestedType + ", but actual type is " + actualType);
            }
        }

        public boolean getBoolValue() {
            checkType(Type.BOOL);
            return ((Boolean) this.mValue).booleanValue();
        }

        public long getIntValue() {
            checkType(Type.INT);
            return ((Long) this.mValue).longValue();
        }

        public float getFloatValue() {
            checkType(Type.FLOAT);
            return ((Float) this.mValue).floatValue();
        }

        public String getStringValue() {
            checkType(Type.STRING);
            return (String) this.mValue;
        }

        public ByteString getBytesValue() {
            checkType(Type.BYTES);
            return (ByteString) this.mValue;
        }
    }

    public static ResolvedFlags resolve(Flags flags, String appId, String cronetVersion) {
        int[] parsedCronetVersion = parseVersionString(cronetVersion);
        Map<String, Value> resolvedFlags = new HashMap<>();
        for (Map.Entry<String, FlagValue> flag : flags.getFlagsMap().entrySet()) {
            try {
                Value value = Value.resolve(flag.getValue(), appId, parsedCronetVersion);
                if (value != null) {
                    resolvedFlags.put(flag.getKey(), value);
                }
            } catch (RuntimeException exception) {
                throw new IllegalArgumentException("Unable to resolve HTTP flag `" + flag.getKey() + "`", exception);
            }
        }
        return new ResolvedFlags(resolvedFlags);
    }

    public ResolvedFlags(Map<String, Value> flags) {
        this.mFlags = flags;
    }

    public Map<String, Value> flags() {
        return DesugarCollections.unmodifiableMap(this.mFlags);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int[] parseVersionString(String versionString) {
        try {
            if (versionString.isEmpty()) {
                throw new IllegalArgumentException("Version string is empty");
            }
            StringTokenizer tokenizer = new StringTokenizer(versionString, ".");
            int[] components = new int[tokenizer.countTokens()];
            for (int i = 0; i < components.length; i++) {
                components[i] = Integer.parseInt(tokenizer.nextToken());
            }
            return components;
        } catch (RuntimeException exception) {
            throw new IllegalArgumentException("Unable to parse HTTP flags version string: `" + versionString + "`", exception);
        }
    }
}
