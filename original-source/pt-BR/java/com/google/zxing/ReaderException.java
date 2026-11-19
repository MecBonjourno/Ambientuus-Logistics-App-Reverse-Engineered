package com.google.zxing;

/* carregado de: classes16.dex */
public abstract class ReaderException extends Exception {
    protected static final boolean isStackTrace;

    static {
        isStackTrace = System.getProperty("surefire.test.class.path") != null;
    }

    ReaderException() {
    }

    ReaderException(Throwable cause) {
        super(cause);
    }

    @Override // java.lang.Throwable
    public final Throwable fillInStackTrace() {
        return null;
    }
}
