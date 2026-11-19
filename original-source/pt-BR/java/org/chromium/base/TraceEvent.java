package org.chromium.base;

import android.app.Activity;
import android.content.res.Resources;
import android.os.Looper;
import android.os.MessageQueue;
import android.util.Printer;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Iterator;
import org.chromium.base.TraceEvent;
import org.chromium.base.annotations.JNINamespace;
import org.chromium.base.task.PostTask;
import org.chromium.build.annotations.MainDex;

@JNINamespace("base::android")
@MainDex
/* carregado de: classes17.dex */
public class TraceEvent implements AutoCloseable {
    private static volatile boolean sEnabled;
    private static boolean sEventNameFilteringEnabled;
    private static volatile boolean sUiThreadReady;
    private final String mName;

    interface Natives {
        void addViewDump(int i, int i2, boolean z, boolean z2, String str, String str2, long j);

        void begin(String str, String str2);

        void beginToplevel(String str);

        void beginWithIntArg(String str, int i);

        void end(String str, String str2, long j);

        void endToplevel(String str);

        void finishAsync(String str, long j);

        void initViewHierarchyDump(long j, Object obj);

        void instant(String str, String str2);

        void instantAndroidIPC(String str, long j);

        void instantAndroidToolbar(int i, int i2, int i3);

        void registerEnabledObserver();

        long startActivityDump(String str, long j);

        void startAsync(String str, long j);

        boolean viewHierarchyDumpEnabled();

        void webViewStartupStage1(long j, long j2);

        void webViewStartupStage2(long j, long j2, boolean z);

        void webViewStartupTotalFactoryInit(long j, long j2);
    }

    static class BasicLooperMonitor implements Printer {
        static final /* sintético */ boolean $assertionsDisabled = false;
        static final String FILTERED_EVENT_NAME = "Looper.dispatch: EVENT_NAME_FILTERED";
        static final String LOOPER_TASK_PREFIX = "Looper.dispatch: ";
        private static final int SHORTEST_LOG_PREFIX_LENGTH = "<<<<< Finished to ".length();
        private String mCurrentTarget;

        BasicLooperMonitor() {
        }

        @Override // android.util.Printer
        public void println(String line) {
            if (line.startsWith(">")) {
                beginHandling(line);
            } else {
                if (!line.startsWith("<")) {
                    throw new AssertionError();
                }
                endHandling(line);
            }
        }

        void beginHandling(String line) {
            boolean earlyTracingActive = EarlyTraceEvent.enabled();
            if (TraceEvent.sEnabled || earlyTracingActive) {
                this.mCurrentTarget = getTraceEventName(line);
                if (TraceEvent.sEnabled) {
                    TraceEventJni.get().beginToplevel(this.mCurrentTarget);
                } else {
                    EarlyTraceEvent.begin(this.mCurrentTarget, true);
                }
            }
        }

        void endHandling(String line) {
            boolean earlyTracingActive = EarlyTraceEvent.enabled();
            if ((TraceEvent.sEnabled || earlyTracingActive) && this.mCurrentTarget != null) {
                if (TraceEvent.sEnabled) {
                    TraceEventJni.get().endToplevel(this.mCurrentTarget);
                } else {
                    EarlyTraceEvent.end(this.mCurrentTarget, true);
                }
            }
            this.mCurrentTarget = null;
        }

        static String getTraceEventName(String line) {
            if (TraceEvent.sEventNameFilteringEnabled) {
                return FILTERED_EVENT_NAME;
            }
            return LOOPER_TASK_PREFIX + getTarget(line) + "(" + getTargetName(line) + ")";
        }

        private static String getTarget(String logLine) {
            int start = logLine.indexOf(40, SHORTEST_LOG_PREFIX_LENGTH);
            int end = start == -1 ? -1 : logLine.indexOf(41, start);
            return end != -1 ? logLine.substring(start + 1, end) : "";
        }

        private static String getTargetName(String logLine) {
            int start = logLine.indexOf(125, SHORTEST_LOG_PREFIX_LENGTH);
            int end = start == -1 ? -1 : logLine.indexOf(58, start);
            if (end == -1) {
                end = logLine.length();
            }
            return start != -1 ? logLine.substring(start + 2, end) : "";
        }
    }

