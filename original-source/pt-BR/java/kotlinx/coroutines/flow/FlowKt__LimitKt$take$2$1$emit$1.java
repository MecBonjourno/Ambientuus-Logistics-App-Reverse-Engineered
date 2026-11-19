package kotlinx.coroutines.flow;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* compiled from: Limit.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@DebugMetadata(c = "kotlinx.coroutines.flow.FlowKt__LimitKt$take$2$1", f = "Limit.kt", i = {}, l = {58, 60}, m = "emit", n = {}, s = {})
/* carregado de: classes17.dex */
final class FlowKt__LimitKt$take$2$1$emit$1 extends ContinuationImpl {
    int label;
    /* sintético */ Object result;
    final /* sintético */ FlowKt__LimitKt$take$2$1<T> this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    FlowKt__LimitKt$take$2$1$emit$1(FlowKt__LimitKt$take$2$1<? super T> flowKt__LimitKt$take$2$1, Continuation<? super FlowKt__LimitKt$take$2$1$emit$1> continuation) {
        super(continuation);
        this.this$0 = flowKt__LimitKt$take$2$1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.emit(null, this);
    }
}
