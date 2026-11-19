package org.chromium.net.httpflags;

import androidx.credentials.provider.CredentialEntry;
import com.google.protobuf.ByteString;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import org.chromium.net.httpflags.BaseFeatureOverrides;
import org.chromium.net.httpflags.ResolvedFlags;

/* carregado de: classes17.dex */
public final class BaseFeature {
    public static final String FLAG_PREFIX = "ChromiumBaseFeature_";
    public static final String PARAM_DELIMITER = "_PARAM_";

    private BaseFeature() {
    }

    public static BaseFeatureOverrides getOverrides(ResolvedFlags flags) {
        Map<String, BaseFeatureOverrides.FeatureState.Builder> featureStateBuilders = new HashMap<>();
        for (Map.Entry<String, ResolvedFlags.Value> flag : flags.flags().entrySet()) {
            try {
                applyOverride(flag.getKey(), flag.getValue(), featureStateBuilders);
            } catch (RuntimeException exception) {
                throw new IllegalArgumentException("Could not parse HTTP flag `" + flag.getKey() + "` as a base::Feature override", exception);
            }
        }
        BaseFeatureOverrides.Builder builder = BaseFeatureOverrides.newBuilder();
        for (Map.Entry<String, BaseFeatureOverrides.FeatureState.Builder> featureStateBuilder : featureStateBuilders.entrySet()) {
            builder.putFeatureStates(featureStateBuilder.getKey(), featureStateBuilder.getValue().build());
        }
        return builder.build();
    }

    private static void applyOverride(String flagName, ResolvedFlags.Value flagValue, Map<String, BaseFeatureOverrides.FeatureState.Builder> featureStateBuilders) {
        ParsedFlagName parsedFlagName = parseFlagName(flagName);
        if (parsedFlagName == null) {
            return;
        }
        BaseFeatureOverrides.FeatureState.Builder featureStateBuilder = featureStateBuilders.get(parsedFlagName.featureName);
        if (featureStateBuilder == null) {
            featureStateBuilder = BaseFeatureOverrides.FeatureState.newBuilder();
            featureStateBuilders.put(parsedFlagName.featureName, featureStateBuilder);
        }
        if (parsedFlagName.paramName == null) {
            applyStateOverride(flagValue, featureStateBuilder);
        } else {
            applyParamOverride(parsedFlagName.paramName, flagValue, featureStateBuilder);
        }
    }

    private static final class ParsedFlagName {
        public String featureName;
        public String paramName;

        private ParsedFlagName() {
        }
    }

    private static ParsedFlagName parseFlagName(String flagName) {
        if (!flagName.startsWith(FLAG_PREFIX)) {
            return null;
        }
        String flagNameWithoutPrefix = flagName.substring(FLAG_PREFIX.length());
        ParsedFlagName parsed = new ParsedFlagName();
        int delimiterIndex = flagNameWithoutPrefix.indexOf(PARAM_DELIMITER);
        if (delimiterIndex < 0) {
            parsed.featureName = flagNameWithoutPrefix;
        } else {
            parsed.featureName = flagNameWithoutPrefix.substring(0, delimiterIndex);
            parsed.paramName = flagNameWithoutPrefix.substring(PARAM_DELIMITER.length() + delimiterIndex);
        }
        return parsed;
    }

    private static void applyStateOverride(ResolvedFlags.Value value, BaseFeatureOverrides.FeatureState.Builder featureStateBuilder) {
        ResolvedFlags.Value.Type valueType = value.getType();
        if (valueType != ResolvedFlags.Value.Type.BOOL) {
            throw new IllegalArgumentException("HTTP flag has type " + valueType + ", but only boolean flags are supported as base::Feature overrides");
        }
        featureStateBuilder.setEnabled(value.getBoolValue());
    }

    private static void applyParamOverride(String paramName, ResolvedFlags.Value value, BaseFeatureOverrides.FeatureState.Builder featureStateBuilder) {
        ByteString rawValue;
        ResolvedFlags.Value.Type valueType = value.getType();
        switch (valueType) {
            case BOOL:
                rawValue = ByteString.copyFrom(value.getBoolValue() ? CredentialEntry.TRUE_STRING : CredentialEntry.FALSE_STRING, StandardCharsets.UTF_8);
                break;
            case INT:
                rawValue = ByteString.copyFrom(Long.toString(value.getIntValue(), 10), StandardCharsets.UTF_8);
                break;
            case FLOAT:
                rawValue = ByteString.copyFrom(Float.toString(value.getFloatValue()), StandardCharsets.UTF_8);
                break;
            case STRING:
                rawValue = ByteString.copyFrom(value.getStringValue(), StandardCharsets.UTF_8);
                break;
            case BYTES:
                rawValue = value.getBytesValue();
                break;
            default:
                throw new UnsupportedOperationException("Unsupported HTTP flag value type for base::Feature param `" + paramName + "`: " + valueType);
        }
        featureStateBuilder.putParams(paramName, rawValue);
    }
}
