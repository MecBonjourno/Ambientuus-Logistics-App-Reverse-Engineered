package org.chromium.base;

import java.util.Locale;

/* loaded from: classes17.dex */
public class Log {
    public static final int ASSERT = 7;
    public static final int DEBUG = 3;
    public static final int ERROR = 6;
    public static final int INFO = 4;
    public static final int VERBOSE = 2;
    public static final int WARN = 5;

    private Log() {
    }

    private static String formatLog(String messageTemplate, Throwable tr, Object... params) {
        if (params == null) {
            return messageTemplate;
        }
        if ((tr == null && params.length > 0) || params.length > 1) {
            return String.format(Locale.US, messageTemplate, params);
        }
        return messageTemplate;
    }

    public static String normalizeTag(String tag) {
        return "cr_" + tag;
    }

    private static String formatLogWithStack(String messageTemplate, Throwable tr, Object... params) {
        return "[" + getCallOrigin() + "] " + formatLog(messageTemplate, tr, params);
    }

    private static boolean isDebug() {
        return true;
    }

    public static boolean isLoggable(String tag, int level) {
        if (!isDebug() && level <= 4) {
            return false;
        }
        return android.util.Log.isLoggable(tag, level);
    }

    public static void v(String tag, String messageTemplate, Object... args) {
        if (isDebug()) {
            Throwable tr = getThrowableToLog(args);
            String message = formatLogWithStack(messageTemplate, tr, args);
            String tag2 = normalizeTag(tag);
            if (tr != null) {
                android.util.Log.v(tag2, message, tr);
            } else {
                android.util.Log.v(tag2, message);
            }
        }
    }

    public static void d(String tag, String messageTemplate, Object... args) {
        if (isDebug()) {
            Throwable tr = getThrowableToLog(args);
            String message = formatLogWithStack(messageTemplate, tr, args);
            String tag2 = normalizeTag(tag);
            if (tr != null) {
                android.util.Log.d(tag2, message, tr);
            } else {
                android.util.Log.d(tag2, message);
            }
        }
    }

    public static void i(String tag, String messageTemplate, Object... args) {
        Throwable tr = getThrowableToLog(args);
        String message = formatLog(messageTemplate, tr, args);
        String tag2 = normalizeTag(tag);
        if (tr != null) {
            android.util.Log.i(tag2, message, tr);
        } else {
            android.util.Log.i(tag2, message);
        }
    }

    public static void i(String tag, String message) {
        android.util.Log.i(normalizeTag(tag), message);
    }

    public static void i(String tag, String message, Throwable t) {
        android.util.Log.i(normalizeTag(tag), message, t);
    }

    public static void i(String tag, String messageTemplate, Object o) {
        i(tag, messageTemplate, o);
    }

    public static void i(String tag, String messageTemplate, Object o1, Object o2) {
        i(tag, messageTemplate, o1, o2);
    }

    public static void w(String tag, String messageTemplate, Object... args) {
        Throwable tr = getThrowableToLog(args);
        String message = formatLog(messageTemplate, tr, args);
        String tag2 = normalizeTag(tag);
        if (tr != null) {
            android.util.Log.w(tag2, message, tr);
        } else {
            android.util.Log.w(tag2, message);
        }
    }

    public static void w(String tag, String message) {
        android.util.Log.w(normalizeTag(tag), message);
    }

    public static void w(String tag, String message, Throwable t) {
        android.util.Log.w(normalizeTag(tag), message, t);
    }

    public static void w(String tag, String messageTemplate, Object o) {
        w(tag, messageTemplate, o);
    }

    public static void w(String tag, String messageTemplate, Object o1, Object o2) {
        w(tag, messageTemplate, o1, o2);
    }

    public static void e(String tag, String messageTemplate, Object... args) {
        Throwable tr = getThrowableToLog(args);
        String message = formatLog(messageTemplate, tr, args);
        String tag2 = normalizeTag(tag);
        if (tr != null) {
            android.util.Log.e(tag2, message, tr);
        } else {
            android.util.Log.e(tag2, message);
        }
    }

    public static void e(String tag, String message) {
        android.util.Log.e(normalizeTag(tag), message);
    }

    public static void e(String tag, String message, Throwable t) {
        android.util.Log.e(normalizeTag(tag), message, t);
    }

    public static void e(String tag, String messageTemplate, Object o) {
        e(tag, messageTemplate, o);
    }

    public static void e(String tag, String messageTemplate, Object o1, Object o2) {
        e(tag, messageTemplate, o1, o2);
    }

    public static void wtf(String tag, String messageTemplate, Object... args) {
        Throwable tr = getThrowableToLog(args);
        String message = formatLog(messageTemplate, tr, args);
        String tag2 = normalizeTag(tag);
        if (tr != null) {
            android.util.Log.wtf(tag2, message, tr);
        } else {
            android.util.Log.wtf(tag2, message);
        }
    }

    public static String getStackTraceString(Throwable tr) {
        return android.util.Log.getStackTraceString(tr);
    }

    private static Throwable getThrowableToLog(Object[] args) {
        if (args == null || args.length == 0) {
            return null;
        }
        Object lastArg = args[args.length - 1];
        if (!(lastArg instanceof Throwable)) {
            return null;
        }
        return (Throwable) lastArg;
    }

    private static String getCallOrigin() {
        StackTraceElement[] st = Thread.currentThread().getStackTrace();
        String logClassName = Log.class.getName();
        int callerStackIndex = 0;
        while (true) {
            if (callerStackIndex >= st.length) {
                break;
            }
            if (!st[callerStackIndex].getClassName().equals(logClassName)) {
                callerStackIndex++;
            } else {
                callerStackIndex += 3;
                break;
            }
        }
        return st[callerStackIndex].getFileName() + ":" + st[callerStackIndex].getLineNumber();
    }
}
