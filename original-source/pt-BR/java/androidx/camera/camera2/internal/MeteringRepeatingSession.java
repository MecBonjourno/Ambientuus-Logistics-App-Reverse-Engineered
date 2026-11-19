package androidx.camera.camera2.internal;

import android.graphics.SurfaceTexture;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.workaround.SupportedRepeatingSurfaceSize;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.UseCase;
import androidx.camera.core.imagecapture.TakePictureManager;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.TargetConfig;
import j$.util.Objects;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/* carregado de: classes.dex */
class MeteringRepeatingSession {
    private static final int IMAGE_FORMAT = 34;
    private static final String TAG = "MeteringRepeating";
    private DeferrableSurface mDeferrableSurface;
    private final Size mMeteringRepeatingSize;
    private SessionConfig mSessionConfig;
    private final SurfaceResetCallback mSurfaceResetCallback;
    private final SupportedRepeatingSurfaceSize mSupportedRepeatingSurfaceSize = new SupportedRepeatingSurfaceSize();
    private SessionConfig.CloseableErrorListener mCloseableErrorListener = null;
    private final MeteringRepeatingConfig mConfigWithDefaults = new MeteringRepeatingConfig();

    interface SurfaceResetCallback {
        void onSurfaceReset();
    }

    MeteringRepeatingSession(CameraCharacteristicsCompat cameraCharacteristicsCompat, DisplayInfoManager displayInfoManager, SurfaceResetCallback surfaceResetCallback) {
        this.mSurfaceResetCallback = surfaceResetCallback;
        this.mMeteringRepeatingSize = getProperPreviewSize(cameraCharacteristicsCompat, displayInfoManager);
        Logger.d(TAG, "MeteringSession SurfaceTexture size: " + this.mMeteringRepeatingSize);
        this.mSessionConfig = createSessionConfig();
    }

