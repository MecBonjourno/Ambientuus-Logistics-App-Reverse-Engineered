package androidx.camera.core;

import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.Identifier;
import androidx.camera.core.impl.LensFacingCameraFilter;
import androidx.core.util.Preconditions;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/* loaded from: classes.dex */
public final class CameraSelector {
    public static final int LENS_FACING_BACK = 1;
    public static final int LENS_FACING_EXTERNAL = 2;
    public static final int LENS_FACING_FRONT = 0;
    public static final int LENS_FACING_UNKNOWN = -1;
    private final LinkedHashSet<CameraFilter> mCameraFilterSet;
    private final String mPhysicalCameraId;
    public static final CameraSelector DEFAULT_FRONT_CAMERA = new Builder().requireLensFacing(0).build();
    public static final CameraSelector DEFAULT_BACK_CAMERA = new Builder().requireLensFacing(1).build();

    @Target({ElementType.TYPE, ElementType.TYPE_USE, ElementType.FIELD, ElementType.PARAMETER, ElementType.LOCAL_VARIABLE})
    @Retention(RetentionPolicy.SOURCE)
    public @interface LensFacing {
    }

    CameraSelector(LinkedHashSet<CameraFilter> cameraFilterSet, String physicalCameraId) {
        this.mCameraFilterSet = cameraFilterSet;
        this.mPhysicalCameraId = physicalCameraId;
    }

    public CameraInternal select(LinkedHashSet<CameraInternal> cameras) {
        Iterator<CameraInternal> cameraInternalIterator = filter(cameras).iterator();
        if (cameraInternalIterator.hasNext()) {
            return cameraInternalIterator.next();
        }
        String errorMessage = String.format("No available camera can be found. %s %s", logCameras(cameras), logSelector());
        throw new IllegalArgumentException(errorMessage);
    }

    private String logCameras(Set<CameraInternal> cameras) {
        StringBuilder sb = new StringBuilder();
        sb.append("Cams:").append(cameras.size());
        for (CameraInternal camera : cameras) {
            CameraInfoInternal info = camera.getCameraInfoInternal();
            sb.append(String.format(" Id:%s  Lens:%s", info.getCameraId(), Integer.valueOf(info.getLensFacing())));
        }
        return sb.toString();
    }

    private String logSelector() {
        StringBuilder sb = new StringBuilder();
        sb.append(String.format("PhyId:%s  Filters:%s", this.mPhysicalCameraId, Integer.valueOf(this.mCameraFilterSet.size())));
        Iterator<CameraFilter> it = this.mCameraFilterSet.iterator();
        while (it.hasNext()) {
            CameraFilter filter = it.next();
            sb.append(" Id:").append(filter.getIdentifier());
            if (filter instanceof LensFacingCameraFilter) {
                sb.append(" LensFilter:").append(((LensFacingCameraFilter) filter).getLensFacing());
            }
        }
        return sb.toString();
    }

    public List<CameraInfo> filter(List<CameraInfo> cameraInfos) {
        List<CameraInfo> output = new ArrayList<>(cameraInfos);
        Iterator<CameraFilter> it = this.mCameraFilterSet.iterator();
        while (it.hasNext()) {
            CameraFilter filter = it.next();
            output = filter.filter(DesugarCollections.unmodifiableList(output));
        }
        output.retainAll(cameraInfos);
        return output;
    }

    public LinkedHashSet<CameraInternal> filter(LinkedHashSet<CameraInternal> cameras) {
        List<CameraInfo> input = new ArrayList<>();
        Iterator<CameraInternal> it = cameras.iterator();
        while (it.hasNext()) {
            input.add(it.next().getCameraInfo());
        }
        List<CameraInfo> result = filter(input);
        LinkedHashSet<CameraInternal> output = new LinkedHashSet<>();
        Iterator<CameraInternal> it2 = cameras.iterator();
        while (it2.hasNext()) {
            CameraInternal camera = it2.next();
            if (result.contains(camera.getCameraInfo())) {
                output.add(camera);
            }
        }
        return output;
    }

