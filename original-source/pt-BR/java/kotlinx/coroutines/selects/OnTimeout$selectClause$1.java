package kotlinx.coroutines.selects;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* compiled from: OnTimeout.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes17.dex */
/* sintético */ class OnTimeout$selectClause$1 extends FunctionReferenceImpl implements Function3<OnTimeout, SelectInstance<?>, Object, Unit> {
    public static final OnTimeout$selectClause$1 INSTANCE = new OnTimeout$selectClause$1();

    OnTimeout$selectClause$1() {
        super(3, OnTimeout.class, "register", "register(Lkotlinx/coroutines/selects/SelectInstance;Ljava/lang/Object;)V", 0);
    }

    @Override // kotlin.jvm.functions.Function3
    public /* bridge */ /* sintético */ Unit invoke(OnTimeout onTimeout, SelectInstance<?> selectInstance, Object p3) {
        invoke2(onTimeout, selectInstance, p3);
        return Unit.INSTANCE;
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2(OnTimeout p0, SelectInstance<?> selectInstance, Object p2) {
        p0.register(selectInstance, p2);
    }
}
