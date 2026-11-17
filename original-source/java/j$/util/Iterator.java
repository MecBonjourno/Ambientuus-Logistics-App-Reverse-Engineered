package j$.util;

import java.util.function.Consumer;

/* loaded from: classes15.dex */
public interface Iterator<E> {

    /* compiled from: D8$$SyntheticClass */
    /* renamed from: j$.util.Iterator$-EL, reason: invalid class name */
    public final /* synthetic */ class EL {
        public static /* synthetic */ void forEachRemaining(java.util.Iterator it, Consumer consumer) {
            if (it instanceof Iterator) {
                ((Iterator) it).forEachRemaining(consumer);
            } else {
                CC.$default$forEachRemaining(it, consumer);
            }
        }
    }

    void forEachRemaining(Consumer<? super E> consumer);

    /* renamed from: j$.util.Iterator$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$remove(java.util.Iterator _this) {
            throw new UnsupportedOperationException("remove");
        }

        public static void $default$forEachRemaining(java.util.Iterator _this, Consumer consumer) {
            Objects.requireNonNull(consumer);
            while (_this.hasNext()) {
                consumer.accept(_this.next());
            }
        }
    }
}
