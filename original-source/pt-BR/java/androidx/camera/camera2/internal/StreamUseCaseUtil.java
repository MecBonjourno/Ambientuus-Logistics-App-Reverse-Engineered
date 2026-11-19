package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.internal.SupportedSurfaceCombination;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.AttachedSurfaceInfo;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.SurfaceConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.streamsharing.StreamSharingConfig;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.util.Preconditions;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.collections.SetsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;

/* compiled from: StreamUseCaseUtil.kt */
@Metadata(d1 = {"\u0000\u009c\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010$\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\r\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J<\u0010\u000e\u001a\u00020\u000f2\f\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u00112\u0010\u0010\u0013\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00140\u00112\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0017\u0012\u0004\u0012\u00020\b0\u0016H\u0007J\u0014\u0010\u0018\u001a\u00020\u00192\n\u0010\u001a\u001a\u0006\u0012\u0002\b\u00030\u0014H\u0007J\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0007J\u0010\u0010\u001f\u001a\u00020\u001c2\u0006\u0010 \u001a\u00020!H\u0007JJ\u0010\"\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\f\u0010#\u001a\b\u0012\u0004\u0012\u00020%0$2\u0016\u0010&\u001a\u0012\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0014\u0012\u0004\u0012\u00020'0\u00162\u0012\u0010(\u001a\u000e\u0012\u0004\u0012\u00020%\u0012\u0004\u0012\u00020'0\u0016H\u0007J\u001e\u0010)\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\f\u0010*\u001a\b\u0012\u0004\u0012\u00020+0$H\u0007J&\u0010,\u001a\u00020\u001c2\u0006\u0010-\u001a\u00020\f2\u0006\u0010.\u001a\u00020\b2\f\u0010/\u001a\b\u0012\u0004\u0012\u00020\f00H\u0002JD\u00101\u001a\u00020\u001c2\u0014\u00102\u001a\u0010\u0012\u0004\u0012\u000203\u0012\u0006\u0012\u0004\u0018\u00010%0\n2\u0016\u00104\u001a\u0012\u0012\u0004\u0012\u000203\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00140\n2\f\u00105\u001a\b\u0012\u0004\u0012\u00020+00H\u0007Jn\u00106\u001a\u00020\u000f2\u0016\u0010&\u001a\u0012\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0014\u0012\u0004\u0012\u00020'0\u00162\u0012\u0010(\u001a\u000e\u0012\u0004\u0012\u00020%\u0012\u0004\u0012\u00020'0\u00162\u0012\u00102\u001a\u000e\u0012\u0004\u0012\u000203\u0012\u0004\u0012\u00020%0\n2\u0016\u00104\u001a\u0012\u0012\u0004\u0012\u000203\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00140\n2\f\u00105\u001a\b\u0012\u0004\u0012\u00020+00H\u0007J!\u00107\u001a\u0004\u0018\u0001082\u0006\u00109\u001a\u0002082\b\u0010.\u001a\u0004\u0018\u00010\bH\u0002¢\u0006\u0002\u0010:J(\u0010;\u001a\u00020\u001c2\f\u0010#\u001a\b\u0012\u0004\u0012\u00020%002\u0010\u0010<\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u001400H\u0007J\u0018\u0010=\u001a\u00020\u001c2\u0006\u0010>\u001a\u0002082\u0006\u0010-\u001a\u00020\fH\u0002J$\u0010?\u001a\u00020\u001c2\f\u0010@\u001a\b\u0012\u0004\u0012\u00020\b0\u000b2\f\u0010A\u001a\b\u0012\u0004\u0012\u00020\b0\u000bH\u0002J\b\u0010B\u001a\u00020\u000fH\u0002J6\u0010C\u001a\u00020\u001c2\f\u0010#\u001a\b\u0012\u0004\u0012\u00020%002\u0010\u0010<\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0014002\f\u0010D\u001a\b\u0012\u0004\u0012\u00020\b0\u000bH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00078\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R \u0010\t\u001a\u0014\u0012\u0004\u0012\u00020\b\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\r\u001a\u0014\u0012\u0004\u0012\u00020\b\u0012\n\u0012\b\u0012\u0004\u0012\u00020\f0\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006E"}, d2 = {"Landroidx/camera/camera2/internal/StreamUseCaseUtil;", "", "<init>", "()V", "TAG", "", "STREAM_USE_CASE_STREAM_SPEC_OPTION", "Landroidx/camera/core/impl/Config$Option;", "", "STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP", "", "", "Landroidx/camera/core/impl/UseCaseConfigFactory$CaptureType;", "STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP", "populateSurfaceToStreamUseCaseMapping", "", "sessionConfigs", "", "Landroidx/camera/core/impl/SessionConfig;", "useCaseConfigs", "Landroidx/camera/core/impl/UseCaseConfig;", "streamUseCaseMap", "", "Landroidx/camera/core/impl/DeferrableSurface;", "getStreamSpecImplementationOptions", "Landroidx/camera/camera2/impl/Camera2ImplConfig;", "useCaseConfig", "isStreamUseCaseSupported", "", "characteristicsCompat", "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;", "shouldUseStreamUseCase", "featureSettings", "Landroidx/camera/camera2/internal/SupportedSurfaceCombination$FeatureSettings;", "populateStreamUseCaseStreamSpecOptionWithInteropOverride", "attachedSurfaces", "", "Landroidx/camera/core/impl/AttachedSurfaceInfo;", "suggestedStreamSpecMap", "Landroidx/camera/core/impl/StreamSpec;", "attachedSurfaceStreamSpecMap", "areStreamUseCasesAvailableForSurfaceConfigs", "surfaceConfigs", "Landroidx/camera/core/impl/SurfaceConfig;", "isEligibleCaptureType", "captureType", "streamUseCase", "streamSharingTypes", "", "areCaptureTypesEligible", "surfaceConfigIndexAttachedSurfaceInfoMap", "", "surfaceConfigIndexUseCaseConfigMap", "surfaceConfigsWithStreamUseCase", "populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs", "getUpdatedImplementationOptionsWithUseCaseStreamSpecOption", "Landroidx/camera/core/impl/Config;", "oldImplementationOptions", "(Landroidx/camera/core/impl/Config;Ljava/lang/Long;)Landroidx/camera/core/impl/Config;", "containsZslUseCase", "newUseCaseConfigs", "isZslUseCase", "config", "areStreamUseCasesAvailable", "availableStreamUseCasesSet", "streamUseCases", "throwInvalidCamera2InteropOverrideException", "isValidCamera2InteropOverride", "availableStreamUseCases", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class StreamUseCaseUtil {
    public static final StreamUseCaseUtil INSTANCE = new StreamUseCaseUtil();
    public static final Config.Option<Long> STREAM_USE_CASE_STREAM_SPEC_OPTION;
    private static final Map<Long, Set<UseCaseConfigFactory.CaptureType>> STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP;
    private static final Map<Long, Set<UseCaseConfigFactory.CaptureType>> STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP;
    private static final String TAG = "StreamUseCaseUtil";

    private StreamUseCaseUtil() {
    }

    static {
        Class cls = Long.TYPE;
        Intrinsics.checkNotNull(cls);
        Config.Option<Long> create = Config.Option.create("camera2.streamSpec.streamUseCase", cls);
        Intrinsics.checkNotNullExpressionValue(create, "create(...)");
        STREAM_USE_CASE_STREAM_SPEC_OPTION = create;
        Map $this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240 = MapsKt.createMapBuilder();
        if (Build.VERSION.SDK_INT >= 33) {
            $this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240.put(4L, SetsKt.setOf((Object[]) new UseCaseConfigFactory.CaptureType[]{UseCaseConfigFactory.CaptureType.PREVIEW, UseCaseConfigFactory.CaptureType.METERING_REPEATING, UseCaseConfigFactory.CaptureType.IMAGE_ANALYSIS}));
            $this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240.put(1L, SetsKt.setOf((Object[]) new UseCaseConfigFactory.CaptureType[]{UseCaseConfigFactory.CaptureType.PREVIEW, UseCaseConfigFactory.CaptureType.METERING_REPEATING, UseCaseConfigFactory.CaptureType.IMAGE_ANALYSIS}));
            $this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240.put(2L, SetsKt.setOf(UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE));
            $this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240.put(3L, SetsKt.setOf(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE));
        }
        STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP = MapsKt.build($this$STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP_u24lambda_u240);
        Map $this$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP_u24lambda_u241 = MapsKt.createMapBuilder();
        if (Build.VERSION.SDK_INT >= 33) {
            $this$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP_u24lambda_u241.put(4L, SetsKt.setOf((Object[]) new UseCaseConfigFactory.CaptureType[]{UseCaseConfigFactory.CaptureType.PREVIEW, UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE, UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE}));
            $this$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP_u24lambda_u241.put(3L, SetsKt.setOf((Object[]) new UseCaseConfigFactory.CaptureType[]{UseCaseConfigFactory.CaptureType.PREVIEW, UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE}));
        }
        STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP = MapsKt.build($this$STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP_u24lambda_u241);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @JvmStatic
    public static final void populateSurfaceToStreamUseCaseMapping(Collection<SessionConfig> sessionConfigs, Collection<? extends UseCaseConfig<?>> useCaseConfigs, Map<DeferrableSurface, Long> streamUseCaseMap) {
        Intrinsics.checkNotNullParameter(sessionConfigs, "sessionConfigs");
        Intrinsics.checkNotNullParameter(useCaseConfigs, "useCaseConfigs");
        Intrinsics.checkNotNullParameter(streamUseCaseMap, "streamUseCaseMap");
        int position = 0;
        boolean hasStreamUseCase = false;
        ArrayList useCaseConfigArrayList = new ArrayList(useCaseConfigs);
        Iterator<SessionConfig> it = sessionConfigs.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            SessionConfig sessionConfig = it.next();
            if (sessionConfig.getImplementationOptions().containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION) && sessionConfig.getSurfaces().size() != 1) {
                StringCompanionObject stringCompanionObject = StringCompanionObject.INSTANCE;
                String format = String.format("SessionConfig has stream use case but also contains %d surfaces, abort populateSurfaceToStreamUseCaseMapping().", Arrays.copyOf(new Object[]{Integer.valueOf(sessionConfig.getSurfaces().size())}, 1));
                Intrinsics.checkNotNullExpressionValue(format, "format(...)");
                Logger.e(TAG, format);
                return;
            }
            if (sessionConfig.getImplementationOptions().containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION)) {
                hasStreamUseCase = true;
                break;
            }
        }
        if (hasStreamUseCase) {
            for (SessionConfig sessionConfig2 : sessionConfigs) {
                if (((UseCaseConfig) useCaseConfigArrayList.get(position)).getCaptureType() == UseCaseConfigFactory.CaptureType.METERING_REPEATING) {
                    Intrinsics.checkNotNullExpressionValue(sessionConfig2.getSurfaces(), "getSurfaces(...)");
                    Preconditions.checkState(!r8.isEmpty(), "MeteringRepeating should contain a surface");
                    streamUseCaseMap.put(sessionConfig2.getSurfaces().get(0), 1L);
                } else if (sessionConfig2.getImplementationOptions().containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION)) {
                    List<DeferrableSurface> surfaces = sessionConfig2.getSurfaces();
                    Intrinsics.checkNotNullExpressionValue(surfaces, "getSurfaces(...)");
                    if (!surfaces.isEmpty()) {
                        DeferrableSurface deferrableSurface = sessionConfig2.getSurfaces().get(0);
                        Object retrieveOption = sessionConfig2.getImplementationOptions().retrieveOption(STREAM_USE_CASE_STREAM_SPEC_OPTION);
                        Intrinsics.checkNotNull(retrieveOption);
                        streamUseCaseMap.put(deferrableSurface, retrieveOption);
                    }
                }
                position++;
            }
        }
        Logger.d(TAG, "populateSurfaceToStreamUseCaseMapping() - streamUseCaseMap = " + streamUseCaseMap);
    }

    @JvmStatic
    public static final Camera2ImplConfig getStreamSpecImplementationOptions(UseCaseConfig<?> useCaseConfig) {
        Intrinsics.checkNotNullParameter(useCaseConfig, "useCaseConfig");
        MutableOptionsBundle optionsBundle = MutableOptionsBundle.create();
        Intrinsics.checkNotNullExpressionValue(optionsBundle, "create(...)");
        if (useCaseConfig.containsOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)) {
            optionsBundle.insertOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION, useCaseConfig.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION));
        }
        if (useCaseConfig.containsOption(UseCaseConfig.OPTION_ZSL_DISABLED)) {
            optionsBundle.insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, useCaseConfig.retrieveOption(UseCaseConfig.OPTION_ZSL_DISABLED));
        }
        if (useCaseConfig.containsOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE)) {
            optionsBundle.insertOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE, useCaseConfig.retrieveOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE));
        }
        if (useCaseConfig.containsOption(UseCaseConfig.OPTION_INPUT_FORMAT)) {
            optionsBundle.insertOption(UseCaseConfig.OPTION_INPUT_FORMAT, useCaseConfig.retrieveOption(UseCaseConfig.OPTION_INPUT_FORMAT));
        }
        return new Camera2ImplConfig(optionsBundle);
    }

    @JvmStatic
    public static final boolean isStreamUseCaseSupported(CameraCharacteristicsCompat characteristicsCompat) {
        long[] availableStreamUseCases;
        Intrinsics.checkNotNullParameter(characteristicsCompat, "characteristicsCompat");
        if (Build.VERSION.SDK_INT >= 33 && (availableStreamUseCases = (long[]) characteristicsCompat.get(CameraCharacteristics.SCALER_AVAILABLE_STREAM_USE_CASES)) != null) {
            return !(availableStreamUseCases.length == 0);
        }
        return false;
    }

    @JvmStatic
    public static final boolean shouldUseStreamUseCase(SupportedSurfaceCombination.FeatureSettings featureSettings) {
        Intrinsics.checkNotNullParameter(featureSettings, "featureSettings");
        return featureSettings.getCameraMode() == 0 && featureSettings.getRequiredMaxBitDepth() == 8 && !featureSettings.isHighSpeedOn();
    }

    @JvmStatic
    public static final boolean populateStreamUseCaseStreamSpecOptionWithInteropOverride(CameraCharacteristicsCompat characteristicsCompat, List<AttachedSurfaceInfo> attachedSurfaces, Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap, Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap) {
        Intrinsics.checkNotNullParameter(characteristicsCompat, "characteristicsCompat");
        Intrinsics.checkNotNullParameter(attachedSurfaces, "attachedSurfaces");
        Intrinsics.checkNotNullParameter(suggestedStreamSpecMap, "suggestedStreamSpecMap");
        Intrinsics.checkNotNullParameter(attachedSurfaceStreamSpecMap, "attachedSurfaceStreamSpecMap");
        if (Build.VERSION.SDK_INT < 33) {
            return false;
        }
        List<UseCaseConfig> newUseCaseConfigs = new ArrayList(suggestedStreamSpecMap.keySet());
        Iterator<AttachedSurfaceInfo> it = attachedSurfaces.iterator();
        while (it.hasNext()) {
            Preconditions.checkNotNull(it.next().getImplementationOptions());
        }
        for (UseCaseConfig useCaseConfig : newUseCaseConfigs) {
            Preconditions.checkNotNull(((StreamSpec) Preconditions.checkNotNull(suggestedStreamSpecMap.get(useCaseConfig))).getImplementationOptions());
        }
        long[] availableStreamUseCases = (long[]) characteristicsCompat.get(CameraCharacteristics.SCALER_AVAILABLE_STREAM_USE_CASES);
        if (availableStreamUseCases != null) {
            if (!(availableStreamUseCases.length == 0)) {
                Set availableStreamUseCaseSet = new HashSet();
                for (long availableStreamUseCase : availableStreamUseCases) {
                    availableStreamUseCaseSet.add(Long.valueOf(availableStreamUseCase));
                }
                if (!INSTANCE.isValidCamera2InteropOverride(attachedSurfaces, newUseCaseConfigs, availableStreamUseCaseSet)) {
                    return false;
                }
                for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
                    Config oldImplementationOptions = attachedSurfaceInfo.getImplementationOptions();
                    StreamUseCaseUtil streamUseCaseUtil = INSTANCE;
                    Intrinsics.checkNotNull(oldImplementationOptions);
                    Config it2 = streamUseCaseUtil.getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions, (Long) oldImplementationOptions.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION));
                    if (it2 != null) {
                        attachedSurfaceStreamSpecMap.put(attachedSurfaceInfo, attachedSurfaceInfo.toStreamSpec(it2));
                    }
                }
                for (UseCaseConfig newUseCaseConfig : newUseCaseConfigs) {
                    StreamSpec oldStreamSpec = suggestedStreamSpecMap.get(newUseCaseConfig);
                    Intrinsics.checkNotNull(oldStreamSpec);
                    Config oldImplementationOptions2 = oldStreamSpec.getImplementationOptions();
                    StreamUseCaseUtil streamUseCaseUtil2 = INSTANCE;
                    Intrinsics.checkNotNull(oldImplementationOptions2);
                    Config it3 = streamUseCaseUtil2.getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions2, (Long) oldImplementationOptions2.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION));
                    if (it3 != null) {
                        suggestedStreamSpecMap.put(newUseCaseConfig, oldStreamSpec.toBuilder().setImplementationOptions(it3).build());
                    }
                }
                return true;
            }
        }
        return false;
    }

    @JvmStatic
    public static final boolean areStreamUseCasesAvailableForSurfaceConfigs(CameraCharacteristicsCompat characteristicsCompat, List<SurfaceConfig> surfaceConfigs) {
        long[] availableStreamUseCases;
        Intrinsics.checkNotNullParameter(characteristicsCompat, "characteristicsCompat");
        Intrinsics.checkNotNullParameter(surfaceConfigs, "surfaceConfigs");
        if (Build.VERSION.SDK_INT >= 33 && (availableStreamUseCases = (long[]) characteristicsCompat.get(CameraCharacteristics.SCALER_AVAILABLE_STREAM_USE_CASES)) != null) {
            if (!(availableStreamUseCases.length == 0)) {
                Set availableStreamUseCaseSet = new HashSet();
                for (long availableStreamUseCase : availableStreamUseCases) {
                    availableStreamUseCaseSet.add(Long.valueOf(availableStreamUseCase));
                }
                for (SurfaceConfig surfaceConfig : surfaceConfigs) {
                    if (!availableStreamUseCaseSet.contains(Long.valueOf(surfaceConfig.getStreamUseCase().getValue()))) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    private final boolean isEligibleCaptureType(UseCaseConfigFactory.CaptureType captureType, long streamUseCase, List<? extends UseCaseConfigFactory.CaptureType> streamSharingTypes) {
        if (Build.VERSION.SDK_INT < 33) {
            return false;
        }
        if (captureType == UseCaseConfigFactory.CaptureType.STREAM_SHARING) {
            if (!STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP.containsKey(Long.valueOf(streamUseCase))) {
                return false;
            }
            Set set = STREAM_USE_CASE_TO_ELIGIBLE_STREAM_SHARING_CHILDREN_TYPES_MAP.get(Long.valueOf(streamUseCase));
            Intrinsics.checkNotNull(set);
            Set captureTypes = set;
            if (streamSharingTypes.size() != captureTypes.size()) {
                return false;
            }
            for (UseCaseConfigFactory.CaptureType childType : streamSharingTypes) {
                if (!captureTypes.contains(childType)) {
                    return false;
                }
            }
            return true;
        }
        if (!STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.containsKey(Long.valueOf(streamUseCase))) {
            return false;
        }
        Set<UseCaseConfigFactory.CaptureType> set2 = STREAM_USE_CASE_TO_ELIGIBLE_CAPTURE_TYPES_MAP.get(Long.valueOf(streamUseCase));
        Intrinsics.checkNotNull(set2);
        return set2.contains(captureType);
    }

    @JvmStatic
    public static final boolean areCaptureTypesEligible(Map<Integer, ? extends AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap, Map<Integer, ? extends UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap, List<SurfaceConfig> surfaceConfigsWithStreamUseCase) {
        List<UseCaseConfigFactory.CaptureType> emptyList;
        UseCaseConfigFactory.CaptureType captureType;
        Intrinsics.checkNotNullParameter(surfaceConfigIndexAttachedSurfaceInfoMap, "surfaceConfigIndexAttachedSurfaceInfoMap");
        Intrinsics.checkNotNullParameter(surfaceConfigIndexUseCaseConfigMap, "surfaceConfigIndexUseCaseConfigMap");
        Intrinsics.checkNotNullParameter(surfaceConfigsWithStreamUseCase, "surfaceConfigsWithStreamUseCase");
        int size = surfaceConfigsWithStreamUseCase.size();
        for (int i = 0; i < size; i++) {
            long streamUseCase = surfaceConfigsWithStreamUseCase.get(i).getStreamUseCase().getValue();
            if (surfaceConfigIndexAttachedSurfaceInfoMap.containsKey(Integer.valueOf(i))) {
                AttachedSurfaceInfo attachedSurfaceInfo = surfaceConfigIndexAttachedSurfaceInfoMap.get(Integer.valueOf(i));
                StreamUseCaseUtil streamUseCaseUtil = INSTANCE;
                Intrinsics.checkNotNull(attachedSurfaceInfo);
                if (attachedSurfaceInfo.getCaptureTypes().size() == 1) {
                    captureType = attachedSurfaceInfo.getCaptureTypes().get(0);
                } else {
                    captureType = UseCaseConfigFactory.CaptureType.STREAM_SHARING;
                }
                Intrinsics.checkNotNull(captureType);
                List<UseCaseConfigFactory.CaptureType> captureTypes = attachedSurfaceInfo.getCaptureTypes();
                Intrinsics.checkNotNullExpressionValue(captureTypes, "getCaptureTypes(...)");
                if (!streamUseCaseUtil.isEligibleCaptureType(captureType, streamUseCase, captureTypes)) {
                    return false;
                }
            } else if (surfaceConfigIndexUseCaseConfigMap.containsKey(Integer.valueOf(i))) {
                UseCaseConfig useCaseConfig = surfaceConfigIndexUseCaseConfigMap.get(Integer.valueOf(i));
                Intrinsics.checkNotNull(useCaseConfig);
                UseCaseConfig newUseCaseConfig = useCaseConfig;
                StreamUseCaseUtil streamUseCaseUtil2 = INSTANCE;
                UseCaseConfigFactory.CaptureType captureType2 = newUseCaseConfig.getCaptureType();
                Intrinsics.checkNotNullExpressionValue(captureType2, "getCaptureType(...)");
                if (newUseCaseConfig.getCaptureType() == UseCaseConfigFactory.CaptureType.STREAM_SHARING) {
                    emptyList = ((StreamSharingConfig) newUseCaseConfig).getCaptureTypes();
                    Intrinsics.checkNotNullExpressionValue(emptyList, "getCaptureTypes(...)");
                } else {
                    emptyList = CollectionsKt.emptyList();
                }
                if (!streamUseCaseUtil2.isEligibleCaptureType(captureType2, streamUseCase, emptyList)) {
                    return false;
                }
            } else {
                throw new AssertionError("SurfaceConfig does not map to any use case");
            }
        }
        return true;
    }

    @JvmStatic
    public static final void populateStreamUseCaseStreamSpecOptionWithSupportedSurfaceConfigs(Map<UseCaseConfig<?>, StreamSpec> suggestedStreamSpecMap, Map<AttachedSurfaceInfo, StreamSpec> attachedSurfaceStreamSpecMap, Map<Integer, ? extends AttachedSurfaceInfo> surfaceConfigIndexAttachedSurfaceInfoMap, Map<Integer, ? extends UseCaseConfig<?>> surfaceConfigIndexUseCaseConfigMap, List<SurfaceConfig> surfaceConfigsWithStreamUseCase) {
        Intrinsics.checkNotNullParameter(suggestedStreamSpecMap, "suggestedStreamSpecMap");
        Intrinsics.checkNotNullParameter(attachedSurfaceStreamSpecMap, "attachedSurfaceStreamSpecMap");
        Intrinsics.checkNotNullParameter(surfaceConfigIndexAttachedSurfaceInfoMap, "surfaceConfigIndexAttachedSurfaceInfoMap");
        Intrinsics.checkNotNullParameter(surfaceConfigIndexUseCaseConfigMap, "surfaceConfigIndexUseCaseConfigMap");
        Intrinsics.checkNotNullParameter(surfaceConfigsWithStreamUseCase, "surfaceConfigsWithStreamUseCase");
        int size = surfaceConfigsWithStreamUseCase.size();
        for (int i = 0; i < size; i++) {
            long streamUseCase = surfaceConfigsWithStreamUseCase.get(i).getStreamUseCase().getValue();
            if (surfaceConfigIndexAttachedSurfaceInfoMap.containsKey(Integer.valueOf(i))) {
                AttachedSurfaceInfo attachedSurfaceInfo = surfaceConfigIndexAttachedSurfaceInfoMap.get(Integer.valueOf(i));
                Intrinsics.checkNotNull(attachedSurfaceInfo);
                Config oldImplementationOptions = attachedSurfaceInfo.getImplementationOptions();
                StreamUseCaseUtil streamUseCaseUtil = INSTANCE;
                Intrinsics.checkNotNull(oldImplementationOptions);
                Config newImplementationOptions = streamUseCaseUtil.getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions, Long.valueOf(streamUseCase));
                if (newImplementationOptions != null) {
                    attachedSurfaceStreamSpecMap.put(attachedSurfaceInfo, attachedSurfaceInfo.toStreamSpec(newImplementationOptions));
                }
            } else if (surfaceConfigIndexUseCaseConfigMap.containsKey(Integer.valueOf(i))) {
                UseCaseConfig useCaseConfig = surfaceConfigIndexUseCaseConfigMap.get(Integer.valueOf(i));
                Intrinsics.checkNotNull(useCaseConfig);
                UseCaseConfig newUseCaseConfig = useCaseConfig;
                StreamSpec oldStreamSpec = suggestedStreamSpecMap.get(newUseCaseConfig);
                Intrinsics.checkNotNull(oldStreamSpec);
                Config oldImplementationOptions2 = oldStreamSpec.getImplementationOptions();
                StreamUseCaseUtil streamUseCaseUtil2 = INSTANCE;
                Intrinsics.checkNotNull(oldImplementationOptions2);
                Config newImplementationOptions2 = streamUseCaseUtil2.getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(oldImplementationOptions2, Long.valueOf(streamUseCase));
                if (newImplementationOptions2 != null) {
                    StreamSpec newStreamSpec = oldStreamSpec.toBuilder().setImplementationOptions(newImplementationOptions2).build();
                    Intrinsics.checkNotNullExpressionValue(newStreamSpec, "build(...)");
                    suggestedStreamSpecMap.put(newUseCaseConfig, newStreamSpec);
                }
            } else {
                throw new AssertionError("SurfaceConfig does not map to any use case");
            }
        }
    }

    private final Config getUpdatedImplementationOptionsWithUseCaseStreamSpecOption(Config oldImplementationOptions, Long streamUseCase) {
        if (oldImplementationOptions.containsOption(STREAM_USE_CASE_STREAM_SPEC_OPTION) && Intrinsics.areEqual(oldImplementationOptions.retrieveOption(STREAM_USE_CASE_STREAM_SPEC_OPTION), streamUseCase)) {
            return null;
        }
        MutableOptionsBundle optionsBundle = MutableOptionsBundle.from(oldImplementationOptions);
        Intrinsics.checkNotNullExpressionValue(optionsBundle, "from(...)");
        optionsBundle.insertOption(STREAM_USE_CASE_STREAM_SPEC_OPTION, streamUseCase);
        return new Camera2ImplConfig(optionsBundle);
    }

    @JvmStatic
    public static final boolean containsZslUseCase(List<? extends AttachedSurfaceInfo> attachedSurfaces, List<? extends UseCaseConfig<?>> newUseCaseConfigs) {
        Intrinsics.checkNotNullParameter(attachedSurfaces, "attachedSurfaces");
        Intrinsics.checkNotNullParameter(newUseCaseConfigs, "newUseCaseConfigs");
        for (AttachedSurfaceInfo attachedSurfaceInfo : attachedSurfaces) {
            List captureTypes = attachedSurfaceInfo.getCaptureTypes();
            Intrinsics.checkNotNullExpressionValue(captureTypes, "getCaptureTypes(...)");
            UseCaseConfigFactory.CaptureType captureType = captureTypes.get(0);
            StreamUseCaseUtil streamUseCaseUtil = INSTANCE;
            Config implementationOptions = attachedSurfaceInfo.getImplementationOptions();
            Intrinsics.checkNotNull(implementationOptions);
            Intrinsics.checkNotNull(captureType);
            if (streamUseCaseUtil.isZslUseCase(implementationOptions, captureType)) {
                return true;
            }
        }
        for (UseCaseConfig useCaseConfig : newUseCaseConfigs) {
            UseCaseConfigFactory.CaptureType captureType2 = useCaseConfig.getCaptureType();
            Intrinsics.checkNotNullExpressionValue(captureType2, "getCaptureType(...)");
            if (INSTANCE.isZslUseCase(useCaseConfig, captureType2)) {
                return true;
            }
        }
        return false;
    }

    private final boolean isZslUseCase(Config config, UseCaseConfigFactory.CaptureType captureType) {
        Object retrieveOption = config.retrieveOption(UseCaseConfig.OPTION_ZSL_DISABLED, false);
        Intrinsics.checkNotNull(retrieveOption);
        if (((Boolean) retrieveOption).booleanValue() || !config.containsOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE)) {
            return false;
        }
        Object retrieveOption2 = config.retrieveOption(ImageCaptureConfig.OPTION_IMAGE_CAPTURE_MODE);
        Intrinsics.checkNotNull(retrieveOption2);
        int captureMode = ((Number) retrieveOption2).intValue();
        return TemplateTypeUtil.getSessionConfigTemplateType(captureType, captureMode) == 5;
    }

    private final boolean areStreamUseCasesAvailable(Set<Long> availableStreamUseCasesSet, Set<Long> streamUseCases) {
        Iterator<Long> it = streamUseCases.iterator();
        while (it.hasNext()) {
            long streamUseCase = it.next().longValue();
            if (!availableStreamUseCasesSet.contains(Long.valueOf(streamUseCase))) {
                return false;
            }
        }
        return true;
    }

    private final void throwInvalidCamera2InteropOverrideException() {
        throw new IllegalArgumentException("Either all use cases must have non-default stream use case assigned or none should have it");
    }

    private final boolean isValidCamera2InteropOverride(List<? extends AttachedSurfaceInfo> attachedSurfaces, List<? extends UseCaseConfig<?>> newUseCaseConfigs, Set<Long> availableStreamUseCases) {
        Set streamUseCases = new LinkedHashSet();
        boolean hasNonDefaultStreamUseCase = false;
        boolean hasDefaultOrNullStreamUseCase = false;
        Iterator<? extends AttachedSurfaceInfo> it = attachedSurfaces.iterator();
        if (it.hasNext()) {
            AttachedSurfaceInfo attachedSurfaceInfo = it.next();
            Config implementationOptions = attachedSurfaceInfo.getImplementationOptions();
            Intrinsics.checkNotNull(implementationOptions);
            if (!implementationOptions.containsOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)) {
                hasDefaultOrNullStreamUseCase = true;
            } else {
                Config implementationOptions2 = attachedSurfaceInfo.getImplementationOptions();
                Intrinsics.checkNotNull(implementationOptions2);
                Object retrieveOption = implementationOptions2.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION);
                Intrinsics.checkNotNull(retrieveOption);
                if (((Number) retrieveOption).longValue() == 0) {
                    hasDefaultOrNullStreamUseCase = true;
                } else {
                    hasNonDefaultStreamUseCase = true;
                }
            }
        }
        for (UseCaseConfig useCaseConfig : newUseCaseConfigs) {
            if (!useCaseConfig.containsOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION)) {
                hasDefaultOrNullStreamUseCase = true;
                if (hasNonDefaultStreamUseCase) {
                    throwInvalidCamera2InteropOverrideException();
                }
            } else {
                Object retrieveOption2 = useCaseConfig.retrieveOption(Camera2ImplConfig.STREAM_USE_CASE_OPTION);
                Intrinsics.checkNotNull(retrieveOption2);
                long streamUseCaseOverride = ((Number) retrieveOption2).longValue();
                if (streamUseCaseOverride == 0) {
                    hasDefaultOrNullStreamUseCase = true;
                    if (hasNonDefaultStreamUseCase) {
                        throwInvalidCamera2InteropOverrideException();
                    }
                } else {
                    hasNonDefaultStreamUseCase = true;
                    if (hasDefaultOrNullStreamUseCase) {
                        throwInvalidCamera2InteropOverrideException();
                    }
                    streamUseCases.add(Long.valueOf(streamUseCaseOverride));
                }
            }
        }
        return !hasDefaultOrNullStreamUseCase && areStreamUseCasesAvailable(availableStreamUseCases, streamUseCases);
    }
}
