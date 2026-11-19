package androidx.camera.core.impl;

import java.util.Iterator;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes.dex */
public final /* sintético */ class Quirks$$ExternalSyntheticBackport0 {
    public static /* sintético */ String m(CharSequence charSequence, Iterable iterable) {
        if (charSequence == null) {
            throw new NullPointerException("delimiter");
        }
        StringBuilder sb = new StringBuilder();
        Iterator it = iterable.iterator();
        if (it.hasNext()) {
            while (true) {
                sb.append((CharSequence) it.next());
                if (!it.hasNext()) {
                    break;
                }
                sb.append(charSequence);
            }
        }
        return sb.toString();
    }
}
