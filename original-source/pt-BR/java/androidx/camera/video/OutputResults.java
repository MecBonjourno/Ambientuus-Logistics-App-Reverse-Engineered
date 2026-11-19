package androidx.camera.video;

import android.net.Uri;
import androidx.core.util.Preconditions;

/* carregado de: classes.dex */
public abstract class OutputResults {
    public abstract Uri getOutputUri();

    static OutputResults of(Uri outputUri) {
        Preconditions.checkNotNull(outputUri, "OutputUri cannot be null.");
        return new AutoValue_OutputResults(outputUri);
    }
}
