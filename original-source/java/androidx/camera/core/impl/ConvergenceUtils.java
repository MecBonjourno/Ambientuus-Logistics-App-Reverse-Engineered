package androidx.camera.core.impl;

import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureMetaData;
import j$.util.DesugarCollections;
import java.util.Collection;
import java.util.EnumSet;
import java.util.Set;

/* loaded from: classes.dex */
public class ConvergenceUtils {
    private static final Set<CameraCaptureMetaData.AeState> AE_TORCH_AS_FLASH_CONVERGED_STATE_SET;
    private static final String TAG = "ConvergenceUtils";
    private static final Set<CameraCaptureMetaData.AfState> AF_CONVERGED_STATE_SET = DesugarCollections.unmodifiableSet(EnumSet.of(CameraCaptureMetaData.AfState.PASSIVE_FOCUSED, CameraCaptureMetaData.AfState.PASSIVE_NOT_FOCUSED, CameraCaptureMetaData.AfState.LOCKED_FOCUSED, CameraCaptureMetaData.AfState.LOCKED_NOT_FOCUSED));
    private static final Set<CameraCaptureMetaData.AwbState> AWB_CONVERGED_STATE_SET = DesugarCollections.unmodifiableSet(EnumSet.of(CameraCaptureMetaData.AwbState.CONVERGED, CameraCaptureMetaData.AwbState.UNKNOWN));
    private static final Set<CameraCaptureMetaData.AeState> AE_CONVERGED_STATE_SET = DesugarCollections.unmodifiableSet(EnumSet.of(CameraCaptureMetaData.AeState.CONVERGED, CameraCaptureMetaData.AeState.FLASH_REQUIRED, CameraCaptureMetaData.AeState.UNKNOWN));

    static {
        EnumSet<CameraCaptureMetaData.AeState> aeStateSet = EnumSet.copyOf((Collection) AE_CONVERGED_STATE_SET);
        aeStateSet.remove(CameraCaptureMetaData.AeState.FLASH_REQUIRED);
        aeStateSet.remove(CameraCaptureMetaData.AeState.UNKNOWN);
        AE_TORCH_AS_FLASH_CONVERGED_STATE_SET = DesugarCollections.unmodifiableSet(aeStateSet);
    }

    private ConvergenceUtils() {
    }

    public static boolean is3AConverged(CameraCaptureResult captureResult, boolean isTorchAsFlash) {
        boolean isAeReady;
        boolean isAfReady = captureResult.getAfMode() == CameraCaptureMetaData.AfMode.OFF || AF_CONVERGED_STATE_SET.contains(captureResult.getAfState());
        boolean isAeModeOff = captureResult.getAeMode() == CameraCaptureMetaData.AeMode.OFF;
        if (isTorchAsFlash) {
            isAeReady = isAeModeOff || AE_TORCH_AS_FLASH_CONVERGED_STATE_SET.contains(captureResult.getAeState());
        } else {
            isAeReady = isAeModeOff || AE_CONVERGED_STATE_SET.contains(captureResult.getAeState());
        }
        boolean isAwbModeOff = captureResult.getAwbMode() == CameraCaptureMetaData.AwbMode.OFF;
        boolean isAwbReady = isAwbModeOff || AWB_CONVERGED_STATE_SET.contains(captureResult.getAwbState());
        Logger.d(TAG, "checkCaptureResult, AE=" + captureResult.getAeState() + " AF =" + captureResult.getAfState() + " AWB=" + captureResult.getAwbState());
        return isAfReady && isAeReady && isAwbReady;
    }
}
