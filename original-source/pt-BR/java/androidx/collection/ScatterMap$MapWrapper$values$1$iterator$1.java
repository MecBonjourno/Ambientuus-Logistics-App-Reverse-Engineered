package androidx.collection;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;

/* JADX INFO: adicionar declarações de tipo genérico ausentes: [V] */
/* compiled from: ScatterMap.kt */
@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002\"\u0004\b\u0001\u0010\u0003*\b\u0012\u0004\u0012\u0002H\u00030\u0004H\u008a@"}, d2 = {"<anonymous>", "", "K", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "Lkotlin/sequences/SequenceScope;"}, k = 3, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
@DebugMetadata(c = "androidx.collection.ScatterMap$MapWrapper$values$1$iterator$1", f = "ScatterMap.kt", i = {0, 0, 0, 0, 0, 0, 0, 0}, l = {744}, m = "invokeSuspend", n = {"$this$iterator", "v$iv", "m$iv$iv", "lastIndex$iv$iv", "i$iv$iv", "slot$iv$iv", "bitCount$iv$iv", "j$iv$iv"}, s = {"L$0", "L$1", "L$2", "I$0", "I$1", "J$0", "I$2", "I$3"})
/* carregado de: classes.dex */
final class ScatterMap$MapWrapper$values$1$iterator$1<V> extends RestrictedSuspendLambda implements Function2<SequenceScope<? super V>, Continuation<? super Unit>, Object> {
    int I$0;
    int I$1;
    int I$2;
    int I$3;
    long J$0;
    private /* sintético */ Object L$0;
    Object L$1;
    Object L$2;
    int label;
    final /* sintético */ ScatterMap<K, V> this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    ScatterMap$MapWrapper$values$1$iterator$1(ScatterMap<K, V> scatterMap, Continuation<? super ScatterMap$MapWrapper$values$1$iterator$1> continuation) {
        super(2, continuation);
        this.this$0 = scatterMap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        ScatterMap$MapWrapper$values$1$iterator$1 scatterMap$MapWrapper$values$1$iterator$1 = new ScatterMap$MapWrapper$values$1$iterator$1(this.this$0, continuation);
        scatterMap$MapWrapper$values$1$iterator$1.L$0 = obj;
        return scatterMap$MapWrapper$values$1$iterator$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(SequenceScope<? super V> sequenceScope, Continuation<? super Unit> continuation) {
        return ((ScatterMap$MapWrapper$values$1$iterator$1) create(sequenceScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x0058, code lost:
    
        if (0 <= r8) goto L9;
     */
    /* JADX WARN: região duplicada removida para o bloco: B:19:0x00ce  */
    /* JADX WARN: região duplicada removida para o bloco: B:23:0x00ea  */
    /* JADX WARN: região duplicada removida para o bloco: B:9:0x0087  */
    /* JADX WARN: padrão de laço com múltiplas entradas não suportado (BACK_EDGE: B:16:0x00bc -> B:7:0x00c6). Please report as a decompilation issue!!! */
    /* JADX WARN: padrão de laço com múltiplas entradas não suportado (BACK_EDGE: B:17:0x00c4 -> B:7:0x00c6). Please report as a decompilation issue!!! */
    /* JADX WARN: padrão de laço com múltiplas entradas não suportado (BACK_EDGE: B:26:0x006f -> B:8:0x0085). Please report as a decompilation issue!!! */
    /* JADX WARN: padrão de laço com múltiplas entradas não suportado (BACK_EDGE: B:27:0x00e4 -> B:22:0x00e8). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r22) {
        /*
            Method dump skipped, instructions count: 256
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.collection.ScatterMap$MapWrapper$values$1$iterator$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
