package org.chromium.base;

import java.lang.Thread;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.build.annotations.MainDex;

@JNINamespace("base::android")
@MainDex
/* loaded from: classes17.dex */
public class JavaExceptionReporter implements Thread.UncaughtExceptionHandler {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private final boolean mCrashAfterReport;
    private boolean mHandlingException;
    private final Thread.UncaughtExceptionHandler mParent;

    interface Natives {
        void reportJavaException(boolean z, Throwable th);

        void reportJavaStackTrace(String str);
    }

    private JavaExceptionReporter(Thread.UncaughtExceptionHandler parent, boolean crashAfterReport) {
        this.mParent = parent;
        this.mCrashAfterReport = crashAfterReport;
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread t, Throwable e) {
        if (!this.mHandlingException) {
            this.mHandlingException = true;
            JavaExceptionReporterJni.get().reportJavaException(this.mCrashAfterReport, e);
        }
        if (this.mParent != null) {
            this.mParent.uncaughtException(t, e);
        }
    }

    public static void reportStackTrace(String stackTrace) {
        if (!ThreadUtils.runningOnUiThread()) {
            throw new AssertionError();
        }
        JavaExceptionReporterJni.get().reportJavaStackTrace(PiiElider.sanitizeStacktrace(stackTrace));
    }

    public static void reportException(Throwable exception) {
        if (!ThreadUtils.runningOnUiThread()) {
            throw new AssertionError();
        }
        JavaExceptionReporterJni.get().reportJavaException(false, exception);
    }

    private static void installHandler(boolean crashAfterReport) {
        Thread.setDefaultUncaughtExceptionHandler(new JavaExceptionReporter(Thread.getDefaultUncaughtExceptionHandler(), crashAfterReport));
    }
}
