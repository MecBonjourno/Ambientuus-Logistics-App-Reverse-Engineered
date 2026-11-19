package androidx.camera.video;

import androidx.camera.core.CameraInfo;
import androidx.camera.core.SurfaceRequest;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.Timebase;

/* carregado de: classes.dex */
public interface VideoOutput {

    public enum SourceState {
        ACTIVE_STREAMING,
        ACTIVE_NON_STREAMING,
        INACTIVE
    }

    VideoCapabilities getMediaCapabilities(CameraInfo cameraInfo, int i);

    Observable<MediaSpec> getMediaSpec();

    Observable<StreamInfo> getStreamInfo();

    Observable<Boolean> isSourceStreamRequired();

    void onSourceStateChanged(SourceState sourceState);

    void onSurfaceRequested(SurfaceRequest surfaceRequest);

    void onSurfaceRequested(SurfaceRequest surfaceRequest, Timebase timebase, boolean z);

    /* renomeado de: androidx.camera.video.VideoOutput$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$onSourceStateChanged(VideoOutput _this, SourceState sourceState) {
        }
    }
}
