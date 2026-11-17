package org.chromium.base;

@FunctionalInterface
/* loaded from: classes17.dex */
public interface Callback<T> {
    Runnable bind(T t);

    void onResult(T t);

    /* renamed from: org.chromium.base.Callback$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static Runnable $default$bind(final Callback _this, final Object obj) {
            return new Runnable() { // from class: org.chromium.base.Callback$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    Callback.this.onResult(obj);
                }
            };
        }
    }

    public static abstract class Helper {
        static void onObjectResultFromNative(Callback callback, Object result) {
            callback.onResult(result);
        }

        static void onBooleanResultFromNative(Callback callback, boolean result) {
            callback.onResult(Boolean.valueOf(result));
        }

        static void onIntResultFromNative(Callback callback, int result) {
            callback.onResult(Integer.valueOf(result));
        }

        static void onLongResultFromNative(Callback callback, long result) {
            callback.onResult(Long.valueOf(result));
        }

        static void onTimeResultFromNative(Callback callback, long result) {
            callback.onResult(Long.valueOf(result));
        }

        static void runRunnable(Runnable runnable) {
            runnable.run();
        }
    }
}
