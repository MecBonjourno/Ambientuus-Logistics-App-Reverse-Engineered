package kotlinx.coroutines.channels;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.apache.commons.lang.ClassUtils;

/* JADX INFO: adicionar declarações de tipo genérico ausentes: [E] */
/* compiled from: Deprecated.kt */
@Metadata(d1 = {"\u0000\n\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\u0010\u0000\u001a\u0002H\u0001\"\b\b\u0000\u0010\u0001*\u00020\u00022\b\u0010\u0003\u001a\u0004\u0018\u0001H\u0001H\u008a@"}, d2 = {"<anonymous>", ExifInterface.LONGITUDE_EAST, "", "it"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@DebugMetadata(c = "kotlinx.coroutines.channels.ChannelsKt__DeprecatedKt$requireNoNulls$1", f = "Deprecated.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* carregado de: classes17.dex */
final class ChannelsKt__DeprecatedKt$requireNoNulls$1<E> extends SuspendLambda implements Function2<E, Continuation<? super E>, Object> {
    final /* sintético */ ReceiveChannel<E> $this_requireNoNulls;
    /* sintético */ Object L$0;
    int label;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    ChannelsKt__DeprecatedKt$requireNoNulls$1(ReceiveChannel<? extends E> receiveChannel, Continuation<? super ChannelsKt__DeprecatedKt$requireNoNulls$1> continuation) {
        super(2, continuation);
        this.$this_requireNoNulls = receiveChannel;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        ChannelsKt__DeprecatedKt$requireNoNulls$1 channelsKt__DeprecatedKt$requireNoNulls$1 = new ChannelsKt__DeprecatedKt$requireNoNulls$1(this.$this_requireNoNulls, continuation);
        channelsKt__DeprecatedKt$requireNoNulls$1.L$0 = obj;
        return channelsKt__DeprecatedKt$requireNoNulls$1;
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* sintético */ Object invoke(Object obj, Object obj2) {
        return invoke((ChannelsKt__DeprecatedKt$requireNoNulls$1<E>) obj, (Continuation<? super ChannelsKt__DeprecatedKt$requireNoNulls$1<E>>) obj2);
    }

    public final Object invoke(E e, Continuation<? super E> continuation) {
        return ((ChannelsKt__DeprecatedKt$requireNoNulls$1) create(e, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                Object it = this.L$0;
                if (it != null) {
                    return it;
                }
                throw new IllegalArgumentException("null element found in " + this.$this_requireNoNulls + ClassUtils.PACKAGE_SEPARATOR_CHAR);
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
