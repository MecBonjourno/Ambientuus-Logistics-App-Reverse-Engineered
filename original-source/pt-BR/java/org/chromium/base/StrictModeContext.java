package org.chromium.base;

import android.os.Build;
import android.os.StrictMode;
import java.io.Closeable;

/* carregado de: classes17.dex */
public final class StrictModeContext implements Closeable {
    private final StrictMode.ThreadPolicy mThreadPolicy;
    private final StrictMode.VmPolicy mVmPolicy;

    private StrictModeContext(StrictMode.ThreadPolicy threadPolicy, StrictMode.VmPolicy vmPolicy) {
        TraceEvent.startAsync("StrictModeContext", hashCode());
        this.mThreadPolicy = threadPolicy;
        this.mVmPolicy = vmPolicy;
    }

    private StrictModeContext(StrictMode.ThreadPolicy threadPolicy) {
        this(threadPolicy, null);
    }

    private StrictModeContext(StrictMode.VmPolicy vmPolicy) {
        this(null, vmPolicy);
    }

    public static StrictModeContext allowAllVmPolicies() {
        TraceEvent e = TraceEvent.scoped("StrictModeContext.allowAllVmPolicies");
        try {
            StrictMode.VmPolicy oldPolicy = StrictMode.getVmPolicy();
            StrictMode.setVmPolicy(StrictMode.VmPolicy.LAX);
            StrictModeContext strictModeContext = new StrictModeContext(oldPolicy);
            if (e != null) {
                e.close();
            }
            return strictModeContext;
        } catch (Throwable th) {
            if (e != null) {
                try {
                    e.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static StrictModeContext allowAllThreadPolicies() {
        TraceEvent e = TraceEvent.scoped("StrictModeContext.allowAllThreadPolicies");
        try {
            StrictMode.ThreadPolicy oldPolicy = StrictMode.getThreadPolicy();
            StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
            StrictModeContext strictModeContext = new StrictModeContext(oldPolicy);
            if (e != null) {
                e.close();
            }
            return strictModeContext;
        } catch (Throwable th) {
            if (e != null) {
                try {
                    e.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static StrictModeContext allowDiskWrites() {
        TraceEvent e = TraceEvent.scoped("StrictModeContext.allowDiskWrites");
        try {
            StrictMode.ThreadPolicy oldPolicy = StrictMode.allowThreadDiskWrites();
            StrictModeContext strictModeContext = new StrictModeContext(oldPolicy);
            if (e != null) {
                e.close();
            }
            return strictModeContext;
        } catch (Throwable th) {
            if (e != null) {
                try {
                    e.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static StrictModeContext allowDiskReads() {
        TraceEvent e = TraceEvent.scoped("StrictModeContext.allowDiskReads");
        try {
            StrictMode.ThreadPolicy oldPolicy = StrictMode.allowThreadDiskReads();
            StrictModeContext strictModeContext = new StrictModeContext(oldPolicy);
            if (e != null) {
                e.close();
            }
            return strictModeContext;
        } catch (Throwable th) {
            if (e != null) {
                try {
                    e.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static StrictModeContext allowSlowCalls() {
        TraceEvent e = TraceEvent.scoped("StrictModeContext.allowSlowCalls");
        try {
            StrictMode.ThreadPolicy oldPolicy = StrictMode.getThreadPolicy();
            StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(oldPolicy).permitCustomSlowCalls().build());
            StrictModeContext strictModeContext = new StrictModeContext(oldPolicy);
            if (e != null) {
                e.close();
            }
            return strictModeContext;
        } catch (Throwable th) {
            if (e != null) {
                try {
                    e.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    public static StrictModeContext allowUnbufferedIo() {
        TraceEvent e = TraceEvent.scoped("StrictModeContext.allowUnbufferedIo");
        try {
            StrictMode.ThreadPolicy oldPolicy = StrictMode.getThreadPolicy();
            if (Build.VERSION.SDK_INT >= 26) {
                StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(oldPolicy).permitUnbufferedIo().build());
            }
            StrictModeContext strictModeContext = new StrictModeContext(oldPolicy);
            if (e != null) {
                e.close();
            }
            return strictModeContext;
        } catch (Throwable th) {
            if (e != null) {
                try {
                    e.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
            }
            throw th;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this.mThreadPolicy != null) {
            StrictMode.setThreadPolicy(this.mThreadPolicy);
        }
        if (this.mVmPolicy != null) {
            StrictMode.setVmPolicy(this.mVmPolicy);
        }
        TraceEvent.finishAsync("StrictModeContext", hashCode());
    }
}
