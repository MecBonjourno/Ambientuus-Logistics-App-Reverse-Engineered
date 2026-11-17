package org.chromium.base;

import j$.util.DesugarCollections;
import java.lang.ref.PhantomReference;
import java.lang.ref.ReferenceQueue;
import java.util.HashSet;
import java.util.Set;
import org.chromium.build.BuildConfig;

/* loaded from: classes17.dex */
public class LifetimeAssert {
    static TestHook sTestHook;
    private final Object mTarget;
    final WrappedReference mWrapper;

    interface TestHook {
        void onCleaned(WrappedReference wrappedReference, String str);
    }

    static class LifetimeAssertException extends RuntimeException {
        LifetimeAssertException(String msg, Throwable causedBy) {
            super(msg, causedBy);
        }
    }

    private static class CreationException extends RuntimeException {
        CreationException() {
            super("vvv This is where object was created. vvv");
        }
    }

    static class WrappedReference extends PhantomReference<Object> {
        final CreationException mCreationException;
        boolean mSafeToGc;
        final Class<?> mTargetClass;
        private static ReferenceQueue<Object> sReferenceQueue = new ReferenceQueue<>();
        private static Set<WrappedReference> sActiveWrappers = DesugarCollections.synchronizedSet(new HashSet());

        public WrappedReference(Object target, CreationException creationException, boolean safeToGc) {
            super(target, sReferenceQueue);
            this.mCreationException = creationException;
            this.mSafeToGc = safeToGc;
            this.mTargetClass = target.getClass();
            sActiveWrappers.add(this);
        }

        static {
            new Thread("GcStateAssertQueue") { // from class: org.chromium.base.LifetimeAssert.WrappedReference.1
                {
                    setDaemon(true);
                    start();
                }

                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    while (true) {
                        try {
                            WrappedReference wrapper = (WrappedReference) WrappedReference.sReferenceQueue.remove();
                            if (WrappedReference.sActiveWrappers.remove(wrapper)) {
                                if (!wrapper.mSafeToGc) {
                                    String msg = String.format("Object of type %s was GC'ed without cleanup. Refer to \"Caused by\" for where object was created.", wrapper.mTargetClass.getName());
                                    if (LifetimeAssert.sTestHook != null) {
                                        LifetimeAssert.sTestHook.onCleaned(wrapper, msg);
                                    } else {
                                        throw new LifetimeAssertException(msg, wrapper.mCreationException);
                                    }
                                } else if (LifetimeAssert.sTestHook != null) {
                                    LifetimeAssert.sTestHook.onCleaned(wrapper, null);
                                }
                            }
                        } catch (InterruptedException e) {
                            throw new RuntimeException(e);
                        }
                    }
                }
            };
        }
    }

    private LifetimeAssert(WrappedReference wrapper, Object target) {
        this.mWrapper = wrapper;
        this.mTarget = target;
    }

    public static LifetimeAssert create(Object target) {
        if (!BuildConfig.ENABLE_ASSERTS) {
            return null;
        }
        return new LifetimeAssert(new WrappedReference(target, new CreationException(), false), target);
    }

    public static LifetimeAssert create(Object target, boolean safeToGc) {
        if (!BuildConfig.ENABLE_ASSERTS) {
            return null;
        }
        return new LifetimeAssert(new WrappedReference(target, new CreationException(), safeToGc), target);
    }

    public static void setSafeToGc(LifetimeAssert asserter, boolean value) {
        if (BuildConfig.ENABLE_ASSERTS) {
            synchronized (asserter.mTarget) {
                asserter.mWrapper.mSafeToGc = value;
            }
        }
    }

    public static void assertAllInstancesDestroyedForTesting() throws LifetimeAssertException {
        if (!BuildConfig.ENABLE_ASSERTS) {
            return;
        }
        synchronized (WrappedReference.sActiveWrappers) {
            try {
                for (WrappedReference ref : WrappedReference.sActiveWrappers) {
                    if (!ref.mSafeToGc) {
                        String msg = String.format("Object of type %s was not destroyed after test completed. Refer to \"Caused by\" for where object was created.", ref.mTargetClass.getName());
                        throw new LifetimeAssertException(msg, ref.mCreationException);
                    }
                }
            } finally {
                WrappedReference.sActiveWrappers.clear();
            }
        }
    }

    public static void resetForTesting() {
        if (!BuildConfig.ENABLE_ASSERTS) {
            return;
        }
        WrappedReference.sActiveWrappers.clear();
    }
}
