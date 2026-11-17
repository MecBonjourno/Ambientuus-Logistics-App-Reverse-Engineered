package androidx.camera.view;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Range;
import android.util.Rational;
import android.util.Size;
import androidx.arch.core.util.Function;
import androidx.camera.core.Camera;
import androidx.camera.core.CameraControl;
import androidx.camera.core.CameraEffect;
import androidx.camera.core.CameraInfo;
import androidx.camera.core.CameraInfoUnavailableException;
import androidx.camera.core.CameraSelector;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.FocusMeteringResult;
import androidx.camera.core.ImageAnalysis;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.Logger;
import androidx.camera.core.MeteringPoint;
import androidx.camera.core.MeteringPointFactory;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCaseGroup;
import androidx.camera.core.ViewPort;
import androidx.camera.core.ZoomState;
import androidx.camera.core.impl.ImageOutputConfig;
import androidx.camera.core.impl.StreamSpec;
import androidx.camera.core.impl.utils.AspectRatioUtil;
import androidx.camera.core.impl.utils.CameraOrientationUtil;
import androidx.camera.core.impl.utils.ContextUtil;
import androidx.camera.core.impl.utils.LiveDataUtil;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.resolutionselector.AspectRatioStrategy;
import androidx.camera.core.resolutionselector.ResolutionSelector;
import androidx.camera.lifecycle.ProcessCameraProvider;
import androidx.camera.video.FileDescriptorOutputOptions;
import androidx.camera.video.FileOutputOptions;
import androidx.camera.video.MediaStoreOutputOptions;
import androidx.camera.video.OutputOptions;
import androidx.camera.video.PendingRecording;
import androidx.camera.video.QualitySelector;
import androidx.camera.video.Recorder;
import androidx.camera.video.Recording;
import androidx.camera.video.VideoCapture;
import androidx.camera.video.VideoRecordEvent;
import androidx.camera.view.CameraController;
import androidx.camera.view.RotationProvider;
import androidx.camera.view.internal.ScreenFlashUiInfo;
import androidx.camera.view.video.AudioConfig;
import androidx.core.content.ContextCompat;
import androidx.core.content.PermissionChecker;
import androidx.core.util.Consumer;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public abstract class CameraController {
    private static final float AE_SIZE = 0.25f;
    private static final float AF_SIZE = 0.16666667f;
    private static final String CAMERA_NOT_ATTACHED = "Use cases not attached to camera.";
    private static final String CAMERA_NOT_INITIALIZED = "Camera not initialized.";

    @Deprecated
    public static final int COORDINATE_SYSTEM_VIEW_REFERENCED = 1;
    public static final int IMAGE_ANALYSIS = 2;
    public static final int IMAGE_CAPTURE = 1;
    private static final String IMAGE_CAPTURE_DISABLED = "ImageCapture disabled.";
    private static final ImageCapture.ScreenFlash NO_OP_SCREEN_FLASH = new ImageCapture.ScreenFlash() { // from class: androidx.camera.view.CameraController.1
        @Override // androidx.camera.core.ImageCapture.ScreenFlash
        public void apply(long expirationTimeMillis, ImageCapture.ScreenFlashListener screenFlashListener) {
            screenFlashListener.onCompleted();
        }

        @Override // androidx.camera.core.ImageCapture.ScreenFlash
        public void clear() {
        }
    };
    private static final String PREVIEW_VIEW_NOT_ATTACHED = "PreviewView not attached to CameraController.";
    private static final String TAG = "CameraController";
    public static final int TAP_TO_FOCUS_FAILED = 4;
    public static final int TAP_TO_FOCUS_FOCUSED = 2;
    public static final int TAP_TO_FOCUS_NOT_FOCUSED = 3;
    public static final int TAP_TO_FOCUS_NOT_STARTED = 0;
    public static final int TAP_TO_FOCUS_STARTED = 1;
    public static final int VIDEO_CAPTURE = 4;
    private static final String VIDEO_CAPTURE_DISABLED = "VideoCapture disabled.";
    private static final String VIDEO_RECORDING_UNFINISHED = "Recording video. Only one recording can be active at a time.";
    Recording mActiveRecording;
    private ImageAnalysis.Analyzer mAnalysisAnalyzer;
    private Executor mAnalysisBackgroundExecutor;
    private Executor mAnalysisExecutor;
    private final Context mAppContext;
    Camera mCamera;
    ProcessCameraProviderWrapper mCameraProvider;
    CameraSelector mCameraSelector;
    final RotationProvider.Listener mDeviceRotationListener;
    private final Set<CameraEffect> mEffects;
    private int mEnabledUseCases;
    private FocusMeteringResultCallback mFocusMeteringResultCallback;
    ImageAnalysis mImageAnalysis;
    ResolutionSelector mImageAnalysisResolutionSelector;
    OutputSize mImageAnalysisTargetSize;
    ImageCapture mImageCapture;
    Executor mImageCaptureIoExecutor;
    ResolutionSelector mImageCaptureResolutionSelector;
    OutputSize mImageCaptureTargetSize;
    private final ListenableFuture<Void> mInitializationFuture;
    private int mLastKnownRotation;
    private final PendingValue<Boolean> mPendingEnableTorch;
    private final PendingValue<Float> mPendingLinearZoom;
    private final PendingValue<Float> mPendingZoomRatio;
    private boolean mPinchToZoomEnabled;
    Preview mPreview;
    private DynamicRange mPreviewDynamicRange;
    ResolutionSelector mPreviewResolutionSelector;
    OutputSize mPreviewTargetSize;
    Map<Consumer<VideoRecordEvent>, Recording> mRecordingMap;
    private final RotationProvider mRotationProvider;
    private final Map<ScreenFlashUiInfo.ProviderType, ScreenFlashUiInfo> mScreenFlashUiInfoMap;
    Preview.SurfaceProvider mSurfaceProvider;
    private long mTapToFocusAutoCancelDurationNanos;
    private boolean mTapToFocusEnabled;
    final MutableLiveData<TapToFocusInfo> mTapToFocusInfoState;
    final LiveData<Integer> mTapToFocusState;
    private final ForwardingLiveData<Integer> mTorchState;
    VideoCapture<Recorder> mVideoCapture;
    private DynamicRange mVideoCaptureDynamicRange;
    private int mVideoCaptureMirrorMode;
    QualitySelector mVideoCaptureQualitySelector;
    private Range<Integer> mVideoCaptureTargetFrameRate;
    ViewPort mViewPort;
    private final ForwardingLiveData<ZoomState> mZoomState;

    @Retention(RetentionPolicy.SOURCE)
    public @interface UseCases {
    }

    abstract Camera startCamera();

    CameraController(Context context) {
        this(context, Futures.transform(ProcessCameraProvider.getInstance(context), new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda7
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return new ProcessCameraProviderWrapperImpl((ProcessCameraProvider) obj);
            }
        }, CameraXExecutors.directExecutor()));
    }

    CameraController(Context context, ListenableFuture<ProcessCameraProviderWrapper> cameraProviderFuture) {
        this.mCameraSelector = CameraSelector.DEFAULT_BACK_CAMERA;
        this.mEnabledUseCases = 3;
        this.mActiveRecording = null;
        this.mRecordingMap = new HashMap();
        this.mVideoCaptureQualitySelector = Recorder.DEFAULT_QUALITY_SELECTOR;
        this.mVideoCaptureMirrorMode = 0;
        this.mVideoCaptureDynamicRange = DynamicRange.UNSPECIFIED;
        this.mPreviewDynamicRange = DynamicRange.UNSPECIFIED;
        this.mVideoCaptureTargetFrameRate = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
        this.mLastKnownRotation = -1;
        this.mPinchToZoomEnabled = true;
        this.mTapToFocusEnabled = true;
        this.mZoomState = new ForwardingLiveData<>();
        this.mTorchState = new ForwardingLiveData<>();
        this.mTapToFocusInfoState = new MutableLiveData<>(new TapToFocusInfo(0, null));
        this.mTapToFocusState = LiveDataUtil.map(this.mTapToFocusInfoState, new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda4
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return Integer.valueOf(((TapToFocusInfo) obj).getFocusState());
            }
        });
        this.mPendingEnableTorch = new PendingValue<>();
        this.mPendingLinearZoom = new PendingValue<>();
        this.mPendingZoomRatio = new PendingValue<>();
        this.mEffects = new HashSet();
        this.mScreenFlashUiInfoMap = new HashMap();
        this.mTapToFocusAutoCancelDurationNanos = TimeUnit.MILLISECONDS.toNanos(FocusMeteringAction.DEFAULT_AUTO_CANCEL_DURATION_MILLIS);
        this.mAppContext = ContextUtil.getApplicationContext(context);
        this.mPreview = createPreview();
        this.mImageCapture = createImageCapture(null);
        this.mImageAnalysis = createImageAnalysis(null, null, null);
        this.mVideoCapture = createVideoCapture();
        this.mInitializationFuture = Futures.transform(cameraProviderFuture, new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda5
            @Override // androidx.arch.core.util.Function
            public final Object apply(Object obj) {
                return CameraController.this.m307lambda$new$0$androidxcameraviewCameraController((ProcessCameraProviderWrapper) obj);
            }
        }, CameraXExecutors.mainThreadExecutor());
        this.mRotationProvider = new RotationProvider(this.mAppContext);
        this.mDeviceRotationListener = new RotationProvider.Listener() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda6
            @Override // androidx.camera.view.RotationProvider.Listener
            public final void onRotationChanged(int i) {
                CameraController.this.m308lambda$new$1$androidxcameraviewCameraController(i);
            }
        };
    }

    /* renamed from: lambda$new$0$androidx-camera-view-CameraController, reason: not valid java name */
    /* synthetic */ Void m307lambda$new$0$androidxcameraviewCameraController(ProcessCameraProviderWrapper provider) {
        this.mCameraProvider = provider;
        unbindAllAndRecreate();
        startCameraAndTrackStates();
        return null;
    }

    /* renamed from: lambda$new$1$androidx-camera-view-CameraController, reason: not valid java name */
    /* synthetic */ void m308lambda$new$1$androidxcameraviewCameraController(int rotation) {
        this.mLastKnownRotation = rotation;
        this.mImageAnalysis.setTargetRotation(rotation);
        this.mImageCapture.setTargetRotation(rotation);
        this.mVideoCapture.setTargetRotation(rotation);
    }

    public ListenableFuture<Void> getInitializationFuture() {
        return this.mInitializationFuture;
    }

    private boolean isCameraInitialized() {
        return this.mCameraProvider != null;
    }

    private boolean isPreviewViewAttached() {
        return (this.mSurfaceProvider == null || this.mViewPort == null) ? false : true;
    }

    private boolean isCameraAttached() {
        return this.mCamera != null;
    }

    public void setEnabledUseCases(final int enabledUseCases) {
        Threads.checkMainThread();
        if (enabledUseCases == this.mEnabledUseCases) {
            return;
        }
        final int oldEnabledUseCases = this.mEnabledUseCases;
        this.mEnabledUseCases = enabledUseCases;
        if (!isVideoCaptureEnabled() && isRecording()) {
            stopRecording();
        }
        startCameraAndTrackStates(new Runnable() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda8
            @Override // java.lang.Runnable
            public final void run() {
                CameraController.this.m310x2318c9a7(oldEnabledUseCases, enabledUseCases);
            }
        });
    }

    /* renamed from: lambda$setEnabledUseCases$2$androidx-camera-view-CameraController, reason: not valid java name */
    /* synthetic */ void m310x2318c9a7(int oldEnabledUseCases, int enabledUseCases) {
        this.mEnabledUseCases = oldEnabledUseCases;
        Logger.w(TAG, "setEnabledUseCases: failed to enable use cases properly for enabledUseCases = " + Integer.toBinaryString(enabledUseCases) + ", restoring back previous values " + Integer.toBinaryString(oldEnabledUseCases));
    }

    private boolean isUseCaseEnabled(int useCaseMask) {
        return (this.mEnabledUseCases & useCaseMask) != 0;
    }

    private void configureResolution(ImageOutputConfig.Builder<?> builder, ResolutionSelector resolutionSelector, OutputSize outputSize) {
        AspectRatioStrategy aspectRatioStrategy;
        if (resolutionSelector != null) {
            builder.setResolutionSelector(resolutionSelector);
            return;
        }
        if (outputSize != null) {
            setTargetOutputSize(builder, outputSize);
        } else if (this.mViewPort != null && (aspectRatioStrategy = getViewportAspectRatioStrategy(this.mViewPort)) != null) {
            builder.setResolutionSelector(new ResolutionSelector.Builder().setAspectRatioStrategy(aspectRatioStrategy).build());
        }
    }

    private void setTargetOutputSize(ImageOutputConfig.Builder<?> builder, OutputSize outputSize) {
        if (outputSize == null) {
            return;
        }
        if (outputSize.getResolution() != null) {
            builder.setTargetResolution(outputSize.getResolution());
        } else if (outputSize.getAspectRatio() != -1) {
            builder.setTargetAspectRatio(outputSize.getAspectRatio());
        } else {
            Logger.e(TAG, "Invalid target surface size. " + outputSize);
        }
    }

    private boolean isOutputSizeEqual(OutputSize currentSize, OutputSize newSize) {
        if (currentSize == newSize) {
            return true;
        }
        return currentSize != null && currentSize.equals(newSize);
    }

    void attachPreviewSurface(Preview.SurfaceProvider surfaceProvider, ViewPort viewPort) {
        Threads.checkMainThread();
        if (this.mSurfaceProvider != surfaceProvider) {
            this.mSurfaceProvider = surfaceProvider;
            this.mPreview.setSurfaceProvider(surfaceProvider);
        }
        boolean shouldUpdateAspectRatio = this.mViewPort == null || getViewportAspectRatioStrategy(viewPort) != getViewportAspectRatioStrategy(this.mViewPort);
        this.mViewPort = viewPort;
        startListeningToRotationEvents();
        if (shouldUpdateAspectRatio) {
            unbindAllAndRecreate();
        }
        startCameraAndTrackStates();
    }

    void clearPreviewSurface() {
        Threads.checkMainThread();
        if (this.mCameraProvider != null) {
            this.mCameraProvider.unbind(this.mPreview, this.mImageCapture, this.mImageAnalysis, this.mVideoCapture);
        }
        this.mPreview.setSurfaceProvider(null);
        this.mCamera = null;
        this.mSurfaceProvider = null;
        this.mViewPort = null;
        stopListeningToRotationEvents();
    }

    private void startListeningToRotationEvents() {
        if (!this.mRotationProvider.addListener(CameraXExecutors.mainThreadExecutor(), this.mDeviceRotationListener)) {
            Logger.w(TAG, "The device cannot detect rotation changes.");
        }
    }

    private void stopListeningToRotationEvents() {
        this.mRotationProvider.removeListener(this.mDeviceRotationListener);
    }

    @Deprecated
    public void setPreviewTargetSize(OutputSize targetSize) {
        Threads.checkMainThread();
        if (isOutputSizeEqual(this.mPreviewTargetSize, targetSize)) {
            return;
        }
        this.mPreviewTargetSize = targetSize;
        unbindPreviewAndRecreate();
        startCameraAndTrackStates();
    }

    @Deprecated
    public OutputSize getPreviewTargetSize() {
        Threads.checkMainThread();
        return this.mPreviewTargetSize;
    }

    public void setPreviewResolutionSelector(ResolutionSelector resolutionSelector) {
        Threads.checkMainThread();
        if (this.mPreviewResolutionSelector == resolutionSelector) {
            return;
        }
        this.mPreviewResolutionSelector = resolutionSelector;
        unbindPreviewAndRecreate();
        startCameraAndTrackStates();
    }

    public ResolutionSelector getPreviewResolutionSelector() {
        Threads.checkMainThread();
        return this.mPreviewResolutionSelector;
    }

    public void setPreviewDynamicRange(DynamicRange dynamicRange) {
        Threads.checkMainThread();
        this.mPreviewDynamicRange = dynamicRange;
        unbindPreviewAndRecreate();
        startCameraAndTrackStates();
    }

    public DynamicRange getPreviewDynamicRange() {
        Threads.checkMainThread();
        return this.mPreviewDynamicRange;
    }

    private void unbindPreviewAndRecreate() {
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mPreview);
        }
        this.mPreview = createPreview();
        if (this.mSurfaceProvider != null) {
            this.mPreview.setSurfaceProvider(this.mSurfaceProvider);
        }
    }

    private Preview createPreview() {
        Preview.Builder builder = new Preview.Builder();
        configureResolution(builder, this.mPreviewResolutionSelector, this.mPreviewTargetSize);
        builder.setDynamicRange(this.mPreviewDynamicRange);
        return builder.build();
    }

    public boolean isImageCaptureEnabled() {
        Threads.checkMainThread();
        return isUseCaseEnabled(1);
    }

    public int getImageCaptureFlashMode() {
        Threads.checkMainThread();
        return this.mImageCapture.getFlashMode();
    }

    public void setImageCaptureFlashMode(int flashMode) {
        Threads.checkMainThread();
        if (flashMode == 3) {
            Integer lensFacing = this.mCameraSelector.getLensFacing();
            if (lensFacing != null && lensFacing.intValue() != 0) {
                throw new IllegalArgumentException("Not a front camera despite setting FLASH_MODE_SCREEN");
            }
            updateScreenFlashToImageCapture();
        }
        this.mImageCapture.setFlashMode(flashMode);
    }

    public void setScreenFlashUiInfo(ScreenFlashUiInfo screenFlashUiInfo) {
        ScreenFlashUiInfo previousInfo = getScreenFlashUiInfoByPriority();
        this.mScreenFlashUiInfoMap.put(screenFlashUiInfo.getProviderType(), screenFlashUiInfo);
        ScreenFlashUiInfo prioritizedInfo = getScreenFlashUiInfoByPriority();
        if (prioritizedInfo != null && !prioritizedInfo.equals(previousInfo)) {
            updateScreenFlashToImageCapture();
        }
    }

    public void updateScreenFlashToImageCapture() {
        ScreenFlashUiInfo screenFlashUiInfo = getScreenFlashUiInfoByPriority();
        if (screenFlashUiInfo == null) {
            Logger.d(TAG, "No ScreenFlash instance set yet, need to wait for controller to be set to either ScreenFlashView or PreviewView");
            this.mImageCapture.setScreenFlash(NO_OP_SCREEN_FLASH);
        } else {
            this.mImageCapture.setScreenFlash(screenFlashUiInfo.getScreenFlash());
            Logger.d(TAG, "Set ScreenFlash instance to ImageCapture, provided by " + screenFlashUiInfo.getProviderType().name());
        }
    }

    public ScreenFlashUiInfo getScreenFlashUiInfoByPriority() {
        if (this.mScreenFlashUiInfoMap.get(ScreenFlashUiInfo.ProviderType.SCREEN_FLASH_VIEW) != null) {
            return this.mScreenFlashUiInfoMap.get(ScreenFlashUiInfo.ProviderType.SCREEN_FLASH_VIEW);
        }
        if (this.mScreenFlashUiInfoMap.get(ScreenFlashUiInfo.ProviderType.PREVIEW_VIEW) != null) {
            return this.mScreenFlashUiInfoMap.get(ScreenFlashUiInfo.ProviderType.PREVIEW_VIEW);
        }
        return null;
    }

    public void takePicture(ImageCapture.OutputFileOptions outputFileOptions, Executor executor, ImageCapture.OnImageSavedCallback imageSavedCallback) {
        Threads.checkMainThread();
        Preconditions.checkState(isCameraInitialized(), CAMERA_NOT_INITIALIZED);
        Preconditions.checkState(isImageCaptureEnabled(), IMAGE_CAPTURE_DISABLED);
        throwExceptionForInvalidScreenFlashCapture();
        updateMirroringFlagInOutputFileOptions(outputFileOptions);
        this.mImageCapture.m153lambda$takePicture$2$androidxcameracoreImageCapture(outputFileOptions, executor, imageSavedCallback);
    }

    void updateMirroringFlagInOutputFileOptions(ImageCapture.OutputFileOptions outputFileOptions) {
        if (this.mCameraSelector.getLensFacing() != null && !outputFileOptions.getMetadata().isReversedHorizontalSet()) {
            outputFileOptions.getMetadata().setReversedHorizontal(this.mCameraSelector.getLensFacing().intValue() == 0);
        }
    }

    public void takePicture(Executor executor, ImageCapture.OnImageCapturedCallback callback) {
        Threads.checkMainThread();
        Preconditions.checkState(isCameraInitialized(), CAMERA_NOT_INITIALIZED);
        Preconditions.checkState(isImageCaptureEnabled(), IMAGE_CAPTURE_DISABLED);
        throwExceptionForInvalidScreenFlashCapture();
        this.mImageCapture.m152lambda$takePicture$1$androidxcameracoreImageCapture(executor, callback);
    }

    private void throwExceptionForInvalidScreenFlashCapture() {
        if (getImageCaptureFlashMode() == 3) {
            if (getScreenFlashUiInfoByPriority() == null || getScreenFlashUiInfoByPriority().getScreenFlash() == null) {
                throw new IllegalStateException("No window set in PreviewView despite setting FLASH_MODE_SCREEN");
            }
        }
    }

    public void setImageCaptureMode(int captureMode) {
        Threads.checkMainThread();
        if (this.mImageCapture.getCaptureMode() == captureMode) {
            return;
        }
        unbindImageCaptureAndRecreate(Integer.valueOf(captureMode));
        startCameraAndTrackStates();
    }

    public int getImageCaptureMode() {
        Threads.checkMainThread();
        return this.mImageCapture.getCaptureMode();
    }

    @Deprecated
    public void setImageCaptureTargetSize(OutputSize targetSize) {
        Threads.checkMainThread();
        if (isOutputSizeEqual(this.mImageCaptureTargetSize, targetSize)) {
            return;
        }
        this.mImageCaptureTargetSize = targetSize;
        unbindImageCaptureAndRecreate(Integer.valueOf(getImageCaptureMode()));
        startCameraAndTrackStates();
    }

    @Deprecated
    public OutputSize getImageCaptureTargetSize() {
        Threads.checkMainThread();
        return this.mImageCaptureTargetSize;
    }

    public void setImageCaptureResolutionSelector(ResolutionSelector resolutionSelector) {
        Threads.checkMainThread();
        if (this.mImageCaptureResolutionSelector == resolutionSelector) {
            return;
        }
        this.mImageCaptureResolutionSelector = resolutionSelector;
        unbindImageCaptureAndRecreate(Integer.valueOf(getImageCaptureMode()));
        startCameraAndTrackStates();
    }

    public ResolutionSelector getImageCaptureResolutionSelector() {
        Threads.checkMainThread();
        return this.mImageCaptureResolutionSelector;
    }

    public void setImageCaptureIoExecutor(Executor executor) {
        Threads.checkMainThread();
        if (this.mImageCaptureIoExecutor == executor) {
            return;
        }
        this.mImageCaptureIoExecutor = executor;
        unbindImageCaptureAndRecreate(Integer.valueOf(getImageCaptureMode()));
        startCameraAndTrackStates();
    }

    public Executor getImageCaptureIoExecutor() {
        Threads.checkMainThread();
        return this.mImageCaptureIoExecutor;
    }

    private void unbindImageCaptureAndRecreate(Integer imageCaptureMode) {
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mImageCapture);
        }
        int flashMode = this.mImageCapture.getFlashMode();
        this.mImageCapture = createImageCapture(imageCaptureMode);
        setImageCaptureFlashMode(flashMode);
    }

    private ImageCapture createImageCapture(Integer imageCaptureMode) {
        ImageCapture.Builder builder = new ImageCapture.Builder();
        if (imageCaptureMode != null) {
            builder.setCaptureMode(imageCaptureMode.intValue());
        }
        configureResolution(builder, this.mImageCaptureResolutionSelector, this.mImageCaptureTargetSize);
        if (this.mImageCaptureIoExecutor != null) {
            builder.setIoExecutor(this.mImageCaptureIoExecutor);
        }
        if (this.mLastKnownRotation != -1) {
            builder.setTargetRotation(this.mLastKnownRotation);
        }
        return builder.build();
    }

    public boolean isImageAnalysisEnabled() {
        Threads.checkMainThread();
        return isUseCaseEnabled(2);
    }

    public void setImageAnalysisAnalyzer(Executor executor, ImageAnalysis.Analyzer analyzer) {
        Threads.checkMainThread();
        if (this.mAnalysisAnalyzer == analyzer && this.mAnalysisExecutor == executor) {
            return;
        }
        ImageAnalysis.Analyzer oldAnalyzer = this.mAnalysisAnalyzer;
        this.mAnalysisExecutor = executor;
        this.mAnalysisAnalyzer = analyzer;
        this.mImageAnalysis.setAnalyzer(executor, analyzer);
        restartCameraIfAnalyzerResolutionChanged(oldAnalyzer, analyzer);
    }

    public void clearImageAnalysisAnalyzer() {
        Threads.checkMainThread();
        ImageAnalysis.Analyzer oldAnalyzer = this.mAnalysisAnalyzer;
        this.mAnalysisExecutor = null;
        this.mAnalysisAnalyzer = null;
        this.mImageAnalysis.clearAnalyzer();
        restartCameraIfAnalyzerResolutionChanged(oldAnalyzer, null);
    }

    private void restartCameraIfAnalyzerResolutionChanged(ImageAnalysis.Analyzer oldAnalyzer, ImageAnalysis.Analyzer newAnalyzer) {
        Size oldResolution;
        Size newResolution = null;
        if (oldAnalyzer == null) {
            oldResolution = null;
        } else {
            oldResolution = oldAnalyzer.getDefaultTargetResolution();
        }
        if (newAnalyzer != null) {
            newResolution = newAnalyzer.getDefaultTargetResolution();
        }
        if (!Objects.equals(oldResolution, newResolution)) {
            unbindImageAnalysisAndRecreate(Integer.valueOf(this.mImageAnalysis.getBackpressureStrategy()), Integer.valueOf(this.mImageAnalysis.getImageQueueDepth()), Integer.valueOf(this.mImageAnalysis.getOutputImageFormat()));
            startCameraAndTrackStates();
        }
    }

    public int getImageAnalysisBackpressureStrategy() {
        Threads.checkMainThread();
        return this.mImageAnalysis.getBackpressureStrategy();
    }

    public void setImageAnalysisBackpressureStrategy(int strategy) {
        Threads.checkMainThread();
        if (this.mImageAnalysis.getBackpressureStrategy() == strategy) {
            return;
        }
        unbindImageAnalysisAndRecreate(Integer.valueOf(strategy), Integer.valueOf(this.mImageAnalysis.getImageQueueDepth()), Integer.valueOf(this.mImageAnalysis.getOutputImageFormat()));
        startCameraAndTrackStates();
    }

    public void setImageAnalysisImageQueueDepth(int depth) {
        Threads.checkMainThread();
        if (this.mImageAnalysis.getImageQueueDepth() == depth) {
            return;
        }
        unbindImageAnalysisAndRecreate(Integer.valueOf(this.mImageAnalysis.getBackpressureStrategy()), Integer.valueOf(depth), Integer.valueOf(this.mImageAnalysis.getOutputImageFormat()));
        startCameraAndTrackStates();
    }

    public int getImageAnalysisImageQueueDepth() {
        Threads.checkMainThread();
        return this.mImageAnalysis.getImageQueueDepth();
    }

    @Deprecated
    public void setImageAnalysisTargetSize(OutputSize targetSize) {
        Threads.checkMainThread();
        if (isOutputSizeEqual(this.mImageAnalysisTargetSize, targetSize)) {
            return;
        }
        this.mImageAnalysisTargetSize = targetSize;
        unbindImageAnalysisAndRecreate(Integer.valueOf(this.mImageAnalysis.getBackpressureStrategy()), Integer.valueOf(this.mImageAnalysis.getImageQueueDepth()), Integer.valueOf(this.mImageAnalysis.getOutputImageFormat()));
        startCameraAndTrackStates();
    }

    @Deprecated
    public OutputSize getImageAnalysisTargetSize() {
        Threads.checkMainThread();
        return this.mImageAnalysisTargetSize;
    }

    public void setImageAnalysisResolutionSelector(ResolutionSelector resolutionSelector) {
        Threads.checkMainThread();
        if (this.mImageAnalysisResolutionSelector == resolutionSelector) {
            return;
        }
        this.mImageAnalysisResolutionSelector = resolutionSelector;
        unbindImageAnalysisAndRecreate(Integer.valueOf(this.mImageAnalysis.getBackpressureStrategy()), Integer.valueOf(this.mImageAnalysis.getImageQueueDepth()), Integer.valueOf(this.mImageAnalysis.getOutputImageFormat()));
        startCameraAndTrackStates();
    }

    public ResolutionSelector getImageAnalysisResolutionSelector() {
        Threads.checkMainThread();
        return this.mImageAnalysisResolutionSelector;
    }

    public void setImageAnalysisBackgroundExecutor(Executor executor) {
        Threads.checkMainThread();
        if (this.mAnalysisBackgroundExecutor == executor) {
            return;
        }
        this.mAnalysisBackgroundExecutor = executor;
        unbindImageAnalysisAndRecreate(Integer.valueOf(this.mImageAnalysis.getBackpressureStrategy()), Integer.valueOf(this.mImageAnalysis.getImageQueueDepth()), Integer.valueOf(this.mImageAnalysis.getOutputImageFormat()));
        startCameraAndTrackStates();
    }

    public Executor getImageAnalysisBackgroundExecutor() {
        Threads.checkMainThread();
        return this.mAnalysisBackgroundExecutor;
    }

    public void setImageAnalysisOutputImageFormat(int imageAnalysisOutputImageFormat) {
        Threads.checkMainThread();
        if (imageAnalysisOutputImageFormat == this.mImageAnalysis.getOutputImageFormat()) {
            return;
        }
        unbindImageAnalysisAndRecreate(Integer.valueOf(this.mImageAnalysis.getBackpressureStrategy()), Integer.valueOf(this.mImageAnalysis.getImageQueueDepth()), Integer.valueOf(imageAnalysisOutputImageFormat));
    }

    public int getImageAnalysisOutputImageFormat() {
        Threads.checkMainThread();
        return this.mImageAnalysis.getOutputImageFormat();
    }

    private void unbindImageAnalysisAndRecreate(Integer strategy, Integer imageQueueDepth, Integer outputFormat) {
        Threads.checkMainThread();
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mImageAnalysis);
        }
        this.mImageAnalysis = createImageAnalysis(strategy, imageQueueDepth, outputFormat);
        if (this.mAnalysisExecutor != null && this.mAnalysisAnalyzer != null) {
            this.mImageAnalysis.setAnalyzer(this.mAnalysisExecutor, this.mAnalysisAnalyzer);
        }
    }

    private ImageAnalysis createImageAnalysis(Integer strategy, Integer imageQueueDepth, Integer outputFormat) {
        ImageAnalysis.Builder builder = new ImageAnalysis.Builder();
        if (strategy != null) {
            builder.setBackpressureStrategy(strategy.intValue());
        }
        if (imageQueueDepth != null) {
            builder.setImageQueueDepth(imageQueueDepth.intValue());
        }
        if (outputFormat != null) {
            builder.setOutputImageFormat(outputFormat.intValue());
        }
        configureResolution(builder, this.mImageAnalysisResolutionSelector, this.mImageAnalysisTargetSize);
        if (this.mAnalysisBackgroundExecutor != null) {
            builder.setBackgroundExecutor(this.mAnalysisBackgroundExecutor);
        }
        if (this.mLastKnownRotation != -1) {
            builder.setTargetRotation(this.mLastKnownRotation);
        }
        return builder.build();
    }

    void updatePreviewViewTransform(Matrix matrix) {
        Threads.checkMainThread();
        if (this.mAnalysisAnalyzer != null && this.mAnalysisAnalyzer.getTargetCoordinateSystem() == 1) {
            this.mAnalysisAnalyzer.updateTransform(matrix);
        }
    }

    public boolean isVideoCaptureEnabled() {
        Threads.checkMainThread();
        return isUseCaseEnabled(4);
    }

    public Recording startRecording(FileOutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        return startRecordingInternal(outputOptions, audioConfig, executor, listener);
    }

    public Recording startRecording(FileDescriptorOutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        return startRecordingInternal(outputOptions, audioConfig, executor, listener);
    }

    public Recording startRecording(MediaStoreOutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        return startRecordingInternal(outputOptions, audioConfig, executor, listener);
    }

    private Recording startRecordingInternal(OutputOptions outputOptions, AudioConfig audioConfig, Executor executor, Consumer<VideoRecordEvent> listener) {
        Threads.checkMainThread();
        Preconditions.checkState(isCameraInitialized(), CAMERA_NOT_INITIALIZED);
        Preconditions.checkState(isVideoCaptureEnabled(), VIDEO_CAPTURE_DISABLED);
        Preconditions.checkState(!isRecording(), VIDEO_RECORDING_UNFINISHED);
        Consumer<VideoRecordEvent> wrappedListener = wrapListenerToDeactivateRecordingOnFinalized(listener);
        PendingRecording pendingRecording = prepareRecording(outputOptions);
        boolean isAudioEnabled = audioConfig.getAudioEnabled();
        if (isAudioEnabled) {
            checkAudioPermissionGranted();
            pendingRecording.withAudioEnabled();
        }
        Recording recording = pendingRecording.start(executor, wrappedListener);
        setActiveRecording(recording, wrappedListener);
        return recording;
    }

    private void checkAudioPermissionGranted() {
        int permissionState = PermissionChecker.checkSelfPermission(this.mAppContext, "android.permission.RECORD_AUDIO");
        if (permissionState == -1) {
            throw new SecurityException("Attempted to start recording with audio, but application does not have RECORD_AUDIO permission granted.");
        }
    }

    private PendingRecording prepareRecording(OutputOptions options) {
        Recorder recorder = this.mVideoCapture.getOutput();
        if (options instanceof FileOutputOptions) {
            return recorder.prepareRecording(this.mAppContext, (FileOutputOptions) options);
        }
        if (options instanceof FileDescriptorOutputOptions) {
            if (Build.VERSION.SDK_INT < 26) {
                throw new UnsupportedOperationException("File descriptors are not supported on pre-Android O (API 26) devices.");
            }
            return recorder.prepareRecording(this.mAppContext, (FileDescriptorOutputOptions) options);
        }
        if (options instanceof MediaStoreOutputOptions) {
            return recorder.prepareRecording(this.mAppContext, (MediaStoreOutputOptions) options);
        }
        throw new IllegalArgumentException("Unsupported OutputOptions type.");
    }

    private Consumer<VideoRecordEvent> wrapListenerToDeactivateRecordingOnFinalized(Consumer<VideoRecordEvent> listener) {
        Executor mainExecutor = ContextCompat.getMainExecutor(this.mAppContext);
        return new AnonymousClass2(mainExecutor, listener);
    }

    /* renamed from: androidx.camera.view.CameraController$2, reason: invalid class name */
    class AnonymousClass2 implements Consumer<VideoRecordEvent> {
        final /* synthetic */ Consumer val$listener;
        final /* synthetic */ Executor val$mainExecutor;

        AnonymousClass2(Executor executor, Consumer consumer) {
            this.val$mainExecutor = executor;
            this.val$listener = consumer;
        }

        @Override // androidx.core.util.Consumer
        public void accept(VideoRecordEvent videoRecordEvent) {
            if (videoRecordEvent instanceof VideoRecordEvent.Finalize) {
                if (!Threads.isMainThread()) {
                    this.val$mainExecutor.execute(new Runnable() { // from class: androidx.camera.view.CameraController$2$$ExternalSyntheticLambda0
                        @Override // java.lang.Runnable
                        public final void run() {
                            CameraController.AnonymousClass2.this.m311lambda$accept$0$androidxcameraviewCameraController$2();
                        }
                    });
                } else {
                    CameraController.this.deactivateRecordingByListener(this);
                }
            }
            this.val$listener.accept(videoRecordEvent);
        }

        /* renamed from: lambda$accept$0$androidx-camera-view-CameraController$2, reason: not valid java name */
        /* synthetic */ void m311lambda$accept$0$androidxcameraviewCameraController$2() {
            CameraController.this.deactivateRecordingByListener(this);
        }
    }

    void deactivateRecordingByListener(Consumer<VideoRecordEvent> listener) {
        Recording recording = this.mRecordingMap.remove(listener);
        if (recording != null) {
            deactivateRecording(recording);
        }
    }

    private void deactivateRecording(Recording recording) {
        if (this.mActiveRecording == recording) {
            this.mActiveRecording = null;
        }
    }

    private void setActiveRecording(Recording recording, Consumer<VideoRecordEvent> listener) {
        this.mRecordingMap.put(listener, recording);
        this.mActiveRecording = recording;
    }

    private void stopRecording() {
        Threads.checkMainThread();
        if (this.mActiveRecording != null) {
            this.mActiveRecording.stop();
            deactivateRecording(this.mActiveRecording);
        }
    }

    public boolean isRecording() {
        Threads.checkMainThread();
        return (this.mActiveRecording == null || this.mActiveRecording.isClosed()) ? false : true;
    }

    public void setVideoCaptureQualitySelector(QualitySelector qualitySelector) {
        Threads.checkMainThread();
        this.mVideoCaptureQualitySelector = qualitySelector;
        unbindVideoAndRecreate();
        startCameraAndTrackStates();
    }

    public QualitySelector getVideoCaptureQualitySelector() {
        Threads.checkMainThread();
        return this.mVideoCaptureQualitySelector;
    }

    public void setVideoCaptureMirrorMode(int mirrorMode) {
        Threads.checkMainThread();
        this.mVideoCaptureMirrorMode = mirrorMode;
        unbindVideoAndRecreate();
        startCameraAndTrackStates();
    }

    public int getVideoCaptureMirrorMode() {
        Threads.checkMainThread();
        return this.mVideoCaptureMirrorMode;
    }

    public void setVideoCaptureDynamicRange(DynamicRange dynamicRange) {
        Threads.checkMainThread();
        this.mVideoCaptureDynamicRange = dynamicRange;
        unbindVideoAndRecreate();
        startCameraAndTrackStates();
    }

    public DynamicRange getVideoCaptureDynamicRange() {
        Threads.checkMainThread();
        return this.mVideoCaptureDynamicRange;
    }

    public void setVideoCaptureTargetFrameRate(Range<Integer> targetFrameRate) {
        Threads.checkMainThread();
        this.mVideoCaptureTargetFrameRate = targetFrameRate;
        unbindVideoAndRecreate();
        startCameraAndTrackStates();
    }

    public Range<Integer> getVideoCaptureTargetFrameRate() {
        Threads.checkMainThread();
        return this.mVideoCaptureTargetFrameRate;
    }

    private void unbindVideoAndRecreate() {
        if (isCameraInitialized()) {
            this.mCameraProvider.unbind(this.mVideoCapture);
        }
        this.mVideoCapture = createVideoCapture();
    }

    private VideoCapture<Recorder> createVideoCapture() {
        int aspectRatioInt;
        Recorder.Builder videoRecorderBuilder = new Recorder.Builder().setQualitySelector(this.mVideoCaptureQualitySelector);
        if (this.mViewPort != null && this.mVideoCaptureQualitySelector == Recorder.DEFAULT_QUALITY_SELECTOR && (aspectRatioInt = getViewportAspectRatioInt(this.mViewPort)) != -1) {
            videoRecorderBuilder.setAspectRatio(aspectRatioInt);
        }
        VideoCapture.Builder<Recorder> builder = new VideoCapture.Builder(videoRecorderBuilder.build()).setTargetFrameRate(this.mVideoCaptureTargetFrameRate).setMirrorMode(this.mVideoCaptureMirrorMode).setDynamicRange(this.mVideoCaptureDynamicRange);
        if (this.mLastKnownRotation != -1) {
            builder.setTargetRotation(this.mLastKnownRotation);
        }
        return builder.build();
    }

    private AspectRatioStrategy getViewportAspectRatioStrategy(ViewPort viewPort) {
        int aspectRatioInt = getViewportAspectRatioInt(viewPort);
        if (aspectRatioInt != -1) {
            return new AspectRatioStrategy(aspectRatioInt, 1);
        }
        return null;
    }

    private int getViewportAspectRatioInt(ViewPort viewPort) {
        boolean z;
        int surfaceRotationDegrees = viewPort == null ? 0 : CameraOrientationUtil.surfaceRotationToDegrees(viewPort.getRotation());
        int sensorRotationDegrees = 0;
        boolean isOppositeFacing = true;
        try {
            if (this.mCameraProvider != null) {
                CameraInfo cameraInfo = this.mCameraProvider.getCameraInfo(this.mCameraSelector);
                sensorRotationDegrees = cameraInfo.getSensorRotationDegrees();
                if (cameraInfo.getLensFacing() != 1) {
                    z = false;
                } else {
                    z = true;
                }
                isOppositeFacing = z;
            }
        } catch (IllegalArgumentException e) {
            String readableSelector = getReadableSelectorString(this.mCameraSelector);
            Logger.w(TAG, "Failed to retrieve CameraInfo for selector: " + readableSelector, e);
        }
        int relativeRotation = CameraOrientationUtil.getRelativeImageRotation(surfaceRotationDegrees, sensorRotationDegrees, isOppositeFacing);
        Rational aspectRatio = viewPort.getAspectRatio();
        if (relativeRotation == 90 || relativeRotation == 270) {
            aspectRatio = new Rational(aspectRatio.getDenominator(), aspectRatio.getNumerator());
        }
        if (aspectRatio.equals(AspectRatioUtil.ASPECT_RATIO_4_3)) {
            return 0;
        }
        if (aspectRatio.equals(AspectRatioUtil.ASPECT_RATIO_16_9)) {
            return 1;
        }
        return -1;
    }

    private String getReadableSelectorString(CameraSelector selector) {
        if (selector == null) {
            return "null";
        }
        StringBuilder description = new StringBuilder("CameraSelector{");
        Integer lensFacing = selector.getLensFacing();
        if (lensFacing != null) {
            switch (lensFacing.intValue()) {
                case 0:
                    description.append("lensFacing=FRONT");
                    break;
                case 1:
                    description.append("lensFacing=BACK");
                    break;
                case 2:
                    description.append("lensFacing=EXTERNAL");
                    break;
                default:
                    description.append("lensFacing=UNKNOWN(").append(lensFacing).append(")");
                    break;
            }
        } else {
            description.append("lensFacing=NOT_SPECIFIED");
        }
        description.append("}");
        return description.toString();
    }

    private void unbindAllUseCases() {
        if (!isCameraInitialized()) {
            return;
        }
        this.mCameraProvider.unbind(this.mPreview, this.mImageCapture, this.mImageAnalysis, this.mVideoCapture);
    }

    private void unbindAllAndRecreate() {
        unbindPreviewAndRecreate();
        unbindImageCaptureAndRecreate(Integer.valueOf(getImageCaptureMode()));
        unbindImageAnalysisAndRecreate(Integer.valueOf(this.mImageAnalysis.getBackpressureStrategy()), Integer.valueOf(this.mImageAnalysis.getImageQueueDepth()), Integer.valueOf(this.mImageAnalysis.getOutputImageFormat()));
        unbindVideoAndRecreate();
    }

    public void setCameraSelector(CameraSelector cameraSelector) {
        Threads.checkMainThread();
        if (this.mCameraSelector == cameraSelector) {
            return;
        }
        Integer lensFacing = cameraSelector.getLensFacing();
        if (this.mImageCapture.getFlashMode() == 3 && lensFacing != null && lensFacing.intValue() != 0) {
            throw new IllegalStateException("Not a front camera despite setting FLASH_MODE_SCREEN");
        }
        final CameraSelector oldCameraSelector = this.mCameraSelector;
        this.mCameraSelector = cameraSelector;
        if (this.mCameraProvider == null) {
            return;
        }
        this.mCameraProvider.unbind(this.mPreview, this.mImageCapture, this.mImageAnalysis, this.mVideoCapture);
        startCameraAndTrackStates(new Runnable() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda9
            @Override // java.lang.Runnable
            public final void run() {
                CameraController.this.m309lambda$setCameraSelector$3$androidxcameraviewCameraController(oldCameraSelector);
            }
        });
    }

    /* renamed from: lambda$setCameraSelector$3$androidx-camera-view-CameraController, reason: not valid java name */
    /* synthetic */ void m309lambda$setCameraSelector$3$androidxcameraviewCameraController(CameraSelector oldCameraSelector) {
        this.mCameraSelector = oldCameraSelector;
    }

    public boolean hasCamera(CameraSelector cameraSelector) {
        Threads.checkMainThread();
        Preconditions.checkNotNull(cameraSelector);
        if (this.mCameraProvider == null) {
            throw new IllegalStateException("Camera not initialized. Please wait for the initialization future to finish. See #getInitializationFuture().");
        }
        try {
            return this.mCameraProvider.hasCamera(cameraSelector);
        } catch (CameraInfoUnavailableException e) {
            Logger.w(TAG, "Failed to check camera availability", e);
            return false;
        }
    }

    public CameraSelector getCameraSelector() {
        Threads.checkMainThread();
        return this.mCameraSelector;
    }

    public boolean isPinchToZoomEnabled() {
        Threads.checkMainThread();
        return this.mPinchToZoomEnabled;
    }

    public void setPinchToZoomEnabled(boolean enabled) {
        Threads.checkMainThread();
        this.mPinchToZoomEnabled = enabled;
    }

    void onPinchToZoom(float pinchToZoomScale) {
        if (!isCameraAttached()) {
            Logger.w(TAG, CAMERA_NOT_ATTACHED);
            return;
        }
        if (!this.mPinchToZoomEnabled) {
            Logger.d(TAG, "Pinch to zoom disabled.");
            return;
        }
        Logger.d(TAG, "Pinch to zoom with scale: " + pinchToZoomScale);
        ZoomState zoomState = getZoomState().getValue();
        if (zoomState == null) {
            return;
        }
        float clampedRatio = zoomState.getZoomRatio() * speedUpZoomBy2X(pinchToZoomScale);
        setZoomRatio(Math.min(Math.max(clampedRatio, zoomState.getMinZoomRatio()), zoomState.getMaxZoomRatio()));
    }

    private float speedUpZoomBy2X(float scaleFactor) {
        return scaleFactor > 1.0f ? ((scaleFactor - 1.0f) * 2.0f) + 1.0f : 1.0f - ((1.0f - scaleFactor) * 2.0f);
    }

    void onTapToFocus(MeteringPointFactory meteringPointFactory, float x, float y) {
        if (!isCameraAttached()) {
            Logger.w(TAG, CAMERA_NOT_ATTACHED);
            return;
        }
        if (!this.mTapToFocusEnabled) {
            Logger.d(TAG, "Tap to focus disabled. ");
            return;
        }
        PointF tapPoint = new PointF(x, y);
        FocusMeteringAction focusMeteringAction = createFocusMeteringAction(meteringPointFactory, tapPoint);
        Logger.d(TAG, "Tap to focus started: " + x + ", " + y);
        if (this.mFocusMeteringResultCallback != null) {
            this.mFocusMeteringResultCallback.close();
        }
        this.mTapToFocusInfoState.postValue(new TapToFocusInfo(1, tapPoint));
        final FocusMeteringResultCallback focusMeteringResultCallback = new FocusMeteringResultCallback(tapPoint, this.mTapToFocusInfoState);
        this.mFocusMeteringResultCallback = focusMeteringResultCallback;
        Futures.addCallback(this.mCamera.getCameraControl().startFocusAndMetering(focusMeteringAction), focusMeteringResultCallback, CameraXExecutors.directExecutor());
        long cancelDuration = TimeUnit.NANOSECONDS.toMillis(this.mTapToFocusAutoCancelDurationNanos);
        Logger.d(TAG, "Tap to focus auto cancel duration: " + cancelDuration + " ms");
        if (cancelDuration > 0) {
            Handler handler = new Handler(Looper.getMainLooper());
            Objects.requireNonNull(focusMeteringResultCallback);
            handler.postDelayed(new Runnable() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda3
                @Override // java.lang.Runnable
                public final void run() {
                    CameraController.FocusMeteringResultCallback.this.resetStateAndClose();
                }
            }, cancelDuration);
        }
    }

    private FocusMeteringAction createFocusMeteringAction(MeteringPointFactory meteringPointFactory, PointF tapPoint) {
        FocusMeteringAction.Builder focusMeteringActionBuilder;
        MeteringPoint afPoint = meteringPointFactory.createPoint(tapPoint.x, tapPoint.y, AF_SIZE);
        MeteringPoint aePoint = meteringPointFactory.createPoint(tapPoint.x, tapPoint.y, AE_SIZE);
        FocusMeteringAction.Builder focusMeteringActionBuilder2 = new FocusMeteringAction.Builder(afPoint, 1).addPoint(aePoint, 2);
        if (this.mTapToFocusAutoCancelDurationNanos > 0) {
            focusMeteringActionBuilder = focusMeteringActionBuilder2.setAutoCancelDuration(this.mTapToFocusAutoCancelDurationNanos, TimeUnit.NANOSECONDS);
        } else {
            focusMeteringActionBuilder = focusMeteringActionBuilder2.disableAutoCancel();
        }
        return focusMeteringActionBuilder.build();
    }

    public boolean isTapToFocusEnabled() {
        Threads.checkMainThread();
        return this.mTapToFocusEnabled;
    }

    public void setTapToFocusEnabled(boolean enabled) {
        Threads.checkMainThread();
        this.mTapToFocusEnabled = enabled;
    }

    @Deprecated
    public LiveData<Integer> getTapToFocusState() {
        Threads.checkMainThread();
        return this.mTapToFocusState;
    }

    public LiveData<TapToFocusInfo> getTapToFocusInfoState() {
        Threads.checkMainThread();
        return this.mTapToFocusInfoState;
    }

    public void setTapToFocusAutoCancelDuration(long duration, TimeUnit timeUnit) {
        Preconditions.checkArgument(duration >= 0, "Tap-to-focus auto-cancellation duration must be at least 0");
        this.mTapToFocusAutoCancelDurationNanos = timeUnit.toNanos(duration);
        Logger.d(TAG, "setTapToFocusAutoCancelDuration: " + this.mTapToFocusAutoCancelDurationNanos + " ns set!");
    }

    public LiveData<ZoomState> getZoomState() {
        Threads.checkMainThread();
        return this.mZoomState;
    }

    public CameraInfo getCameraInfo() {
        Threads.checkMainThread();
        if (this.mCamera == null) {
            return null;
        }
        return this.mCamera.getCameraInfo();
    }

    public CameraControl getCameraControl() {
        Threads.checkMainThread();
        if (this.mCamera == null) {
            return null;
        }
        return this.mCamera.getCameraControl();
    }

    public ListenableFuture<Void> setZoomRatio(float zoomRatio) {
        Threads.checkMainThread();
        if (!isCameraAttached()) {
            return this.mPendingZoomRatio.setValue(Float.valueOf(zoomRatio));
        }
        return this.mCamera.getCameraControl().setZoomRatio(zoomRatio);
    }

    public ListenableFuture<Void> setLinearZoom(float linearZoom) {
        Threads.checkMainThread();
        if (!isCameraAttached()) {
            return this.mPendingLinearZoom.setValue(Float.valueOf(linearZoom));
        }
        return this.mCamera.getCameraControl().setLinearZoom(linearZoom);
    }

    public LiveData<Integer> getTorchState() {
        Threads.checkMainThread();
        return this.mTorchState;
    }

    public ListenableFuture<Void> enableTorch(boolean torchEnabled) {
        Threads.checkMainThread();
        if (!isCameraAttached()) {
            return this.mPendingEnableTorch.setValue(Boolean.valueOf(torchEnabled));
        }
        return this.mCamera.getCameraControl().enableTorch(torchEnabled);
    }

    public void setEffects(Set<CameraEffect> effects) {
        Threads.checkMainThread();
        if (Objects.equals(this.mEffects, effects)) {
            return;
        }
        if (this.mCameraProvider != null) {
            this.mCameraProvider.unbindAll();
        }
        this.mEffects.clear();
        this.mEffects.addAll(effects);
        startCameraAndTrackStates();
    }

    public void clearEffects() {
        Threads.checkMainThread();
        if (this.mCameraProvider != null) {
            this.mCameraProvider.unbindAll();
        }
        this.mEffects.clear();
        startCameraAndTrackStates();
    }

    void startCameraAndTrackStates() {
        startCameraAndTrackStates(null);
    }

    void startCameraAndTrackStates(Runnable restoreStateRunnable) {
        try {
            this.mCamera = startCamera();
            if (!isCameraAttached()) {
                Logger.d(TAG, CAMERA_NOT_ATTACHED);
                return;
            }
            this.mZoomState.setSource(this.mCamera.getCameraInfo().getZoomState());
            this.mTorchState.setSource(this.mCamera.getCameraInfo().getTorchState());
            this.mPendingEnableTorch.propagateIfHasValue(new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda0
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return CameraController.this.enableTorch(((Boolean) obj).booleanValue());
                }
            });
            this.mPendingLinearZoom.propagateIfHasValue(new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda1
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return CameraController.this.setLinearZoom(((Float) obj).floatValue());
                }
            });
            this.mPendingZoomRatio.propagateIfHasValue(new Function() { // from class: androidx.camera.view.CameraController$$ExternalSyntheticLambda2
                @Override // androidx.arch.core.util.Function
                public final Object apply(Object obj) {
                    return CameraController.this.setZoomRatio(((Float) obj).floatValue());
                }
            });
        } catch (RuntimeException exception) {
            if (restoreStateRunnable != null) {
                restoreStateRunnable.run();
            }
            throw exception;
        }
    }

    protected UseCaseGroup createUseCaseGroup() {
        if (!isCameraInitialized()) {
            Logger.d(TAG, CAMERA_NOT_INITIALIZED);
            return null;
        }
        if (!isPreviewViewAttached()) {
            Logger.d(TAG, PREVIEW_VIEW_NOT_ATTACHED);
            return null;
        }
        unbindAllUseCases();
        UseCaseGroup.Builder builder = new UseCaseGroup.Builder().addUseCase(this.mPreview);
        if (isImageCaptureEnabled()) {
            builder.addUseCase(this.mImageCapture);
        }
        if (isImageAnalysisEnabled()) {
            builder.addUseCase(this.mImageAnalysis);
        }
        if (isVideoCaptureEnabled()) {
            builder.addUseCase(this.mVideoCapture);
        }
        builder.setViewPort(this.mViewPort);
        for (CameraEffect effect : this.mEffects) {
            builder.addEffect(effect);
        }
        return builder.build();
    }

    @Deprecated
    public static final class OutputSize {
        public static final int UNASSIGNED_ASPECT_RATIO = -1;
        private final int mAspectRatio;
        private final Size mResolution;

        @Retention(RetentionPolicy.SOURCE)
        public @interface OutputAspectRatio {
        }

        public OutputSize(int aspectRatio) {
            Preconditions.checkArgument(aspectRatio != -1);
            this.mAspectRatio = aspectRatio;
            this.mResolution = null;
        }

        public OutputSize(Size resolution) {
            Preconditions.checkNotNull(resolution);
            this.mAspectRatio = -1;
            this.mResolution = resolution;
        }

        public int getAspectRatio() {
            return this.mAspectRatio;
        }

        public Size getResolution() {
            return this.mResolution;
        }

        public String toString() {
            return "aspect ratio: " + this.mAspectRatio + " resolution: " + this.mResolution;
        }
    }

    static class FocusMeteringResultCallback implements FutureCallback<FocusMeteringResult> {
        private boolean mIsCanceled = false;
        private final Object mLock = new Object();
        private final PointF mTapPoint;
        private final MutableLiveData<TapToFocusInfo> mTapToFocusInfoState;

        FocusMeteringResultCallback(PointF tapPoint, MutableLiveData<TapToFocusInfo> tapToFocusInfoState) {
            this.mTapPoint = tapPoint;
            this.mTapToFocusInfoState = tapToFocusInfoState;
        }

        @Override // androidx.camera.core.impl.utils.futures.FutureCallback
        public void onSuccess(FocusMeteringResult result) {
            synchronized (this.mLock) {
                if (this.mIsCanceled) {
                    return;
                }
                if (result == null) {
                    return;
                }
                Logger.d(CameraController.TAG, "Tap-to-focus onSuccess: " + result.isFocusSuccessful());
                this.mTapToFocusInfoState.postValue(new TapToFocusInfo(result.isFocusSuccessful() ? 2 : 3, this.mTapPoint));
            }
        }

        @Override // androidx.camera.core.impl.utils.futures.FutureCallback
        public void onFailure(Throwable t) {
            synchronized (this.mLock) {
                if (this.mIsCanceled) {
                    return;
                }
                if (t instanceof CameraControl.OperationCanceledException) {
                    Logger.d(CameraController.TAG, "Tap-to-focus canceled", t);
                    this.mTapToFocusInfoState.postValue(new TapToFocusInfo(0, null));
                    close();
                } else {
                    Logger.d(CameraController.TAG, "Tap-to-focus failed.", t);
                    this.mTapToFocusInfoState.postValue(new TapToFocusInfo(4, this.mTapPoint));
                }
            }
        }

        void resetStateAndClose() {
            synchronized (this.mLock) {
                if (this.mIsCanceled) {
                    return;
                }
                Logger.d(CameraController.TAG, "Tap-to-focus reset.");
                this.mTapToFocusInfoState.postValue(new TapToFocusInfo(0, null));
                this.mIsCanceled = true;
            }
        }

        void close() {
            synchronized (this.mLock) {
                this.mIsCanceled = true;
            }
        }
    }
}
