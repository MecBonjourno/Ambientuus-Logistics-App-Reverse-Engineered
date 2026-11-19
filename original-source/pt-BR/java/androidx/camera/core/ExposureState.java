package androidx.camera.core;

import android.util.Range;
import android.util.Rational;

/* carregado de: classes.dex */
public interface ExposureState {
    int getExposureCompensationIndex();

    Range<Integer> getExposureCompensationRange();

    Rational getExposureCompensationStep();

    boolean isExposureCompensationSupported();
}
