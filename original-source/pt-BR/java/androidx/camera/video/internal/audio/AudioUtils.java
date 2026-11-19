package androidx.camera.video.internal.audio;

import android.media.AudioTimestamp;
import androidx.core.util.Preconditions;
import java.util.concurrent.TimeUnit;

/* carregado de: classes.dex */
public final class AudioUtils {
    private AudioUtils() {
    }

    public static int channelCountToChannelConfig(int channelCount) {
        return channelCount == 1 ? 16 : 12;
    }

    public static int channelCountToChannelMask(int channelCount) {
        return channelCount == 1 ? 16 : 12;
    }

    public static int getBytesPerFrame(int audioEncoding, int channelCount) {
        Preconditions.checkArgument(channelCount > 0, "Invalid channel count: " + channelCount);
        switch (audioEncoding) {
            case 2:
                return channelCount * 2;
            case 3:
                return channelCount;
            case 4:
            case 22:
                return channelCount * 4;
            case 21:
                return channelCount * 3;
            default:
                throw new IllegalArgumentException("Invalid audio encoding: " + audioEncoding);
        }
    }

    public static long sizeToFrameCount(long sizeInBytes, int bytesPerFrame) {
        Preconditions.checkArgument(((long) bytesPerFrame) > 0, "bytesPerFrame must be greater than 0.");
        return sizeInBytes / bytesPerFrame;
    }

    public static long frameCountToSize(long frameCount, int bytesPerFrame) {
        Preconditions.checkArgument(((long) bytesPerFrame) > 0, "bytesPerFrame must be greater than 0.");
        return bytesPerFrame * frameCount;
    }

    public static long frameCountToDurationNs(long frameCount, int sampleRate) {
        Preconditions.checkArgument(((long) sampleRate) > 0, "sampleRate must be greater than 0.");
        return (TimeUnit.SECONDS.toNanos(1L) * frameCount) / sampleRate;
    }

    public static long computeInterpolatedTimeNs(int sampleRate, long framePosition, AudioTimestamp timestamp) {
        Preconditions.checkArgument(((long) sampleRate) > 0, "sampleRate must be greater than 0.");
        Preconditions.checkArgument(framePosition >= 0, "framePosition must be no less than 0.");
        long frameDiff = framePosition - timestamp.framePosition;
        long compensateTimeInNanoSec = frameCountToDurationNs(frameDiff, sampleRate);
        long resultInNanoSec = timestamp.nanoTime + compensateTimeInNanoSec;
        if (resultInNanoSec < 0) {
            return 0L;
        }
        return resultInNanoSec;
    }
}
