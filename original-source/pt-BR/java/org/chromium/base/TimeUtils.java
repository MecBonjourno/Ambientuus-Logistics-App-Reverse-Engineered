package org.chromium.base;

import android.os.SystemClock;

/* carregado de: classes17.dex */
public class TimeUtils {
    public static final long MILLISECONDS_PER_MINUTE = 60000;
    public static final long NANOSECONDS_PER_MICROSECOND = 1000;
    public static final long NANOSECONDS_PER_MILLISECOND = 1000000;
    public static final long SECONDS_PER_DAY = 86400;
    public static final long SECONDS_PER_HOUR = 3600;
    public static final long SECONDS_PER_MINUTE = 60;
    static FakeClock sFakeClock;

    interface FakeClock {
        long currentThreadTimeMillis();

        long currentTimeMillis();

        long elapsedRealtimeNanos();

        long uptimeMillis();
    }

    public static class UptimeMillisTimer {
        private final long mStart = TimeUtils.uptimeMillis();

        public long getElapsedMillis() {
            return TimeUtils.uptimeMillis() - this.mStart;
        }
    }

    public static class ElapsedRealtimeMillisTimer {
        private final long mStart = TimeUtils.elapsedRealtimeMillis();

        public long getElapsedMillis() {
            return TimeUtils.elapsedRealtimeMillis() - this.mStart;
        }
    }

    public static class ElapsedRealtimeNanosTimer {
        private final long mStart = TimeUtils.elapsedRealtimeNanos();

        public long getElapsedNanos() {
            return TimeUtils.elapsedRealtimeNanos() - this.mStart;
        }
    }

    public static class CurrentThreadTimeMillisTimer {
        private final long mStart = TimeUtils.currentThreadTimeMillis();

        public long getElapsedMillis() {
            return TimeUtils.currentThreadTimeMillis() - this.mStart;
        }
    }

    private TimeUtils() {
    }

    public static long currentTimeMillis() {
        if (sFakeClock != null) {
            return sFakeClock.currentTimeMillis();
        }
        return System.currentTimeMillis();
    }

    public static long uptimeMillis() {
        if (sFakeClock != null) {
            return sFakeClock.uptimeMillis();
        }
        return SystemClock.uptimeMillis();
    }

    public static long elapsedRealtimeNanos() {
        if (sFakeClock != null) {
            return sFakeClock.elapsedRealtimeNanos();
        }
        return SystemClock.elapsedRealtimeNanos();
    }

    public static long elapsedRealtimeMillis() {
        if (sFakeClock != null) {
            return sFakeClock.elapsedRealtimeNanos() / NANOSECONDS_PER_MILLISECOND;
        }
        return SystemClock.elapsedRealtime();
    }

    public static long currentThreadTimeMillis() {
        if (sFakeClock != null) {
            return sFakeClock.currentThreadTimeMillis();
        }
        return SystemClock.currentThreadTimeMillis();
    }
}
