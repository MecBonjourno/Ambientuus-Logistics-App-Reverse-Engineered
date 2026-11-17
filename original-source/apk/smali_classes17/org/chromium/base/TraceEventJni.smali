.class Lorg/chromium/base/TraceEventJni;
.super Ljava/lang/Object;
.source "TraceEventJni.java"

# interfaces
.implements Lorg/chromium/base/TraceEvent$Natives;


# static fields
.field public static final TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jni_zero/JniStaticTestMocker<",
            "Lorg/chromium/base/TraceEvent$Natives;",
            ">;"
        }
    .end annotation
.end field

.field private static testInstance:Lorg/chromium/base/TraceEvent$Natives;


# direct methods
.method static bridge synthetic -$$Nest$sfputtestInstance(Lorg/chromium/base/TraceEvent$Natives;)V
    .locals 0

    sput-object p0, Lorg/chromium/base/TraceEventJni;->testInstance:Lorg/chromium/base/TraceEvent$Natives;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 31
    new-instance v0, Lorg/chromium/base/TraceEventJni$1;

    invoke-direct {v0}, Lorg/chromium/base/TraceEventJni$1;-><init>()V

    sput-object v0, Lorg/chromium/base/TraceEventJni;->TEST_HOOKS:Lorg/jni_zero/JniStaticTestMocker;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get()Lorg/chromium/base/TraceEvent$Natives;
    .locals 2

    .line 134
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->TESTING_ENABLED:Z

    if-eqz v0, :cond_2

    .line 135
    sget-object v0, Lorg/chromium/base/TraceEventJni;->testInstance:Lorg/chromium/base/TraceEvent$Natives;

    if-eqz v0, :cond_0

    .line 136
    sget-object v0, Lorg/chromium/base/TraceEventJni;->testInstance:Lorg/chromium/base/TraceEvent$Natives;

    return-object v0

    .line 138
    :cond_0
    sget-boolean v0, Lorg/jni_zero/GEN_JNI;->REQUIRE_MOCK:Z

    if-nez v0, :cond_1

    goto :goto_0

    .line 139
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "No mock found for the native implementation of TraceEvent.Natives. The current configuration requires implementations be mocked."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_2
    :goto_0
    invoke-static {}, Lorg/jni_zero/NativeLibraryLoadedStatus;->checkLoaded()V

    .line 145
    new-instance v0, Lorg/chromium/base/TraceEventJni;

    invoke-direct {v0}, Lorg/chromium/base/TraceEventJni;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addViewDump(IIZZLjava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "parentId"    # I
    .param p3, "isShown"    # Z
    .param p4, "isDirty"    # Z
    .param p5, "className"    # Ljava/lang/String;
    .param p6, "resourceName"    # Ljava/lang/String;
    .param p7, "activityProtoPtr"    # J

    .line 45
    invoke-static/range {p1 .. p8}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_addViewDump(IIZZLjava/lang/String;Ljava/lang/String;J)V

    .line 46
    return-void
.end method

.method public begin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;

    .line 50
    invoke-static {p1, p2}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_begin(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public beginToplevel(Ljava/lang/String;)V
    .locals 0
    .param p1, "target"    # Ljava/lang/String;

    .line 55
    invoke-static {p1}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_beginToplevel(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method public beginWithIntArg(Ljava/lang/String;I)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg"    # I

    .line 60
    invoke-static {p1, p2}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_beginWithIntArg(Ljava/lang/String;I)V

    .line 61
    return-void
.end method

.method public end(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;
    .param p3, "flow"    # J

    .line 65
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_end(Ljava/lang/String;Ljava/lang/String;J)V

    .line 66
    return-void
.end method

.method public endToplevel(Ljava/lang/String;)V
    .locals 0
    .param p1, "target"    # Ljava/lang/String;

    .line 70
    invoke-static {p1}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_endToplevel(Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public finishAsync(Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "id"    # J

    .line 75
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_finishAsync(Ljava/lang/String;J)V

    .line 76
    return-void
.end method

.method public initViewHierarchyDump(JLjava/lang/Object;)V
    .locals 0
    .param p1, "id"    # J
    .param p3, "list"    # Ljava/lang/Object;

    .line 80
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_initViewHierarchyDump(JLjava/lang/Object;)V

    .line 81
    return-void
.end method

.method public instant(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "arg"    # Ljava/lang/String;

    .line 85
    invoke-static {p1, p2}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_instant(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    return-void
.end method

.method public instantAndroidIPC(Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "durMs"    # J

    .line 90
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_instantAndroidIPC(Ljava/lang/String;J)V

    .line 91
    return-void
.end method

.method public instantAndroidToolbar(III)V
    .locals 0
    .param p1, "blockReason"    # I
    .param p2, "allowReason"    # I
    .param p3, "snapshotDiff"    # I

    .line 95
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_instantAndroidToolbar(III)V

    .line 96
    return-void
.end method

.method public registerEnabledObserver()V
    .locals 0

    .line 100
    invoke-static {}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_registerEnabledObserver()V

    .line 101
    return-void
.end method

.method public startActivityDump(Ljava/lang/String;J)J
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "dumpProtoPtr"    # J

    .line 105
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_startActivityDump(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public startAsync(Ljava/lang/String;J)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "id"    # J

    .line 110
    invoke-static {p1, p2, p3}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_startAsync(Ljava/lang/String;J)V

    .line 111
    return-void
.end method

.method public viewHierarchyDumpEnabled()Z
    .locals 1

    .line 115
    invoke-static {}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_viewHierarchyDumpEnabled()Z

    move-result v0

    return v0
.end method

.method public webViewStartupStage1(JJ)V
    .locals 0
    .param p1, "startTimeMs"    # J
    .param p3, "durationMs"    # J

    .line 120
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_webViewStartupStage1(JJ)V

    .line 121
    return-void
.end method

.method public webViewStartupStage2(JJZ)V
    .locals 0
    .param p1, "startTimeMs"    # J
    .param p3, "durationMs"    # J
    .param p5, "isColdStartup"    # Z

    .line 125
    invoke-static {p1, p2, p3, p4, p5}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_webViewStartupStage2(JJZ)V

    .line 126
    return-void
.end method

.method public webViewStartupTotalFactoryInit(JJ)V
    .locals 0
    .param p1, "startTimeMs"    # J
    .param p3, "durationMs"    # J

    .line 130
    invoke-static {p1, p2, p3, p4}, Lorg/jni_zero/GEN_JNI;->org_chromium_base_TraceEvent_webViewStartupTotalFactoryInit(JJ)V

    .line 131
    return-void
.end method
