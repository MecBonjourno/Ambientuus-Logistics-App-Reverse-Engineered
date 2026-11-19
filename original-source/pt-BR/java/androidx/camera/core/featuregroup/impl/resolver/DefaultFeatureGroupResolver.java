package androidx.camera.core.featuregroup.impl.resolver;

import androidx.camera.core.Logger;
import androidx.camera.core.SessionConfig;
import androidx.camera.core.featuregroup.GroupableFeature;
import androidx.camera.core.featuregroup.impl.ResolvedFeatureGroup;
import androidx.camera.core.featuregroup.impl.resolver.FeatureGroupResolutionResult;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.collections.SetsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: DefaultFeatureGroupResolver.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\b\u0000\u0018\u0000 \u00112\u00020\u0001:\u0001\u0011B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0016J8\u0010\n\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\f2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\u000e\b\u0002\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\r0\fH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver;", "Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolver;", "cameraInfoInternal", "Landroidx/camera/core/impl/CameraInfoInternal;", "<init>", "(Landroidx/camera/core/impl/CameraInfoInternal;)V", "resolveFeatureGroup", "Landroidx/camera/core/featuregroup/impl/resolver/FeatureGroupResolutionResult;", "sessionConfig", "Landroidx/camera/core/SessionConfig;", "getFeatureListResolvedByPriority", "orderedPreferredFeatures", "", "Landroidx/camera/core/featuregroup/GroupableFeature;", "index", "", "currentOptionalFeatures", "Companion", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class DefaultFeatureGroupResolver implements FeatureGroupResolver {
    private static final Companion Companion = new Companion(null);
    private static final String TAG = "DefaultFeatureGroupResolver";
    private final CameraInfoInternal cameraInfoInternal;

    public DefaultFeatureGroupResolver(CameraInfoInternal cameraInfoInternal) {
        Intrinsics.checkNotNullParameter(cameraInfoInternal, "cameraInfoInternal");
        this.cameraInfoInternal = cameraInfoInternal;
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x011b, code lost:
    
        return new androidx.camera.core.featuregroup.impl.resolver.FeatureGroupResolutionResult.UseCaseMissing(androidx.camera.core.featuregroup.impl.UseCaseType.PREVIEW + " or " + androidx.camera.core.featuregroup.impl.UseCaseType.VIDEO_CAPTURE, r7);
     */
    @Override // androidx.camera.core.featuregroup.impl.resolver.FeatureGroupResolver
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public androidx.camera.core.featuregroup.impl.resolver.FeatureGroupResolutionResult resolveFeatureGroup(androidx.camera.core.SessionConfig r17) {
        /*
            Method dump skipped, instructions count: 370
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.featuregroup.impl.resolver.DefaultFeatureGroupResolver.resolveFeatureGroup(androidx.camera.core.SessionConfig):androidx.camera.core.featuregroup.impl.resolver.FeatureGroupResolutionResult");
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    static /* sintético */ FeatureGroupResolutionResult getFeatureListResolvedByPriority$default(DefaultFeatureGroupResolver defaultFeatureGroupResolver, SessionConfig sessionConfig, List list, int i, List list2, int i2, Object obj) {
        if ((i2 & 4) != 0) {
            i = 0;
        }
        if ((i2 & 8) != 0) {
            list2 = CollectionsKt.emptyList();
        }
        return defaultFeatureGroupResolver.getFeatureListResolvedByPriority(sessionConfig, list, i, list2);
    }

    private final FeatureGroupResolutionResult getFeatureListResolvedByPriority(SessionConfig sessionConfig, List<? extends GroupableFeature> orderedPreferredFeatures, int index, List<? extends GroupableFeature> currentOptionalFeatures) {
        if (index >= orderedPreferredFeatures.size()) {
            Set features = SetsKt.plus((Set) sessionConfig.getRequiredFeatureGroup(), (Iterable) currentOptionalFeatures);
            Logger.d(TAG, "getFeatureListResolvedByPriority: features = " + features + ", useCases = " + sessionConfig.getUseCases());
            if (this.cameraInfoInternal.isResolvedFeatureGroupSupported(new ResolvedFeatureGroup(features), sessionConfig)) {
                return new FeatureGroupResolutionResult.Supported(new ResolvedFeatureGroup(features));
            }
            return FeatureGroupResolutionResult.Unsupported.INSTANCE;
        }
        FeatureGroupResolutionResult resultTakingCurrentFeature = getFeatureListResolvedByPriority(sessionConfig, orderedPreferredFeatures, index + 1, CollectionsKt.plus((Collection<? extends GroupableFeature>) currentOptionalFeatures, orderedPreferredFeatures.get(index)));
        if (resultTakingCurrentFeature instanceof FeatureGroupResolutionResult.Supported) {
            return resultTakingCurrentFeature;
        }
        return getFeatureListResolvedByPriority(sessionConfig, orderedPreferredFeatures, index + 1, currentOptionalFeatures);
    }

    /* compiled from: DefaultFeatureGroupResolver.kt */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0006"}, d2 = {"Landroidx/camera/core/featuregroup/impl/resolver/DefaultFeatureGroupResolver$Companion;", "", "<init>", "()V", "TAG", "", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }
}
