package androidx.camera.featurecombinationquery;

import android.hardware.camera2.params.OutputConfiguration;
import androidx.camera.featurecombinationquery.SessionParametersLegacy;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* loaded from: classes.dex */
public class SessionConfigurationLegacy {
    private final List<OutputConfiguration> mOutputConfigs;
    private final SessionParametersLegacy mSessionParams;

    private SessionConfigurationLegacy(List<OutputConfiguration> outputConfigs, SessionParametersLegacy sessionParams) {
        this.mOutputConfigs = outputConfigs;
        this.mSessionParams = sessionParams;
    }

    public List<OutputConfiguration> getOutputConfigurations() {
        return this.mOutputConfigs;
    }

    public SessionParametersLegacy getSessionParameters() {
        return this.mSessionParams;
    }

    public static final class Builder {
        private final ArrayList<OutputConfiguration> mOutputConfigs = new ArrayList<>();
        private SessionParametersLegacy mSessionParams = new SessionParametersLegacy.Builder().build();

        public Builder addOutputConfiguration(OutputConfiguration outputConfig) {
            this.mOutputConfigs.add(outputConfig);
            return this;
        }

        public Builder addOutputConfigurations(Collection<OutputConfiguration> outputConfigs) {
            this.mOutputConfigs.addAll(outputConfigs);
            return this;
        }

        public Builder setSessionParameters(SessionParametersLegacy sessionParams) {
            this.mSessionParams = sessionParams;
            return this;
        }

        public SessionConfigurationLegacy build() {
            return new SessionConfigurationLegacy(SessionConfigurationLegacy$Builder$$ExternalSyntheticBackport0.m(this.mOutputConfigs), this.mSessionParams);
        }
    }
}