    private static final class IdleTracingLooperMonitor extends BasicLooperMonitor implements MessageQueue.IdleHandler {
        private static final long FRAME_DURATION_MILLIS = 16;
        private static final String IDLE_EVENT_NAME = "Looper.queueIdle";
        private static final long MIN_INTERESTING_BURST_DURATION_MILLIS = 48;
        private static final long MIN_INTERESTING_DURATION_MILLIS = 16;
        private static final String TAG = "TraceEvt_LooperMonitor";
        private boolean mIdleMonitorAttached;
        private long mLastIdleStartedAt;
        private long mLastWorkStartedAt;
        private int mNumIdlesSeen;
        private int mNumTasksSeen;
        private int mNumTasksSinceLastIdle;

        private IdleTracingLooperMonitor() {
        }

        private final void syncIdleMonitoring() {
            if (TraceEvent.sEnabled && !this.mIdleMonitorAttached) {
                this.mLastIdleStartedAt = TimeUtils.elapsedRealtimeMillis();
                Looper.myQueue().addIdleHandler(this);
                this.mIdleMonitorAttached = true;
                android.util.Log.v(TAG, "attached idle handler");
                return;
            }
            if (this.mIdleMonitorAttached && !TraceEvent.sEnabled) {
                Looper.myQueue().removeIdleHandler(this);
                this.mIdleMonitorAttached = false;
                android.util.Log.v(TAG, "detached idle handler");
            }
        }

        @Override // org.chromium.base.TraceEvent.BasicLooperMonitor
        final void beginHandling(String line) {
            if (this.mNumTasksSinceLastIdle == 0) {
                TraceEvent.end(IDLE_EVENT_NAME);
            }
            this.mLastWorkStartedAt = TimeUtils.elapsedRealtimeMillis();
            syncIdleMonitoring();
            super.beginHandling(line);
        }

        @Override // org.chromium.base.TraceEvent.BasicLooperMonitor
        final void endHandling(String line) {
            long elapsed = TimeUtils.elapsedRealtimeMillis() - this.mLastWorkStartedAt;
            if (elapsed > 16) {
                traceAndLog(5, "observed a task that took " + elapsed + "ms: " + line);
            }
            super.endHandling(line);
            syncIdleMonitoring();
            this.mNumTasksSeen++;
            this.mNumTasksSinceLastIdle++;
        }

        private static void traceAndLog(int level, String message) {
            TraceEvent.instant("TraceEvent.LooperMonitor:IdleStats", message);
            android.util.Log.println(level, TAG, message);
        }

        @Override // android.os.MessageQueue.IdleHandler
        public final boolean queueIdle() {
            long now = TimeUtils.elapsedRealtimeMillis();
            if (this.mLastIdleStartedAt == 0) {
                this.mLastIdleStartedAt = now;
            }
            long elapsed = now - this.mLastIdleStartedAt;
            this.mNumIdlesSeen++;
            TraceEvent.begin(IDLE_EVENT_NAME, this.mNumTasksSinceLastIdle + " tasks since last idle.");
            if (elapsed > MIN_INTERESTING_BURST_DURATION_MILLIS) {
                String statsString = this.mNumTasksSeen + " tasks and " + this.mNumIdlesSeen + " idles processed so far, " + this.mNumTasksSinceLastIdle + " tasks bursted and " + elapsed + "ms elapsed since last idle";
                traceAndLog(3, statsString);
            }
            this.mLastIdleStartedAt = now;
            this.mNumTasksSinceLastIdle = 0;
            return true;
        }
    }

    private static final class LooperMonitorHolder {
        private static final BasicLooperMonitor sInstance;

        private LooperMonitorHolder() {
        }

        static {
            sInstance = CommandLine.getInstance().hasSwitch(BaseSwitches.ENABLE_IDLE_TRACING) ? new IdleTracingLooperMonitor() : new BasicLooperMonitor();
        }
    }

    private TraceEvent(String name, String arg) {
        this.mName = name;
        begin(name, arg);
    }

    private TraceEvent(String name, int arg) {
        this.mName = name;
        begin(name, arg);
    }

    @Override // java.lang.AutoCloseable
    public void close() {
        end(this.mName);
    }

    public static TraceEvent scoped(String name, String arg) {
        if (EarlyTraceEvent.enabled() || enabled()) {
            return new TraceEvent(name, arg);
        }
        return null;
    }

    public static TraceEvent scoped(String name, int arg) {
        if (EarlyTraceEvent.enabled() || enabled()) {
            return new TraceEvent(name, arg);
        }
        return null;
    }

    public static TraceEvent scoped(String name) {
        return scoped(name, (String) null);
    }

