package org.chromium.base.supplier;

/* loaded from: classes17.dex */
public interface Supplier<T> {

    /* renamed from: org.chromium.base.supplier.Supplier$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ boolean $assertionsDisabled = false;
    }

    T get();

    boolean hasValue();

    static {
        boolean z = AnonymousClass1.$assertionsDisabled;
    }

    /* renamed from: org.chromium.base.supplier.Supplier$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static boolean $default$hasValue(Supplier _this) {
            Object obj = _this.get();
            if (AnonymousClass1.$assertionsDisabled || obj == _this.get()) {
                return obj != null;
            }
            throw new AssertionError("Value provided by #get() must not change.");
        }
    }
}
