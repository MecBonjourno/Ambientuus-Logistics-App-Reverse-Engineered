package androidx.camera.core;

import androidx.camera.core.impl.Identifier;
import java.util.List;

/* carregado de: classes.dex */
public interface CameraFilter {
    public static final Identifier DEFAULT_ID = Identifier.create(new Object());

    List<CameraInfo> filter(List<CameraInfo> list);

    Identifier getIdentifier();

    /* renomeado de: androidx.camera.core.CameraFilter$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
    }
}
