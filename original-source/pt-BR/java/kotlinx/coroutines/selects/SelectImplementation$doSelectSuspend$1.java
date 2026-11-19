package kotlinx.coroutines.selects;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;

/* compiled from: Select.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@DebugMetadata(c = "kotlinx.coroutines.selects.SelectImplementation", f = "Select.kt", i = {0}, l = {438, 441}, m = "doSelectSuspend", n = {"this"}, s = {"L$0"})
/* carregado de: classes17.dex */
final class SelectImplementation$doSelectSuspend$1 extends ContinuationImpl {
    Object L$0;
    int label;
    /* sintético */ Object result;
    final /* sintético */ SelectImplementation<R> this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    SelectImplementation$doSelectSuspend$1(SelectImplementation<R> selectImplementation, Continuation<? super SelectImplementation$doSelectSuspend$1> continuation) {
        super(continuation);
        this.this$0 = selectImplementation;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object doSelectSuspend;
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        doSelectSuspend = this.this$0.doSelectSuspend(this);
        return doSelectSuspend;
    }
}
