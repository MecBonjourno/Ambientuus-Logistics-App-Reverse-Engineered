package org.chromium.base.supplier;

/* carregado de: classes17.dex */
public interface Supplier<T> {

    /* renomeado de: org.chromium.base.supplier.Supplier$1, motivo: nome de classe inválido */
    static /* sintético */ class AnonymousClass1 {
        static final /* sintético */ boolean $assertionsDisabled = false;
    }

    T get();

    boolean hasValue();

    static {
        boolean z = AnonymousClass1.$assertionsDisabled;
    }

    /* renomeado de: org.chromium.base.supplier.Supplier$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static boolean $default$hasValue(Supplier _this) {
            Object obj = _this.get();
            if (AnonymousClass1.$assertionsDisabled || obj == _this.get()) {
                return obj != null;
            }
            throw new AssertionError("Value provided by #get() must not change.");
        }
    }
}
