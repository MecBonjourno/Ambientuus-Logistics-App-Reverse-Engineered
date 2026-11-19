package com.coleta.ambientuus.activities.bombona;

import com.coleta.ambientuus.dto.ClienteMTR;
import j$.util.function.Function$CC;
import java.util.function.Function;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes14.dex */
public final /* sintético */ class LerBombonaActivity$$ExternalSyntheticLambda1 implements Function {
    @Override // java.util.function.Function
    public /* sintético */ Function andThen(Function function) {
        return Function$CC.$default$andThen(this, function);
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        return ((ClienteMTR) obj).getRazao_social();
    }

    @Override // java.util.function.Function
    public /* sintético */ Function compose(Function function) {
        return Function$CC.$default$compose(this, function);
    }
}