    public static void setEnabled(boolean enabled) {
        if (enabled) {
            EarlyTraceEvent.disable();
        }
        if (sEnabled != enabled) {
            sEnabled = enabled;
            ThreadUtils.getUiThreadLooper().setMessageLogging(enabled ? LooperMonitorHolder.sInstance : null);
        }
        if (sUiThreadReady) {
            ViewHierarchyDumper.updateEnabledState();
        }
    }

    public static void setEventNameFilteringEnabled(boolean enabled) {
        sEventNameFilteringEnabled = enabled;
    }

    public static boolean eventNameFilteringEnabled() {
        return sEventNameFilteringEnabled;
    }

    public static void maybeEnableEarlyTracing(boolean readCommandLine) {
        if (readCommandLine) {
            EarlyTraceEvent.maybeEnableInBrowserProcess();
        }
        if (EarlyTraceEvent.enabled()) {
            ThreadUtils.getUiThreadLooper().setMessageLogging(LooperMonitorHolder.sInstance);
        }
    }

    public static void onNativeTracingReady() {
        TraceEventJni.get().registerEnabledObserver();
    }

    static void onUiThreadReady() {
        sUiThreadReady = true;
        if (sEnabled) {
            ViewHierarchyDumper.updateEnabledState();
        }
    }

    public static boolean enabled() {
        return sEnabled;
    }

    public static void instant(String name) {
        if (sEnabled) {
            TraceEventJni.get().instant(name, null);
        }
    }

    public static void instant(String name, String arg) {
        if (sEnabled) {
            TraceEventJni.get().instant(name, arg);
        }
    }

    public static void instantAndroidIPC(String name, long durMs) {
        if (sEnabled) {
            TraceEventJni.get().instantAndroidIPC(name, durMs);
        }
    }

    public static void instantAndroidToolbar(int blockReason, int allowReason, int snapshotDiff) {
        if (sEnabled) {
            TraceEventJni.get().instantAndroidToolbar(blockReason, allowReason, snapshotDiff);
        }
    }

    public static void webViewStartupTotalFactoryInit(long startTimeMs, long durationMs) {
        if (sEnabled) {
            TraceEventJni.get().webViewStartupTotalFactoryInit(startTimeMs, durationMs);
        }
    }

    public static void webViewStartupStage1(long startTimeMs, long durationMs) {
        if (sEnabled) {
            TraceEventJni.get().webViewStartupStage1(startTimeMs, durationMs);
        }
    }

    public static void webViewStartupStage2(long startTimeMs, long durationMs, boolean isColdStartup) {
        if (sEnabled) {
            TraceEventJni.get().webViewStartupStage2(startTimeMs, durationMs, isColdStartup);
        }
    }

