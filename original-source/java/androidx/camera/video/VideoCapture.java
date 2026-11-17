package androidx.camera.video;

import android.graphics.Rect;
import android.media.MediaCodec;
import android.os.SystemClock;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.ImageAnalysis$$ExternalSyntheticBackport1;
import androidx.camera.core.Logger;
import androidx.camera.core.ResolutionInfo;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CameraCaptureResult;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CameraInfoInternal;
import androidx.camera.core.impl.CameraInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.ConfigProvider;
import androidx.camera.core.impl.ConstantObservable;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.EncoderProfilesProxy;
import androidx.camera.core.impl.ImageInputConfig;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.StreamUseCase;
import androidx.camera.core.impl.Timebase;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.TransformUtils;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.internal.TargetConfig;
import androidx.camera.core.internal.ThreadConfig;
import androidx.camera.core.internal.compat.quirk.SurfaceProcessingQuirk;
import androidx.camera.core.internal.utils.SizeUtil;
import androidx.camera.core.processing.DefaultSurfaceProcessor;
import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.camera.core.processing.util.OutConfig;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.video.StreamInfo;
import androidx.camera.video.VideoCapture;
import androidx.camera.video.VideoOutput;
import androidx.camera.video.impl.VideoCaptureConfig;
import androidx.camera.video.internal.VideoValidatedEncoderProfilesProxy;
import androidx.camera.video.internal.compat.quirk.DeviceQuirks;
import androidx.camera.video.internal.compat.quirk.HdrRepeatingRequestFailureQuirk;
import androidx.camera.video.internal.compat.quirk.SizeCannotEncodeVideoQuirk;
import androidx.camera.video.internal.config.VideoConfigUtil;
import androidx.camera.video.internal.config.VideoMimeInfo;
import androidx.camera.video.internal.encoder.SwappedVideoEncoderInfo;
import androidx.camera.video.internal.encoder.VideoEncoderInfo;
import androidx.camera.video.internal.encoder.VideoEncoderInfoImpl;
import androidx.camera.video.internal.utils.DynamicRangeUtil;
import androidx.camera.video.internal.workaround.VideoEncoderInfoWrapper;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class VideoCapture<T extends VideoOutput> extends UseCase {
    private static final Defaults DEFAULT_CONFIG = new Defaults();
    private static final String SURFACE_UPDATE_KEY = "androidx.camera.video.VideoCapture.streamUpdate";
    private static final String TAG = "VideoCapture";
    private SurfaceEdge mCameraEdge;
    private SessionConfig.CloseableErrorListener mCloseableErrorListener;
    private Rect mCropRect;
    DeferrableSurface mDeferrableSurface;
    private boolean mHasCompensatingTransformation;
    private SurfaceProcessorNode mNode;
    private Map<Quality, List<Size>> mQualityToCustomSizesMap;
    private int mRotationDegrees;
    SessionConfig.Builder mSessionConfigBuilder;
    VideoOutput.SourceState mSourceState;
    private SourceStreamRequirementObserver mSourceStreamRequirementObserver;
    StreamInfo mStreamInfo;
    private final Observable.Observer<StreamInfo> mStreamInfoObserver;
    private SurfaceRequest mSurfaceRequest;
    ListenableFuture<Void> mSurfaceUpdateFuture;

    public static <T extends VideoOutput> VideoCapture<T> withOutput(T videoOutput) {
        return new Builder((VideoOutput) Preconditions.checkNotNull(videoOutput)).build();
    }

    VideoCapture(VideoCaptureConfig<T> config) {
        super(config);
        this.mStreamInfo = StreamInfo.STREAM_INFO_ANY_INACTIVE;
        this.mSessionConfigBuilder = new SessionConfig.Builder();
        this.mSurfaceUpdateFuture = null;
        this.mSourceState = VideoOutput.SourceState.INACTIVE;
        this.mHasCompensatingTransformation = false;
        this.mQualityToCustomSizesMap = Collections.emptyMap();
        this.mStreamInfoObserver = new Observable.Observer<StreamInfo>() { // from class: androidx.camera.video.VideoCapture.1
            @Override // androidx.camera.core.impl.Observable.Observer
            public void onNewData(StreamInfo streamInfo) {
                List m;
                List m2;
                if (streamInfo == null) {
                    throw new IllegalArgumentException("StreamInfo can't be null");
                }
                if (VideoCapture.this.mSourceState == VideoOutput.SourceState.INACTIVE) {
                    return;
                }
                Logger.d(VideoCapture.TAG, "Stream info update: old: " + VideoCapture.this.mStreamInfo + " new: " + streamInfo);
                StreamInfo currentStreamInfo = VideoCapture.this.mStreamInfo;
                VideoCapture.this.mStreamInfo = streamInfo;
                StreamSpec attachedStreamSpec = (StreamSpec) Preconditions.checkNotNull(VideoCapture.this.getAttachedStreamSpec());
                if (VideoCapture.this.isStreamIdChanged(currentStreamInfo.getId(), streamInfo.getId()) || VideoCapture.this.shouldResetCompensatingTransformation(currentStreamInfo, streamInfo)) {
                    VideoCapture.this.resetPipeline();
                    return;
                }
                if ((currentStreamInfo.getId() != -1 && streamInfo.getId() == -1) || (currentStreamInfo.getId() == -1 && streamInfo.getId() != -1)) {
                    VideoCapture.this.applyStreamInfoAndStreamSpecToSessionConfigBuilder(VideoCapture.this.mSessionConfigBuilder, streamInfo, attachedStreamSpec);
                    VideoCapture videoCapture = VideoCapture.this;
                    m2 = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{VideoCapture.this.mSessionConfigBuilder.build()});
                    videoCapture.updateSessionConfig(m2);
                    VideoCapture.this.notifyReset();
                    return;
                }
                if (currentStreamInfo.getStreamState() != streamInfo.getStreamState()) {
                    VideoCapture.this.applyStreamInfoAndStreamSpecToSessionConfigBuilder(VideoCapture.this.mSessionConfigBuilder, streamInfo, attachedStreamSpec);
                    VideoCapture videoCapture2 = VideoCapture.this;
                    m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{VideoCapture.this.mSessionConfigBuilder.build()});
                    videoCapture2.updateSessionConfig(m);
                    VideoCapture.this.notifyUpdated();
                }
            }

            @Override // androidx.camera.core.impl.Observable.Observer
            public void onError(Throwable t) {
                Logger.w(VideoCapture.TAG, "Receive onError from StreamState observer", t);
            }
        };
    }

    public T getOutput() {
        return (T) ((VideoCaptureConfig) getCurrentConfig()).getVideoOutput();
    }

    public int getTargetRotation() {
        return getTargetRotationInternal();
    }

    public Range<Integer> getTargetFrameRate() {
        return getTargetFrameRateInternal();
    }

    public boolean isVideoStabilizationEnabled() {
        return getCurrentConfig().getVideoStabilizationMode() == 2;
    }

    public void setTargetRotation(int rotation) {
        if (setTargetRotationInternal(rotation)) {
            sendTransformationInfoIfReady();
        }
    }

    public ResolutionInfo getResolutionInfo() {
        return getResolutionInfoInternal();
    }

    public Quality getSelectedQuality() {
        StreamSpec streamSpec = getAttachedStreamSpec();
        if (streamSpec == null) {
            return null;
        }
        Size configuredResolution = streamSpec.getOriginalConfiguredResolution();
        for (Map.Entry<Quality, List<Size>> entry : this.mQualityToCustomSizesMap.entrySet()) {
            if (entry.getValue().contains(configuredResolution)) {
                return entry.getKey();
            }
        }
        Logger.w(TAG, "Can't find matched Quality for " + configuredResolution);
        return findNearestSizeFor(this.mQualityToCustomSizesMap, configuredResolution);
    }

    @Override // androidx.camera.core.UseCase
    protected ResolutionInfo getResolutionInfoInternal() {
        CameraInternal camera = getCamera();
        Size resolution = getAttachedSurfaceResolution();
        Rect cropRect = this.mCropRect;
        int rotationDegrees = this.mRotationDegrees;
        if (camera == null || resolution == null || cropRect == null) {
            return null;
        }
        return new ResolutionInfo(resolution, cropRect, rotationDegrees);
    }

    public int getMirrorMode() {
        int mirrorMode = getMirrorModeInternal();
        if (mirrorMode == -1) {
            return 0;
        }
        return mirrorMode;
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecUpdated(StreamSpec primaryStreamSpec, StreamSpec secondaryStreamSpec) {
        Logger.d(TAG, "onSuggestedStreamSpecUpdated: primaryStreamSpec = " + primaryStreamSpec + ", secondaryStreamSpec " + secondaryStreamSpec);
        VideoCaptureConfig<T> config = (VideoCaptureConfig) getCurrentConfig();
        List<Size> customOrderedResolutions = config.getCustomOrderedResolutions(null);
        if (customOrderedResolutions != null && !customOrderedResolutions.contains(primaryStreamSpec.getResolution())) {
            Logger.w(TAG, "suggested resolution " + primaryStreamSpec.getResolution() + " is not in custom ordered resolutions " + customOrderedResolutions);
        }
        return primaryStreamSpec;
    }

    public DynamicRange getDynamicRange() {
        return getCurrentConfig().hasDynamicRange() ? getCurrentConfig().getDynamicRange() : Defaults.DEFAULT_DYNAMIC_RANGE;
    }

    @Override // androidx.camera.core.UseCase
    public void onSessionStart() {
        List<SessionConfig> m;
        super.onSessionStart();
        Logger.d(TAG, "VideoCapture#onStateAttached: cameraID = " + getCameraId());
        if (getAttachedStreamSpec() == null || this.mSurfaceRequest != null) {
            return;
        }
        StreamSpec attachedStreamSpec = (StreamSpec) Preconditions.checkNotNull(getAttachedStreamSpec());
        this.mStreamInfo = (StreamInfo) fetchObservableValue(getOutput().getStreamInfo(), StreamInfo.STREAM_INFO_ANY_INACTIVE);
        this.mSessionConfigBuilder = createPipeline((VideoCaptureConfig) getCurrentConfig(), attachedStreamSpec);
        applyStreamInfoAndStreamSpecToSessionConfigBuilder(this.mSessionConfigBuilder, this.mStreamInfo, attachedStreamSpec);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        notifyActive();
        getOutput().getStreamInfo().addObserver(CameraXExecutors.mainThreadExecutor(), this.mStreamInfoObserver);
        if (this.mSourceStreamRequirementObserver != null) {
            this.mSourceStreamRequirementObserver.close();
        }
        this.mSourceStreamRequirementObserver = new SourceStreamRequirementObserver(getCameraControl());
        getOutput().isSourceStreamRequired().addObserver(CameraXExecutors.mainThreadExecutor(), this.mSourceStreamRequirementObserver);
        setSourceState(VideoOutput.SourceState.ACTIVE_NON_STREAMING);
    }

    @Override // androidx.camera.core.UseCase
    public void setViewPortCropRect(Rect viewPortCropRect) {
        super.setViewPortCropRect(viewPortCropRect);
        sendTransformationInfoIfReady();
    }

    @Override // androidx.camera.core.UseCase
    public void onSessionStop() {
        Logger.d(TAG, "VideoCapture#onStateDetached");
        Preconditions.checkState(Threads.isMainThread(), "VideoCapture can only be detached on the main thread.");
        if (this.mSourceStreamRequirementObserver != null) {
            getOutput().isSourceStreamRequired().removeObserver(this.mSourceStreamRequirementObserver);
            this.mSourceStreamRequirementObserver.close();
            this.mSourceStreamRequirementObserver = null;
        }
        setSourceState(VideoOutput.SourceState.INACTIVE);
        getOutput().getStreamInfo().removeObserver(this.mStreamInfoObserver);
        if (this.mSurfaceUpdateFuture != null && this.mSurfaceUpdateFuture.cancel(false)) {
            Logger.d(TAG, "VideoCapture is detached from the camera. Surface update cancelled.");
        }
        clearPipeline();
    }

    @Override // androidx.camera.core.UseCase
    protected StreamSpec onSuggestedStreamSpecImplementationOptionsUpdated(Config config) {
        List<SessionConfig> m;
        this.mSessionConfigBuilder.addImplementationOptions(config);
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        return ((StreamSpec) Objects.requireNonNull(getAttachedStreamSpec())).toBuilder().setImplementationOptions(config).build();
    }

    public String toString() {
        return "VideoCapture:" + getName();
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    public UseCaseConfig<?> getDefaultConfig(boolean applyDefaultConfig, UseCaseConfigFactory factory) {
        Config captureConfig = factory.getConfig(DEFAULT_CONFIG.getConfig().getCaptureType(), 1);
        if (applyDefaultConfig) {
            captureConfig = Config.CC.mergeConfigs(captureConfig, DEFAULT_CONFIG.getConfig());
        }
        if (captureConfig == null) {
            return null;
        }
        return getUseCaseConfigBuilder(captureConfig).getUseCaseConfig();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [androidx.camera.core.impl.UseCaseConfig, androidx.camera.core.impl.UseCaseConfig<?>] */
    @Override // androidx.camera.core.UseCase
    protected UseCaseConfig<?> onMergeConfig(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) {
        updateCustomOrderedResolutionsByQuality(cameraInfo, builder);
        return builder.getUseCaseConfig();
    }

    @Override // androidx.camera.core.UseCase
    public UseCaseConfig.Builder<?, ?, ?> getUseCaseConfigBuilder(Config config) {
        return Builder.fromConfig(config);
    }

    private void sendTransformationInfoIfReady() {
        CameraInternal cameraInternal = getCamera();
        SurfaceEdge cameraEdge = this.mCameraEdge;
        if (cameraInternal != null && cameraEdge != null) {
            this.mRotationDegrees = getCompensatedRotation(cameraInternal);
            cameraEdge.updateTransformation(this.mRotationDegrees, getAppTargetRotation());
        }
    }

    private Rect adjustCropRectWithInProgressTransformation(Rect cropRect, int rotationDegrees) {
        if (!shouldCompensateTransformation()) {
            return cropRect;
        }
        Rect adjustedCropRect = TransformUtils.sizeToRect(TransformUtils.getRotatedSize(((SurfaceRequest.TransformationInfo) Preconditions.checkNotNull(this.mStreamInfo.getInProgressTransformationInfo())).getCropRect(), rotationDegrees));
        return adjustedCropRect;
    }

    private int getCompensatedRotation(CameraInternal cameraInternal) {
        boolean isMirroringRequired = isMirroringRequired(cameraInternal);
        int rotationDegrees = getRelativeRotation(cameraInternal, isMirroringRequired);
        if (shouldCompensateTransformation()) {
            SurfaceRequest.TransformationInfo transformationInfo = (SurfaceRequest.TransformationInfo) Objects.requireNonNull(this.mStreamInfo.getInProgressTransformationInfo());
            int inProgressDegrees = transformationInfo.getRotationDegrees();
            if (isMirroringRequired != transformationInfo.isMirroring()) {
                inProgressDegrees = -inProgressDegrees;
            }
            return TransformUtils.within360(rotationDegrees - inProgressDegrees);
        }
        return rotationDegrees;
    }

    private Size adjustResolutionWithInProgressTransformation(Size resolution, Rect originalCropRect, Rect targetCropRect) {
        if (!shouldCompensateTransformation() || targetCropRect.equals(originalCropRect)) {
            return resolution;
        }
        float targetRatio = targetCropRect.height() / originalCropRect.height();
        Size nodeResolution = new Size((int) Math.ceil(resolution.getWidth() * targetRatio), (int) Math.ceil(resolution.getHeight() * targetRatio));
        return nodeResolution;
    }

    Rect getCropRect() {
        return this.mCropRect;
    }

    int getRotationDegrees() {
        return this.mRotationDegrees;
    }

    private Rect calculateCropRect(Size surfaceResolution, VideoEncoderInfo videoEncoderInfo) {
        Rect cropRect;
        if (getViewPortCropRect() != null) {
            cropRect = getViewPortCropRect();
        } else {
            cropRect = new Rect(0, 0, surfaceResolution.getWidth(), surfaceResolution.getHeight());
        }
        if (videoEncoderInfo == null || videoEncoderInfo.isSizeSupportedAllowSwapping(cropRect.width(), cropRect.height())) {
            return cropRect;
        }
        return adjustCropRectToValidSize(cropRect, surfaceResolution, videoEncoderInfo);
    }

    private SessionConfig.Builder createPipeline(final VideoCaptureConfig<T> config, StreamSpec streamSpec) {
        final VideoCapture<T> videoCapture = this;
        Threads.checkMainThread();
        final CameraInternal camera = (CameraInternal) Preconditions.checkNotNull(videoCapture.getCamera());
        Size resolution = streamSpec.getResolution();
        Runnable onSurfaceInvalidated = new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                VideoCapture.this.notifyReset();
            }
        };
        Range<Integer> expectedFrameRate = resolveFrameRate(streamSpec);
        MediaSpec mediaSpec = (MediaSpec) Objects.requireNonNull(videoCapture.getMediaSpec());
        int sessionType = streamSpec.getSessionType();
        VideoCapabilities videoCapabilities = videoCapture.getVideoCapabilities(camera.getCameraInfo(), sessionType);
        DynamicRange dynamicRange = streamSpec.getDynamicRange();
        VideoValidatedEncoderProfilesProxy encoderProfiles = videoCapabilities.findNearestHigherSupportedEncoderProfilesFor(resolution, dynamicRange);
        VideoEncoderInfo videoEncoderInfo = resolveVideoEncoderInfo(config.getVideoEncoderInfoFinder(), encoderProfiles, mediaSpec, dynamicRange);
        videoCapture.mRotationDegrees = videoCapture.getCompensatedRotation(camera);
        Rect originalCropRect = videoCapture.calculateCropRect(resolution, videoEncoderInfo);
        videoCapture.mCropRect = videoCapture.adjustCropRectWithInProgressTransformation(originalCropRect, videoCapture.mRotationDegrees);
        Size nodeResolution = videoCapture.adjustResolutionWithInProgressTransformation(resolution, originalCropRect, videoCapture.mCropRect);
        if (videoCapture.shouldCompensateTransformation()) {
            videoCapture.mHasCompensatingTransformation = true;
        }
        videoCapture.mCropRect = adjustCropRectByQuirk(videoCapture.mCropRect, videoCapture.mRotationDegrees, videoCapture.isCreateNodeNeeded(camera, config, sessionType, videoCapture.mCropRect, resolution, dynamicRange), videoEncoderInfo);
        videoCapture.mNode = videoCapture.createNodeIfNeeded(camera, config, sessionType, videoCapture.mCropRect, resolution, dynamicRange);
        final boolean hasGlProcessing = (camera.getHasTransform() && videoCapture.mNode == null) ? false : true;
        final Timebase timebase = resolveTimebase(camera, videoCapture.mNode);
        Logger.d(TAG, "camera timebase = " + camera.getCameraInfoInternal().getTimebase() + ", processing timebase = " + timebase);
        StreamSpec updatedStreamSpec = streamSpec.toBuilder().setResolution(nodeResolution).setExpectedFrameRateRange(expectedFrameRate).build();
        Preconditions.checkState(videoCapture.mCameraEdge == null);
        videoCapture.mCameraEdge = new SurfaceEdge(2, 34, updatedStreamSpec, videoCapture.getSensorToBufferTransformMatrix(), camera.getHasTransform(), videoCapture.mCropRect, videoCapture.mRotationDegrees, videoCapture.getAppTargetRotation(), videoCapture.shouldMirror(camera));
        videoCapture.mCameraEdge.addOnInvalidatedListener(onSurfaceInvalidated);
        if (videoCapture.mNode != null) {
            OutConfig outConfig = OutConfig.of(videoCapture.mCameraEdge);
            SurfaceProcessorNode.In nodeInput = SurfaceProcessorNode.In.of(videoCapture.mCameraEdge, Collections.singletonList(outConfig));
            SurfaceProcessorNode.Out nodeOutput = videoCapture.mNode.transform(nodeInput);
            final SurfaceEdge appEdge = (SurfaceEdge) Objects.requireNonNull(nodeOutput.get(outConfig));
            Runnable runnable = new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    VideoCapture.this.m257lambda$createPipeline$1$androidxcameravideoVideoCapture(appEdge, camera, config, timebase, hasGlProcessing);
                }
            };
            videoCapture = this;
            camera = camera;
            appEdge.addOnInvalidatedListener(runnable);
            videoCapture.mSurfaceRequest = appEdge.createSurfaceRequest(camera);
            videoCapture.mDeferrableSurface = videoCapture.mCameraEdge.getDeferrableSurface();
            final DeferrableSurface latestDeferrableSurface = videoCapture.mDeferrableSurface;
            videoCapture.mDeferrableSurface.getTerminationFuture().addListener(new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    VideoCapture.this.m258lambda$createPipeline$2$androidxcameravideoVideoCapture(latestDeferrableSurface);
                }
            }, CameraXExecutors.mainThreadExecutor());
        } else {
            videoCapture.mSurfaceRequest = videoCapture.mCameraEdge.createSurfaceRequest(camera);
            videoCapture.mDeferrableSurface = videoCapture.mSurfaceRequest.getDeferrableSurface();
        }
        config.getVideoOutput().onSurfaceRequested(videoCapture.mSurfaceRequest, timebase, hasGlProcessing);
        videoCapture.sendTransformationInfoIfReady();
        videoCapture.mDeferrableSurface.setContainerClass(MediaCodec.class);
        SessionConfig.Builder sessionConfigBuilder = SessionConfig.Builder.createFrom(config, streamSpec.getResolution());
        sessionConfigBuilder.setSessionType(sessionType);
        videoCapture.applyExpectedFrameRateRange(sessionConfigBuilder, streamSpec);
        sessionConfigBuilder.setVideoStabilization(config.getVideoStabilizationMode());
        if (videoCapture.mCloseableErrorListener != null) {
            videoCapture.mCloseableErrorListener.close();
        }
        videoCapture.mCloseableErrorListener = new SessionConfig.CloseableErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda5
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                VideoCapture.this.m259lambda$createPipeline$3$androidxcameravideoVideoCapture(sessionConfig, sessionError);
            }
        });
        sessionConfigBuilder.setErrorListener(videoCapture.mCloseableErrorListener);
        if (streamSpec.getImplementationOptions() != null) {
            sessionConfigBuilder.addImplementationOptions(streamSpec.getImplementationOptions());
        }
        return sessionConfigBuilder;
    }

    /* renamed from: lambda$createPipeline$2$androidx-camera-video-VideoCapture, reason: not valid java name */
    /* synthetic */ void m258lambda$createPipeline$2$androidxcameravideoVideoCapture(DeferrableSurface latestDeferrableSurface) {
        if (latestDeferrableSurface == this.mDeferrableSurface) {
            clearPipeline();
        }
    }

    /* renamed from: lambda$createPipeline$3$androidx-camera-video-VideoCapture, reason: not valid java name */
    /* synthetic */ void m259lambda$createPipeline$3$androidxcameravideoVideoCapture(SessionConfig sessionConfig, SessionConfig.SessionError error) {
        resetPipeline();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: onAppEdgeInvalidated, reason: merged with bridge method [inline-methods] */
    public void m257lambda$createPipeline$1$androidxcameravideoVideoCapture(SurfaceEdge appEdge, CameraInternal camera, VideoCaptureConfig<T> config, Timebase timebase, boolean hasGlProcessing) {
        if (camera == getCamera()) {
            this.mSurfaceRequest = appEdge.createSurfaceRequest(camera);
            config.getVideoOutput().onSurfaceRequested(this.mSurfaceRequest, timebase, hasGlProcessing);
            sendTransformationInfoIfReady();
        }
    }

    private void clearPipeline() {
        Threads.checkMainThread();
        if (this.mCloseableErrorListener != null) {
            this.mCloseableErrorListener.close();
            this.mCloseableErrorListener = null;
        }
        if (this.mDeferrableSurface != null) {
            this.mDeferrableSurface.close();
            this.mDeferrableSurface = null;
        }
        if (this.mNode != null) {
            this.mNode.release();
            this.mNode = null;
        }
        if (this.mCameraEdge != null) {
            this.mCameraEdge.close();
            this.mCameraEdge = null;
        }
        this.mCropRect = null;
        this.mSurfaceRequest = null;
        this.mStreamInfo = StreamInfo.STREAM_INFO_ANY_INACTIVE;
        this.mRotationDegrees = 0;
        this.mHasCompensatingTransformation = false;
    }

    void resetPipeline() {
        List<SessionConfig> m;
        if (getCamera() == null) {
            return;
        }
        clearPipeline();
        this.mSessionConfigBuilder = createPipeline((VideoCaptureConfig) getCurrentConfig(), (StreamSpec) Preconditions.checkNotNull(getAttachedStreamSpec()));
        applyStreamInfoAndStreamSpecToSessionConfigBuilder(this.mSessionConfigBuilder, this.mStreamInfo, getAttachedStreamSpec());
        m = ImageAnalysis$$ExternalSyntheticBackport1.m(new Object[]{this.mSessionConfigBuilder.build()});
        updateSessionConfig(m);
        notifyReset();
    }

    SurfaceEdge getCameraEdge() {
        return this.mCameraEdge;
    }

    public static final class Defaults implements ConfigProvider<VideoCaptureConfig<?>> {
        private static final int DEFAULT_SURFACE_OCCUPANCY_PRIORITY = 5;
        private static final StreamUseCase DEFAULT_STREAM_USE_CASE = StreamUseCase.VIDEO_RECORD;
        private static final VideoOutput DEFAULT_VIDEO_OUTPUT = new VideoOutput() { // from class: androidx.camera.video.VideoCapture$Defaults$$ExternalSyntheticLambda0
            @Override // androidx.camera.video.VideoOutput
            public /* synthetic */ VideoCapabilities getMediaCapabilities(CameraInfo cameraInfo, int i) {
                VideoCapabilities videoCapabilities;
                videoCapabilities = VideoCapabilities.EMPTY;
                return videoCapabilities;
            }

            @Override // androidx.camera.video.VideoOutput
            public /* synthetic */ Observable getMediaSpec() {
                Observable withValue;
                withValue = ConstantObservable.withValue(null);
                return withValue;
            }

            @Override // androidx.camera.video.VideoOutput
            public /* synthetic */ Observable getStreamInfo() {
                Observable observable;
                observable = StreamInfo.ALWAYS_ACTIVE_OBSERVABLE;
                return observable;
            }

            @Override // androidx.camera.video.VideoOutput
            public /* synthetic */ Observable isSourceStreamRequired() {
                Observable withValue;
                withValue = ConstantObservable.withValue(false);
                return withValue;
            }

            @Override // androidx.camera.video.VideoOutput
            public /* synthetic */ void onSourceStateChanged(VideoOutput.SourceState sourceState) {
                VideoOutput.CC.$default$onSourceStateChanged(this, sourceState);
            }

            @Override // androidx.camera.video.VideoOutput
            public final void onSurfaceRequested(SurfaceRequest surfaceRequest) {
                surfaceRequest.willNotProvideSurface();
            }

            @Override // androidx.camera.video.VideoOutput
            public /* synthetic */ void onSurfaceRequested(SurfaceRequest surfaceRequest, Timebase timebase, boolean z) {
                onSurfaceRequested(surfaceRequest);
            }
        };
        private static final VideoEncoderInfo.Finder DEFAULT_VIDEO_ENCODER_INFO_FINDER = VideoEncoderInfoImpl.FINDER;
        static final Range<Integer> DEFAULT_FPS_RANGE = new Range<>(30, 30);
        static final Range<Integer> DEFAULT_HIGH_SPEED_FPS_RANGE = new Range<>(120, 120);
        static final DynamicRange DEFAULT_DYNAMIC_RANGE = DynamicRange.SDR;
        private static final VideoCaptureConfig<?> DEFAULT_CONFIG = new Builder(DEFAULT_VIDEO_OUTPUT).setSurfaceOccupancyPriority(5).setStreamUseCase(DEFAULT_STREAM_USE_CASE).setVideoEncoderInfoFinder(DEFAULT_VIDEO_ENCODER_INFO_FINDER).setDynamicRange(DEFAULT_DYNAMIC_RANGE).getUseCaseConfig();

        @Override // androidx.camera.core.impl.ConfigProvider
        public VideoCaptureConfig<?> getConfig() {
            return DEFAULT_CONFIG;
        }
    }

    private MediaSpec getMediaSpec() {
        return (MediaSpec) fetchObservableValue(getOutput().getMediaSpec(), null);
    }

    private MediaSpec getMediaSpecOrThrow() throws IllegalArgumentException {
        MediaSpec mediaSpec = getMediaSpec();
        if (mediaSpec == null) {
            throw new IllegalArgumentException("MediaSpec can't be null");
        }
        return mediaSpec;
    }

    private VideoCapabilities getVideoCapabilities(CameraInfo cameraInfo, int sessionType) {
        return getOutput().getMediaCapabilities(cameraInfo, sessionType);
    }

    static class SourceStreamRequirementObserver implements Observable.Observer<Boolean> {
        private CameraControlInternal mCameraControl;
        private boolean mIsSourceStreamRequired = false;

        SourceStreamRequirementObserver(CameraControlInternal cameraControl) {
            this.mCameraControl = cameraControl;
        }

        @Override // androidx.camera.core.impl.Observable.Observer
        public void onNewData(Boolean value) {
            Preconditions.checkState(Threads.isMainThread(), "SourceStreamRequirementObserver can be updated from main thread only");
            updateVideoUsageInCamera(Boolean.TRUE.equals(value));
        }

        @Override // androidx.camera.core.impl.Observable.Observer
        public void onError(Throwable t) {
            Logger.w(VideoCapture.TAG, "SourceStreamRequirementObserver#onError", t);
        }

        private void updateVideoUsageInCamera(boolean isRequired) {
            if (this.mIsSourceStreamRequired == isRequired) {
                return;
            }
            this.mIsSourceStreamRequired = isRequired;
            if (this.mCameraControl != null) {
                if (this.mIsSourceStreamRequired) {
                    this.mCameraControl.incrementVideoUsage();
                    return;
                } else {
                    this.mCameraControl.decrementVideoUsage();
                    return;
                }
            }
            Logger.d(VideoCapture.TAG, "SourceStreamRequirementObserver#isSourceStreamRequired: Received new data despite being closed already");
        }

        public void close() {
            Preconditions.checkState(Threads.isMainThread(), "SourceStreamRequirementObserver can be closed from main thread only");
            Logger.d(VideoCapture.TAG, "SourceStreamRequirementObserver#close: mIsSourceStreamRequired = " + this.mIsSourceStreamRequired);
            if (this.mCameraControl == null) {
                Logger.d(VideoCapture.TAG, "SourceStreamRequirementObserver#close: Already closed!");
            } else {
                updateVideoUsageInCamera(false);
                this.mCameraControl = null;
            }
        }
    }

    void applyStreamInfoAndStreamSpecToSessionConfigBuilder(SessionConfig.Builder sessionConfigBuilder, StreamInfo streamInfo, StreamSpec streamSpec) {
        boolean isStreamError = streamInfo.getId() == -1;
        boolean isStreamActive = streamInfo.getStreamState() == StreamInfo.StreamState.ACTIVE;
        if (isStreamError && isStreamActive) {
            throw new IllegalStateException("Unexpected stream state, stream is error but active");
        }
        sessionConfigBuilder.clearSurfaces();
        DynamicRange dynamicRange = streamSpec.getDynamicRange();
        if (!isStreamError && this.mDeferrableSurface != null) {
            if (isStreamActive) {
                sessionConfigBuilder.addSurface(this.mDeferrableSurface, dynamicRange, null, -1);
            } else {
                sessionConfigBuilder.addNonRepeatingSurface(this.mDeferrableSurface, dynamicRange);
            }
        }
        setupSurfaceUpdateNotifier(sessionConfigBuilder, isStreamActive);
    }

    private boolean isCreateNodeNeeded(CameraInternal camera, VideoCaptureConfig<?> config, int sessionType, Rect cropRect, Size resolution, DynamicRange dynamicRange) {
        if (sessionType == 1) {
            return false;
        }
        return getEffect() != null || shouldEnableSurfaceProcessingByConfig(camera, config) || shouldEnableSurfaceProcessingByQuirk(camera) || shouldEnableSurfaceProcessingBasedOnDynamicRangeByQuirk(camera, dynamicRange) || shouldCrop(cropRect, resolution) || shouldMirror(camera) || shouldCompensateTransformation();
    }

    private SurfaceProcessorNode createNodeIfNeeded(CameraInternal camera, VideoCaptureConfig<T> config, int sessionType, Rect cropRect, Size resolution, DynamicRange dynamicRange) {
        if (isCreateNodeNeeded(camera, config, sessionType, cropRect, resolution, dynamicRange)) {
            Logger.d(TAG, "Surface processing is enabled.");
            return new SurfaceProcessorNode((CameraInternal) Objects.requireNonNull(getCamera()), getEffect() != null ? getEffect().createSurfaceProcessorInternal() : DefaultSurfaceProcessor.Factory.newInstance(dynamicRange));
        }
        return null;
    }

    SurfaceProcessorNode getNode() {
        return this.mNode;
    }

    private static Rect adjustCropRectByQuirk(Rect cropRect, int rotationDegrees, boolean isSurfaceProcessingEnabled, VideoEncoderInfo videoEncoderInfo) {
        SizeCannotEncodeVideoQuirk quirk = (SizeCannotEncodeVideoQuirk) DeviceQuirks.get(SizeCannotEncodeVideoQuirk.class);
        if (quirk != null) {
            return quirk.adjustCropRectForProblematicEncodeSize(cropRect, isSurfaceProcessingEnabled ? rotationDegrees : 0, videoEncoderInfo);
        }
        return cropRect;
    }

    private static Rect adjustCropRectToValidSize(final Rect cropRect, Size resolution, VideoEncoderInfo videoEncoderInfo) {
        boolean swapWidthHeightConstraints;
        VideoEncoderInfo videoEncoderInfo2;
        Logger.d(TAG, String.format("Adjust cropRect %s by width/height alignment %d/%d and supported widths %s / supported heights %s", TransformUtils.rectToString(cropRect), Integer.valueOf(videoEncoderInfo.getWidthAlignment()), Integer.valueOf(videoEncoderInfo.getHeightAlignment()), videoEncoderInfo.getSupportedWidths(), videoEncoderInfo.getSupportedHeights()));
        if (videoEncoderInfo.getSupportedWidths().contains((Range<Integer>) Integer.valueOf(cropRect.width())) && videoEncoderInfo.getSupportedHeights().contains((Range<Integer>) Integer.valueOf(cropRect.height()))) {
            swapWidthHeightConstraints = false;
        } else {
            boolean swapWidthHeightConstraints2 = videoEncoderInfo.canSwapWidthHeight();
            if (swapWidthHeightConstraints2 && videoEncoderInfo.getSupportedHeights().contains((Range<Integer>) Integer.valueOf(cropRect.width())) && videoEncoderInfo.getSupportedWidths().contains((Range<Integer>) Integer.valueOf(cropRect.height()))) {
                swapWidthHeightConstraints = true;
            } else {
                swapWidthHeightConstraints = false;
            }
        }
        if (!swapWidthHeightConstraints) {
            videoEncoderInfo2 = videoEncoderInfo;
        } else {
            videoEncoderInfo2 = new SwappedVideoEncoderInfo(videoEncoderInfo);
        }
        int widthAlignment = videoEncoderInfo2.getWidthAlignment();
        int heightAlignment = videoEncoderInfo2.getHeightAlignment();
        Range<Integer> supportedWidths = videoEncoderInfo2.getSupportedWidths();
        Range<Integer> supportedHeights = videoEncoderInfo2.getSupportedHeights();
        int widthAlignedDown = alignDown(cropRect.width(), widthAlignment, supportedWidths);
        int widthAlignedUp = alignUp(cropRect.width(), widthAlignment, supportedWidths);
        int heightAlignedDown = alignDown(cropRect.height(), heightAlignment, supportedHeights);
        int heightAlignedUp = alignUp(cropRect.height(), heightAlignment, supportedHeights);
        Set<Size> candidateSet = new HashSet<>();
        addBySupportedSize(candidateSet, widthAlignedDown, heightAlignedDown, resolution, videoEncoderInfo2);
        addBySupportedSize(candidateSet, widthAlignedDown, heightAlignedUp, resolution, videoEncoderInfo2);
        addBySupportedSize(candidateSet, widthAlignedUp, heightAlignedDown, resolution, videoEncoderInfo2);
        addBySupportedSize(candidateSet, widthAlignedUp, heightAlignedUp, resolution, videoEncoderInfo2);
        if (candidateSet.isEmpty()) {
            Logger.w(TAG, "Can't find valid cropped size");
            return cropRect;
        }
        List<Size> candidatesList = new ArrayList<>(candidateSet);
        Logger.d(TAG, "candidatesList = " + candidatesList);
        Collections.sort(candidatesList, new Comparator() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda7
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return VideoCapture.lambda$adjustCropRectToValidSize$4(cropRect, (Size) obj, (Size) obj2);
            }
        });
        Logger.d(TAG, "sorted candidatesList = " + candidatesList);
        Size newSize = candidatesList.get(0);
        int newWidth = newSize.getWidth();
        int newHeight = newSize.getHeight();
        if (newWidth == cropRect.width() && newHeight == cropRect.height()) {
            Logger.d(TAG, "No need to adjust cropRect because crop size is valid.");
            return cropRect;
        }
        Preconditions.checkState(newWidth % 2 == 0 && newHeight % 2 == 0 && newWidth <= resolution.getWidth() && newHeight <= resolution.getHeight());
        Rect newCropRect = new Rect(cropRect);
        if (newWidth != cropRect.width()) {
            newCropRect.left = Math.max(0, cropRect.centerX() - (newWidth / 2));
            newCropRect.right = newCropRect.left + newWidth;
            if (newCropRect.right > resolution.getWidth()) {
                newCropRect.right = resolution.getWidth();
                newCropRect.left = newCropRect.right - newWidth;
            }
        }
        if (newHeight != cropRect.height()) {
            newCropRect.top = Math.max(0, cropRect.centerY() - (newHeight / 2));
            newCropRect.bottom = newCropRect.top + newHeight;
            if (newCropRect.bottom > resolution.getHeight()) {
                newCropRect.bottom = resolution.getHeight();
                newCropRect.top = newCropRect.bottom - newHeight;
            }
        }
        Logger.d(TAG, String.format("Adjust cropRect from %s to %s", TransformUtils.rectToString(cropRect), TransformUtils.rectToString(newCropRect)));
        return newCropRect;
    }

    static /* synthetic */ int lambda$adjustCropRectToValidSize$4(Rect cropRect, Size s1, Size s2) {
        return (Math.abs(s1.getWidth() - cropRect.width()) + Math.abs(s1.getHeight() - cropRect.height())) - (Math.abs(s2.getWidth() - cropRect.width()) + Math.abs(s2.getHeight() - cropRect.height()));
    }

    private static void addBySupportedSize(Set<Size> candidates, int width, int height, Size resolution, VideoEncoderInfo videoEncoderInfo) {
        if (width > resolution.getWidth() || height > resolution.getHeight()) {
            return;
        }
        try {
            Range<Integer> supportedHeights = videoEncoderInfo.getSupportedHeightsFor(width);
            candidates.add(new Size(width, supportedHeights.clamp(Integer.valueOf(height)).intValue()));
        } catch (IllegalArgumentException e) {
            Logger.w(TAG, "No supportedHeights for width: " + width, e);
        }
        try {
            Range<Integer> supportedWidths = videoEncoderInfo.getSupportedWidthsFor(height);
            candidates.add(new Size(supportedWidths.clamp(Integer.valueOf(width)).intValue(), height));
        } catch (IllegalArgumentException e2) {
            Logger.w(TAG, "No supportedWidths for height: " + height, e2);
        }
    }

    boolean isStreamIdChanged(int currentId, int newId) {
        return (StreamInfo.NON_SURFACE_STREAM_ID.contains(Integer.valueOf(currentId)) || StreamInfo.NON_SURFACE_STREAM_ID.contains(Integer.valueOf(newId)) || currentId == newId) ? false : true;
    }

    boolean shouldResetCompensatingTransformation(StreamInfo currentStreamInfo, StreamInfo streamInfo) {
        return this.mHasCompensatingTransformation && currentStreamInfo.getInProgressTransformationInfo() != null && streamInfo.getInProgressTransformationInfo() == null;
    }

    private boolean shouldMirror(CameraInternal camera) {
        return camera.getHasTransform() && isMirroringRequired(camera);
    }

    private boolean shouldCompensateTransformation() {
        return this.mStreamInfo.getInProgressTransformationInfo() != null;
    }

    private static boolean shouldCrop(Rect cropRect, Size resolution) {
        return (resolution.getWidth() == cropRect.width() && resolution.getHeight() == cropRect.height()) ? false : true;
    }

    private static <T extends VideoOutput> boolean shouldEnableSurfaceProcessingByConfig(CameraInternal camera, VideoCaptureConfig<T> config) {
        return camera.getHasTransform() && config.isSurfaceProcessingForceEnabled();
    }

    private static boolean shouldEnableSurfaceProcessingByQuirk(CameraInternal camera) {
        return camera.getHasTransform() && (SurfaceProcessingQuirk.CC.workaroundBySurfaceProcessing(DeviceQuirks.getAll()) || SurfaceProcessingQuirk.CC.workaroundBySurfaceProcessing(camera.getCameraInfoInternal().getCameraQuirks()));
    }

    private static boolean shouldEnableSurfaceProcessingBasedOnDynamicRangeByQuirk(CameraInternal camera, DynamicRange dynamicRange) {
        HdrRepeatingRequestFailureQuirk quirk = (HdrRepeatingRequestFailureQuirk) DeviceQuirks.get(HdrRepeatingRequestFailureQuirk.class);
        return camera.getHasTransform() && quirk != null && quirk.workaroundBySurfaceProcessing(dynamicRange);
    }

    private static int alignDown(int length, int alignment, Range<Integer> supportedLength) {
        return align(true, length, alignment, supportedLength);
    }

    private static int alignUp(int length, int alignment, Range<Integer> supportedRange) {
        return align(false, length, alignment, supportedRange);
    }

    private static int align(boolean alignDown, int length, int alignment, Range<Integer> supportedRange) {
        int newLength;
        int remainder = length % alignment;
        if (remainder == 0) {
            newLength = length;
        } else if (alignDown) {
            newLength = length - remainder;
        } else {
            int newLength2 = alignment - remainder;
            newLength = newLength2 + length;
        }
        return supportedRange.clamp(Integer.valueOf(newLength)).intValue();
    }

    private static Timebase resolveTimebase(CameraInternal camera, SurfaceProcessorNode node) {
        if (node != null || !camera.getHasTransform()) {
            Timebase timebase = camera.getCameraInfoInternal().getTimebase();
            return timebase;
        }
        Timebase timebase2 = Timebase.UPTIME;
        return timebase2;
    }

    private static Range<Integer> resolveFrameRate(StreamSpec streamSpec) {
        Range<Integer> frameRate = streamSpec.getExpectedFrameRateRange();
        if (Objects.equals(frameRate, StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
            return streamSpec.getSessionType() == 1 ? Defaults.DEFAULT_HIGH_SPEED_FPS_RANGE : Defaults.DEFAULT_FPS_RANGE;
        }
        return frameRate;
    }

    private static VideoEncoderInfo resolveVideoEncoderInfo(VideoEncoderInfo.Finder videoEncoderInfoFinder, VideoValidatedEncoderProfilesProxy encoderProfiles, MediaSpec mediaSpec, DynamicRange dynamicRange) {
        VideoMimeInfo videoMimeInfo = VideoConfigUtil.resolveVideoMimeInfo(mediaSpec, dynamicRange, encoderProfiles);
        VideoEncoderInfo videoEncoderInfo = videoEncoderInfoFinder.find(videoMimeInfo.getMimeType());
        Size profileSize = null;
        if (videoEncoderInfo == null) {
            Logger.w(TAG, "Can't find videoEncoderInfo");
            return null;
        }
        if (encoderProfiles != null) {
            profileSize = encoderProfiles.getDefaultVideoProfile().getResolution();
        }
        return VideoEncoderInfoWrapper.from(videoEncoderInfo, profileSize);
    }

    private void setupSurfaceUpdateNotifier(final SessionConfig.Builder sessionConfigBuilder, final boolean isStreamActive) {
        if (this.mSurfaceUpdateFuture != null && this.mSurfaceUpdateFuture.cancel(false)) {
            Logger.d(TAG, "A newer surface update is requested. Previous surface update cancelled.");
        }
        final ListenableFuture<Void> surfaceUpdateFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return VideoCapture.this.m260xc7537f7(sessionConfigBuilder, completer);
            }
        });
        this.mSurfaceUpdateFuture = surfaceUpdateFuture;
        Futures.addCallback(surfaceUpdateFuture, new FutureCallback<Void>() { // from class: androidx.camera.video.VideoCapture.3
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                if (surfaceUpdateFuture == VideoCapture.this.mSurfaceUpdateFuture && VideoCapture.this.mSourceState != VideoOutput.SourceState.INACTIVE) {
                    VideoCapture.this.setSourceState(isStreamActive ? VideoOutput.SourceState.ACTIVE_STREAMING : VideoOutput.SourceState.ACTIVE_NON_STREAMING);
                }
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                if (!(t instanceof CancellationException)) {
                    Logger.e(VideoCapture.TAG, "Surface update completed with unexpected exception", t);
                }
            }
        }, CameraXExecutors.mainThreadExecutor());
    }

    /* renamed from: lambda$setupSurfaceUpdateNotifier$6$androidx-camera-video-VideoCapture, reason: not valid java name */
    /* synthetic */ Object m260xc7537f7(final SessionConfig.Builder sessionConfigBuilder, CallbackToFutureAdapter.Completer completer) throws Exception {
        sessionConfigBuilder.addTag(SURFACE_UPDATE_KEY, Integer.valueOf(completer.hashCode()));
        final AtomicBoolean surfaceUpdateComplete = new AtomicBoolean(false);
        final CameraCaptureCallback cameraCaptureCallback = new AnonymousClass2(surfaceUpdateComplete, completer, sessionConfigBuilder);
        completer.addCancellationListener(new Runnable() { // from class: androidx.camera.video.VideoCapture$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                VideoCapture.lambda$setupSurfaceUpdateNotifier$5(surfaceUpdateComplete, sessionConfigBuilder, cameraCaptureCallback);
            }
        }, CameraXExecutors.directExecutor());
        sessionConfigBuilder.addRepeatingCameraCaptureCallback(cameraCaptureCallback);
        return String.format("%s[0x%x]", SURFACE_UPDATE_KEY, Integer.valueOf(completer.hashCode()));
    }

    /* renamed from: androidx.camera.video.VideoCapture$2, reason: invalid class name */
    class AnonymousClass2 extends CameraCaptureCallback {
        private boolean mIsFirstCaptureResult = true;
        final /* synthetic */ CallbackToFutureAdapter.Completer val$completer;
        final /* synthetic */ SessionConfig.Builder val$sessionConfigBuilder;
        final /* synthetic */ AtomicBoolean val$surfaceUpdateComplete;

        AnonymousClass2(AtomicBoolean atomicBoolean, CallbackToFutureAdapter.Completer completer, SessionConfig.Builder builder) {
            this.val$surfaceUpdateComplete = atomicBoolean;
            this.val$completer = completer;
            this.val$sessionConfigBuilder = builder;
        }

        @Override // androidx.camera.core.impl.CameraCaptureCallback
        public void onCaptureCompleted(int captureConfigId, CameraCaptureResult cameraCaptureResult) {
            Object tag;
            super.onCaptureCompleted(captureConfigId, cameraCaptureResult);
            if (this.mIsFirstCaptureResult) {
                this.mIsFirstCaptureResult = false;
                Logger.d(VideoCapture.TAG, "cameraCaptureResult timestampNs = " + cameraCaptureResult.getTimestamp() + ", current system uptimeMs = " + SystemClock.uptimeMillis() + ", current system realtimeMs = " + SystemClock.elapsedRealtime());
            }
            if (!this.val$surfaceUpdateComplete.get() && (tag = cameraCaptureResult.getTagBundle().getTag(VideoCapture.SURFACE_UPDATE_KEY)) != null && ((Integer) tag).intValue() == this.val$completer.hashCode() && this.val$completer.set(null) && !this.val$surfaceUpdateComplete.getAndSet(true)) {
                ScheduledExecutorService mainThreadExecutor = CameraXExecutors.mainThreadExecutor();
                final SessionConfig.Builder builder = this.val$sessionConfigBuilder;
                mainThreadExecutor.execute(new Runnable() { // from class: androidx.camera.video.VideoCapture$2$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        VideoCapture.AnonymousClass2.this.m261lambda$onCaptureCompleted$0$androidxcameravideoVideoCapture$2(builder);
                    }
                });
            }
        }

        /* renamed from: lambda$onCaptureCompleted$0$androidx-camera-video-VideoCapture$2, reason: not valid java name */
        /* synthetic */ void m261lambda$onCaptureCompleted$0$androidxcameravideoVideoCapture$2(SessionConfig.Builder sessionConfigBuilder) {
            sessionConfigBuilder.removeCameraCaptureCallback(this);
        }
    }

    static /* synthetic */ void lambda$setupSurfaceUpdateNotifier$5(AtomicBoolean surfaceUpdateComplete, SessionConfig.Builder sessionConfigBuilder, CameraCaptureCallback cameraCaptureCallback) {
        Preconditions.checkState(Threads.isMainThread(), "Surface update cancellation should only occur on main thread.");
        surfaceUpdateComplete.set(true);
        sessionConfigBuilder.removeCameraCaptureCallback(cameraCaptureCallback);
    }

    private void updateCustomOrderedResolutionsByQuality(CameraInfoInternal cameraInfo, UseCaseConfig.Builder<?, ?, ?> builder) throws IllegalArgumentException {
        MediaSpec mediaSpec = getMediaSpecOrThrow();
        QualitySelector qualitySelector = mediaSpec.getVideoSpec().getQualitySelector();
        VideoCaptureConfig<T> config = (VideoCaptureConfig) builder.getUseCaseConfig();
        if (config.containsOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS)) {
            Preconditions.checkArgument(qualitySelector == VideoSpec.QUALITY_SELECTOR_AUTO, "Custom ordered resolutions and QualitySelector can't both be set");
            return;
        }
        DynamicRange requestedDynamicRange = config.getDynamicRange();
        int sessionType = getSessionType(config);
        Range<Integer> targetFrameRate = getTargetFrameRate(config);
        VideoCapabilities videoCapabilities = getVideoCapabilities(cameraInfo, sessionType);
        Logger.d(TAG, "Update custom order resolutions: requestedDynamicRange = " + requestedDynamicRange + ", sessionType = " + sessionType + ", targetFrameRate = " + targetFrameRate);
        List<Quality> supportedQualities = getSupportedQualitiesOrThrow(requestedDynamicRange, videoCapabilities, sessionType);
        if (supportedQualities.isEmpty()) {
            Logger.w(TAG, "Can't find any supported quality on the device.");
            return;
        }
        List<Quality> selectedQualities = getSelectedQualityOrThrow(supportedQualities, qualitySelector);
        LinkedHashMap<Quality, List<Size>> supportedQualityToSizeMap = createOrderedQualityToSizesMap(cameraInfo, mediaSpec, requestedDynamicRange, videoCapabilities, sessionType, targetFrameRate, config.getVideoEncoderInfoFinder(), selectedQualities);
        setCustomOrderedResolutions(builder, supportedQualityToSizeMap);
    }

    private List<Quality> getSupportedQualitiesOrThrow(DynamicRange requestedDynamicRange, VideoCapabilities videoCapabilities, int sessionType) throws IllegalArgumentException {
        List<Quality> supportedQualities = videoCapabilities.getSupportedQualities(requestedDynamicRange);
        Logger.d(TAG, "supportedQualities = " + supportedQualities);
        if (supportedQualities.isEmpty() && sessionType == 1) {
            throw new IllegalArgumentException("No supported quality on the device for high-speed capture.");
        }
        return supportedQualities;
    }

    private List<Quality> getSelectedQualityOrThrow(List<Quality> supportedQualities, QualitySelector qualitySelector) throws IllegalArgumentException {
        List<Quality> selectedQualities = qualitySelector.getPrioritizedQualities(supportedQualities);
        Logger.d(TAG, "Found selectedQualities " + selectedQualities + " by " + qualitySelector);
        if (selectedQualities.isEmpty()) {
            throw new IllegalArgumentException("Unable to find selected quality");
        }
        return selectedQualities;
    }

    private LinkedHashMap<Quality, List<Size>> createOrderedQualityToSizesMap(CameraInfoInternal cameraInfo, MediaSpec mediaSpec, DynamicRange requestedDynamicRange, VideoCapabilities videoCapabilities, int sessionType, Range<Integer> targetFrameRate, VideoEncoderInfo.Finder videoEncoderInfoFinder, List<Quality> selectedQualities) {
        int aspectRatio = mediaSpec.getVideoSpec().getAspectRatio();
        Map<Quality, Size> supportedQualityToSizeMap = QualitySelector.getQualityToResolutionMap(videoCapabilities, requestedDynamicRange);
        List<Size> supportedResolutions = getSupportedResolutions(cameraInfo, sessionType, targetFrameRate);
        QualityRatioToResolutionsTable qualityRatioTable = new QualityRatioToResolutionsTable(supportedResolutions, supportedQualityToSizeMap);
        LinkedHashMap<Quality, List<Size>> orderedQualityToSizesMap = new LinkedHashMap<>();
        for (Quality selectedQuality : selectedQualities) {
            orderedQualityToSizesMap.put(selectedQuality, qualityRatioTable.getResolutions(selectedQuality, aspectRatio));
        }
        return filterOutEncoderUnsupportedResolutions(videoEncoderInfoFinder, mediaSpec, requestedDynamicRange, videoCapabilities, orderedQualityToSizesMap, supportedQualityToSizeMap);
    }

    private void setCustomOrderedResolutions(UseCaseConfig.Builder<?, ?, ?> configBuilder, LinkedHashMap<Quality, List<Size>> qualityToSizesMap) {
        ArrayList arrayList = new ArrayList();
        for (List<Size> resolutions : qualityToSizesMap.values()) {
            arrayList.addAll(resolutions);
        }
        Logger.d(TAG, "Set custom ordered resolutions = " + arrayList);
        configBuilder.getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, arrayList);
        this.mQualityToCustomSizesMap = qualityToSizesMap;
    }

    private int getSessionType(VideoCaptureConfig<T> useCaseConfig) {
        return useCaseConfig.getSessionType(0);
    }

    private Range<Integer> getTargetFrameRate(VideoCaptureConfig<T> useCaseConfig) {
        return (Range) Objects.requireNonNull(useCaseConfig.getTargetFrameRate(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED));
    }

    private List<Size> getSupportedResolutions(CameraInfoInternal cameraInfo, int sessionType, Range<Integer> targetFrameRate) {
        if (sessionType == 1) {
            if (StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED.equals(targetFrameRate)) {
                List<Size> supportedResolutions = cameraInfo.getSupportedHighSpeedResolutions();
                return supportedResolutions;
            }
            List<Size> supportedResolutions2 = cameraInfo.getSupportedHighSpeedResolutionsFor(targetFrameRate);
            return supportedResolutions2;
        }
        List<Size> supportedResolutions3 = cameraInfo.getSupportedResolutions(getImageFormat());
        return supportedResolutions3;
    }

    private static LinkedHashMap<Quality, List<Size>> filterOutEncoderUnsupportedResolutions(VideoEncoderInfo.Finder videoEncoderFinder, MediaSpec mediaSpec, DynamicRange dynamicRange, VideoCapabilities videoCapabilities, LinkedHashMap<Quality, List<Size>> qualityToSizesOrderedMap, Map<Quality, Size> supportedQualityToSizeMap) {
        VideoValidatedEncoderProfilesProxy encoderProfiles;
        VideoEncoderInfo videoEncoderInfo;
        if (qualityToSizesOrderedMap.isEmpty()) {
            return new LinkedHashMap<>();
        }
        LinkedHashMap<Quality, List<Size>> filteredQualityToSizesOrderedMap = new LinkedHashMap<>();
        for (Map.Entry<Quality, List<Size>> entry : qualityToSizesOrderedMap.entrySet()) {
            List<Size> filteredSizeList = new ArrayList<>(entry.getValue());
            Iterator<Size> sizeIterator = filteredSizeList.iterator();
            while (sizeIterator.hasNext()) {
                Size resolution = sizeIterator.next();
                if (!supportedQualityToSizeMap.containsValue(resolution) && (encoderProfiles = videoCapabilities.findNearestHigherSupportedEncoderProfilesFor(resolution, dynamicRange)) != null && (videoEncoderInfo = findLargestSupportedSizeVideoEncoderInfo(videoEncoderFinder, encoderProfiles, dynamicRange, mediaSpec)) != null && !videoEncoderInfo.isSizeSupportedAllowSwapping(resolution.getWidth(), resolution.getHeight())) {
                    sizeIterator.remove();
                }
            }
            if (!filteredSizeList.isEmpty()) {
                filteredQualityToSizesOrderedMap.put(entry.getKey(), filteredSizeList);
            }
        }
        return filteredQualityToSizesOrderedMap;
    }

    private static VideoEncoderInfo findLargestSupportedSizeVideoEncoderInfo(VideoEncoderInfo.Finder videoEncoderInfoFinder, VideoValidatedEncoderProfilesProxy encoderProfiles, DynamicRange dynamicRange, MediaSpec mediaSpec) {
        int area;
        if (dynamicRange.isFullySpecified()) {
            return resolveVideoEncoderInfo(videoEncoderInfoFinder, encoderProfiles, mediaSpec, dynamicRange);
        }
        VideoEncoderInfo sizeLargestVideoEncoderInfo = null;
        int largestArea = Integer.MIN_VALUE;
        for (EncoderProfilesProxy.VideoProfileProxy videoProfile : encoderProfiles.getVideoProfiles()) {
            if (DynamicRangeUtil.isHdrSettingsMatched(videoProfile, dynamicRange)) {
                DynamicRange profileDynamicRange = new DynamicRange(DynamicRangeUtil.videoProfileHdrFormatsToDynamicRangeEncoding(videoProfile.getHdrFormat()), DynamicRangeUtil.videoProfileBitDepthToDynamicRangeBitDepth(videoProfile.getBitDepth()));
                VideoEncoderInfo videoEncoderInfo = resolveVideoEncoderInfo(videoEncoderInfoFinder, encoderProfiles, mediaSpec, profileDynamicRange);
                if (videoEncoderInfo != null && (area = SizeUtil.getArea(videoEncoderInfo.getSupportedWidths().getUpper().intValue(), videoEncoderInfo.getSupportedHeights().getUpper().intValue())) > largestArea) {
                    largestArea = area;
                    sizeLargestVideoEncoderInfo = videoEncoderInfo;
                }
            }
        }
        return sizeLargestVideoEncoderInfo;
    }

    private static Quality findNearestSizeFor(Map<Quality, List<Size>> sizeMap, Size targetSize) {
        int targetArea = SizeUtil.getArea(targetSize);
        Quality nearestQuality = null;
        int minAreaDiff = Integer.MAX_VALUE;
        for (Map.Entry<Quality, List<Size>> entry : sizeMap.entrySet()) {
            for (Size size : entry.getValue()) {
                int areaDiff = Math.abs(SizeUtil.getArea(size) - targetArea);
                if (areaDiff < minAreaDiff) {
                    minAreaDiff = areaDiff;
                    Quality nearestQuality2 = entry.getKey();
                    nearestQuality = nearestQuality2;
                }
            }
        }
        return nearestQuality;
    }

    private static <T> T fetchObservableValue(Observable<T> observable, T valueIfMissing) {
        ListenableFuture<T> future = observable.fetchData();
        if (!future.isDone()) {
            return valueIfMissing;
        }
        try {
            return future.get();
        } catch (InterruptedException | ExecutionException e) {
            throw new IllegalStateException(e);
        }
    }

    void setSourceState(VideoOutput.SourceState newState) {
        VideoOutput.SourceState oldState = this.mSourceState;
        if (newState != oldState) {
            this.mSourceState = newState;
            getOutput().onSourceStateChanged(newState);
        }
    }

    SurfaceRequest getSurfaceRequest() {
        return (SurfaceRequest) Objects.requireNonNull(this.mSurfaceRequest);
    }

    @Override // androidx.camera.core.UseCase
    public Set<Integer> getSupportedEffectTargets() {
        Set<Integer> targets = new HashSet<>();
        targets.add(2);
        return targets;
    }

    @Override // androidx.camera.core.UseCase
    public Set<DynamicRange> getSupportedDynamicRanges(CameraInfoInternal cameraInfo) {
        VideoCapabilities videoCapabilities = getVideoCapabilities(cameraInfo, 0);
        return videoCapabilities.getSupportedDynamicRanges();
    }

    public static final class Builder<T extends VideoOutput> implements UseCaseConfig.Builder<VideoCapture<T>, VideoCaptureConfig<T>, Builder<T>>, ImageOutputConfig.Builder<Builder<T>>, ImageInputConfig.Builder<Builder<T>>, ThreadConfig.Builder<Builder<T>> {
        private final MutableOptionsBundle mMutableConfig;

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Object setCustomOrderedResolutions(List list) {
            return setCustomOrderedResolutions((List<Size>) list);
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public /* bridge */ /* synthetic */ Object setSupportedResolutions(List list) {
            return setSupportedResolutions((List<Pair<Integer, Size[]>>) list);
        }

        public Builder(T videoOutput) {
            this(createInitialBundle(videoOutput));
        }

        private Builder(MutableOptionsBundle mutableConfig) {
            this.mMutableConfig = mutableConfig;
            if (!this.mMutableConfig.containsOption(VideoCaptureConfig.OPTION_VIDEO_OUTPUT)) {
                throw new IllegalArgumentException("VideoOutput is required");
            }
            Class<?> oldConfigClass = (Class) mutableConfig.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
            if (oldConfigClass != null && !oldConfigClass.equals(VideoCapture.class)) {
                throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + oldConfigClass);
            }
            setCaptureType(UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE);
            setTargetClass((Class) VideoCapture.class);
        }

        static Builder<? extends VideoOutput> fromConfig(Config configuration) {
            return new Builder<>(MutableOptionsBundle.from(configuration));
        }

        public static <T extends VideoOutput> Builder<T> fromConfig(VideoCaptureConfig<T> configuration) {
            return new Builder<>(MutableOptionsBundle.from((Config) configuration));
        }

        private static <T extends VideoOutput> MutableOptionsBundle createInitialBundle(T videoOutput) {
            MutableOptionsBundle bundle = MutableOptionsBundle.create();
            bundle.insertOption(VideoCaptureConfig.OPTION_VIDEO_OUTPUT, videoOutput);
            return bundle;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public MutableConfig getMutableConfig() {
            return this.mMutableConfig;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public VideoCaptureConfig<T> getUseCaseConfig() {
            return new VideoCaptureConfig<>(OptionsBundle.from(this.mMutableConfig));
        }

        public Builder<T> setVideoOutput(VideoOutput videoOutput) {
            getMutableConfig().insertOption(VideoCaptureConfig.OPTION_VIDEO_OUTPUT, videoOutput);
            return this;
        }

        Builder<T> setVideoEncoderInfoFinder(VideoEncoderInfo.Finder videoEncoderInfoFinder) {
            getMutableConfig().insertOption(VideoCaptureConfig.OPTION_VIDEO_ENCODER_INFO_FINDER, videoEncoderInfoFinder);
            return this;
        }

        @Override // androidx.camera.core.ExtendableBuilder
        public VideoCapture<T> build() {
            return new VideoCapture<>(getUseCaseConfig());
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder<T> setTargetClass(Class<VideoCapture<T>> targetClass) {
            getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_CLASS, targetClass);
            if (getMutableConfig().retrieveOption(TargetConfig.OPTION_TARGET_NAME, null) == null) {
                String targetName = targetClass.getCanonicalName() + "-" + UUID.randomUUID();
                setTargetName(targetName);
            }
            return this;
        }

        @Override // androidx.camera.core.internal.TargetConfig.Builder
        public Builder<T> setTargetName(String targetName) {
            getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_NAME, targetName);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetAspectRatio(int aspectRatio) {
            throw new UnsupportedOperationException("setTargetAspectRatio is not supported.");
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetRotation(int rotation) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_TARGET_ROTATION, Integer.valueOf(rotation));
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setMirrorMode(int mirrorMode) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_MIRROR_MODE, Integer.valueOf(mirrorMode));
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setTargetResolution(Size resolution) {
            throw new UnsupportedOperationException("setTargetResolution is not supported.");
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setDefaultResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_DEFAULT_RESOLUTION, resolution);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setMaxResolution(Size resolution) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_MAX_RESOLUTION, resolution);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setSupportedResolutions(List<Pair<Integer, Size[]>> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_SUPPORTED_RESOLUTIONS, resolutions);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setCustomOrderedResolutions(List<Size> resolutions) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_CUSTOM_ORDERED_RESOLUTIONS, resolutions);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageOutputConfig.Builder
        public Builder<T> setResolutionSelector(ResolutionSelector resolutionSelector) {
            getMutableConfig().insertOption(ImageOutputConfig.OPTION_RESOLUTION_SELECTOR, resolutionSelector);
            return this;
        }

        @Override // androidx.camera.core.impl.ImageInputConfig.Builder
        public Builder<T> setDynamicRange(DynamicRange dynamicRange) {
            getMutableConfig().insertOption(ImageInputConfig.OPTION_INPUT_DYNAMIC_RANGE, dynamicRange);
            return this;
        }

        @Override // androidx.camera.core.internal.ThreadConfig.Builder
        public Builder<T> setBackgroundExecutor(Executor executor) {
            getMutableConfig().insertOption(ThreadConfig.OPTION_BACKGROUND_EXECUTOR, executor);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setDefaultSessionConfig(SessionConfig sessionConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_SESSION_CONFIG, sessionConfig);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setDefaultCaptureConfig(CaptureConfig captureConfig) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_DEFAULT_CAPTURE_CONFIG, captureConfig);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_CONFIG_UNPACKER, optionUnpacker);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setSurfaceOccupancyPriority(int priority) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_SURFACE_OCCUPANCY_PRIORITY, Integer.valueOf(priority));
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setZslDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_ZSL_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setHighResolutionDisabled(boolean disabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_HIGH_RESOLUTION_DISABLED, Boolean.valueOf(disabled));
            return this;
        }

        public Builder<T> setTargetFrameRate(Range<Integer> targetFrameRate) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_TARGET_FRAME_RATE, targetFrameRate);
            return this;
        }

        public Builder<T> setVideoStabilizationEnabled(boolean enabled) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_VIDEO_STABILIZATION_MODE, Integer.valueOf(enabled ? 2 : 1));
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setCaptureType(UseCaseConfigFactory.CaptureType captureType) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_TYPE, captureType);
            return this;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig.Builder
        public Builder<T> setStreamUseCase(StreamUseCase streamUseCase) {
            getMutableConfig().insertOption(UseCaseConfig.OPTION_STREAM_USE_CASE, streamUseCase);
            return this;
        }

        public Builder<T> setSurfaceProcessingForceEnabled() {
            getMutableConfig().insertOption(VideoCaptureConfig.OPTION_FORCE_ENABLE_SURFACE_PROCESSING, true);
            return this;
        }
    }
}
