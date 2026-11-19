package kotlinx.coroutines.channels;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlinx.coroutines.selects.SelectInstance;

/* compiled from: BufferedChannel.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes17.dex */
/* sintético */ class BufferedChannel$onReceiveOrNull$1 extends FunctionReferenceImpl implements Function3<BufferedChannel<?>, SelectInstance<?>, Object, Unit> {
    public static final BufferedChannel$onReceiveOrNull$1 INSTANCE = new BufferedChannel$onReceiveOrNull$1();

    BufferedChannel$onReceiveOrNull$1() {
        super(3, BufferedChannel.class, "registerSelectForReceive", "registerSelectForReceive(Lkotlinx/coroutines/selects/SelectInstance;Ljava/lang/Object;)V", 0);
    }

    @Override // kotlin.jvm.functions.Function3
    public /* bridge */ /* sintético */ Unit invoke(BufferedChannel<?> bufferedChannel, SelectInstance<?> selectInstance, Object p3) {
        invoke2(bufferedChannel, selectInstance, p3);
        return Unit.INSTANCE;
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2(BufferedChannel<?> bufferedChannel, SelectInstance<?> selectInstance, Object p2) {
        bufferedChannel.registerSelectForReceive(selectInstance, p2);
    }
}
