package j$.time.format;

/* loaded from: classes15.dex */
public enum SignStyle {
    NORMAL,
    ALWAYS,
    NEVER,
    NOT_NEGATIVE,
    EXCEEDS_PAD;

    boolean parse(boolean positive, boolean strict, boolean fixedWidth) {
        switch (this) {
            case NORMAL:
                return (positive && strict) ? false : true;
            case ALWAYS:
            case EXCEEDS_PAD:
                return true;
            case NEVER:
            case NOT_NEGATIVE:
            default:
                return (strict || fixedWidth) ? false : true;
        }
    }
}
