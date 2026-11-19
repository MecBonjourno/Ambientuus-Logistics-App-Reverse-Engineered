package kotlinx.coroutines.sync;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlinx.coroutines.selects.SelectInstance;

/* compiled from: Mutex.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes17.dex */
/* sintético */ class MutexImpl$onLock$1 extends FunctionReferenceImpl implements Function3<MutexImpl, SelectInstance<?>, Object, Unit> {
    public static final MutexImpl$onLock$1 INSTANCE = new MutexImpl$onLock$1();

    MutexImpl$onLock$1() {
        super(3, MutexImpl.class, "onLockRegFunction", "onLockRegFunction(Lkotlinx/coroutines/selects/SelectInstance;Ljava/lang/Object;)V", 0);
    }

    @Override // kotlin.jvm.functions.Function3
    public /* bridge */ /* sintético */ Unit invoke(MutexImpl mutexImpl, SelectInstance<?> selectInstance, Object p3) {
        invoke2(mutexImpl, selectInstance, p3);
        return Unit.INSTANCE;
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2(MutexImpl p0, SelectInstance<?> selectInstance, Object p2) {
        p0.onLockRegFunction(selectInstance, p2);
    }
}
