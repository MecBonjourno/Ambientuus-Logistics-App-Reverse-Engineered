package com.google.android.material.color.utilities;

import j$.util.function.Function$CC;
import java.util.function.Function;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes16.dex */
public final /* synthetic */ class MaterialDynamicColors$$ExternalSyntheticLambda162 implements Function {
    public final /* synthetic */ MaterialDynamicColors f$0;

    public /* synthetic */ MaterialDynamicColors$$ExternalSyntheticLambda162(MaterialDynamicColors materialDynamicColors) {
        this.f$0 = materialDynamicColors;
    }

    @Override // java.util.function.Function
    public /* synthetic */ Function andThen(Function function) {
        return Function$CC.$default$andThen(this, function);
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        return this.f$0.highestSurface((DynamicScheme) obj);
    }

    @Override // java.util.function.Function
    public /* synthetic */ Function compose(Function function) {
        return Function$CC.$default$compose(this, function);
    }
}
