package androidx.camera.featurecombinationquery;

import android.hardware.camera2.CaptureRequest;
import j$.util.DesugarCollections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public class SessionParametersLegacy {
    private final Map<CaptureRequest.Key<?>, Object> mKeyVal;

    private SessionParametersLegacy(Map<CaptureRequest.Key<?>, Object> keyValMap) {
        this.mKeyVal = keyValMap;
    }

    public Set<CaptureRequest.Key<?>> getKeys() {
        return SessionParametersLegacy$$ExternalSyntheticBackport0.m(this.mKeyVal.keySet());
    }

    public <T> T get(CaptureRequest.Key<T> key) {
        return (T) this.mKeyVal.get(key);
    }

    public Map<CaptureRequest.Key<?>, Object> asMap() {
        return DesugarCollections.unmodifiableMap(this.mKeyVal);
    }

    public static final class Builder {
        private final HashMap<CaptureRequest.Key<?>, Object> mKeyVal = new HashMap<>();

        public <T> Builder set(CaptureRequest.Key<T> key, T val) {
            this.mKeyVal.put(key, val);
            return this;
        }

        public SessionParametersLegacy build() {
            return new SessionParametersLegacy(SessionParametersLegacy$Builder$$ExternalSyntheticBackport0.m(this.mKeyVal));
        }
    }
}
