package androidx.camera.video.internal.encoder;

import android.util.Range;

/* carregado de: classes.dex */
public interface VideoEncoderInfo extends EncoderInfo {

    public interface Finder {
        VideoEncoderInfo find(String str);
    }

    boolean canSwapWidthHeight();

    int getHeightAlignment();

    Range<Integer> getSupportedBitrateRange();

    Range<Integer> getSupportedHeights();

    Range<Integer> getSupportedHeightsFor(int i);

    Range<Integer> getSupportedWidths();

    Range<Integer> getSupportedWidthsFor(int i);

    int getWidthAlignment();

    boolean isSizeSupported(int i, int i2);

    boolean isSizeSupportedAllowSwapping(int i, int i2);

    /* renomeado de: androidx.camera.video.internal.encoder.VideoEncoderInfo$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static boolean $default$isSizeSupportedAllowSwapping(VideoEncoderInfo _this, int width, int height) {
            return _this.isSizeSupported(width, height) || (_this.canSwapWidthHeight() && _this.isSizeSupported(height, width));
        }
    }
}
