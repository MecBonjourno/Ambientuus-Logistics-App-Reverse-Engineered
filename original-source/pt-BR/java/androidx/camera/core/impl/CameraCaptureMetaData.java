package androidx.camera.core.impl;

/* carregado de: classes.dex */
public final class CameraCaptureMetaData {

    public enum AeMode {
        UNKNOWN,
        OFF,
        ON,
        ON_AUTO_FLASH,
        ON_ALWAYS_FLASH,
        ON_AUTO_FLASH_REDEYE,
        ON_EXTERNAL_FLASH
    }

    public enum AeState {
        UNKNOWN,
        INACTIVE,
        SEARCHING,
        FLASH_REQUIRED,
        CONVERGED,
        LOCKED
    }

    public enum AfMode {
        UNKNOWN,
        OFF,
        ON_MANUAL_AUTO,
        ON_CONTINUOUS_AUTO
    }

    public enum AfState {
        UNKNOWN,
        INACTIVE,
        SCANNING,
        PASSIVE_FOCUSED,
        PASSIVE_NOT_FOCUSED,
        LOCKED_FOCUSED,
        LOCKED_NOT_FOCUSED
    }

    public enum AwbMode {
        UNKNOWN,
        OFF,
        AUTO,
        INCANDESCENT,
        FLUORESCENT,
        WARM_FLUORESCENT,
        DAYLIGHT,
        CLOUDY_DAYLIGHT,
        TWILIGHT,
        SHADE
    }

    public enum AwbState {
        UNKNOWN,
        INACTIVE,
        METERING,
        CONVERGED,
        LOCKED
    }

    private CameraCaptureMetaData() {
    }

    public enum FlashState {
        UNKNOWN,
        NONE,
        READY,
        FIRED;

        public int toFlashState() {
            switch (ordinal()) {
                case 1:
                    return 2;
                case 2:
                    return 3;
                case 3:
                    return 1;
                default:
                    return 0;
            }
        }
    }
}
