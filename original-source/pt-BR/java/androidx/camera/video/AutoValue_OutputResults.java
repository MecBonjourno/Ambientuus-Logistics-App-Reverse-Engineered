package androidx.camera.video;

import android.net.Uri;

/* carregado de: classes.dex */
final class AutoValue_OutputResults extends OutputResults {
    private final Uri outputUri;

    AutoValue_OutputResults(Uri outputUri) {
        if (outputUri == null) {
            throw new NullPointerException("Null outputUri");
        }
        this.outputUri = outputUri;
    }

    @Override // androidx.camera.video.OutputResults
    public Uri getOutputUri() {
        return this.outputUri;
    }

    public String toString() {
        return "OutputResults{outputUri=" + this.outputUri + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof OutputResults) {
            OutputResults that = (OutputResults) o;
            return this.outputUri.equals(that.getOutputUri());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return h$ ^ this.outputUri.hashCode();
    }
}
