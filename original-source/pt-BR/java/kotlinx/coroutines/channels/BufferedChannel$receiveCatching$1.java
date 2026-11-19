package kotlinx.coroutines.channels;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* compiled from: BufferedChannel.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@DebugMetadata(c = "kotlinx.coroutines.channels.BufferedChannel", f = "BufferedChannel.kt", i = {}, l = {762}, m = "receiveCatching-JP2dKIU$suspendImpl", n = {}, s = {})
/* carregado de: classes17.dex */
final class BufferedChannel$receiveCatching$1<E> extends ContinuationImpl {
    int label;
    /* sintético */ Object result;
    final /* sintético */ BufferedChannel<E> this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    BufferedChannel$receiveCatching$1(BufferedChannel<E> bufferedChannel, Continuation<? super BufferedChannel$receiveCatching$1> continuation) {
        super(continuation);
        this.this$0 = bufferedChannel;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        Object m2385receiveCatchingJP2dKIU$suspendImpl = BufferedChannel.m2385receiveCatchingJP2dKIU$suspendImpl(this.this$0, this);
        return m2385receiveCatchingJP2dKIU$suspendImpl == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? m2385receiveCatchingJP2dKIU$suspendImpl : ChannelResult.m2394boximpl(m2385receiveCatchingJP2dKIU$suspendImpl);
    }
}
