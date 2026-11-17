package androidx.camera.camera2.internal.compat.params;

import android.hardware.camera2.params.DynamicRangeProfiles;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.core.DynamicRange;
import androidx.core.util.Preconditions;
import j$.util.DesugarCollections;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* loaded from: classes.dex */
class DynamicRangesCompatApi33Impl implements DynamicRangesCompat.DynamicRangeProfilesCompatImpl {
    private final DynamicRangeProfiles mDynamicRangeProfiles;

    DynamicRangesCompatApi33Impl(Object dynamicRangeProfiles) {
        this.mDynamicRangeProfiles = (DynamicRangeProfiles) dynamicRangeProfiles;
    }

    @Override // androidx.camera.camera2.internal.compat.params.DynamicRangesCompat.DynamicRangeProfilesCompatImpl
    public Set<DynamicRange> getDynamicRangeCaptureRequestConstraints(DynamicRange dynamicRange) {
        Long dynamicRangeProfile = dynamicRangeToFirstSupportedProfile(dynamicRange);
        Preconditions.checkArgument(dynamicRangeProfile != null, "DynamicRange is not supported: " + dynamicRange);
        return profileSetToDynamicRangeSet(this.mDynamicRangeProfiles.getProfileCaptureRequestConstraints(dynamicRangeProfile.longValue()));
    }

    @Override // androidx.camera.camera2.internal.compat.params.DynamicRangesCompat.DynamicRangeProfilesCompatImpl
    public Set<DynamicRange> getSupportedDynamicRanges() {
        return profileSetToDynamicRangeSet(this.mDynamicRangeProfiles.getSupportedProfiles());
    }

    @Override // androidx.camera.camera2.internal.compat.params.DynamicRangesCompat.DynamicRangeProfilesCompatImpl
    public boolean isExtraLatencyPresent(DynamicRange dynamicRange) {
        Long dynamicRangeProfile = dynamicRangeToFirstSupportedProfile(dynamicRange);
        Preconditions.checkArgument(dynamicRangeProfile != null, "DynamicRange is not supported: " + dynamicRange);
        return this.mDynamicRangeProfiles.isExtraLatencyPresent(dynamicRangeProfile.longValue());
    }

    @Override // androidx.camera.camera2.internal.compat.params.DynamicRangesCompat.DynamicRangeProfilesCompatImpl
    public DynamicRangeProfiles unwrap() {
        return this.mDynamicRangeProfiles;
    }

    private static DynamicRange profileToDynamicRange(long profile) {
        return (DynamicRange) Preconditions.checkNotNull(DynamicRangeConversions.profileToDynamicRange(profile), "Dynamic range profile cannot be converted to a DynamicRange object: " + profile);
    }

    private Long dynamicRangeToFirstSupportedProfile(DynamicRange dynamicRange) {
        return DynamicRangeConversions.dynamicRangeToFirstSupportedProfile(dynamicRange, this.mDynamicRangeProfiles);
    }

    private static Set<DynamicRange> profileSetToDynamicRangeSet(Set<Long> profileSet) {
        if (profileSet.isEmpty()) {
            return Collections.emptySet();
        }
        Set<DynamicRange> dynamicRangeSet = new HashSet<>(profileSet.size());
        Iterator<Long> it = profileSet.iterator();
        while (it.hasNext()) {
            long profile = it.next().longValue();
            dynamicRangeSet.add(profileToDynamicRange(profile));
        }
        return DesugarCollections.unmodifiableSet(dynamicRangeSet);
    }
}
