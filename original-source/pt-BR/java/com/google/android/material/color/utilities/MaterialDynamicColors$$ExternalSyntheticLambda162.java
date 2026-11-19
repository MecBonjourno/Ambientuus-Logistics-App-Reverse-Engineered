package com.google.android.material.color.utilities;

import j$.util.function.Function$CC;
import java.util.function.Function;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes16.dex */
public final /* sintético */ class MaterialDynamicColors$$ExternalSyntheticLambda162 implements Function {
    public final /* sintético */ MaterialDynamicColors f$0;

    public /* sintético */ MaterialDynamicColors$$ExternalSyntheticLambda162(MaterialDynamicColors materialDynamicColors) {
        this.f$0 = materialDynamicColors;
    }

    @Override // java.util.function.Function
    public /* sintético */ Function andThen(Function function) {
        return Function$CC.$default$andThen(this, function);
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        return this.f$0.highestSurface((DynamicScheme) obj);
    }

    @Override // java.util.function.Function
    public /* sintético */ Function compose(Function function) {
        return Function$CC.$default$compose(this, function);
    }
}
