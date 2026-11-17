package androidx.camera.core.featuregroup.impl;

import android.graphics.SurfaceTexture;
import android.media.MediaCodec;
import android.view.SurfaceHolder;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCase;
import androidx.camera.core.featuregroup.impl.feature.FeatureTypeInternal;
import androidx.camera.core.impl.ImageCaptureConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.internal.CameraUseCaseAdapter;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: UseCaseType.kt */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0086\u0081\u0002\u0018\u0000 \u00162\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0016B\u001f\b\u0002\u0012\f\u0010\u0002\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0017\u0010\u0011\u001a\u00020\u00052\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0013J\b\u0010\u0014\u001a\u00020\u0015H\u0016R\u0017\u0010\u0002\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0017"}, d2 = {"Landroidx/camera/core/featuregroup/impl/UseCaseType;", "", "surfaceClass", "Ljava/lang/Class;", "defaultImageFormat", "", "<init>", "(Ljava/lang/String;ILjava/lang/Class;I)V", "getSurfaceClass", "()Ljava/lang/Class;", "getDefaultImageFormat", "()I", "PREVIEW", "IMAGE_CAPTURE", "VIDEO_CAPTURE", "STREAM_SHARING", "UNDEFINED", "getImageFormat", "imageCaptureFormat", "(Ljava/lang/Integer;)I", "toString", "", "Companion", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public enum UseCaseType {
    PREVIEW(SurfaceHolder.class, 34),
    IMAGE_CAPTURE(null, 256),
    VIDEO_CAPTURE(MediaCodec.class, 34),
    STREAM_SHARING(SurfaceTexture.class, 34),
    UNDEFINED(null, 34);

    private final int defaultImageFormat;
    private final Class<?> surfaceClass;
    private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);

    /* compiled from: UseCaseType.kt */
    @Metadata(k = 3, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[UseCaseType.values().length];
            try {
                iArr[UseCaseType.PREVIEW.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[UseCaseType.IMAGE_CAPTURE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[UseCaseType.VIDEO_CAPTURE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[UseCaseType.STREAM_SHARING.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[UseCaseType.UNDEFINED.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    UseCaseType(Class surfaceClass, int defaultImageFormat) {
        this.surfaceClass = surfaceClass;
        this.defaultImageFormat = defaultImageFormat;
    }

    public final Class<?> getSurfaceClass() {
        return this.surfaceClass;
    }

    public final int getDefaultImageFormat() {
        return this.defaultImageFormat;
    }

    public static /* synthetic */ int getImageFormat$default(UseCaseType useCaseType, Integer num, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getImageFormat");
        }
        if ((i & 1) != 0) {
            num = null;
        }
        return useCaseType.getImageFormat(num);
    }

    public final int getImageFormat(Integer imageCaptureFormat) {
        if (this == IMAGE_CAPTURE && imageCaptureFormat != null) {
            return imageCaptureFormat.intValue();
        }
        return this.defaultImageFormat;
    }

    @Override // java.lang.Enum
    public String toString() {
        switch (WhenMappings.$EnumSwitchMapping$0[ordinal()]) {
            case 1:
                return "Preview";
            case 2:
                return "ImageCapture";
            case 3:
                return "VideoCapture";
            case 4:
                return "StreamSharing";
            case 5:
                return "Undefined";
            default:
                throw new NoWhenBranchMatchedException();
        }
    }

    /* compiled from: UseCaseType.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u0004\u001a\u00020\u0005*\u00020\u0006H\u0007J\u0010\u0010\u0004\u001a\u00020\u0005*\u0006\u0012\u0002\b\u00030\u0007H\u0007J\u0013\u0010\b\u001a\u0004\u0018\u00010\t*\u00020\u0006H\u0000¢\u0006\u0002\b\nJ\u0014\u0010\u000b\u001a\u00020\f*\u00020\t2\u0006\u0010\r\u001a\u00020\u0006H\u0002J\f\u0010\u000e\u001a\u00020\f*\u00020\u0006H\u0002J\f\u0010\u000f\u001a\u00020\f*\u00020\u0006H\u0002J\f\u0010\u0010\u001a\u00020\f*\u00020\u0006H\u0002J\f\u0010\u0011\u001a\u00020\f*\u00020\u0006H\u0002¨\u0006\u0012"}, d2 = {"Landroidx/camera/core/featuregroup/impl/UseCaseType$Companion;", "", "<init>", "()V", "getFeatureGroupUseCaseType", "Landroidx/camera/core/featuregroup/impl/UseCaseType;", "Landroidx/camera/core/UseCase;", "Landroidx/camera/core/impl/UseCaseConfig;", "getAppConfiguredGroupableFeatureType", "Landroidx/camera/core/featuregroup/impl/feature/FeatureTypeInternal;", "getAppConfiguredGroupableFeatureType$camera_core_release", "isConfiguredToUseCaseByApp", "", "useCase", "isDynamicRangeConfiguredByApp", "isFpsRangeConfiguredByApp", "isStabilizationModeConfiguredByApp", "isImageFormatConfiguredByApp", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {

        /* compiled from: UseCaseType.kt */
        @Metadata(k = 3, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
        public /* synthetic */ class WhenMappings {
            public static final /* synthetic */ int[] $EnumSwitchMapping$0;
            public static final /* synthetic */ int[] $EnumSwitchMapping$1;

            static {
                int[] iArr = new int[UseCaseConfigFactory.CaptureType.values().length];
                try {
                    iArr[UseCaseConfigFactory.CaptureType.IMAGE_CAPTURE.ordinal()] = 1;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[UseCaseConfigFactory.CaptureType.PREVIEW.ordinal()] = 2;
                } catch (NoSuchFieldError e2) {
                }
                try {
                    iArr[UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE.ordinal()] = 3;
                } catch (NoSuchFieldError e3) {
                }
                try {
                    iArr[UseCaseConfigFactory.CaptureType.STREAM_SHARING.ordinal()] = 4;
                } catch (NoSuchFieldError e4) {
                }
                $EnumSwitchMapping$0 = iArr;
                int[] iArr2 = new int[FeatureTypeInternal.values().length];
                try {
                    iArr2[FeatureTypeInternal.DYNAMIC_RANGE.ordinal()] = 1;
                } catch (NoSuchFieldError e5) {
                }
                try {
                    iArr2[FeatureTypeInternal.FPS_RANGE.ordinal()] = 2;
                } catch (NoSuchFieldError e6) {
                }
                try {
                    iArr2[FeatureTypeInternal.VIDEO_STABILIZATION.ordinal()] = 3;
                } catch (NoSuchFieldError e7) {
                }
                try {
                    iArr2[FeatureTypeInternal.IMAGE_FORMAT.ordinal()] = 4;
                } catch (NoSuchFieldError e8) {
                }
                $EnumSwitchMapping$1 = iArr2;
            }
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final UseCaseType getFeatureGroupUseCaseType(UseCase $this$getFeatureGroupUseCaseType) {
            Intrinsics.checkNotNullParameter($this$getFeatureGroupUseCaseType, "<this>");
            if ($this$getFeatureGroupUseCaseType instanceof Preview) {
                return UseCaseType.PREVIEW;
            }
            if ($this$getFeatureGroupUseCaseType instanceof ImageCapture) {
                return UseCaseType.IMAGE_CAPTURE;
            }
            if (CameraUseCaseAdapter.isVideoCapture($this$getFeatureGroupUseCaseType)) {
                return UseCaseType.VIDEO_CAPTURE;
            }
            if ($this$getFeatureGroupUseCaseType instanceof StreamSharing) {
                return UseCaseType.STREAM_SHARING;
            }
            return UseCaseType.UNDEFINED;
        }

        @JvmStatic
        public final UseCaseType getFeatureGroupUseCaseType(UseCaseConfig<?> useCaseConfig) {
            Intrinsics.checkNotNullParameter(useCaseConfig, "<this>");
            switch (WhenMappings.$EnumSwitchMapping$0[useCaseConfig.getCaptureType().ordinal()]) {
                case 1:
                    return UseCaseType.IMAGE_CAPTURE;
                case 2:
                    return UseCaseType.PREVIEW;
                case 3:
                    return UseCaseType.VIDEO_CAPTURE;
                case 4:
                    return UseCaseType.STREAM_SHARING;
                default:
                    return UseCaseType.UNDEFINED;
            }
        }

        public final FeatureTypeInternal getAppConfiguredGroupableFeatureType$camera_core_release(UseCase $this$getAppConfiguredGroupableFeatureType) {
            Object obj;
            Intrinsics.checkNotNullParameter($this$getAppConfiguredGroupableFeatureType, "<this>");
            Iterator<E> it = FeatureTypeInternal.getEntries().iterator();
            while (true) {
                if (!it.hasNext()) {
                    obj = null;
                    break;
                }
                obj = it.next();
                FeatureTypeInternal it2 = (FeatureTypeInternal) obj;
                if (UseCaseType.INSTANCE.isConfiguredToUseCaseByApp(it2, $this$getAppConfiguredGroupableFeatureType)) {
                    break;
                }
            }
            return (FeatureTypeInternal) obj;
        }

        private final boolean isConfiguredToUseCaseByApp(FeatureTypeInternal $this$isConfiguredToUseCaseByApp, UseCase useCase) {
            switch (WhenMappings.$EnumSwitchMapping$1[$this$isConfiguredToUseCaseByApp.ordinal()]) {
                case 1:
                    return isDynamicRangeConfiguredByApp(useCase);
                case 2:
                    return isFpsRangeConfiguredByApp(useCase);
                case 3:
                    return isStabilizationModeConfiguredByApp(useCase);
                case 4:
                    return isImageFormatConfiguredByApp(useCase);
                default:
                    throw new NoWhenBranchMatchedException();
            }
        }

        private final boolean isDynamicRangeConfiguredByApp(UseCase $this$isDynamicRangeConfiguredByApp) {
            return $this$isDynamicRangeConfiguredByApp.getAppConfig().hasDynamicRange();
        }

        private final boolean isFpsRangeConfiguredByApp(UseCase $this$isFpsRangeConfiguredByApp) {
            return $this$isFpsRangeConfiguredByApp.getAppConfig().hasTargetFrameRate();
        }

        private final boolean isStabilizationModeConfiguredByApp(UseCase $this$isStabilizationModeConfiguredByApp) {
            return $this$isStabilizationModeConfiguredByApp.getAppConfig().containsOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE) || $this$isStabilizationModeConfiguredByApp.getAppConfig().containsOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE);
        }

        private final boolean isImageFormatConfiguredByApp(UseCase $this$isImageFormatConfiguredByApp) {
            return $this$isImageFormatConfiguredByApp.getAppConfig().containsOption(ImageCaptureConfig.OPTION_OUTPUT_FORMAT);
        }
    }

    @JvmStatic
    public static final UseCaseType getFeatureGroupUseCaseType(UseCase $this$getFeatureGroupUseCaseType) {
        return INSTANCE.getFeatureGroupUseCaseType($this$getFeatureGroupUseCaseType);
    }

    @JvmStatic
    public static final UseCaseType getFeatureGroupUseCaseType(UseCaseConfig<?> useCaseConfig) {
        return INSTANCE.getFeatureGroupUseCaseType(useCaseConfig);
    }

    public static EnumEntries<UseCaseType> getEntries() {
        return $ENTRIES;
    }
}
