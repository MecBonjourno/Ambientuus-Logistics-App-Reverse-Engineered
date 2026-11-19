package androidx.camera.camera2.internal.compat.workaround;

import androidx.camera.camera2.internal.compat.quirk.TorchFlashRequiredFor3aUpdateQuirk;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.Quirks;

/* carregado de: classes.dex */
public class UseFlashModeTorchFor3aUpdate {
    private static final String TAG = "UseFlashModeTorchFor3aUpdate";
    private final TorchFlashRequiredFor3aUpdateQuirk mTorchFlashRequiredFor3AUpdateQuirk;

    public UseFlashModeTorchFor3aUpdate(Quirks quirks) {
        this.mTorchFlashRequiredFor3AUpdateQuirk = (TorchFlashRequiredFor3aUpdateQuirk) quirks.get(TorchFlashRequiredFor3aUpdateQuirk.class);
    }

    public boolean shouldUseFlashModeTorch() {
        boolean shouldUse = this.mTorchFlashRequiredFor3AUpdateQuirk != null && this.mTorchFlashRequiredFor3AUpdateQuirk.isFlashModeTorchRequired();
        Logger.d(TAG, "shouldUseFlashModeTorch: " + shouldUse);
        return shouldUse;
    }
}
