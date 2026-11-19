package kotlin.sequences;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.exifinterface.media.ExifInterface;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.random.Random;

/* JADX INFO: adicionar declarações de tipo genérico ausentes: [T] */
/* compiled from: Sequences.kt */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\b\u0012\u0004\u0012\u0002H\u00020\u0003H\u008a@"}, d2 = {"<anonymous>", "", ExifInterface.GPS_DIRECTION_TRUE, "Lkotlin/sequences/SequenceScope;"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@DebugMetadata(c = "kotlin.sequences.SequencesKt__SequencesKt$shuffled$1", f = "Sequences.kt", i = {0, 0}, l = {145}, m = "invokeSuspend", n = {"$this$sequence", "buffer"}, s = {"L$0", "L$1"})
/* carregado de: classes17.dex */
final class SequencesKt__SequencesKt$shuffled$1<T> extends RestrictedSuspendLambda implements Function2<SequenceScope<? super T>, Continuation<? super Unit>, Object> {
    final /* sintético */ Random $random;
    final /* sintético */ Sequence<T> $this_shuffled;
    private /* sintético */ Object L$0;
    Object L$1;
    int label;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    SequencesKt__SequencesKt$shuffled$1(Sequence<? extends T> sequence, Random random, Continuation<? super SequencesKt__SequencesKt$shuffled$1> continuation) {
        super(2, continuation);
        this.$this_shuffled = sequence;
        this.$random = random;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        SequencesKt__SequencesKt$shuffled$1 sequencesKt__SequencesKt$shuffled$1 = new SequencesKt__SequencesKt$shuffled$1(this.$this_shuffled, this.$random, continuation);
        sequencesKt__SequencesKt$shuffled$1.L$0 = obj;
        return sequencesKt__SequencesKt$shuffled$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(SequenceScope<? super T> sequenceScope, Continuation<? super Unit> continuation) {
        return ((SequencesKt__SequencesKt$shuffled$1) create(sequenceScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        SequenceScope sequenceScope;
        List mutableList;
        SequencesKt__SequencesKt$shuffled$1<T> sequencesKt__SequencesKt$shuffled$1;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                SequenceScope sequenceScope2 = (SequenceScope) this.L$0;
                sequenceScope = sequenceScope2;
                mutableList = SequencesKt.toMutableList(this.$this_shuffled);
                sequencesKt__SequencesKt$shuffled$1 = this;
                break;
            case 1:
                mutableList = (List) this.L$1;
                SequenceScope sequenceScope3 = (SequenceScope) this.L$0;
                ResultKt.throwOnFailure(obj);
                sequencesKt__SequencesKt$shuffled$1 = this;
                sequenceScope = sequenceScope3;
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        while (!mutableList.isEmpty()) {
            int nextInt = sequencesKt__SequencesKt$shuffled$1.$random.nextInt(mutableList.size());
            Object removeLast = CollectionsKt.removeLast(mutableList);
            if (nextInt < mutableList.size()) {
                removeLast = mutableList.set(nextInt, removeLast);
            }
            sequencesKt__SequencesKt$shuffled$1.L$0 = sequenceScope;
            sequencesKt__SequencesKt$shuffled$1.L$1 = mutableList;
            sequencesKt__SequencesKt$shuffled$1.label = 1;
            if (sequenceScope.yield(removeLast, sequencesKt__SequencesKt$shuffled$1) == coroutine_suspended) {
                return coroutine_suspended;
            }
        }
        return Unit.INSTANCE;
    }
}
