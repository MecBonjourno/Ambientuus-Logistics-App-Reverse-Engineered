package androidx.camera.camera2.impl;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.params.DynamicRangeProfiles;
import android.hardware.camera2.params.OutputConfiguration;
import android.hardware.camera2.params.SessionConfiguration;
import android.media.ImageReader;
import android.media.MediaCodec;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Size;
import android.view.SurfaceHolder;
import androidx.camera.camera2.internal.CameraUnavailableExceptionHelper;
import androidx.camera.camera2.internal.compat.CameraAccessExceptionCompat;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.CameraManagerCompat;
import androidx.camera.camera2.internal.compat.params.DynamicRangeConversions;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.core.Logger;
import androidx.camera.core.featuregroup.impl.FeatureCombinationQuery;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.featurecombinationquery.CameraDeviceSetupCompat;
import androidx.camera.featurecombinationquery.CameraDeviceSetupCompatFactory;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: FeatureCombinationQueryImpl.kt */
@Metadata(d1 = {"\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 B2\u00020\u0001:\u0002ABB\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010%\u001a\u00020\"2\u0006\u0010&\u001a\u00020'H\u0016J\u0016\u0010(\u001a\b\u0012\u0004\u0012\u00020*0)2\u0006\u0010&\u001a\u00020'H\u0002J\f\u0010+\u001a\u00020**\u00020,H\u0003J\f\u0010-\u001a\u00020**\u00020,H\u0003J\u0014\u0010.\u001a\u00020/*\u0002002\u0006\u00101\u001a\u00020,H\u0002J \u00102\u001a\u0004\u0018\u0001032\f\u00104\u001a\b\u0012\u0004\u0012\u0002000)2\u0006\u00105\u001a\u00020'H\u0002J\f\u00106\u001a\u00020\u0005*\u00020'H\u0002J\u000f\u00107\u001a\u0004\u0018\u00010\"H\u0002¢\u0006\u0002\u00108JF\u00109\u001a\u0002H:\"\f\b\u0000\u0010;*\u00060<j\u0002`=\"\u0004\b\u0001\u0010:*\b\u0012\u0004\u0012\u0002H;0)2\u0018\u0010>\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u0002H;0)\u0012\u0004\u0012\u0002H:0?H\u0082\b¢\u0006\u0002\u0010@R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\n\u001a\u00070\u000b¢\u0006\u0002\b\f8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\r\u0010\u000eR\u001d\u0010\u0011\u001a\u0004\u0018\u00010\u00128BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0015\u0010\u0010\u001a\u0004\b\u0013\u0010\u0014R\u001b\u0010\u0016\u001a\u00020\u00178BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u001a\u0010\u0010\u001a\u0004\b\u0018\u0010\u0019R\"\u0010\u001b\u001a\t\u0018\u00010\u001c¢\u0006\u0002\b\u001d8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b \u0010\u0010\u001a\u0004\b\u001e\u0010\u001fR\u001b\u0010!\u001a\u00020\"8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b$\u0010\u0010\u001a\u0004\b!\u0010#¨\u0006C"}, d2 = {"Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;", "Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;", "context", "Landroid/content/Context;", "cameraId", "", "cameraManagerCompat", "Landroidx/camera/camera2/internal/compat/CameraManagerCompat;", "<init>", "(Landroid/content/Context;Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V", "cameraDeviceSetupCompat", "Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;", "Lorg/jspecify/annotations/NonNull;", "getCameraDeviceSetupCompat", "()Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;", "cameraDeviceSetupCompat$delegate", "Lkotlin/Lazy;", "cameraDeviceSetup", "Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;", "getCameraDeviceSetup", "()Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;", "cameraDeviceSetup$delegate", "cameraCharacteristics", "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;", "getCameraCharacteristics", "()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;", "cameraCharacteristics$delegate", "dynamicRangeProfiles", "Landroid/hardware/camera2/params/DynamicRangeProfiles;", "Lorg/jspecify/annotations/Nullable;", "getDynamicRangeProfiles", "()Landroid/hardware/camera2/params/DynamicRangeProfiles;", "dynamicRangeProfiles$delegate", "isDeferredSurfaceSupported", "", "()Z", "isDeferredSurfaceSupported$delegate", "isSupported", "sessionConfig", "Landroidx/camera/core/impl/SessionConfig;", "createOutputConfigurations", "", "Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;", "toConcreteOutputConfiguration", "Landroidx/camera/core/impl/SessionConfig$OutputConfig;", "toDeferredOutputConfiguration", "applyDynamicRange", "", "Landroid/hardware/camera2/params/OutputConfiguration;", "outputConfig", "getCamera2SessionConfiguration", "Landroid/hardware/camera2/params/SessionConfiguration;", "outputConfigs", "cameraXSessionConfig", "toLogString", "hasPlayServicesDependency", "()Ljava/lang/Boolean;", "use", "R", ExifInterface.GPS_DIRECTION_TRUE, "Ljava/lang/AutoCloseable;", "Lkotlin/AutoCloseable;", "block", "Lkotlin/Function1;", "(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "CloseableOutputConfiguration", "Companion", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class FeatureCombinationQueryImpl implements FeatureCombinationQuery {
    private static final String FCQ_PLAY_SERVICES_IMPL_KEY = "androidx.camera.featurecombinationquery.PLAY_SERVICES_IMPL_PROVIDER_KEY";
    private static final String TAG = "FeatureCombinationQueryImpl";

    /* renomeado de: cameraCharacteristics$delegate, motivo: de metadados do Kotlin */
    private final Lazy cameraCharacteristics;

    /* renomeado de: cameraDeviceSetup$delegate, motivo: de metadados do Kotlin */
    private final Lazy cameraDeviceSetup;

    /* renomeado de: cameraDeviceSetupCompat$delegate, motivo: de metadados do Kotlin */
    private final Lazy cameraDeviceSetupCompat;
    private final String cameraId;
    private final CameraManagerCompat cameraManagerCompat;
    private final Context context;

    /* renomeado de: dynamicRangeProfiles$delegate, motivo: de metadados do Kotlin */
    private final Lazy dynamicRangeProfiles;

    /* renomeado de: isDeferredSurfaceSupported$delegate, motivo: de metadados do Kotlin */
    private final Lazy isDeferredSurfaceSupported;
    private static final FeatureCombinationQueryImpl$Companion$NO_OP_CALLBACK$1 NO_OP_CALLBACK = new CameraCaptureSession.StateCallback() { // da classe: androidx.camera.camera2.impl.FeatureCombinationQueryImpl$Companion$NO_OP_CALLBACK$1
        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onConfigured(CameraCaptureSession p0) {
            Intrinsics.checkNotNullParameter(p0, "p0");
        }

        @Override // android.hardware.camera2.CameraCaptureSession.StateCallback
        public void onConfigureFailed(CameraCaptureSession p0) {
            Intrinsics.checkNotNullParameter(p0, "p0");
        }
    };

    public FeatureCombinationQueryImpl(Context context, String cameraId, CameraManagerCompat cameraManagerCompat) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(cameraId, "cameraId");
        Intrinsics.checkNotNullParameter(cameraManagerCompat, "cameraManagerCompat");
        this.context = context;
        this.cameraId = cameraId;
        this.cameraManagerCompat = cameraManagerCompat;
        this.cameraDeviceSetupCompat = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.impl.FeatureCombinationQueryImpl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                CameraDeviceSetupCompat cameraDeviceSetupCompat_delegate$lambda$0;
                cameraDeviceSetupCompat_delegate$lambda$0 = FeatureCombinationQueryImpl.cameraDeviceSetupCompat_delegate$lambda$0(FeatureCombinationQueryImpl.this);
                return cameraDeviceSetupCompat_delegate$lambda$0;
            }
        });
        this.cameraDeviceSetup = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.impl.FeatureCombinationQueryImpl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                CameraDevice.CameraDeviceSetup cameraDeviceSetup_delegate$lambda$1;
                cameraDeviceSetup_delegate$lambda$1 = FeatureCombinationQueryImpl.cameraDeviceSetup_delegate$lambda$1(FeatureCombinationQueryImpl.this);
                return cameraDeviceSetup_delegate$lambda$1;
            }
        });
        this.cameraCharacteristics = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.impl.FeatureCombinationQueryImpl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                CameraCharacteristicsCompat cameraCharacteristics_delegate$lambda$2;
                cameraCharacteristics_delegate$lambda$2 = FeatureCombinationQueryImpl.cameraCharacteristics_delegate$lambda$2(FeatureCombinationQueryImpl.this);
                return cameraCharacteristics_delegate$lambda$2;
            }
        });
        this.dynamicRangeProfiles = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.impl.FeatureCombinationQueryImpl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                DynamicRangeProfiles dynamicRangeProfiles_delegate$lambda$3;
                dynamicRangeProfiles_delegate$lambda$3 = FeatureCombinationQueryImpl.dynamicRangeProfiles_delegate$lambda$3(FeatureCombinationQueryImpl.this);
                return dynamicRangeProfiles_delegate$lambda$3;
            }
        });
        this.isDeferredSurfaceSupported = LazyKt.lazy(new Function0() { // da classe: androidx.camera.camera2.impl.FeatureCombinationQueryImpl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                boolean isDeferredSurfaceSupported_delegate$lambda$4;
                isDeferredSurfaceSupported_delegate$lambda$4 = FeatureCombinationQueryImpl.isDeferredSurfaceSupported_delegate$lambda$4(FeatureCombinationQueryImpl.this);
                return Boolean.valueOf(isDeferredSurfaceSupported_delegate$lambda$4);
            }
        });
    }

    private final CameraDeviceSetupCompat getCameraDeviceSetupCompat() {
        return (CameraDeviceSetupCompat) this.cameraDeviceSetupCompat.getValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final CameraDeviceSetupCompat cameraDeviceSetupCompat_delegate$lambda$0(FeatureCombinationQueryImpl this$0) {
        return new CameraDeviceSetupCompatFactory(this$0.context).getCameraDeviceSetupCompat(this$0.cameraId);
    }

    private final CameraDevice.CameraDeviceSetup getCameraDeviceSetup() {
        return (CameraDevice.CameraDeviceSetup) this.cameraDeviceSetup.getValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final CameraDevice.CameraDeviceSetup cameraDeviceSetup_delegate$lambda$1(FeatureCombinationQueryImpl this$0) {
        if (this$0.cameraManagerCompat.unwrap().isCameraDeviceSetupSupported(this$0.cameraId)) {
            return this$0.cameraManagerCompat.unwrap().getCameraDeviceSetup(this$0.cameraId);
        }
        return null;
    }

    private final CameraCharacteristicsCompat getCameraCharacteristics() {
        return (CameraCharacteristicsCompat) this.cameraCharacteristics.getValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final CameraCharacteristicsCompat cameraCharacteristics_delegate$lambda$2(FeatureCombinationQueryImpl this$0) {
        try {
            CameraCharacteristicsCompat cameraCharacteristicsCompat = this$0.cameraManagerCompat.getCameraCharacteristicsCompat(this$0.cameraId);
            Intrinsics.checkNotNull(cameraCharacteristicsCompat);
            return cameraCharacteristicsCompat;
        } catch (CameraAccessExceptionCompat e) {
            throw CameraUnavailableExceptionHelper.createFrom(e);
        }
    }

    private final DynamicRangeProfiles getDynamicRangeProfiles() {
        return (DynamicRangeProfiles) this.dynamicRangeProfiles.getValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final DynamicRangeProfiles dynamicRangeProfiles_delegate$lambda$3(FeatureCombinationQueryImpl this$0) {
        return DynamicRangesCompat.fromCameraCharacteristics(this$0.getCameraCharacteristics()).toDynamicRangeProfiles();
    }

    private final boolean isDeferredSurfaceSupported() {
        return ((Boolean) this.isDeferredSurfaceSupported.getValue()).booleanValue();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final boolean isDeferredSurfaceSupported_delegate$lambda$4(FeatureCombinationQueryImpl this$0) {
        return Intrinsics.areEqual((Object) this$0.hasPlayServicesDependency(), (Object) false);
    }

    @Override // androidx.camera.core.featuregroup.impl.FeatureCombinationQuery
    public boolean isSupported(SessionConfig sessionConfig) {
        Intrinsics.checkNotNullParameter(sessionConfig, "sessionConfig");
        Iterable $this$use$iv = createOutputConfigurations(sessionConfig);
        Iterable $this$map$iv = $this$use$iv;
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            CloseableOutputConfiguration it = (CloseableOutputConfiguration) item$iv$iv;
            destination$iv$iv.add(it.getValue());
        }
        SessionConfiguration camera2SessionConfiguration = getCamera2SessionConfiguration((List) destination$iv$iv, sessionConfig);
        if (camera2SessionConfiguration == null) {
            return false;
        }
        int supported = getCameraDeviceSetupCompat().isSessionConfigurationSupported(camera2SessionConfiguration).getSupported();
        Logger.d(TAG, "isSupported: supported = " + supported + " for session config with " + toLogString(sessionConfig));
        boolean z = supported == 1;
        Iterable $this$forEach$iv$iv = $this$use$iv;
        for (Object element$iv$iv : $this$forEach$iv$iv) {
            AutoCloseable it$iv = (AutoCloseable) element$iv$iv;
            it$iv.close();
        }
        return z;
    }

    private final List<CloseableOutputConfiguration> createOutputConfigurations(SessionConfig sessionConfig) {
        CloseableOutputConfiguration concreteOutputConfiguration;
        Iterable outputConfigs = sessionConfig.getOutputConfigs();
        Intrinsics.checkNotNullExpressionValue(outputConfigs, "getOutputConfigs(...)");
        Iterable $this$map$iv = outputConfigs;
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            SessionConfig.OutputConfig outputConfig = (SessionConfig.OutputConfig) item$iv$iv;
            if (isDeferredSurfaceSupported()) {
                Intrinsics.checkNotNull(outputConfig);
                concreteOutputConfiguration = toDeferredOutputConfiguration(outputConfig);
            } else {
                Intrinsics.checkNotNull(outputConfig);
                concreteOutputConfiguration = toConcreteOutputConfiguration(outputConfig);
            }
            CloseableOutputConfiguration $this$createOutputConfigurations_u24lambda_u248_u24lambda_u247 = concreteOutputConfiguration;
            if (outputConfig.getSurface().getContainerClass() != null) {
                applyDynamicRange($this$createOutputConfigurations_u24lambda_u248_u24lambda_u247.getValue(), outputConfig);
            }
            destination$iv$iv.add(concreteOutputConfiguration);
        }
        List outputConfigs2 = (List) destination$iv$iv;
        return outputConfigs2;
    }

    private final CloseableOutputConfiguration toConcreteOutputConfiguration(SessionConfig.OutputConfig $this$toConcreteOutputConfiguration) {
        Class<?> containerClass = $this$toConcreteOutputConfiguration.getSurface().getContainerClass();
        long usageFlag = Intrinsics.areEqual(containerClass, MediaCodec.class) ? PlaybackStateCompat.ACTION_PREPARE_FROM_SEARCH : Intrinsics.areEqual(containerClass, SurfaceHolder.class) ? PlaybackStateCompat.ACTION_PLAY_FROM_SEARCH : Intrinsics.areEqual(containerClass, SurfaceTexture.class) ? 256L : 0L;
        Logger.d(TAG, "toConcreteOutputConfiguration: surface containerClass = " + $this$toConcreteOutputConfiguration.getSurface().getContainerClass() + ", usageFlag = " + usageFlag);
        ImageReader imageReader = ImageReader.newInstance($this$toConcreteOutputConfiguration.getSurface().getPrescribedSize().getWidth(), $this$toConcreteOutputConfiguration.getSurface().getPrescribedSize().getHeight(), $this$toConcreteOutputConfiguration.getSurface().getPrescribedStreamFormat(), 1, usageFlag);
        Intrinsics.checkNotNullExpressionValue(imageReader, "newInstance(...)");
        return new CloseableOutputConfiguration(new OutputConfiguration(imageReader.getSurface()), imageReader);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    private final CloseableOutputConfiguration toDeferredOutputConfiguration(SessionConfig.OutputConfig outputConfig) {
        OutputConfiguration outputConfiguration;
        Class<?> containerClass = outputConfig.getSurface().getContainerClass();
        Logger.d(TAG, "toDeferredOutputConfiguration: surface containerClass = " + outputConfig.getSurface().getContainerClass());
        if (containerClass != null) {
            Size prescribedSize = outputConfig.getSurface().getPrescribedSize();
            if (prescribedSize == null) {
                throw new IllegalArgumentException("Required value was null.".toString());
            }
            outputConfiguration = new OutputConfiguration(prescribedSize, containerClass);
        } else {
            outputConfiguration = new OutputConfiguration(outputConfig.getSurface().getPrescribedStreamFormat(), outputConfig.getSurface().getPrescribedSize());
        }
        return new CloseableOutputConfiguration(outputConfiguration, null, 2, 0 == true ? 1 : 0);
    }

    private final void applyDynamicRange(OutputConfiguration $this$applyDynamicRange, SessionConfig.OutputConfig outputConfig) {
        DynamicRangeProfiles dynamicRangeProfiles = getDynamicRangeProfiles();
        if (dynamicRangeProfiles == null) {
            return;
        }
        Long dynamicRangeToFirstSupportedProfile = DynamicRangeConversions.dynamicRangeToFirstSupportedProfile(outputConfig.getDynamicRange(), dynamicRangeProfiles);
        if (dynamicRangeToFirstSupportedProfile != null) {
            $this$applyDynamicRange.setDynamicRangeProfile(dynamicRangeToFirstSupportedProfile.longValue());
            return;
        }
        throw new IllegalArgumentException("Required value was null.".toString());
    }

    private final SessionConfiguration getCamera2SessionConfiguration(List<OutputConfiguration> outputConfigs, SessionConfig cameraXSessionConfig) {
        SessionConfiguration camera2SessionConfig = new SessionConfiguration(0, outputConfigs, CameraXExecutors.directExecutor(), NO_OP_CALLBACK);
        CameraDevice.CameraDeviceSetup cameraDeviceSetup = getCameraDeviceSetup();
        if (cameraDeviceSetup == null) {
            return null;
        }
        CaptureRequest.Builder $this$getCamera2SessionConfiguration_u24lambda_u249 = cameraDeviceSetup.createCaptureRequest(cameraXSessionConfig.getTemplateType());
        $this$getCamera2SessionConfiguration_u24lambda_u249.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, cameraXSessionConfig.getExpectedFrameRateRange());
        if (cameraXSessionConfig.getRepeatingCaptureConfig().getPreviewStabilizationMode() == 2) {
            $this$getCamera2SessionConfiguration_u24lambda_u249.set(CaptureRequest.CONTROL_VIDEO_STABILIZATION_MODE, 2);
        }
        camera2SessionConfig.setSessionParameters($this$getCamera2SessionConfiguration_u24lambda_u249.build());
        return camera2SessionConfig;
    }

    private final String toLogString(SessionConfig $this$toLogString) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("sessionParameters=[");
        stringBuilder.append("fpsRange=" + $this$toLogString.getExpectedFrameRateRange());
        stringBuilder.append(", previewStabilizationMode=" + $this$toLogString.getRepeatingCaptureConfig().getPreviewStabilizationMode());
        stringBuilder.append("], ");
        stringBuilder.append("outputConfigurations=[");
        Iterable outputConfigs = $this$toLogString.getOutputConfigs();
        Intrinsics.checkNotNullExpressionValue(outputConfigs, "getOutputConfigs(...)");
        Iterable $this$forEachIndexed$iv = outputConfigs;
        int index = 0;
        for (Object item$iv : $this$forEachIndexed$iv) {
            int index$iv = index + 1;
            if (index < 0) {
                CollectionsKt.throwIndexOverflow();
            }
            SessionConfig.OutputConfig outputConfig = (SessionConfig.OutputConfig) item$iv;
            if (index != 0) {
                stringBuilder.append(",");
            }
            stringBuilder.append("{format=" + outputConfig.getSurface().getPrescribedStreamFormat() + ", size=" + outputConfig.getSurface().getPrescribedSize() + ", dynamicRange=" + outputConfig.getDynamicRange() + ", class=" + outputConfig.getSurface().getContainerClass() + '}');
            index = index$iv;
        }
        stringBuilder.append("]");
        String sb = stringBuilder.toString();
        Intrinsics.checkNotNullExpressionValue(sb, "toString(...)");
        return sb;
    }

    private final Boolean hasPlayServicesDependency() {
        try {
            PackageInfo packageInfo = this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 132);
            if (packageInfo.services == null) {
                return false;
            }
            Iterator it = ArrayIteratorKt.iterator(packageInfo.services);
            while (it.hasNext()) {
                ServiceInfo serviceInfo = (ServiceInfo) it.next();
                if (serviceInfo.metaData != null && serviceInfo.metaData.getString(FCQ_PLAY_SERVICES_IMPL_KEY) != null) {
                    return true;
                }
            }
            return false;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    /* compiled from: FeatureCombinationQueryImpl.kt */
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0082\b\u0018\u00002\u00060\u0001j\u0002`\u0002B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0007\u0010\bJ\b\u0010\u000b\u001a\u00020\fH\u0016J\t\u0010\r\u001a\u00020\u0004HÆ\u0003J\u000b\u0010\u000e\u001a\u0004\u0018\u00010\u0006HÂ\u0003J\u001f\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00042\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;", "Ljava/lang/AutoCloseable;", "Lkotlin/AutoCloseable;", "value", "Landroid/hardware/camera2/params/OutputConfiguration;", "backingImageReader", "Landroid/media/ImageReader;", "<init>", "(Landroid/hardware/camera2/params/OutputConfiguration;Landroid/media/ImageReader;)V", "getValue", "()Landroid/hardware/camera2/params/OutputConfiguration;", "close", "", "component1", "component2", "copy", "equals", "", "other", "", "hashCode", "", "toString", "", "camera-camera2_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final /* data */ class CloseableOutputConfiguration implements AutoCloseable {
        private final ImageReader backingImageReader;
        private final OutputConfiguration value;

        /* renomeado de: component2, motivo: de getter */
        private final ImageReader getBackingImageReader() {
            return this.backingImageReader;
        }

        public static /* sintético */ CloseableOutputConfiguration copy$default(CloseableOutputConfiguration closeableOutputConfiguration, OutputConfiguration outputConfiguration, ImageReader imageReader, int i, Object obj) {
            if ((i & 1) != 0) {
                outputConfiguration = closeableOutputConfiguration.value;
            }
            if ((i & 2) != 0) {
                imageReader = closeableOutputConfiguration.backingImageReader;
            }
            return closeableOutputConfiguration.copy(outputConfiguration, imageReader);
        }

        /* renomeado de: component1, motivo: de getter */
        public final OutputConfiguration getValue() {
            return this.value;
        }

        public final CloseableOutputConfiguration copy(OutputConfiguration value, ImageReader backingImageReader) {
            Intrinsics.checkNotNullParameter(value, "value");
            return new CloseableOutputConfiguration(value, backingImageReader);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CloseableOutputConfiguration)) {
                return false;
            }
            CloseableOutputConfiguration closeableOutputConfiguration = (CloseableOutputConfiguration) other;
            return Intrinsics.areEqual(this.value, closeableOutputConfiguration.value) && Intrinsics.areEqual(this.backingImageReader, closeableOutputConfiguration.backingImageReader);
        }

        public int hashCode() {
            return (this.value.hashCode() * 31) + (this.backingImageReader == null ? 0 : this.backingImageReader.hashCode());
        }

        public String toString() {
            return "CloseableOutputConfiguration(value=" + this.value + ", backingImageReader=" + this.backingImageReader + ')';
        }

        public CloseableOutputConfiguration(OutputConfiguration value, ImageReader backingImageReader) {
            Intrinsics.checkNotNullParameter(value, "value");
            this.value = value;
            this.backingImageReader = backingImageReader;
        }

        public /* sintético */ CloseableOutputConfiguration(OutputConfiguration outputConfiguration, ImageReader imageReader, int i, DefaultConstructorMarker defaultConstructorMarker) {
            this(outputConfiguration, (i & 2) != 0 ? null : imageReader);
        }

        public final OutputConfiguration getValue() {
            return this.value;
        }

        @Override // java.lang.AutoCloseable
        public void close() {
            ImageReader imageReader = this.backingImageReader;
            if (imageReader != null) {
                imageReader.close();
            }
        }
    }

    private final <T extends AutoCloseable, R> R use(List<? extends T> list, Function1<? super List<? extends T>, ? extends R> function1) {
        R invoke = function1.invoke(list);
        List<? extends T> $this$forEach$iv = list;
        for (Object element$iv : $this$forEach$iv) {
            AutoCloseable it = (AutoCloseable) element$iv;
            it.close();
        }
        return invoke;
    }
}
