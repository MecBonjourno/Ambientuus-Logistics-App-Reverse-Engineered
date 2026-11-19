package kotlin.collections;

import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.comparisons.ComparisonsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* JADX INFO: adicionar declarações de tipo genérico ausentes: [T] */
/* JADX WARN: assinatura de campo incorreta: TK; */
/* compiled from: Collections.kt */
@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000f\n\u0002\b\u0003\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002\"\u000e\b\u0001\u0010\u0003*\b\u0012\u0004\u0012\u0002H\u00030\u00042\u0006\u0010\u0005\u001a\u0002H\u0002H\n¢\u0006\u0004\b\u0006\u0010\u0007"}, d2 = {"<anonymous>", "", ExifInterface.GPS_DIRECTION_TRUE, "K", "", "it", "invoke", "(Ljava/lang/Object;)Ljava/lang/Integer;"}, k = 3, mv = {1, 9, 0}, xi = 176)
/* carregado de: classes.dex */
public final class CollectionsKt__CollectionsKt$binarySearchBy$1<T> extends Lambda implements Function1<T, Integer> {
    final /* sintético */ Comparable $key;
    final /* sintético */ Function1<T, K> $selector;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    /* JADX WARN: tipos incorretos na assinatura do método: (Lkotlin/jvm/functions/Function1<-TT;+TK;>;TK;)V */
    public CollectionsKt__CollectionsKt$binarySearchBy$1(Function1 function1, Comparable comparable) {
        super(1);
        this.$selector = function1;
        this.$key = comparable;
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // kotlin.jvm.functions.Function1
    public final Integer invoke(T t) {
        return Integer.valueOf(ComparisonsKt.compareValues((Comparable) this.$selector.invoke(t), this.$key));
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // kotlin.jvm.functions.Function1
    public /* bridge */ /* sintético */ Integer invoke(Object obj) {
        return invoke((CollectionsKt__CollectionsKt$binarySearchBy$1<T>) obj);
    }
}