    SessionConfig createSessionConfig() {
        final SurfaceTexture surfaceTexture = new SurfaceTexture(0);
        surfaceTexture.setDefaultBufferSize(this.mMeteringRepeatingSize.getWidth(), this.mMeteringRepeatingSize.getHeight());
        final Surface surface = new Surface(surfaceTexture);
        SessionConfig.Builder builder = SessionConfig.Builder.createFrom(this.mConfigWithDefaults, this.mMeteringRepeatingSize);
        builder.setTemplateType(1);
        this.mDeferrableSurface = new ImmediateSurface(surface);
        Futures.addCallback(this.mDeferrableSurface.getTerminationFuture(), new FutureCallback<Void>() { // da classe: androidx.camera.camera2.internal.MeteringRepeatingSession.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                surface.release();
                surfaceTexture.release();
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                throw new IllegalStateException("Future should never fail. Did it get completed by GC?", t);
            }
        }, CameraXExecutors.directExecutor());
        builder.addSurface(this.mDeferrableSurface);
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
        }
        this.mCloseableErrorListener = new SessionConfig.CloseableErrorListener(new SessionConfig.ErrorListener() { // da classe: androidx.camera.camera2.internal.MeteringRepeatingSession$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                MeteringRepeatingSession.this.m82x1b0a2abb(sessionConfig, sessionError);
            }
        });
        builder.setErrorListener(this.mCloseableErrorListener);
        return builder.build();
    }

    /* renomeado de: lambda$createSessionConfig$0$androidx-camera-camera2-internal-MeteringRepeatingSession, motivo: nome Java inválido */
    /* sintético */ void m82x1b0a2abb(SessionConfig sessionConfig, SessionConfig.SessionError error) {
        this.mSessionConfig = createSessionConfig();
        if (this.mSurfaceResetCallback != null) {
            this.mSurfaceResetCallback.onSurfaceReset();
        }
    }

    UseCaseConfig<?> getUseCaseConfig() {
        return this.mConfigWithDefaults;
    }

    SessionConfig getSessionConfig() {
        return this.mSessionConfig;
    }

    Size getMeteringRepeatingSize() {
        return this.mMeteringRepeatingSize;
    }

    String getName() {
        return TAG;
    }

    void clear() {
        Logger.d(TAG, "MeteringRepeating clear!");
        if (this.mDeferrableSurface != null) {
            this.mDeferrableSurface.close();
        }
        this.mDeferrableSurface = null;
    }

    private static class MeteringRepeatingConfig implements UseCaseConfig<UseCase> {
        private final Config mConfig;

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ boolean containsOption(Config.Option option) {
            boolean containsOption;
            containsOption = getConfig().containsOption(option);
            return containsOption;
        }

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ void findOptions(String str, Config.OptionMatcher optionMatcher) {
            getConfig().findOptions(str, optionMatcher);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ CaptureConfig.OptionUnpacker getCaptureOptionUnpacker() {
            return UseCaseConfig.CC.$default$getCaptureOptionUnpacker(this);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ CaptureConfig.OptionUnpacker getCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            return UseCaseConfig.CC.$default$getCaptureOptionUnpacker(this, optionUnpacker);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ CaptureConfig getDefaultCaptureConfig() {
            return UseCaseConfig.CC.$default$getDefaultCaptureConfig(this);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ CaptureConfig getDefaultCaptureConfig(CaptureConfig captureConfig) {
            return UseCaseConfig.CC.$default$getDefaultCaptureConfig(this, captureConfig);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ SessionConfig getDefaultSessionConfig() {
            return UseCaseConfig.CC.$default$getDefaultSessionConfig(this);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ SessionConfig getDefaultSessionConfig(SessionConfig sessionConfig) {
            return UseCaseConfig.CC.$default$getDefaultSessionConfig(this, sessionConfig);
        }

        @Override // androidx.camera.core.impl.ImageInputConfig
        public /* sintético */ DynamicRange getDynamicRange() {
            return ImageInputConfig.CC.$default$getDynamicRange(this);
        }

        @Override // androidx.camera.core.impl.ImageInputConfig
        public /* sintético */ int getInputFormat() {
            int intValue;
            intValue = ((Integer) retrieveOption(ImageInputConfig.OPTION_INPUT_FORMAT)).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ Config.OptionPriority getOptionPriority(Config.Option option) {
            Config.OptionPriority optionPriority;
            optionPriority = getConfig().getOptionPriority(option);
            return optionPriority;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ int getPreviewStabilizationMode() {
            int intValue;
            intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_PREVIEW_STABILIZATION_MODE, 0)).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ Set getPriorities(Config.Option option) {
            Set priorities;
            priorities = getConfig().getPriorities(option);
            return priorities;
        }

        @Override // androidx.camera.core.impl.ImageInputConfig
        public /* sintético */ int getSecondaryInputFormat() {
            int intValue;
            intValue = ((Integer) retrieveOption(ImageInputConfig.OPTION_SECONDARY_INPUT_FORMAT, 0)).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ SessionConfig.OptionUnpacker getSessionOptionUnpacker() {
            return UseCaseConfig.CC.$default$getSessionOptionUnpacker(this);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ SessionConfig.OptionUnpacker getSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            return UseCaseConfig.CC.$default$getSessionOptionUnpacker(this, optionUnpacker);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ int getSessionType() {
            int intValue;
            intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SESSION_TYPE)).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ int getSessionType(int i) {
            int intValue;
            intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SESSION_TYPE, Integer.valueOf(i))).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ StreamUseCase getStreamUseCase() {
            return UseCaseConfig.CC.$default$getStreamUseCase(this);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ int getSurfaceOccupancyPriority() {
            int intValue;
            intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY)).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ int getSurfaceOccupancyPriority(int i) {
            int intValue;
            intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(i))).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ TakePictureManager.Provider getTakePictureManagerProvider() {
            return UseCaseConfig.CC.$default$getTakePictureManagerProvider(this);
        }

        @Override // androidx.camera.core.internal.TargetConfig
        public /* sintético */ Class getTargetClass() {
            return TargetConfig.CC.$default$getTargetClass(this);
        }

        @Override // androidx.camera.core.internal.TargetConfig
        public /* sintético */ Class getTargetClass(Class cls) {
            return TargetConfig.CC.$default$getTargetClass(this, cls);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ Range getTargetFrameRate() {
            return UseCaseConfig.CC.$default$getTargetFrameRate(this);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ Range getTargetFrameRate(Range range) {
            return UseCaseConfig.CC.$default$getTargetFrameRate(this, range);
        }

        @Override // androidx.camera.core.internal.TargetConfig
        public /* sintético */ String getTargetName() {
            return TargetConfig.CC.$default$getTargetName(this);
        }

        @Override // androidx.camera.core.internal.TargetConfig
        public /* sintético */ String getTargetName(String str) {
            return TargetConfig.CC.$default$getTargetName(this, str);
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ int getVideoStabilizationMode() {
            int intValue;
            intValue = ((Integer) retrieveOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, 0)).intValue();
            return intValue;
        }

        @Override // androidx.camera.core.impl.ImageInputConfig
        public /* sintético */ boolean hasDynamicRange() {
            boolean containsOption;
            containsOption = containsOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE);
            return containsOption;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ boolean hasTargetFrameRate() {
            boolean containsOption;
            containsOption = containsOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE);
            return containsOption;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ boolean isHighResolutionDisabled(boolean z) {
            boolean booleanValue;
            booleanValue = ((Boolean) retrieveOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(z))).booleanValue();
            return booleanValue;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ boolean isStrictFrameRateRequired() {
            boolean booleanValue;
            booleanValue = ((Boolean) Objects.requireNonNull((Boolean) retrieveOption(UseCaseConfig.OPTION_IS_STRICT_FRAME_RATE_REQUIRED, false))).booleanValue();
            return booleanValue;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public /* sintético */ boolean isZslDisabled(boolean z) {
            boolean booleanValue;
            booleanValue = ((Boolean) retrieveOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(z))).booleanValue();
            return booleanValue;
        }

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ Set listOptions() {
            Set listOptions;
            listOptions = getConfig().listOptions();
            return listOptions;
        }

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ Object retrieveOption(Config.Option option) {
            Object retrieveOption;
            retrieveOption = getConfig().retrieveOption(option);
            return retrieveOption;
        }

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ Object retrieveOption(Config.Option option, Object obj) {
            Object retrieveOption;
            retrieveOption = getConfig().retrieveOption(option, obj);
            return retrieveOption;
        }

        @Override // androidx.camera.core.impl.ReadableConfig, androidx.camera.core.impl.Config
        public /* sintético */ Object retrieveOptionWithPriority(Config.Option option, Config.OptionPriority optionPriority) {
            Object retrieveOptionWithPriority;
            retrieveOptionWithPriority = getConfig().retrieveOptionWithPriority(option, optionPriority);
            return retrieveOptionWithPriority;
        }

        MeteringRepeatingConfig() {
            MutableOptionsBundle mutableOptionsBundle = MutableOptionsBundle.create();
            mutableOptionsBundle.insertOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, new Camera2SessionOptionUnpacker());
            mutableOptionsBundle.insertOption(OPTION_INPUT_FORMAT, 34);
            setTargetConfigs(mutableOptionsBundle);
            this.mConfig = mutableOptionsBundle;
        }

        @Override // androidx.camera.core.impl.ReadableConfig
        public Config getConfig() {
            return this.mConfig;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public UseCaseConfigFactory.CaptureType getCaptureType() {
            return UseCaseConfigFactory.CaptureType.METERING_REPEATING;
        }

        private void setTargetConfigs(MutableOptionsBundle mutableOptionsBundle) {
            mutableOptionsBundle.insertOption(OPTION_TARGET_CLASS, MeteringRepeatingSession.class);
            String targetName = MeteringRepeatingSession.class.getCanonicalName() + "-" + UUID.randomUUID();
            mutableOptionsBundle.insertOption(OPTION_TARGET_NAME, targetName);
        }
    }

    private Size getProperPreviewSize(CameraCharacteristicsCompat cameraCharacteristicsCompat, DisplayInfoManager displayInfoManager) {
        StreamConfigurationMapCompat mapCompat = cameraCharacteristicsCompat.getStreamConfigurationMapCompat();
        Size[] outputSizes = mapCompat.getOutputSizes(34);
        if (outputSizes == null) {
            Logger.e(TAG, "Can not get output size list.");
            return new Size(0, 0);
        }
        Size[] outputSizes2 = this.mSupportedRepeatingSurfaceSize.getSupportedSizes(outputSizes);
        List<Size> outSizesList = Arrays.asList(outputSizes2);
        Collections.sort(outSizesList, new Comparator() { // da classe: androidx.camera.camera2.internal.MeteringRepeatingSession$$ExternalSyntheticLambda1
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return MeteringRepeatingSession.lambda$getProperPreviewSize$1((Size) obj, (Size) obj2);
            }
        });
        Size previewMaxSize = displayInfoManager.getPreviewSize();
        long maxSizeProduct = Math.min(previewMaxSize.getWidth() * previewMaxSize.getHeight(), 307200L);
        Size previousSize = null;
        int length = outputSizes2.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            Size outputSize = outputSizes2[i];
            long product = outputSize.getWidth() * outputSize.getHeight();
            if (product == maxSizeProduct) {
                return outputSize;
            }
            if (product > maxSizeProduct) {
                if (previousSize != null) {
                    return previousSize;
                }
            } else {
                previousSize = outputSize;
                i++;
            }
        }
        return outSizesList.get(0);
    }

    static /* sintético */ int lambda$getProperPreviewSize$1(Size o1, Size o2) {
        int result = Long.signum((o1.getWidth() * o1.getHeight()) - (o2.getWidth() * o2.getHeight()));
        return result;
    }
}
