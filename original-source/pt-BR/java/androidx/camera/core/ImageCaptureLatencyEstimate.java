package androidx.camera.core;

import j$.util.Objects;

/* carregado de: classes.dex */
public class ImageCaptureLatencyEstimate {
    public static final long UNDEFINED_CAPTURE_LATENCY = -1;
    public static final ImageCaptureLatencyEstimate UNDEFINED_IMAGE_CAPTURE_LATENCY = new ImageCaptureLatencyEstimate(-1, -1);
    public static final long UNDEFINED_PROCESSING_LATENCY = -1;
    private final long mCaptureLatencyMillis;
    private final long mProcessingLatencyMillis;
    private final long mTotalCaptureLatencyMillis;

    public ImageCaptureLatencyEstimate(long captureLatencyMillis, long processingLatencyMillis) {
        this.mCaptureLatencyMillis = captureLatencyMillis;
        this.mProcessingLatencyMillis = processingLatencyMillis;
        this.mTotalCaptureLatencyMillis = computeTotalCaptureLatencyMillis(captureLatencyMillis, processingLatencyMillis);
    }

    public long getCaptureLatencyMillis() {
        return this.mCaptureLatencyMillis;
    }

    public long getProcessingLatencyMillis() {
        return this.mProcessingLatencyMillis;
    }

    public long getTotalCaptureLatencyMillis() {
        return this.mTotalCaptureLatencyMillis;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof ImageCaptureLatencyEstimate)) {
            return false;
        }
        ImageCaptureLatencyEstimate that = (ImageCaptureLatencyEstimate) o;
        return this.mCaptureLatencyMillis == that.getCaptureLatencyMillis() && this.mProcessingLatencyMillis == that.getProcessingLatencyMillis() && this.mTotalCaptureLatencyMillis == that.getTotalCaptureLatencyMillis();
    }

    public int hashCode() {
        return Objects.hash(Long.valueOf(this.mCaptureLatencyMillis), Long.valueOf(this.mProcessingLatencyMillis), Long.valueOf(this.mTotalCaptureLatencyMillis));
    }

    public String toString() {
        return "captureLatencyMillis=" + this.mCaptureLatencyMillis + ", processingLatencyMillis=" + this.mProcessingLatencyMillis + ", totalCaptureLatencyMillis=" + this.mTotalCaptureLatencyMillis;
    }

    private long computeTotalCaptureLatencyMillis(long captureLatencyMillis, long processingLatencyMillis) {
        if (captureLatencyMillis == -1 || processingLatencyMillis == -1) {
            return -1L;
        }
        return captureLatencyMillis + processingLatencyMillis;
    }
}
