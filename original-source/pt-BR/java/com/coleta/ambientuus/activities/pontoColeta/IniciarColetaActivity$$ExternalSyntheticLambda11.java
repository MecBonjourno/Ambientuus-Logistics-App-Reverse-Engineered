package com.coleta.ambientuus.activities.pontoColeta;

import com.coleta.ambientuus.dto.TipoResiduo;
import j$.util.function.Function$CC;
import java.util.function.Function;

/* compiled from: D8$$SyntheticClass */
/* carregado de: classes14.dex */
public final /* sintético */ class IniciarColetaActivity$$ExternalSyntheticLambda11 implements Function {
    @Override // java.util.function.Function
    public /* sintético */ Function andThen(Function function) {
        return Function$CC.$default$andThen(this, function);
    }

    @Override // java.util.function.Function
    public final Object apply(Object obj) {
        return ((TipoResiduo) obj).getDescricao();
    }

    @Override // java.util.function.Function
    public /* sintético */ Function compose(Function function) {
        return Function$CC.$default$compose(this, function);
    }
}
