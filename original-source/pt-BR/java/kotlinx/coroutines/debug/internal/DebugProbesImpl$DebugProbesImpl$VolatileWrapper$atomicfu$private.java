package kotlinx.coroutines.debug.internal;

import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;

/* JADX INFO: modificadores de acesso alterados de: private */
/* compiled from: DebugProbesImpl.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes17.dex */
public /* sintético */ class DebugProbesImpl$DebugProbesImpl$VolatileWrapper$atomicfu$private {
    private static final /* sintético */ AtomicIntegerFieldUpdater installations$volatile$FU = AtomicIntegerFieldUpdater.newUpdater(DebugProbesImpl$DebugProbesImpl$VolatileWrapper$atomicfu$private.class, "installations$volatile");
    private static final /* sintético */ AtomicLongFieldUpdater sequenceNumber$volatile$FU = AtomicLongFieldUpdater.newUpdater(DebugProbesImpl$DebugProbesImpl$VolatileWrapper$atomicfu$private.class, "sequenceNumber$volatile");
    private volatile /* sintético */ int installations$volatile;
    private volatile /* sintético */ long sequenceNumber$volatile;

    private DebugProbesImpl$DebugProbesImpl$VolatileWrapper$atomicfu$private() {
    }

    public /* sintético */ DebugProbesImpl$DebugProbesImpl$VolatileWrapper$atomicfu$private(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private final /* sintético */ int getInstallations$volatile() {
        return this.installations$volatile;
    }

    private final /* sintético */ long getSequenceNumber$volatile() {
        return this.sequenceNumber$volatile;
    }

    private final /* sintético */ void setInstallations$volatile(int i) {
        this.installations$volatile = i;
    }

    private final /* sintético */ void setSequenceNumber$volatile(long j) {
        this.sequenceNumber$volatile = j;
    }
}
