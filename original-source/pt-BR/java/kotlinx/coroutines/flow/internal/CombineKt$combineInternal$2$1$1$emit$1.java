package kotlinx.coroutines.flow.internal;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlinx.coroutines.flow.internal.CombineKt$combineInternal$2;

/* compiled from: Combine.kt */
@Metadata(k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@DebugMetadata(c = "kotlinx.coroutines.flow.internal.CombineKt$combineInternal$2$1$1", f = "Combine.kt", i = {}, l = {29, 30}, m = "emit", n = {}, s = {})
/* carregado de: classes17.dex */
final class CombineKt$combineInternal$2$1$1$emit$1 extends ContinuationImpl {
    int label;
    /* sintético */ Object result;
    final /* sintético */ CombineKt$combineInternal$2.AnonymousClass1.C00501<T> this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    CombineKt$combineInternal$2$1$1$emit$1(CombineKt$combineInternal$2.AnonymousClass1.C00501<? super T> c00501, Continuation<? super CombineKt$combineInternal$2$1$1$emit$1> continuation) {
        super(continuation);
        this.this$0 = c00501;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.emit(null, this);
    }
}