    public LinkedHashSet<CameraFilter> getCameraFilterSet() {
        return this.mCameraFilterSet;
    }

    public Integer getLensFacing() {
        Integer currentLensFacing = null;
        Iterator<CameraFilter> it = this.mCameraFilterSet.iterator();
        while (it.hasNext()) {
            CameraFilter filter = it.next();
            if (filter instanceof LensFacingCameraFilter) {
                Integer newLensFacing = Integer.valueOf(((LensFacingCameraFilter) filter).getLensFacing());
                if (currentLensFacing == null) {
                    currentLensFacing = newLensFacing;
                } else if (!currentLensFacing.equals(newLensFacing)) {
                    throw new IllegalStateException("Multiple conflicting lens facing requirements exist.");
                }
            }
        }
        return currentLensFacing;
    }

    public String getPhysicalCameraId() {
        return this.mPhysicalCameraId;
    }

    public static CameraSelector of(final CameraIdentifier... cameraIdentifiers) {
        if (cameraIdentifiers == null || cameraIdentifiers.length == 0) {
            throw new IllegalArgumentException("At least one CameraIdentifier must be provided.");
        }
        Builder builder = new Builder();
        builder.addCameraFilter(new CameraFilter() { // from class: androidx.camera.core.CameraSelector$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.CameraFilter
            public final List filter(List list) {
                return CameraSelector.lambda$of$0(cameraIdentifiers, list);
            }

            @Override // androidx.camera.core.CameraFilter
            public /* synthetic */ Identifier getIdentifier() {
                Identifier identifier;
                identifier = CameraFilter.DEFAULT_ID;
                return identifier;
            }
        });
        return builder.build();
    }

    static /* synthetic */ List lambda$of$0(CameraIdentifier[] cameraIdentifiers, List availableCameras) {
        List<CameraInfo> result = new ArrayList<>();
        Set<CameraIdentifier> seenIdentifiers = new HashSet<>();
        for (CameraIdentifier priorityId : cameraIdentifiers) {
            Iterator it = availableCameras.iterator();
            while (true) {
                if (it.hasNext()) {
                    CameraInfo cameraInfo = (CameraInfo) it.next();
                    if (Objects.equals(cameraInfo.getCameraIdentifier(), priorityId) && !seenIdentifiers.contains(priorityId)) {
                        result.add(cameraInfo);
                        seenIdentifiers.add(priorityId);
                        break;
                    }
                }
            }
        }
        return result;
    }

    public static final class Builder {
        private final LinkedHashSet<CameraFilter> mCameraFilterSet;
        private String mPhysicalCameraId;

        public Builder() {
            this.mCameraFilterSet = new LinkedHashSet<>();
        }

        private Builder(LinkedHashSet<CameraFilter> cameraFilterSet) {
            this.mCameraFilterSet = new LinkedHashSet<>(cameraFilterSet);
        }

        public Builder requireLensFacing(int lensFacing) {
            Preconditions.checkState(lensFacing != -1, "The specified lens facing is invalid.");
            this.mCameraFilterSet.add(new LensFacingCameraFilter(lensFacing));
            return this;
        }

        public Builder addCameraFilter(CameraFilter cameraFilter) {
            this.mCameraFilterSet.add(cameraFilter);
            return this;
        }

        public static Builder fromSelector(CameraSelector cameraSelector) {
            Builder builder = new Builder(cameraSelector.getCameraFilterSet());
            return builder;
        }

        public Builder setPhysicalCameraId(String physicalCameraId) {
            this.mPhysicalCameraId = physicalCameraId;
            return this;
        }

        public CameraSelector build() {
            return new CameraSelector(this.mCameraFilterSet, this.mPhysicalCameraId);
        }
    }
}
