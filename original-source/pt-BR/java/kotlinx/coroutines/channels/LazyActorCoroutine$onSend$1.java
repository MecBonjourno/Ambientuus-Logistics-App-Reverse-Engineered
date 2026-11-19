package kotlinx.coroutines.channels;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlinx.coroutines.selects.SelectInstance;

/* compiled from: Actor.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes17.dex */
/* sintético */ class LazyActorCoroutine$onSend$1 extends FunctionReferenceImpl implements Function3<LazyActorCoroutine<?>, SelectInstance<?>, Object, Unit> {
    public static final LazyActorCoroutine$onSend$1 INSTANCE = new LazyActorCoroutine$onSend$1();

    LazyActorCoroutine$onSend$1() {
        super(3, LazyActorCoroutine.class, "onSendRegFunction", "onSendRegFunction(Lkotlinx/coroutines/selects/SelectInstance;Ljava/lang/Object;)V", 0);
    }

    @Override // kotlin.jvm.functions.Function3
    public /* bridge */ /* sintético */ Unit invoke(LazyActorCoroutine<?> lazyActorCoroutine, SelectInstance<?> selectInstance, Object p3) {
        invoke2(lazyActorCoroutine, selectInstance, p3);
        return Unit.INSTANCE;
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2(LazyActorCoroutine<?> lazyActorCoroutine, SelectInstance<?> selectInstance, Object p2) {
        lazyActorCoroutine.onSendRegFunction(selectInstance, p2);
    }
}
