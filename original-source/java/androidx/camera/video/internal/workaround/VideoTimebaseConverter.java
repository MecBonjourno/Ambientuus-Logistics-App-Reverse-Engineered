package androidx.camera.video.internal.workaround;

import android.os.Build;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Timebase;
import androidx.camera.video.internal.compat.quirk.CameraUseInconsistentTimebaseQuirk;
import androidx.camera.video.internal.encoder.TimeProvider;

/* loaded from: classes.dex */
public class VideoTimebaseConverter {
    private static final String TAG = "VideoTimebaseConverter";
    private static final long UPTIME_REALTIME_DIFF_THRESHOLD_US = 3000000;
    private final CameraUseInconsistentTimebaseQuirk mCameraUseInconsistentTimebaseQuirk;
    private final Timebase mInputTimebase;
    private Timebase mResolvedInputTimebase;
    private final TimeProvider mTimeProvider;
    private long mUptimeToRealtimeOffsetUs = -1;

    public VideoTimebaseConverter(TimeProvider timeProvider, Timebase inputTimebase, CameraUseInconsistentTimebaseQuirk cameraUseInconsistentTimebaseQuirk) {
        this.mTimeProvider = timeProvider;
        this.mInputTimebase = inputTimebase;
        this.mCameraUseInconsistentTimebaseQuirk = cameraUseInconsistentTimebaseQuirk;
    }

    public long convertToUptimeUs(long timestampUs) {
        if (this.mResolvedInputTimebase == null) {
            this.mResolvedInputTimebase = resolveInputTimebase(timestampUs);
        }
        switch (this.mResolvedInputTimebase) {
            case REALTIME:
                if (this.mUptimeToRealtimeOffsetUs == -1) {
                    this.mUptimeToRealtimeOffsetUs = calculateUptimeToRealtimeOffsetUs();
                    Logger.d(TAG, "mUptimeToRealtimeOffsetUs = " + this.mUptimeToRealtimeOffsetUs);
                }
                return timestampUs - this.mUptimeToRealtimeOffsetUs;
            case UPTIME:
                return timestampUs;
            default:
                throw new AssertionError("Unknown timebase: " + this.mResolvedInputTimebase);
        }
    }

    private Timebase resolveInputTimebase(long timestampUs) {
        boolean isSystemTimeDiverged = false;
        if (this.mCameraUseInconsistentTimebaseQuirk != null) {
            Logger.w(TAG, "CameraUseInconsistentTimebaseQuirk is enabled");
        } else if (exceedUptimeRealtimeDiffThreshold()) {
            isSystemTimeDiverged = true;
        } else {
            return this.mInputTimebase;
        }
        Timebase resolvedTimebase = isCloseToRealtime(timestampUs) ? Timebase.REALTIME : Timebase.UPTIME;
        if (isSystemTimeDiverged && resolvedTimebase != this.mInputTimebase) {
            String socModelInfo = "";
            if (Build.VERSION.SDK_INT >= 31) {
                socModelInfo = ", SOC: " + Build.SOC_MODEL;
            }
            Logger.e(TAG, String.format("Detected camera timebase inconsistent. Please file an issue at https://issuetracker.google.com/issues/new?component=618491&template=1257717 with this error message [Manufacturer: %s, Model: %s, Hardware: %s, API Level: %d%s].\nCamera timebase is inconsistent. The timebase reported by the camera is %s, but the actual timebase contained in the frame is detected as %s.", Build.MANUFACTURER, Build.MODEL, Build.HARDWARE, Integer.valueOf(Build.VERSION.SDK_INT), socModelInfo, this.mInputTimebase, resolvedTimebase));
        } else {
            Logger.d(TAG, "Detect input timebase = " + resolvedTimebase);
        }
        return resolvedTimebase;
    }

    private boolean exceedUptimeRealtimeDiffThreshold() {
        long uptimeUs = this.mTimeProvider.uptimeUs();
        long realTimeUs = this.mTimeProvider.realtimeUs();
        return realTimeUs - uptimeUs > UPTIME_REALTIME_DIFF_THRESHOLD_US;
    }

    private boolean isCloseToRealtime(long timeUs) {
        long uptimeUs = this.mTimeProvider.uptimeUs();
        long realtimeUs = this.mTimeProvider.realtimeUs();
        return Math.abs(timeUs - realtimeUs) < Math.abs(timeUs - uptimeUs);
    }

    private long calculateUptimeToRealtimeOffsetUs() {
        long bestGap = Long.MAX_VALUE;
        long measured = 0;
        for (int i = 0; i < 3; i++) {
            long uptime1 = this.mTimeProvider.uptimeUs();
            long realtime = this.mTimeProvider.realtimeUs();
            long uptime2 = this.mTimeProvider.uptimeUs();
            long gap = uptime2 - uptime1;
            if (i == 0 || gap < bestGap) {
                bestGap = gap;
                measured = realtime - ((uptime1 + uptime2) >> 1);
            }
        }
        return Math.max(0L, measured);
    }
}
