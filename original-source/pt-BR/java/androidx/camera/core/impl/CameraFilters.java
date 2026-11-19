package androidx.camera.core.impl;

import androidx.camera.core.CameraFilter;
import java.util.Collections;
import java.util.List;

/* carregado de: classes.dex */
public class CameraFilters {
    public static final CameraFilter ANY = new CameraFilter() { // da classe: androidx.camera.core.impl.CameraFilters$$ExternalSyntheticLambda0
        @Override // androidx.camera.core.CameraFilter
        public final List filter(List list) {
            return CameraFilters.lambda$static$0(list);
        }

        @Override // androidx.camera.core.CameraFilter
        public /* sintético */ Identifier getIdentifier() {
            Identifier identifier;
            identifier = CameraFilter.DEFAULT_ID;
            return identifier;
        }
    };
    public static final CameraFilter NONE = new CameraFilter() { // da classe: androidx.camera.core.impl.CameraFilters$$ExternalSyntheticLambda1
        @Override // androidx.camera.core.CameraFilter
        public final List filter(List list) {
            List emptyList;
            emptyList = Collections.emptyList();
            return emptyList;
        }

        @Override // androidx.camera.core.CameraFilter
        public /* sintético */ Identifier getIdentifier() {
            Identifier identifier;
            identifier = CameraFilter.DEFAULT_ID;
            return identifier;
        }
    };

    static /* sintético */ List lambda$static$0(List cameraInfos) {
        return cameraInfos;
    }

    private CameraFilters() {
    }
}
