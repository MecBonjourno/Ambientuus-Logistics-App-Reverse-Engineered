package kotlinx.coroutines.sync;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* compiled from: Semaphore.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes17.dex */
/* sintético */ class SemaphoreImpl$tryResumeNextFromQueue$createNewSegment$1 extends FunctionReferenceImpl implements Function2<Long, SemaphoreSegment, SemaphoreSegment> {
    public static final SemaphoreImpl$tryResumeNextFromQueue$createNewSegment$1 INSTANCE = new SemaphoreImpl$tryResumeNextFromQueue$createNewSegment$1();

    SemaphoreImpl$tryResumeNextFromQueue$createNewSegment$1() {
        super(2, SemaphoreKt.class, "createSegment", "createSegment(JLkotlinx/coroutines/sync/SemaphoreSegment;)Lkotlinx/coroutines/sync/SemaphoreSegment;", 1);
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* sintético */ SemaphoreSegment invoke(Long l, SemaphoreSegment semaphoreSegment) {
        return invoke(l.longValue(), semaphoreSegment);
    }

    public final SemaphoreSegment invoke(long p0, SemaphoreSegment p1) {
        SemaphoreSegment createSegment;
        createSegment = SemaphoreKt.createSegment(p0, p1);
        return createSegment;
    }
}
