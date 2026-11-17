package com.coleta.ambientuus.activities.bombona;

import com.coleta.ambientuus.dto.ClienteMTR;
import j$.util.function.Function$CC;
import java.util.function.Function;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes14.dex */
public final /* synthetic */ class LerBombonaActivity$$ExternalSyntheticLambda1 implements Function {
    @Override // java.util.function.Function
    public /* synthetic */ Function andThen(Function function) {
        return Function$CC.$default$andThen(this, function);
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        return ((ClienteMTR) obj).getRazao_social();
    }

    @Override // java.util.function.Function
    public /* synthetic */ Function compose(Function function) {
        return Function$CC.$default$compose(this, function);
    }
}
