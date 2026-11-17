package androidx.camera.core.streamsharing;

import androidx.camera.core.imagecapture.CameraCapturePipeline;
import androidx.camera.core.impl.CameraControlInternal;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.ForwardingCameraControl;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.camera.core.streamsharing.StreamSharing;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class VirtualCameraControl extends ForwardingCameraControl {
    private static final int DEFAULT_JPEG_QUALITY = 100;
    private static final int DEFAULT_ROTATION_DEGREES = 0;
    private final StreamSharing.Control mStreamSharingControl;

    VirtualCameraControl(CameraControlInternal parent, StreamSharing.Control streamSharingControl) {
        super(parent);
        this.mStreamSharingControl = streamSharingControl;
    }

    @Override // androidx.camera.core.impl.ForwardingCameraControl, androidx.camera.core.impl.CameraControlInternal
    public ListenableFuture<List<Void>> submitStillCaptureRequests(final List<CaptureConfig> captureConfigs, int captureMode, int flashType) {
        Preconditions.checkArgument(captureConfigs.size() == 1, "Only support one capture config.");
        final ListenableFuture<CameraCapturePipeline> capturePipeline = getCameraCapturePipelineAsync(captureMode, 1);
        ListenableFuture<Void> captureFuture = FutureChain.from(capturePipeline).transformAsync(new AsyncFunction() { // from class: androidx.camera.core.streamsharing.VirtualCameraControl$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                ListenableFuture invokePreCapture;
                invokePreCapture = ((CameraCapturePipeline) ListenableFuture.this.get()).invokePreCapture();
                return invokePreCapture;
            }
        }, CameraXExecutors.directExecutor()).transformAsync(new AsyncFunction() { // from class: androidx.camera.core.streamsharing.VirtualCameraControl$$ExternalSyntheticLambda1
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                return VirtualCameraControl.this.m238x49c89588(captureConfigs, (Void) obj);
            }
        }, CameraXExecutors.directExecutor()).transformAsync(new AsyncFunction() { // from class: androidx.camera.core.streamsharing.VirtualCameraControl$$ExternalSyntheticLambda2
            @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
            public final ListenableFuture apply(Object obj) {
                ListenableFuture invokePostCapture;
                invokePostCapture = ((CameraCapturePipeline) ListenableFuture.this.get()).invokePostCapture();
                return invokePostCapture;
            }
        }, CameraXExecutors.directExecutor());
        return Futures.allAsList(Collections.singletonList(captureFuture));
    }

    /* renamed from: lambda$submitStillCaptureRequests$1$androidx-camera-core-streamsharing-VirtualCameraControl, reason: not valid java name */
    /* synthetic */ ListenableFuture m238x49c89588(List captureConfigs, Void v) throws Exception {
        return this.mStreamSharingControl.jpegSnapshot(getJpegQuality((CaptureConfig) captureConfigs.get(0)), getRotationDegrees((CaptureConfig) captureConfigs.get(0)));
    }

    private int getJpegQuality(CaptureConfig captureConfig) {
        return ((Integer) Objects.requireNonNull((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_JPEG_QUALITY, 100))).intValue();
    }

    private int getRotationDegrees(CaptureConfig captureConfig) {
        return ((Integer) Objects.requireNonNull((Integer) captureConfig.getImplementationOptions().retrieveOption(CaptureConfig.OPTION_ROTATION, 0))).intValue();
    }
}