    public static void snapshotViewHierarchy() {
        if (sEnabled && TraceEventJni.get().viewHierarchyDumpEnabled()) {
            begin("instantAndroidViewHierarchy");
            final ArrayList<ActivityInfo> views = snapshotViewHierarchyState();
            if (views.isEmpty()) {
                end("instantAndroidViewHierarchy");
                return;
            }
            final long flow = views.hashCode();
            PostTask.postTask(0, new Runnable() { // da classe: org.chromium.base.TraceEvent$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    TraceEventJni.get().initViewHierarchyDump(flow, views);
                }
            });
            end("instantAndroidViewHierarchy", null, flow);
        }
    }

    public static void startAsync(String name, long id) {
        EarlyTraceEvent.startAsync(name, id);
        if (sEnabled) {
            TraceEventJni.get().startAsync(name, id);
        }
    }

    public static void finishAsync(String name, long id) {
        EarlyTraceEvent.finishAsync(name, id);
        if (sEnabled) {
            TraceEventJni.get().finishAsync(name, id);
        }
    }

    public static void begin(String name) {
        begin(name, (String) null);
    }

    public static void begin(String name, String arg) {
        EarlyTraceEvent.begin(name, false);
        if (sEnabled) {
            TraceEventJni.get().begin(name, arg);
        }
    }

    public static void begin(String name, int arg) {
        EarlyTraceEvent.begin(name, false);
        if (sEnabled) {
            TraceEventJni.get().beginWithIntArg(name, arg);
        }
    }

    public static void end(String name) {
        end(name, null);
    }

    public static void end(String name, String arg) {
        end(name, arg, 0L);
    }

    public static void end(String name, String arg, long flow) {
        EarlyTraceEvent.end(name, false);
        if (sEnabled) {
            TraceEventJni.get().end(name, arg, flow);
        }
    }

    public static ArrayList<ActivityInfo> snapshotViewHierarchyState() {
        if (!ApplicationStatus.isInitialized()) {
            return new ArrayList<>();
        }
        ArrayList<ActivityInfo> views = new ArrayList<>(2);
        for (Activity a : ApplicationStatus.getRunningActivities()) {
            views.add(new ActivityInfo(a.getClass().getName()));
            ViewHierarchyDumper.dumpView(views.get(views.size() - 1), 0, a.getWindow().getDecorView().getRootView());
        }
        return views;
    }

    public static void dumpViewHierarchy(long dumpProtoPtr, Object list) {
        String resource;
        String resource2;
        if (!ApplicationStatus.isInitialized()) {
            return;
        }
        ArrayList<ActivityInfo> activities = (ArrayList) list;
        Iterator<ActivityInfo> it = activities.iterator();
        while (it.hasNext()) {
            ActivityInfo activity = it.next();
            long activityProtoPtr = TraceEventJni.get().startActivityDump(activity.mActivityName, dumpProtoPtr);
            Iterator<ViewInfo> it2 = activity.mViews.iterator();
            while (it2.hasNext()) {
                ViewInfo view = it2.next();
                try {
                    if (view.mRes != null) {
                        if (view.mId != 0 && view.mId != -1) {
                            resource2 = view.mRes.getResourceName(view.mId);
                        }
                        resource2 = "__no_id__";
                    } else {
                        resource2 = "__no_resources__";
                    }
                    resource = resource2;
                } catch (Resources.NotFoundException e) {
                    resource = "__name_not_found__";
                }
                TraceEventJni.get().addViewDump(view.mId, view.mParentId, view.mIsShown, view.mIsDirty, view.mClassName, resource, activityProtoPtr);
            }
        }
    }

    public static class ViewInfo {
        private String mClassName;
        private int mId;
        private boolean mIsDirty;
        private boolean mIsShown;
        private int mParentId;
        private Resources mRes;

        public ViewInfo(int id, int parentId, boolean isShown, boolean isDirty, String className, Resources res) {
            this.mId = id;
            this.mParentId = parentId;
            this.mIsShown = isShown;
            this.mIsDirty = isDirty;
            this.mClassName = className;
            this.mRes = res;
        }
    }

    public static class ActivityInfo {
        public String mActivityName;
        public ArrayList<ViewInfo> mViews = new ArrayList<>(125);

        public ActivityInfo(String activityName) {
            this.mActivityName = activityName;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    static final class ViewHierarchyDumper implements MessageQueue.IdleHandler {
        private static final String EVENT_NAME = "TraceEvent.ViewHierarchyDumper";
        private static final long MIN_VIEW_DUMP_INTERVAL_MILLIS = 1000;
        private static boolean sEnabled;
        private static ViewHierarchyDumper sInstance;
        private long mLastDumpTs;

        private ViewHierarchyDumper() {
        }

        @Override // android.os.MessageQueue.IdleHandler
        public final boolean queueIdle() {
            long now = TimeUtils.elapsedRealtimeMillis();
            if (this.mLastDumpTs == 0 || now - this.mLastDumpTs > 1000) {
                this.mLastDumpTs = now;
                TraceEvent.snapshotViewHierarchy();
                return true;
            }
            return true;
        }

        public static void updateEnabledState() {
            PostTask.runOrPostTask(7, new Runnable() { // da classe: org.chromium.base.TraceEvent$ViewHierarchyDumper$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    TraceEvent.ViewHierarchyDumper.lambda$updateEnabledState$0();
                }
            });
        }

        static /* sintético */ void lambda$updateEnabledState$0() {
            if (TraceEventJni.get().viewHierarchyDumpEnabled()) {
                if (sInstance == null) {
                    sInstance = new ViewHierarchyDumper();
                }
                enable();
            } else if (sInstance != null) {
                disable();
            }
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public static void dumpView(ActivityInfo collection, int parentId, View v) {
            ThreadUtils.assertOnUiThread();
            int id = v.getId();
            collection.mViews.add(new ViewInfo(id, parentId, v.isShown(), v.isDirty(), v.getClass().getSimpleName(), v.getResources()));
            if (v instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) v;
                for (int i = 0; i < vg.getChildCount(); i++) {
                    dumpView(collection, id, vg.getChildAt(i));
                }
            }
        }

        private static void enable() {
            ThreadUtils.assertOnUiThread();
            if (!sEnabled) {
                Looper.myQueue().addIdleHandler(sInstance);
                sEnabled = true;
            }
        }

        private static void disable() {
            ThreadUtils.assertOnUiThread();
            if (sEnabled) {
                Looper.myQueue().removeIdleHandler(sInstance);
                sEnabled = false;
            }
        }
    }
}
