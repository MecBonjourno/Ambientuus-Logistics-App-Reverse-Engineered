package androidx.camera.core;

import android.util.Range;
import androidx.camera.core.featuregroup.GroupableFeature;
import androidx.camera.core.featuregroup.impl.UseCaseType;
import androidx.camera.core.featuregroup.impl.feature.FeatureTypeInternal;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.util.Consumer;
import com.google.android.gms.common.internal.ServiceSpecificExtraArgs;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.SetsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: SessionConfig.kt */
@Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0017\u0018\u00002\u00020\u0001:\u00017Bc\b\u0007\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0003\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\n\u0012\u000e\b\u0002\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r\u0012\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0003¢\u0006\u0004\b\u0010\u0010\u0011B\u001d\b\u0016\u0012\u0012\u0010\u0002\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00040\u0012\"\u00020\u0004¢\u0006\u0004\b\u0010\u0010\u0013J\b\u0010-\u001a\u00020.H\u0002J\b\u0010/\u001a\u00020.H\u0002J\b\u00100\u001a\u00020.H\u0002J\f\u00101\u001a\u00020.*\u00020\u0004H\u0002J\f\u00102\u001a\u000203*\u00020\u0004H\u0002J&\u00104\u001a\u00020.2\b\b\u0002\u00105\u001a\u00020)2\u0012\u00106\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000e0\r0%H\u0007R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0017\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0017\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\n¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u0017\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u001bR\u0017\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0017R\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0017R\u0016\u0010\u001e\u001a\u00020\u001f8WX\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\u001e\u0010 R\u0016\u0010!\u001a\u00020\u000b8WX\u0096D¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#R6\u0010&\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000e0\r0%2\u0012\u0010$\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000e0\r0%@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b'\u0010(R\u001e\u0010*\u001a\u00020)2\u0006\u0010$\u001a\u00020)@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b+\u0010,¨\u00068"}, d2 = {"Landroidx/camera/core/SessionConfig;", "", "useCases", "", "Landroidx/camera/core/UseCase;", "viewPort", "Landroidx/camera/core/ViewPort;", "effects", "Landroidx/camera/core/CameraEffect;", "frameRateRange", "Landroid/util/Range;", "", "requiredFeatureGroup", "", "Landroidx/camera/core/featuregroup/GroupableFeature;", "preferredFeatureGroup", "<init>", "(Ljava/util/List;Landroidx/camera/core/ViewPort;Ljava/util/List;Landroid/util/Range;Ljava/util/Set;Ljava/util/List;)V", "", "([Landroidx/camera/core/UseCase;)V", "getViewPort", "()Landroidx/camera/core/ViewPort;", "getEffects", "()Ljava/util/List;", "getFrameRateRange", "()Landroid/util/Range;", "getRequiredFeatureGroup", "()Ljava/util/Set;", "getPreferredFeatureGroup", "getUseCases", "isLegacy", "", "()Z", "sessionType", "getSessionType", "()I", "value", "Landroidx/core/util/Consumer;", "featureSelectionListener", "getFeatureSelectionListener", "()Landroidx/core/util/Consumer;", "Ljava/util/concurrent/Executor;", "featureSelectionListenerExecutor", "getFeatureSelectionListenerExecutor", "()Ljava/util/concurrent/Executor;", "validateFrameRate", "", "validateFeatureGroups", "validateRequiredFeatures", "validateDefaultGroupableFeatureValues", "getUseCaseName", "", "setFeatureSelectionListener", "executor", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "Builder", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public class SessionConfig {
    private final List<CameraEffect> effects;
    private Consumer<Set<GroupableFeature>> featureSelectionListener;
    private Executor featureSelectionListenerExecutor;
    private final Range<Integer> frameRateRange;
    private final boolean isLegacy;
    private final List<GroupableFeature> preferredFeatureGroup;
    private final Set<GroupableFeature> requiredFeatureGroup;
    private final int sessionType;
    private final List<UseCase> useCases;
    private final ViewPort viewPort;

    /* compiled from: SessionConfig.kt */
    @Metadata(k = 3, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public /* sintético */ class WhenMappings {
        public static final /* sintético */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[FeatureTypeInternal.values().length];
            try {
                iArr[FeatureTypeInternal.DYNAMIC_RANGE.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[FeatureTypeInternal.FPS_RANGE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[FeatureTypeInternal.VIDEO_STABILIZATION.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[FeatureTypeInternal.IMAGE_FORMAT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public SessionConfig(List<? extends UseCase> useCases, ViewPort viewPort, List<? extends CameraEffect> effects, Range<Integer> frameRateRange, Set<? extends GroupableFeature> requiredFeatureGroup, List<? extends GroupableFeature> preferredFeatureGroup) {
        Intrinsics.checkNotNullParameter(useCases, "useCases");
        Intrinsics.checkNotNullParameter(effects, "effects");
        Intrinsics.checkNotNullParameter(frameRateRange, "frameRateRange");
        Intrinsics.checkNotNullParameter(requiredFeatureGroup, "requiredFeatureGroup");
        Intrinsics.checkNotNullParameter(preferredFeatureGroup, "preferredFeatureGroup");
        this.viewPort = viewPort;
        this.effects = effects;
        this.frameRateRange = frameRateRange;
        this.requiredFeatureGroup = requiredFeatureGroup;
        this.preferredFeatureGroup = preferredFeatureGroup;
        this.useCases = CollectionsKt.distinct(useCases);
        this.featureSelectionListener = new Consumer() { // da classe: androidx.camera.core.SessionConfig$$ExternalSyntheticLambda0
            @Override // androidx.core.util.Consumer
            public final void accept(Object obj) {
                SessionConfig.featureSelectionListener$lambda$0((Set) obj);
            }
        };
        ScheduledExecutorService mainThreadExecutor = CameraXExecutors.mainThreadExecutor();
        Intrinsics.checkNotNullExpressionValue(mainThreadExecutor, "mainThreadExecutor(...)");
        this.featureSelectionListenerExecutor = mainThreadExecutor;
        validateFrameRate();
        validateFeatureGroups();
    }

    public /* sintético */ SessionConfig(List list, ViewPort viewPort, List list2, Range range, Set set, List list3, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(list, (i & 2) != 0 ? null : viewPort, (i & 4) != 0 ? CollectionsKt.emptyList() : list2, (i & 8) != 0 ? StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED : range, (i & 16) != 0 ? SetsKt.emptySet() : set, (i & 32) != 0 ? CollectionsKt.emptyList() : list3);
    }

    public final ViewPort getViewPort() {
        return this.viewPort;
    }

    public final List<CameraEffect> getEffects() {
        return this.effects;
    }

    public final Range<Integer> getFrameRateRange() {
        return this.frameRateRange;
    }

    public final Set<GroupableFeature> getRequiredFeatureGroup() {
        return this.requiredFeatureGroup;
    }

    public final List<GroupableFeature> getPreferredFeatureGroup() {
        return this.preferredFeatureGroup;
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public SessionConfig(List<? extends UseCase> useCases) {
        this(useCases, null, null, null, null, null, 62, null);
        Intrinsics.checkNotNullParameter(useCases, "useCases");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public SessionConfig(List<? extends UseCase> useCases, ViewPort viewPort) {
        this(useCases, viewPort, null, null, null, null, 60, null);
        Intrinsics.checkNotNullParameter(useCases, "useCases");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public SessionConfig(List<? extends UseCase> useCases, ViewPort viewPort, List<? extends CameraEffect> effects) {
        this(useCases, viewPort, effects, null, null, null, 56, null);
        Intrinsics.checkNotNullParameter(useCases, "useCases");
        Intrinsics.checkNotNullParameter(effects, "effects");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public SessionConfig(List<? extends UseCase> useCases, ViewPort viewPort, List<? extends CameraEffect> effects, Range<Integer> frameRateRange) {
        this(useCases, viewPort, effects, frameRateRange, null, null, 48, null);
        Intrinsics.checkNotNullParameter(useCases, "useCases");
        Intrinsics.checkNotNullParameter(effects, "effects");
        Intrinsics.checkNotNullParameter(frameRateRange, "frameRateRange");
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public SessionConfig(List<? extends UseCase> useCases, ViewPort viewPort, List<? extends CameraEffect> effects, Range<Integer> frameRateRange, Set<? extends GroupableFeature> requiredFeatureGroup) {
        this(useCases, viewPort, effects, frameRateRange, requiredFeatureGroup, null, 32, null);
        Intrinsics.checkNotNullParameter(useCases, "useCases");
        Intrinsics.checkNotNullParameter(effects, "effects");
        Intrinsics.checkNotNullParameter(frameRateRange, "frameRateRange");
        Intrinsics.checkNotNullParameter(requiredFeatureGroup, "requiredFeatureGroup");
    }

    public final List<UseCase> getUseCases() {
        return this.useCases;
    }

    /* renomeado de: isLegacy, motivo: de getter */
    public boolean getIsLegacy() {
        return this.isLegacy;
    }

    public int getSessionType() {
        return this.sessionType;
    }

    public final Consumer<Set<GroupableFeature>> getFeatureSelectionListener() {
        return this.featureSelectionListener;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final void featureSelectionListener$lambda$0(Set it) {
    }

    public final Executor getFeatureSelectionListenerExecutor() {
        return this.featureSelectionListenerExecutor;
    }

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    public SessionConfig(UseCase... useCases) {
        this(ArraysKt.toList(useCases), null, null, null, null, null, 62, null);
        Intrinsics.checkNotNullParameter(useCases, "useCases");
    }

    private final void validateFrameRate() {
        if (Intrinsics.areEqual(this.frameRateRange, StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
            return;
        }
        for (UseCase useCase : this.useCases) {
            if (useCase.getAppConfig().hasTargetFrameRate()) {
                throw new IllegalArgumentException("Can't set target frame rate on a UseCase (by Preview.Builder.setTargetFrameRate() or VideoCapture.Builder.setTargetFrameRate()) if the frame rate range has already been set in the SessionConfig.".toString());
            }
        }
    }

    private final void validateFeatureGroups() {
        if (this.requiredFeatureGroup.isEmpty() && this.preferredFeatureGroup.isEmpty()) {
            return;
        }
        validateRequiredFeatures();
        if (!(CollectionsKt.distinct(this.preferredFeatureGroup).size() == this.preferredFeatureGroup.size())) {
            throw new IllegalArgumentException(("Duplicate values in preferredFeatures(" + this.preferredFeatureGroup + ')').toString());
        }
        Set duplicateFeatures = CollectionsKt.intersect(this.requiredFeatureGroup, this.preferredFeatureGroup);
        if (!duplicateFeatures.isEmpty()) {
            throw new IllegalArgumentException(("requiredFeatures and preferredFeatures have duplicate values: " + duplicateFeatures).toString());
        }
        Iterable $this$forEach$iv = this.useCases;
        for (Object element$iv : $this$forEach$iv) {
            UseCase useCase = (UseCase) element$iv;
            if (!(UseCaseType.INSTANCE.getFeatureGroupUseCaseType(useCase) != UseCaseType.UNDEFINED)) {
                throw new IllegalArgumentException((useCase + " is not supported with feature group").toString());
            }
            validateDefaultGroupableFeatureValues(useCase);
        }
        if (!this.effects.isEmpty()) {
            throw new IllegalArgumentException("Effects aren't supported with feature group yet".toString());
        }
    }

    private final void validateRequiredFeatures() {
        Iterable $this$map$iv = this.requiredFeatureGroup;
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            GroupableFeature it = (GroupableFeature) item$iv$iv;
            destination$iv$iv.add(it.getFeatureTypeInternal());
        }
        Iterable requiredFeatureTypes = CollectionsKt.distinct((List) destination$iv$iv);
        Iterable $this$forEach$iv = requiredFeatureTypes;
        for (Object element$iv : $this$forEach$iv) {
            FeatureTypeInternal featureType = (FeatureTypeInternal) element$iv;
            Iterable $this$filter$iv = this.requiredFeatureGroup;
            Collection destination$iv$iv2 = new ArrayList();
            for (Object element$iv$iv : $this$filter$iv) {
                GroupableFeature it2 = (GroupableFeature) element$iv$iv;
                if (it2.getFeatureTypeInternal() == featureType) {
                    destination$iv$iv2.add(element$iv$iv);
                }
            }
            List distinctFeaturesPerType = (List) destination$iv$iv2;
            if (!(distinctFeaturesPerType.size() <= 1)) {
                throw new IllegalArgumentException(("requiredFeatures has conflicting feature values: " + distinctFeaturesPerType).toString());
            }
        }
    }

    private final void validateDefaultGroupableFeatureValues(UseCase $this$validateDefaultGroupableFeatureValues) {
        String str;
        String str2;
        String str3;
        String useCaseName = getUseCaseName($this$validateDefaultGroupableFeatureValues);
        FeatureTypeInternal conflictingFeatureType = UseCaseType.INSTANCE.getAppConfiguredGroupableFeatureType$camera_core_release($this$validateDefaultGroupableFeatureValues);
        if (conflictingFeatureType == null) {
            return;
        }
        StringBuilder append = new StringBuilder().append("A ");
        Intrinsics.checkNotNull(conflictingFeatureType);
        StringBuilder append2 = append.append(conflictingFeatureType.name()).append(" value is set to ").append(useCaseName).append(" despite using feature groups. Do not use APIs like ").append(useCaseName).append(".Builder.");
        switch (WhenMappings.$EnumSwitchMapping$0[conflictingFeatureType.ordinal()]) {
            case 1:
                str = "setDynamicRange";
                break;
            case 2:
                str = "setTargetFrameRateRange";
                break;
            case 3:
                if (!CameraUseCaseAdapter.isVideoCapture($this$validateDefaultGroupableFeatureValues)) {
                    str = "setPreviewStabilizationEnabled";
                    break;
                } else {
                    str = "setVideoStabilizationEnabled";
                    break;
                }
            case 4:
                str = "setOutputFormat";
                break;
            default:
                throw new NoWhenBranchMatchedException();
        }
        StringBuilder append3 = append2.append(str).append(" while using feature groups. If ");
        switch (WhenMappings.$EnumSwitchMapping$0[conflictingFeatureType.ordinal()]) {
            case 1:
                str2 = "HDR";
                break;
            case 2:
                str2 = "60 FPS";
                break;
            case 3:
                str2 = "stabilization";
                break;
            case 4:
                str2 = "JPEG_R output format";
                break;
            default:
                throw new NoWhenBranchMatchedException();
        }
        StringBuilder append4 = append3.append(str2).append(" is required, instead set ");
        switch (WhenMappings.$EnumSwitchMapping$0[conflictingFeatureType.ordinal()]) {
            case 1:
                str3 = "GroupableFeature.HDR_HLG10";
                break;
            case 2:
                str3 = "GroupableFeature.FPS_60";
                break;
            case 3:
                str3 = "GroupableFeature.PREVIEW_STABILIZATION";
                break;
            case 4:
                str3 = "GroupableFeature.IMAGE_ULTRA_HDR";
                break;
            default:
                throw new NoWhenBranchMatchedException();
        }
        throw new IllegalArgumentException(append4.append(str3).append(" as either a required or preferred feature.").toString().toString());
    }

    private final String getUseCaseName(UseCase $this$getUseCaseName) {
        if ($this$getUseCaseName instanceof Preview) {
            return "Preview";
        }
        if ($this$getUseCaseName instanceof ImageCapture) {
            return "ImageCapture";
        }
        if ($this$getUseCaseName instanceof ImageAnalysis) {
            return "ImageAnalysis";
        }
        if (CameraUseCaseAdapter.isVideoCapture($this$getUseCaseName)) {
            return "VideoCapture";
        }
        return "UseCase";
    }

    public static /* sintético */ void setFeatureSelectionListener$default(SessionConfig sessionConfig, Executor executor, Consumer consumer, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: setFeatureSelectionListener");
        }
        if ((i & 1) != 0) {
            executor = CameraXExecutors.mainThreadExecutor();
        }
        sessionConfig.setFeatureSelectionListener(executor, consumer);
    }

    public final void setFeatureSelectionListener(Executor executor, Consumer<Set<GroupableFeature>> listener) {
        Intrinsics.checkNotNullParameter(executor, "executor");
        Intrinsics.checkNotNullParameter(listener, "listener");
        this.featureSelectionListener = listener;
        this.featureSelectionListenerExecutor = executor;
    }

    public final void setFeatureSelectionListener(Consumer<Set<GroupableFeature>> listener) {
        Intrinsics.checkNotNullParameter(listener, "listener");
        setFeatureSelectionListener$default(this, null, listener, 1, null);
    }

    /* compiled from: SessionConfig.kt */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0004\b\u0005\u0010\u0006B\u001d\b\u0016\u0012\u0012\u0010\u0002\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00040\u0007\"\u00020\u0004¢\u0006\u0004\b\u0005\u0010\bJ\u000e\u0010\u0014\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\nJ\u000e\u0010\u0015\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\rJ\u0014\u0010\u0017\u001a\u00020\u00002\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000fJ\u001f\u0010\u0018\u001a\u00020\u00002\u0012\u0010\u0019\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00120\u0007\"\u00020\u0012¢\u0006\u0002\u0010\u001aJ\u001f\u0010\u001b\u001a\u00020\u00002\u0012\u0010\u0019\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00120\u0007\"\u00020\u0012¢\u0006\u0002\u0010\u001aJ\u0006\u0010\u001c\u001a\u00020\u001dR\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00120\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001e"}, d2 = {"Landroidx/camera/core/SessionConfig$Builder;", "", "useCases", "", "Landroidx/camera/core/UseCase;", "<init>", "(Ljava/util/List;)V", "", "([Landroidx/camera/core/UseCase;)V", "viewPort", "Landroidx/camera/core/ViewPort;", "effects", "", "Landroidx/camera/core/CameraEffect;", "frameRateRange", "Landroid/util/Range;", "", "requiredFeatureGroup", "Landroidx/camera/core/featuregroup/GroupableFeature;", "preferredFeatureGroup", "setViewPort", "addEffect", "effect", "setFrameRateRange", "setRequiredFeatureGroup", "features", "([Landroidx/camera/core/featuregroup/GroupableFeature;)Landroidx/camera/core/SessionConfig$Builder;", "setPreferredFeatureGroup", "build", "Landroidx/camera/core/SessionConfig;", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Builder {
        private List<CameraEffect> effects;
        private Range<Integer> frameRateRange;
        private final List<GroupableFeature> preferredFeatureGroup;
        private final List<GroupableFeature> requiredFeatureGroup;
        private final List<UseCase> useCases;
        private ViewPort viewPort;

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public Builder(List<? extends UseCase> useCases) {
            Intrinsics.checkNotNullParameter(useCases, "useCases");
            this.useCases = useCases;
            this.effects = new ArrayList();
            Range<Integer> FRAME_RATE_RANGE_UNSPECIFIED = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
            Intrinsics.checkNotNullExpressionValue(FRAME_RATE_RANGE_UNSPECIFIED, "FRAME_RATE_RANGE_UNSPECIFIED");
            this.frameRateRange = FRAME_RATE_RANGE_UNSPECIFIED;
            this.requiredFeatureGroup = new ArrayList();
            this.preferredFeatureGroup = new ArrayList();
        }

        /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
        public Builder(UseCase... useCases) {
            this((List<? extends UseCase>) ArraysKt.toList(useCases));
            Intrinsics.checkNotNullParameter(useCases, "useCases");
        }

        public final Builder setViewPort(ViewPort viewPort) {
            Intrinsics.checkNotNullParameter(viewPort, "viewPort");
            this.viewPort = viewPort;
            return this;
        }

        public final Builder addEffect(CameraEffect effect) {
            Intrinsics.checkNotNullParameter(effect, "effect");
            this.effects.add(effect);
            return this;
        }

        public final Builder setFrameRateRange(Range<Integer> frameRateRange) {
            Intrinsics.checkNotNullParameter(frameRateRange, "frameRateRange");
            this.frameRateRange = frameRateRange;
            return this;
        }

        public final Builder setRequiredFeatureGroup(GroupableFeature... features) {
            Intrinsics.checkNotNullParameter(features, "features");
            this.requiredFeatureGroup.clear();
            CollectionsKt.addAll(this.requiredFeatureGroup, features);
            return this;
        }

        public final Builder setPreferredFeatureGroup(GroupableFeature... features) {
            Intrinsics.checkNotNullParameter(features, "features");
            this.preferredFeatureGroup.clear();
            CollectionsKt.addAll(this.preferredFeatureGroup, features);
            return this;
        }

        public final SessionConfig build() {
            return new SessionConfig(this.useCases, this.viewPort, CollectionsKt.toList(this.effects), this.frameRateRange, CollectionsKt.toSet(this.requiredFeatureGroup), CollectionsKt.toList(this.preferredFeatureGroup));
        }
    }
}
