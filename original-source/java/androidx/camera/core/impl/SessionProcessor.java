package androidx.camera.core.impl;

import android.hardware.camera2.CameraCharacteristics;
import android.os.Build;
import android.util.Pair;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.CameraInfo;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public interface SessionProcessor {
    public static final int TYPE_CAMERA2_EXTENSION = 1;
    public static final int TYPE_VENDOR_LIBRARY = 0;

    public interface CaptureSessionRequestProcessor {
        Pair<Long, Long> getRealtimeStillCaptureLatency();

        void setExtensionStrength(int i);
    }

    void abortCapture(int i);

    void deInitSession();

    List<Pair<CameraCharacteristics.Key, Object>> getAvailableCharacteristicsKeyValues();

    int[] getExtensionAvailableStabilizationModes();

    Range<Float> getExtensionZoomRange();

    Pair<Integer, Integer> getImplementationType();

    Pair<Long, Long> getRealtimeCaptureLatency();

    Set<Integer> getSupportedCameraOperations();

    Map<Integer, List<Size>> getSupportedPostviewSize(Size size);

    SessionConfig initSession(CameraInfo cameraInfo, OutputSurfaceConfiguration outputSurfaceConfiguration);

    void onCaptureSessionEnd();

    void onCaptureSessionStart(RequestProcessor requestProcessor);

    void setCaptureSessionRequestProcessor(CaptureSessionRequestProcessor captureSessionRequestProcessor);

    void setParameters(Config config);

    int startCapture(boolean z, TagBundle tagBundle, CaptureCallback captureCallback);

    int startRepeating(TagBundle tagBundle, CaptureCallback captureCallback);

    int startTrigger(Config config, TagBundle tagBundle, CaptureCallback captureCallback);

    void stopRepeating();

    /* renamed from: androidx.camera.core.impl.SessionProcessor$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static int $default$startTrigger(SessionProcessor _this, Config config, TagBundle tagBundle, CaptureCallback callback) {
            return -1;
        }

        public static Range $default$getExtensionZoomRange(SessionProcessor _this) {
            if (Build.VERSION.SDK_INT >= 30) {
                List<Pair<CameraCharacteristics.Key, Object>> keyValues = _this.getAvailableCharacteristicsKeyValues();
                for (Pair<CameraCharacteristics.Key, Object> keyValue : keyValues) {
                    if (((CameraCharacteristics.Key) keyValue.first).equals(CameraCharacteristics.CONTROL_ZOOM_RATIO_RANGE)) {
                        return (Range) keyValue.second;
                    }
                }
                return null;
            }
            return null;
        }

        public static int[] $default$getExtensionAvailableStabilizationModes(SessionProcessor _this) {
            List<Pair<CameraCharacteristics.Key, Object>> keyValues = _this.getAvailableCharacteristicsKeyValues();
            for (Pair<CameraCharacteristics.Key, Object> keyValue : keyValues) {
                if (((CameraCharacteristics.Key) keyValue.first).equals(CameraCharacteristics.CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES)) {
                    return (int[]) keyValue.second;
                }
            }
            return null;
        }

        public static Pair $default$getRealtimeCaptureLatency(SessionProcessor _this) {
            return null;
        }

        public static void $default$setCaptureSessionRequestProcessor(SessionProcessor _this, CaptureSessionRequestProcessor processor) {
        }
    }

    public interface CaptureCallback {
        void onCaptureCompleted(long j, int i, CameraCaptureResult cameraCaptureResult);

        void onCaptureFailed(int i);

        void onCaptureProcessProgressed(int i);

        void onCaptureProcessStarted(int i);

        void onCaptureSequenceAborted(int i);

        void onCaptureSequenceCompleted(int i);

        void onCaptureStarted(int i, long j);

        /* renamed from: androidx.camera.core.impl.SessionProcessor$CaptureCallback$-CC, reason: invalid class name */
        public final /* synthetic */ class CC {
            public static void $default$onCaptureStarted(CaptureCallback _this, int captureSequenceId, long timestamp) {
            }

            public static void $default$onCaptureProcessStarted(CaptureCallback _this, int captureSequenceId) {
            }

            public static void $default$onCaptureFailed(CaptureCallback _this, int captureSequenceId) {
            }

            public static void $default$onCaptureSequenceCompleted(CaptureCallback _this, int captureSequenceId) {
            }

            public static void $default$onCaptureSequenceAborted(CaptureCallback _this, int captureSequenceId) {
            }

            public static void $default$onCaptureCompleted(CaptureCallback _this, long timestamp, int captureSequenceId, CameraCaptureResult captureResult) {
            }

            public static void $default$onCaptureProcessProgressed(CaptureCallback _this, int progress) {
            }
        }
    }
}
