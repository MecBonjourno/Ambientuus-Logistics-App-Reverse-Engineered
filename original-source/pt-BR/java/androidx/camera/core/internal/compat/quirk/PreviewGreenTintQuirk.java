package androidx.camera.core.internal.compat.quirk;

import android.os.Build;
import androidx.camera.core.Preview;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.Quirk;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.Collection;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;

/* compiled from: PreviewGreenTintQuirk.kt */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0007\u001a\u00020\u0005H\u0007J\u001e\u0010\b\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\n2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\fH\u0007J\u001e\u0010\u000e\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\n2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\fH\u0002R\u0014\u0010\u0004\u001a\u00020\u00058BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0006¨\u0006\u000f"}, d2 = {"Landroidx/camera/core/internal/compat/quirk/PreviewGreenTintQuirk;", "Landroidx/camera/core/impl/Quirk;", "<init>", "()V", "isMotoE20", "", "()Z", "load", "shouldForceEnableStreamSharing", "cameraId", "", "appUseCases", "", "Landroidx/camera/core/UseCase;", "shouldForceEnableStreamSharingForMotoE20", "camera-core_release"}, k = 1, mv = {2, 0, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class PreviewGreenTintQuirk implements Quirk {
    public static final PreviewGreenTintQuirk INSTANCE = new PreviewGreenTintQuirk();

    private PreviewGreenTintQuirk() {
    }

    private final boolean isMotoE20() {
        return StringsKt.equals("motorola", Build.BRAND, true) && StringsKt.equals("moto e20", Build.MODEL, true);
    }

    @JvmStatic
    public static final boolean load() {
        return INSTANCE.isMotoE20();
    }

    @JvmStatic
    public static final boolean shouldForceEnableStreamSharing(String cameraId, Collection<? extends UseCase> appUseCases) {
        Intrinsics.checkNotNullParameter(cameraId, "cameraId");
        Intrinsics.checkNotNullParameter(appUseCases, "appUseCases");
        if (INSTANCE.isMotoE20()) {
            return INSTANCE.shouldForceEnableStreamSharingForMotoE20(cameraId, appUseCases);
        }
        return false;
    }

    private final boolean shouldForceEnableStreamSharingForMotoE20(String cameraId, Collection<? extends UseCase> appUseCases) {
        Iterable $this$any$iv;
        Iterable $this$any$iv2;
        if (!Intrinsics.areEqual(cameraId, "0") || appUseCases.size() != 2) {
            return false;
        }
        Collection<? extends UseCase> $this$any$iv3 = appUseCases;
        if (!($this$any$iv3 instanceof Collection) || !$this$any$iv3.isEmpty()) {
            Iterator it = $this$any$iv3.iterator();
            while (true) {
                if (it.hasNext()) {
                    Object element$iv = it.next();
                    if (((UseCase) element$iv) instanceof Preview) {
                        $this$any$iv = 1;
                        break;
                    }
                } else {
                    $this$any$iv = null;
                    break;
                }
            }
        } else {
            $this$any$iv = null;
        }
        Collection<? extends UseCase> $this$any$iv4 = appUseCases;
        if (!($this$any$iv4 instanceof Collection) || !$this$any$iv4.isEmpty()) {
            Iterator it2 = $this$any$iv4.iterator();
            while (true) {
                if (it2.hasNext()) {
                    Object element$iv2 = it2.next();
                    UseCase it3 = (UseCase) element$iv2;
                    if (((it3.getCurrentConfig().containsOption(UseCaseConfig.OPTION_CAPTURE_TYPE) && it3.getCurrentConfig().getCaptureType() == UseCaseConfigFactory.CaptureType.VIDEO_CAPTURE) ? 1 : null) != null) {
                        $this$any$iv2 = 1;
                        break;
                    }
                } else {
                    $this$any$iv2 = null;
                    break;
                }
            }
        } else {
            $this$any$iv2 = null;
        }
        return ($this$any$iv == null || $this$any$iv2 == null) ? false : true;
    }
}
