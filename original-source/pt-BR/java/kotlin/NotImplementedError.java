package kotlin;

import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: Standard.kt */
@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\u0018\u00002\u00060\u0001j\u0002`\u0002B\u000f\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005¨\u0006\u0006"}, d2 = {"Lkotlin/NotImplementedError;", "Ljava/lang/Error;", "Lkotlin/Error;", "message", "", "(Ljava/lang/String;)V", "kotlin-stdlib"}, k = 1, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class NotImplementedError extends Error {
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public NotImplementedError() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public NotImplementedError(String message) {
        super(message);
        Intrinsics.checkNotNullParameter(message, "message");
    }

    public /* sintético */ NotImplementedError(String str, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? "An operation is not implemented." : str);
    }
}
