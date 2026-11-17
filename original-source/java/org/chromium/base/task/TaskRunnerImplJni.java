package org.chromium.base.task;

import org.chromium.base.task.TaskRunnerImpl;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* loaded from: classes17.dex */
class TaskRunnerImplJni implements TaskRunnerImpl.Natives {
    public static final JniStaticTestMocker<TaskRunnerImpl.Natives> TEST_HOOKS = new JniStaticTestMocker<TaskRunnerImpl.Natives>() { // from class: org.chromium.base.task.TaskRunnerImplJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(TaskRunnerImpl.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            TaskRunnerImplJni.testInstance = instance;
        }
    };
    private static TaskRunnerImpl.Natives testInstance;

    TaskRunnerImplJni() {
    }

    @Override // org.chromium.base.task.TaskRunnerImpl.Natives
    public boolean belongsToCurrentThread(long nativeTaskRunnerAndroid) {
        return GEN_JNI.org_chromium_base_task_TaskRunnerImpl_belongsToCurrentThread(nativeTaskRunnerAndroid);
    }

    @Override // org.chromium.base.task.TaskRunnerImpl.Natives
    public void destroy(long nativeTaskRunnerAndroid) {
        GEN_JNI.org_chromium_base_task_TaskRunnerImpl_destroy(nativeTaskRunnerAndroid);
    }

    @Override // org.chromium.base.task.TaskRunnerImpl.Natives
    public long init(int taskRunnerType, int taskTraits) {
        return GEN_JNI.org_chromium_base_task_TaskRunnerImpl_init(taskRunnerType, taskTraits);
    }

    @Override // org.chromium.base.task.TaskRunnerImpl.Natives
    public void postDelayedTask(long nativeTaskRunnerAndroid, Runnable task, long delay, String runnableClassName) {
        GEN_JNI.org_chromium_base_task_TaskRunnerImpl_postDelayedTask(nativeTaskRunnerAndroid, task, delay, runnableClassName);
    }

    public static TaskRunnerImpl.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of TaskRunnerImpl.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new TaskRunnerImplJni();
    }
}
