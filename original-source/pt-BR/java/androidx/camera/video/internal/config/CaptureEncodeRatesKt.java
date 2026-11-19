package androidx.camera.video.internal.config;

import android.util.Rational;
import androidx.camera.core.Logger;
import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;

/* compiled from: CaptureEncodeRates.kt */
@Metadata(d1 = {"\u0000 \n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\u001a\u001a\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00032\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0000\u001a\u001a\u0010\u0007\u001a\u00020\u00032\u0006\u0010\b\u001a\u00020\u00032\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0000\u001a\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0006H\u0002\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\f"}, d2 = {"TAG", "", "toEncodeRate", "", "captureRate", "captureToEncodeRatio", "Landroid/util/Rational;", "toCaptureRate", "encodeRate", "isInvalidCaptureToEncodeRatio", "", "ratio", "camera-video_release"}, k = 2, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class CaptureEncodeRatesKt {
    private static final String TAG = "CaptureEncodeRates";

    public static final int toEncodeRate(int captureRate, Rational captureToEncodeRatio) {
        if (captureToEncodeRatio == null) {
            return captureRate;
        }
        if (isInvalidCaptureToEncodeRatio(captureToEncodeRatio)) {
            Logger.w(TAG, "Invalid capture-to-encode ratio: " + captureToEncodeRatio);
            return captureRate;
        }
        return MathKt.roundToInt(captureRate / captureToEncodeRatio.floatValue());
    }

    public static final int toCaptureRate(int encodeRate, Rational captureToEncodeRatio) {
        if (captureToEncodeRatio == null) {
            return encodeRate;
        }
        if (isInvalidCaptureToEncodeRatio(captureToEncodeRatio)) {
            Logger.w(TAG, "Invalid capture-to-encode ratio: " + captureToEncodeRatio);
            return encodeRate;
        }
        return MathKt.roundToInt(encodeRate * captureToEncodeRatio.floatValue());
    }

    private static final boolean isInvalidCaptureToEncodeRatio(Rational ratio) {
        return Intrinsics.areEqual(ratio, Rational.NaN) || Intrinsics.areEqual(ratio, Rational.ZERO) || Intrinsics.areEqual(ratio, Rational.NEGATIVE_INFINITY) || Intrinsics.areEqual(ratio, Rational.POSITIVE_INFINITY);
    }
}
