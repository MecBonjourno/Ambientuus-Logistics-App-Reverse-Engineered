package org.chromium.base;

import org.chromium.base.TraceEvent;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class TraceEventJni implements TraceEvent.Natives {
    public static final JniStaticTestMocker<TraceEvent.Natives> TEST_HOOKS = new JniStaticTestMocker<TraceEvent.Natives>() { // from class: org.chromium.base.TraceEventJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(TraceEvent.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            TraceEventJni.testInstance = instance;
        }
    };
    private static TraceEvent.Natives testInstance;

    TraceEventJni() {
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void addViewDump(int id, int parentId, boolean isShown, boolean isDirty, String className, String resourceName, long activityProtoPtr) {
        GEN_JNI.org_chromium_base_TraceEvent_addViewDump(id, parentId, isShown, isDirty, className, resourceName, activityProtoPtr);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void begin(String name, String arg) {
        GEN_JNI.org_chromium_base_TraceEvent_begin(name, arg);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void beginToplevel(String target) {
        GEN_JNI.org_chromium_base_TraceEvent_beginToplevel(target);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void beginWithIntArg(String name, int arg) {
        GEN_JNI.org_chromium_base_TraceEvent_beginWithIntArg(name, arg);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void end(String name, String arg, long flow) {
        GEN_JNI.org_chromium_base_TraceEvent_end(name, arg, flow);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void endToplevel(String target) {
        GEN_JNI.org_chromium_base_TraceEvent_endToplevel(target);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void finishAsync(String name, long id) {
        GEN_JNI.org_chromium_base_TraceEvent_finishAsync(name, id);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void initViewHierarchyDump(long id, Object list) {
        GEN_JNI.org_chromium_base_TraceEvent_initViewHierarchyDump(id, list);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void instant(String name, String arg) {
        GEN_JNI.org_chromium_base_TraceEvent_instant(name, arg);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void instantAndroidIPC(String name, long durMs) {
        GEN_JNI.org_chromium_base_TraceEvent_instantAndroidIPC(name, durMs);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void instantAndroidToolbar(int blockReason, int allowReason, int snapshotDiff) {
        GEN_JNI.org_chromium_base_TraceEvent_instantAndroidToolbar(blockReason, allowReason, snapshotDiff);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void registerEnabledObserver() {
        GEN_JNI.org_chromium_base_TraceEvent_registerEnabledObserver();
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public long startActivityDump(String name, long dumpProtoPtr) {
        return GEN_JNI.org_chromium_base_TraceEvent_startActivityDump(name, dumpProtoPtr);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void startAsync(String name, long id) {
        GEN_JNI.org_chromium_base_TraceEvent_startAsync(name, id);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public boolean viewHierarchyDumpEnabled() {
        return GEN_JNI.org_chromium_base_TraceEvent_viewHierarchyDumpEnabled();
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void webViewStartupStage1(long startTimeMs, long durationMs) {
        GEN_JNI.org_chromium_base_TraceEvent_webViewStartupStage1(startTimeMs, durationMs);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void webViewStartupStage2(long startTimeMs, long durationMs, boolean isColdStartup) {
        GEN_JNI.org_chromium_base_TraceEvent_webViewStartupStage2(startTimeMs, durationMs, isColdStartup);
    }

    @Override // org.chromium.base.TraceEvent.Natives
    public void webViewStartupTotalFactoryInit(long startTimeMs, long durationMs) {
        GEN_JNI.org_chromium_base_TraceEvent_webViewStartupTotalFactoryInit(startTimeMs, durationMs);
    }

    public static TraceEvent.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of TraceEvent.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new TraceEventJni();
    }
}
