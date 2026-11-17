package androidx.camera.core.impl;

import androidx.camera.core.Logger;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseAttachState;
import androidx.camera.core.impl.UseCaseConfigFactory;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class UseCaseAttachState {
    private static final String TAG = "UseCaseAttachState";
    private final Map<String, UseCaseAttachInfo> mAttachedUseCasesToInfoMap = new LinkedHashMap();
    private final String mCameraId;

    /* JADX INFO: Access modifiers changed from: private */
    interface AttachStateFilter {
        boolean filter(UseCaseAttachInfo useCaseAttachInfo);
    }

    public UseCaseAttachState(String cameraId) {
        this.mCameraId = cameraId;
    }

    public void setUseCaseActive(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, StreamSpec streamSpec, List<UseCaseConfigFactory.CaptureType> captureTypes) {
        UseCaseAttachInfo useCaseAttachInfo = getOrCreateUseCaseAttachInfo(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
        useCaseAttachInfo.setActive(true);
    }

    public void setUseCaseInactive(String useCaseId) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return;
        }
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        useCaseAttachInfo.setActive(false);
        if (!useCaseAttachInfo.getAttached()) {
            this.mAttachedUseCasesToInfoMap.remove(useCaseId);
        }
    }

    public void setUseCaseAttached(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, StreamSpec streamSpec, List<UseCaseConfigFactory.CaptureType> captureTypes) {
        UseCaseAttachInfo useCaseAttachInfo = getOrCreateUseCaseAttachInfo(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
        useCaseAttachInfo.setAttached(true);
        updateUseCase(useCaseId, sessionConfig, useCaseConfig, streamSpec, captureTypes);
    }

    public void setUseCaseDetached(String useCaseId) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return;
        }
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        useCaseAttachInfo.setAttached(false);
        if (!useCaseAttachInfo.getActive()) {
            this.mAttachedUseCasesToInfoMap.remove(useCaseId);
        }
    }

    public boolean isUseCaseAttached(String useCaseId) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return false;
        }
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        return useCaseAttachInfo.getAttached();
    }

    public Collection<UseCaseConfig<?>> getAttachedUseCaseConfigs() {
        return DesugarCollections.unmodifiableCollection(getUseCaseConfigs(new AttachStateFilter() { // from class: androidx.camera.core.impl.UseCaseAttachState$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.impl.UseCaseAttachState.AttachStateFilter
            public final boolean filter(UseCaseAttachState.UseCaseAttachInfo useCaseAttachInfo) {
                boolean attached;
                attached = useCaseAttachInfo.getAttached();
                return attached;
            }
        }));
    }

    public Collection<SessionConfig> getAttachedSessionConfigs() {
        return DesugarCollections.unmodifiableCollection(getSessionConfigs(new AttachStateFilter() { // from class: androidx.camera.core.impl.UseCaseAttachState$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.impl.UseCaseAttachState.AttachStateFilter
            public final boolean filter(UseCaseAttachState.UseCaseAttachInfo useCaseAttachInfo) {
                boolean attached;
                attached = useCaseAttachInfo.getAttached();
                return attached;
            }
        }));
    }

    public Collection<UseCaseAttachInfo> getAttachedUseCaseInfo() {
        return DesugarCollections.unmodifiableCollection(getUseCaseInfo(new AttachStateFilter() { // from class: androidx.camera.core.impl.UseCaseAttachState$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.UseCaseAttachState.AttachStateFilter
            public final boolean filter(UseCaseAttachState.UseCaseAttachInfo useCaseAttachInfo) {
                boolean attached;
                attached = useCaseAttachInfo.getAttached();
                return attached;
            }
        }));
    }

    public Collection<SessionConfig> getActiveAndAttachedSessionConfigs() {
        return DesugarCollections.unmodifiableCollection(getSessionConfigs(new AttachStateFilter() { // from class: androidx.camera.core.impl.UseCaseAttachState$$ExternalSyntheticLambda3
            @Override // androidx.camera.core.impl.UseCaseAttachState.AttachStateFilter
            public final boolean filter(UseCaseAttachState.UseCaseAttachInfo useCaseAttachInfo) {
                return UseCaseAttachState.lambda$getActiveAndAttachedSessionConfigs$3(useCaseAttachInfo);
            }
        }));
    }

    static /* synthetic */ boolean lambda$getActiveAndAttachedSessionConfigs$3(UseCaseAttachInfo useCaseAttachInfo) {
        return useCaseAttachInfo.getActive() && useCaseAttachInfo.getAttached();
    }

    public void updateUseCase(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, StreamSpec streamSpec, List<UseCaseConfigFactory.CaptureType> captureTypes) {
        if (!this.mAttachedUseCasesToInfoMap.containsKey(useCaseId)) {
            return;
        }
        UseCaseAttachInfo newUseCaseAttachInfo = new UseCaseAttachInfo(sessionConfig, useCaseConfig, streamSpec, captureTypes);
        UseCaseAttachInfo oldUseCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        newUseCaseAttachInfo.setAttached(oldUseCaseAttachInfo.getAttached());
        newUseCaseAttachInfo.setActive(oldUseCaseAttachInfo.getActive());
        this.mAttachedUseCasesToInfoMap.put(useCaseId, newUseCaseAttachInfo);
    }

    public void removeUseCase(String useCaseId) {
        this.mAttachedUseCasesToInfoMap.remove(useCaseId);
    }

    public SessionConfig.ValidatingBuilder getActiveAndAttachedBuilder() {
        SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
        List<String> list = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            UseCaseAttachInfo useCaseAttachInfo = attachedUseCase.getValue();
            if (useCaseAttachInfo.getActive() && useCaseAttachInfo.getAttached()) {
                String useCaseId = attachedUseCase.getKey();
                validatingBuilder.add(useCaseAttachInfo.getSessionConfig());
                list.add(useCaseId);
            }
        }
        Logger.d(TAG, "Active and attached use case: " + list + " for camera: " + this.mCameraId);
        return validatingBuilder;
    }

    public SessionConfig.ValidatingBuilder getAttachedBuilder() {
        SessionConfig.ValidatingBuilder validatingBuilder = new SessionConfig.ValidatingBuilder();
        List<String> list = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            UseCaseAttachInfo useCaseAttachInfo = attachedUseCase.getValue();
            if (useCaseAttachInfo.getAttached()) {
                validatingBuilder.add(useCaseAttachInfo.getSessionConfig());
                String useCaseId = attachedUseCase.getKey();
                list.add(useCaseId);
            }
        }
        Logger.d(TAG, "All use case: " + list + " for camera: " + this.mCameraId);
        return validatingBuilder;
    }

    private UseCaseAttachInfo getOrCreateUseCaseAttachInfo(String useCaseId, SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, StreamSpec streamSpec, List<UseCaseConfigFactory.CaptureType> captureTypes) {
        UseCaseAttachInfo useCaseAttachInfo = this.mAttachedUseCasesToInfoMap.get(useCaseId);
        if (useCaseAttachInfo == null) {
            UseCaseAttachInfo useCaseAttachInfo2 = new UseCaseAttachInfo(sessionConfig, useCaseConfig, streamSpec, captureTypes);
            this.mAttachedUseCasesToInfoMap.put(useCaseId, useCaseAttachInfo2);
            return useCaseAttachInfo2;
        }
        return useCaseAttachInfo;
    }

    private Collection<SessionConfig> getSessionConfigs(AttachStateFilter attachStateFilter) {
        List<SessionConfig> sessionConfigs = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            if (attachStateFilter == null || attachStateFilter.filter(attachedUseCase.getValue())) {
                sessionConfigs.add(attachedUseCase.getValue().getSessionConfig());
            }
        }
        return sessionConfigs;
    }

    private Collection<UseCaseConfig<?>> getUseCaseConfigs(AttachStateFilter attachStateFilter) {
        List<UseCaseConfig<?>> useCaseConfigs = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            if (attachStateFilter == null || attachStateFilter.filter(attachedUseCase.getValue())) {
                useCaseConfigs.add(attachedUseCase.getValue().getUseCaseConfig());
            }
        }
        return useCaseConfigs;
    }

    private Collection<UseCaseAttachInfo> getUseCaseInfo(AttachStateFilter attachStateFilter) {
        List<UseCaseAttachInfo> useCaseAttachInfo = new ArrayList<>();
        for (Map.Entry<String, UseCaseAttachInfo> attachedUseCase : this.mAttachedUseCasesToInfoMap.entrySet()) {
            if (attachStateFilter == null || attachStateFilter.filter(attachedUseCase.getValue())) {
                useCaseAttachInfo.add(attachedUseCase.getValue());
            }
        }
        return useCaseAttachInfo;
    }

    public static final class UseCaseAttachInfo {
        private final List<UseCaseConfigFactory.CaptureType> mCaptureTypes;
        private final SessionConfig mSessionConfig;
        private final StreamSpec mStreamSpec;
        private final UseCaseConfig<?> mUseCaseConfig;
        private boolean mAttached = false;
        private boolean mActive = false;

        UseCaseAttachInfo(SessionConfig sessionConfig, UseCaseConfig<?> useCaseConfig, StreamSpec streamSpec, List<UseCaseConfigFactory.CaptureType> captureTypes) {
            this.mSessionConfig = sessionConfig;
            this.mUseCaseConfig = useCaseConfig;
            this.mStreamSpec = streamSpec;
            this.mCaptureTypes = captureTypes;
        }

        public UseCaseConfig<?> getUseCaseConfig() {
            return this.mUseCaseConfig;
        }

        public SessionConfig getSessionConfig() {
            return this.mSessionConfig;
        }

        public StreamSpec getStreamSpec() {
            return this.mStreamSpec;
        }

        public List<UseCaseConfigFactory.CaptureType> getCaptureTypes() {
            return this.mCaptureTypes;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public boolean getAttached() {
            return this.mAttached;
        }

        void setAttached(boolean attached) {
            this.mAttached = attached;
        }

        boolean getActive() {
            return this.mActive;
        }

        void setActive(boolean active) {
            this.mActive = active;
        }

        public String toString() {
            return "UseCaseAttachInfo{mSessionConfig=" + this.mSessionConfig + ", mUseCaseConfig=" + this.mUseCaseConfig + ", mStreamSpec=" + this.mStreamSpec + ", mCaptureTypes=" + this.mCaptureTypes + ", mAttached=" + this.mAttached + ", mActive=" + this.mActive + '}';
        }
    }
}
