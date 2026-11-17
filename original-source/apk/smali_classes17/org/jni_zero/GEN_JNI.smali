.class public Lorg/jni_zero/GEN_JNI;
.super Ljava/lang/Object;
.source "GEN_JNI.java"


# static fields
.field public static final REQUIRE_MOCK:Z = false

.field public static final TESTING_ENABLED:Z = false


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static org_chromium_base_ApplicationStatus_onApplicationStateChange(I)V
    .locals 0
    .param p0, "newState"    # I

    .line 17
    invoke-static {p0}, LJ/N;->MiAkQ_SU(I)V

    .line 18
    return-void
.end method

.method public static org_chromium_base_BaseFeatureMap_getNativeMap()J
    .locals 2

    .line 20
    invoke-static {}, LJ/N;->MshdYEWu()J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_CommandLine_appendSwitch(Ljava/lang/String;)V
    .locals 0
    .param p0, "switchString"    # Ljava/lang/String;

    .line 23
    invoke-static {p0}, LJ/N;->M5K_ewhl(Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public static org_chromium_base_CommandLine_appendSwitchWithValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "switchString"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .line 27
    invoke-static {p0, p1}, LJ/N;->MUoYiNbY(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method public static org_chromium_base_CommandLine_appendSwitchesAndArguments([Ljava/lang/String;)V
    .locals 0
    .param p0, "array"    # [Ljava/lang/String;

    .line 31
    invoke-static {p0}, LJ/N;->MPquHBNa([Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public static org_chromium_base_CommandLine_getSwitchValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "switchString"    # Ljava/lang/String;

    .line 35
    invoke-static {p0}, LJ/N;->MZJ2lrZY(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_CommandLine_getSwitchesFlattened()[Ljava/lang/String;
    .locals 1

    .line 39
    invoke-static {}, LJ/N;->MHzche6O()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_CommandLine_hasSwitch(Ljava/lang/String;)Z
    .locals 1
    .param p0, "switchString"    # Ljava/lang/String;

    .line 43
    invoke-static {p0}, LJ/N;->MsCvypjU(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_CommandLine_init([Ljava/lang/String;)V
    .locals 0
    .param p0, "args"    # [Ljava/lang/String;

    .line 47
    invoke-static {p0}, LJ/N;->MDkrKi31([Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public static org_chromium_base_CommandLine_removeSwitch(Ljava/lang/String;)V
    .locals 0
    .param p0, "switchString"    # Ljava/lang/String;

    .line 51
    invoke-static {p0}, LJ/N;->M1cMYXGO(Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public static org_chromium_base_CpuFeatures_getCoreCount()I
    .locals 1

    .line 54
    invoke-static {}, LJ/N;->MOiBJ1qS()I

    move-result v0

    return v0
.end method

.method public static org_chromium_base_CpuFeatures_getCpuFeatures()J
    .locals 2

    .line 58
    invoke-static {}, LJ/N;->ML0T8q1U()J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_EarlyTraceEvent_recordEarlyAsyncBeginEvent(Ljava/lang/String;JJ)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "id"    # J
    .param p3, "timeNanos"    # J

    .line 61
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->M_Gv8TwM(Ljava/lang/String;JJ)V

    .line 62
    return-void
.end method

.method public static org_chromium_base_EarlyTraceEvent_recordEarlyAsyncEndEvent(JJ)V
    .locals 0
    .param p0, "id"    # J
    .param p2, "timeNanos"    # J

    .line 65
    invoke-static {p0, p1, p2, p3}, LJ/N;->MrKsqeCD(JJ)V

    .line 66
    return-void
.end method

.method public static org_chromium_base_EarlyTraceEvent_recordEarlyBeginEvent(Ljava/lang/String;JIJ)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "timeNanos"    # J
    .param p3, "threadId"    # I
    .param p4, "threadMillis"    # J

    .line 69
    invoke-static/range {p0 .. p5}, LJ/N;->MrWG2uUW(Ljava/lang/String;JIJ)V

    .line 70
    return-void
.end method

.method public static org_chromium_base_EarlyTraceEvent_recordEarlyEndEvent(Ljava/lang/String;JIJ)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "timeNanos"    # J
    .param p3, "threadId"    # I
    .param p4, "threadMillis"    # J

    .line 73
    invoke-static/range {p0 .. p5}, LJ/N;->MmyrhqXB(Ljava/lang/String;JIJ)V

    .line 74
    return-void
.end method

.method public static org_chromium_base_EarlyTraceEvent_recordEarlyToplevelBeginEvent(Ljava/lang/String;JIJ)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "timeNanos"    # J
    .param p3, "threadId"    # I
    .param p4, "threadMillis"    # J

    .line 77
    invoke-static/range {p0 .. p5}, LJ/N;->M7UXCmoq(Ljava/lang/String;JIJ)V

    .line 78
    return-void
.end method

.method public static org_chromium_base_EarlyTraceEvent_recordEarlyToplevelEndEvent(Ljava/lang/String;JIJ)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "timeNanos"    # J
    .param p3, "threadId"    # I
    .param p4, "threadMillis"    # J

    .line 81
    invoke-static/range {p0 .. p5}, LJ/N;->MRlw2LEn(Ljava/lang/String;JIJ)V

    .line 82
    return-void
.end method

.method public static org_chromium_base_FeatureList_isInitialized()Z
    .locals 1

    .line 84
    invoke-static {}, LJ/N;->MFTJCvBh()Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_FeatureMap_getFieldTrialParamByFeature(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "featureMap"    # J
    .param p2, "featureName"    # Ljava/lang/String;
    .param p3, "paramName"    # Ljava/lang/String;

    .line 87
    invoke-static {p0, p1, p2, p3}, LJ/N;->MkEZDArf(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_FeatureMap_getFieldTrialParamByFeatureAsBoolean(JLjava/lang/String;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "featureMap"    # J
    .param p2, "featureName"    # Ljava/lang/String;
    .param p3, "paramName"    # Ljava/lang/String;
    .param p4, "defaultValue"    # Z

    .line 91
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MR5ZSvGM(JLjava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_FeatureMap_getFieldTrialParamByFeatureAsDouble(JLjava/lang/String;Ljava/lang/String;D)D
    .locals 2
    .param p0, "featureMap"    # J
    .param p2, "featureName"    # Ljava/lang/String;
    .param p3, "paramName"    # Ljava/lang/String;
    .param p4, "defaultValue"    # D

    .line 95
    invoke-static/range {p0 .. p5}, LJ/N;->MVPjCt$S(JLjava/lang/String;Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_FeatureMap_getFieldTrialParamByFeatureAsInt(JLjava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "featureMap"    # J
    .param p2, "featureName"    # Ljava/lang/String;
    .param p3, "paramName"    # Ljava/lang/String;
    .param p4, "defaultValue"    # I

    .line 99
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->Me$URWJx(JLjava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static org_chromium_base_FeatureMap_getFlattedFieldTrialParamsForFeature(JLjava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "featureMap"    # J
    .param p2, "featureName"    # Ljava/lang/String;

    .line 103
    invoke-static {p0, p1, p2}, LJ/N;->MV_QqWU4(JLjava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_FeatureMap_isEnabled(JLjava/lang/String;)Z
    .locals 1
    .param p0, "featureMap"    # J
    .param p2, "featureName"    # Ljava/lang/String;

    .line 107
    invoke-static {p0, p1, p2}, LJ/N;->M2evocmp(JLjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_Features_getFieldTrialParamByFeatureAsBoolean(JLjava/lang/String;Z)Z
    .locals 1
    .param p0, "featurePointer"    # J
    .param p2, "paramName"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Z

    .line 110
    invoke-static {p0, p1, p2, p3}, LJ/N;->M8R55Xut(JLjava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_Features_getFieldTrialParamByFeatureAsString(JLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "featurePointer"    # J
    .param p2, "paramName"    # Ljava/lang/String;

    .line 114
    invoke-static {p0, p1, p2}, LJ/N;->M9wfStLu(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_Features_isEnabled(J)Z
    .locals 1
    .param p0, "featurePointer"    # J

    .line 118
    invoke-static {p0, p1}, LJ/N;->MRiRQ_Ey(J)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_FieldTrialList_createFieldTrial(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;
    .param p1, "groupName"    # Ljava/lang/String;

    .line 121
    invoke-static {p0, p1}, LJ/N;->MGqzwlIM(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_FieldTrialList_findFullName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;

    .line 125
    invoke-static {p0}, LJ/N;->MdC43qwX(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_FieldTrialList_getVariationParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;
    .param p1, "parameterKey"    # Ljava/lang/String;

    .line 129
    invoke-static {p0, p1}, LJ/N;->MZWMOP4I(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_FieldTrialList_logActiveTrials()V
    .locals 0

    .line 133
    invoke-static {}, LJ/N;->MHz6Fn06()V

    .line 134
    return-void
.end method

.method public static org_chromium_base_FieldTrialList_trialExists(Ljava/lang/String;)Z
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;

    .line 137
    invoke-static {p0}, LJ/N;->Mmqqda9c(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_FileUtils_getAbsoluteFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "filePath"    # Ljava/lang/String;

    .line 140
    invoke-static {p0}, LJ/N;->MWck3aif(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_ImportantFileWriterAndroid_writeFileAtomically(Ljava/lang/String;[B)Z
    .locals 1
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "data"    # [B

    .line 143
    invoke-static {p0, p1}, LJ/N;->MsOKBrZ5(Ljava/lang/String;[B)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_JavaExceptionReporter_reportJavaException(ZLjava/lang/Throwable;)V
    .locals 0
    .param p0, "crashAfterReport"    # Z
    .param p1, "e"    # Ljava/lang/Throwable;

    .line 146
    invoke-static {p0, p1}, LJ/N;->MLlibBXh(ZLjava/lang/Throwable;)V

    .line 147
    return-void
.end method

.method public static org_chromium_base_JavaExceptionReporter_reportJavaStackTrace(Ljava/lang/String;)V
    .locals 0
    .param p0, "stackTrace"    # Ljava/lang/String;

    .line 150
    invoke-static {p0}, LJ/N;->MmS4zlEt(Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public static org_chromium_base_JavaHandlerThread_initializeThread(JJ)V
    .locals 0
    .param p0, "nativeJavaHandlerThread"    # J
    .param p2, "nativeEvent"    # J

    .line 153
    invoke-static {p0, p1, p2, p3}, LJ/N;->MJcct7gJ(JJ)V

    .line 154
    return-void
.end method

.method public static org_chromium_base_JavaHandlerThread_onLooperStopped(J)V
    .locals 0
    .param p0, "nativeJavaHandlerThread"    # J

    .line 157
    invoke-static {p0, p1}, LJ/N;->MYwg$x8E(J)V

    .line 158
    return-void
.end method

.method public static org_chromium_base_MemoryPressureListener_onMemoryPressure(I)V
    .locals 0
    .param p0, "pressure"    # I

    .line 160
    invoke-static {p0}, LJ/N;->MZJzyjAa(I)V

    .line 161
    return-void
.end method

.method public static org_chromium_base_PathService_override(ILjava/lang/String;)V
    .locals 0
    .param p0, "what"    # I
    .param p1, "path"    # Ljava/lang/String;

    .line 163
    invoke-static {p0, p1}, LJ/N;->M6H_IiaF(ILjava/lang/String;)V

    .line 164
    return-void
.end method

.method public static org_chromium_base_PowerMonitor_onBatteryChargingChanged()V
    .locals 0

    .line 166
    invoke-static {}, LJ/N;->MCImhGql()V

    .line 167
    return-void
.end method

.method public static org_chromium_base_PowerMonitor_onThermalStatusChanged(I)V
    .locals 0
    .param p0, "thermalStatus"    # I

    .line 170
    invoke-static {p0}, LJ/N;->MQNVaF2F(I)V

    .line 171
    return-void
.end method

.method public static org_chromium_base_SysUtils_logPageFaultCountToTracing()V
    .locals 0

    .line 173
    invoke-static {}, LJ/N;->MOXOasS5()V

    .line 174
    return-void
.end method

.method public static org_chromium_base_TraceEvent_addViewDump(IIZZLjava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p0, "id"    # I
    .param p1, "parentId"    # I
    .param p2, "isShown"    # Z
    .param p3, "isDirty"    # Z
    .param p4, "className"    # Ljava/lang/String;
    .param p5, "resourceName"    # Ljava/lang/String;
    .param p6, "activityProtoPtr"    # J

    .line 176
    invoke-static/range {p0 .. p7}, LJ/N;->MmnP6i1r(IIZZLjava/lang/String;Ljava/lang/String;J)V

    .line 177
    return-void
.end method

.method public static org_chromium_base_TraceEvent_begin(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .line 180
    invoke-static {p0, p1}, LJ/N;->M9XfPu17(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public static org_chromium_base_TraceEvent_beginToplevel(Ljava/lang/String;)V
    .locals 0
    .param p0, "target"    # Ljava/lang/String;

    .line 184
    invoke-static {p0}, LJ/N;->M_y76mct(Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method public static org_chromium_base_TraceEvent_beginWithIntArg(Ljava/lang/String;I)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # I

    .line 188
    invoke-static {p0, p1}, LJ/N;->MfyKGfoR(Ljava/lang/String;I)V

    .line 189
    return-void
.end method

.method public static org_chromium_base_TraceEvent_end(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;
    .param p2, "flow"    # J

    .line 192
    invoke-static {p0, p1, p2, p3}, LJ/N;->Mw73xTww(Ljava/lang/String;Ljava/lang/String;J)V

    .line 193
    return-void
.end method

.method public static org_chromium_base_TraceEvent_endToplevel(Ljava/lang/String;)V
    .locals 0
    .param p0, "target"    # Ljava/lang/String;

    .line 196
    invoke-static {p0}, LJ/N;->MLJecZJ9(Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public static org_chromium_base_TraceEvent_finishAsync(Ljava/lang/String;J)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "id"    # J

    .line 200
    invoke-static {p0, p1, p2}, LJ/N;->MffNhCLU(Ljava/lang/String;J)V

    .line 201
    return-void
.end method

.method public static org_chromium_base_TraceEvent_initViewHierarchyDump(JLjava/lang/Object;)V
    .locals 0
    .param p0, "id"    # J
    .param p2, "list"    # Ljava/lang/Object;

    .line 204
    invoke-static {p0, p1, p2}, LJ/N;->Ml5G_GLY(JLjava/lang/Object;)V

    .line 205
    return-void
.end method

.method public static org_chromium_base_TraceEvent_instant(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "arg"    # Ljava/lang/String;

    .line 208
    invoke-static {p0, p1}, LJ/N;->ML40H8ed(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public static org_chromium_base_TraceEvent_instantAndroidIPC(Ljava/lang/String;J)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "durMs"    # J

    .line 212
    invoke-static {p0, p1, p2}, LJ/N;->MgOW0Igo(Ljava/lang/String;J)V

    .line 213
    return-void
.end method

.method public static org_chromium_base_TraceEvent_instantAndroidToolbar(III)V
    .locals 0
    .param p0, "blockReason"    # I
    .param p1, "allowReason"    # I
    .param p2, "snapshotDiff"    # I

    .line 216
    invoke-static {p0, p1, p2}, LJ/N;->MtoXPJsu(III)V

    .line 217
    return-void
.end method

.method public static org_chromium_base_TraceEvent_registerEnabledObserver()V
    .locals 0

    .line 220
    invoke-static {}, LJ/N;->MFFzPOVw()V

    .line 221
    return-void
.end method

.method public static org_chromium_base_TraceEvent_startActivityDump(Ljava/lang/String;J)J
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "dumpProtoPtr"    # J

    .line 224
    invoke-static {p0, p1, p2}, LJ/N;->MwX2YEhL(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_TraceEvent_startAsync(Ljava/lang/String;J)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "id"    # J

    .line 228
    invoke-static {p0, p1, p2}, LJ/N;->MHopMqLX(Ljava/lang/String;J)V

    .line 229
    return-void
.end method

.method public static org_chromium_base_TraceEvent_viewHierarchyDumpEnabled()Z
    .locals 1

    .line 232
    invoke-static {}, LJ/N;->MnfJQqTB()Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_TraceEvent_webViewStartupStage1(JJ)V
    .locals 0
    .param p0, "startTimeMs"    # J
    .param p2, "durationMs"    # J

    .line 236
    invoke-static {p0, p1, p2, p3}, LJ/N;->MkM80XCq(JJ)V

    .line 237
    return-void
.end method

.method public static org_chromium_base_TraceEvent_webViewStartupStage2(JJZ)V
    .locals 0
    .param p0, "startTimeMs"    # J
    .param p2, "durationMs"    # J
    .param p4, "isColdStartup"    # Z

    .line 240
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MaLi67Df(JJZ)V

    .line 241
    return-void
.end method

.method public static org_chromium_base_TraceEvent_webViewStartupTotalFactoryInit(JJ)V
    .locals 0
    .param p0, "startTimeMs"    # J
    .param p2, "durationMs"    # J

    .line 244
    invoke-static {p0, p1, p2, p3}, LJ/N;->MsUcOjxl(JJ)V

    .line 245
    return-void
.end method

.method public static org_chromium_base_jank_1tracker_JankMetricUMARecorder_recordJankMetrics([J[ZJJI)V
    .locals 0
    .param p0, "durationsNs"    # [J
    .param p1, "jankStatus"    # [Z
    .param p2, "reportingIntervalStartTime"    # J
    .param p4, "reportingIntervalDuration"    # J
    .param p6, "scenario"    # I

    .line 247
    invoke-static/range {p0 .. p6}, LJ/N;->MJ46uzUz([J[ZJJI)V

    .line 248
    return-void
.end method

.method public static org_chromium_base_library_1loader_LibraryLoader_libraryLoaded(I)Z
    .locals 1
    .param p0, "processType"    # I

    .line 250
    invoke-static {p0}, LJ/N;->M81WqFvs(I)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_library_1loader_LibraryPrefetcher_forkAndPrefetchNativeLibrary()V
    .locals 0

    .line 253
    invoke-static {}, LJ/N;->MUjpxN8d()V

    .line 254
    return-void
.end method

.method public static org_chromium_base_library_1loader_LibraryPrefetcher_percentageOfResidentNativeLibraryCode()I
    .locals 1

    .line 257
    invoke-static {}, LJ/N;->MdFgVRJJ()I

    move-result v0

    return v0
.end method

.method public static org_chromium_base_library_1loader_LibraryPrefetcher_periodicallyCollectResidency()V
    .locals 0

    .line 261
    invoke-static {}, LJ/N;->MLXZo1U6()V

    .line 262
    return-void
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_addActionCallbackForTesting(Ljava/lang/Object;)J
    .locals 2
    .param p0, "callback"    # Ljava/lang/Object;

    .line 264
    invoke-static {p0}, LJ/N;->MEfoV$c9_ForTesting(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_createHistogramSnapshotForTesting()J
    .locals 2

    .line 268
    invoke-static {}, LJ/N;->MlZcyPle_ForTesting()J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_destroyHistogramSnapshotForTesting(J)V
    .locals 0
    .param p0, "snapshotPtr"    # J

    .line 272
    invoke-static {p0, p1}, LJ/N;->MqHgOQAN_ForTesting(J)V

    .line 273
    return-void
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_getHistogramSamplesForTesting(Ljava/lang/String;)[J
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 276
    invoke-static {p0}, LJ/N;->MDr5ROsj_ForTesting(Ljava/lang/String;)[J

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_getHistogramTotalCountForTesting(Ljava/lang/String;J)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "snapshotPtr"    # J

    .line 280
    invoke-static {p0, p1, p2}, LJ/N;->MP$RSyC4_ForTesting(Ljava/lang/String;J)I

    move-result v0

    return v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_getHistogramValueCountForTesting(Ljava/lang/String;IJ)I
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "sample"    # I
    .param p2, "snapshotPtr"    # J

    .line 284
    invoke-static {p0, p1, p2, p3}, LJ/N;->M_1WxmXI_ForTesting(Ljava/lang/String;IJ)I

    move-result v0

    return v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_recordBooleanHistogram(Ljava/lang/String;JZ)J
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "nativeHint"    # J
    .param p3, "sample"    # Z

    .line 288
    invoke-static {p0, p1, p2, p3}, LJ/N;->MtKTTHie(Ljava/lang/String;JZ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_recordExponentialHistogram(Ljava/lang/String;JIIII)J
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "nativeHint"    # J
    .param p3, "sample"    # I
    .param p4, "min"    # I
    .param p5, "max"    # I
    .param p6, "numBuckets"    # I

    .line 292
    invoke-static/range {p0 .. p6}, LJ/N;->MILRV9Ch(Ljava/lang/String;JIIII)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_recordLinearHistogram(Ljava/lang/String;JIIII)J
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "nativeHint"    # J
    .param p3, "sample"    # I
    .param p4, "min"    # I
    .param p5, "max"    # I
    .param p6, "numBuckets"    # I

    .line 296
    invoke-static/range {p0 .. p6}, LJ/N;->M$oMD214(Ljava/lang/String;JIIII)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_recordSparseHistogram(Ljava/lang/String;JI)J
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "nativeHint"    # J
    .param p3, "sample"    # I

    .line 300
    invoke-static {p0, p1, p2, p3}, LJ/N;->Mk1ai9mx(Ljava/lang/String;JI)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_recordUserAction(Ljava/lang/String;J)V
    .locals 0
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "millisSinceEvent"    # J

    .line 304
    invoke-static {p0, p1, p2}, LJ/N;->MTDsfZGe(Ljava/lang/String;J)V

    .line 305
    return-void
.end method

.method public static org_chromium_base_metrics_NativeUmaRecorder_removeActionCallbackForTesting(J)V
    .locals 0
    .param p0, "callbackId"    # J

    .line 308
    invoke-static {p0, p1}, LJ/N;->MUBbgum1_ForTesting(J)V

    .line 309
    return-void
.end method

.method public static org_chromium_base_metrics_StatisticsRecorderAndroid_toJson(I)Ljava/lang/String;
    .locals 1
    .param p0, "verbosityLevel"    # I

    .line 311
    invoke-static {p0}, LJ/N;->MvO$oy3r(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_base_task_TaskRunnerImpl_belongsToCurrentThread(J)Z
    .locals 1
    .param p0, "nativeTaskRunnerAndroid"    # J

    .line 314
    invoke-static {p0, p1}, LJ/N;->MdFi6sVQ(J)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_base_task_TaskRunnerImpl_destroy(J)V
    .locals 0
    .param p0, "nativeTaskRunnerAndroid"    # J

    .line 318
    invoke-static {p0, p1}, LJ/N;->MERCiIV8(J)V

    .line 319
    return-void
.end method

.method public static org_chromium_base_task_TaskRunnerImpl_init(II)J
    .locals 2
    .param p0, "taskRunnerType"    # I
    .param p1, "taskTraits"    # I

    .line 322
    invoke-static {p0, p1}, LJ/N;->M5_IQXaH(II)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_base_task_TaskRunnerImpl_postDelayedTask(JLjava/lang/Object;JLjava/lang/String;)V
    .locals 0
    .param p0, "nativeTaskRunnerAndroid"    # J
    .param p2, "task"    # Ljava/lang/Object;
    .param p3, "delay"    # J
    .param p5, "runnableClassName"    # Ljava/lang/String;

    .line 326
    invoke-static/range {p0 .. p5}, LJ/N;->MGnQU$47(JLjava/lang/Object;JLjava/lang/String;)V

    .line 327
    return-void
.end method

.method public static org_chromium_net_GURLUtils_getOrigin(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "url"    # Ljava/lang/String;

    .line 329
    invoke-static {p0}, LJ/N;->MpCt7siL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_net_HttpNegotiateAuthenticator_setResult(JLjava/lang/Object;ILjava/lang/String;)V
    .locals 0
    .param p0, "nativeJavaNegotiateResultWrapper"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "status"    # I
    .param p4, "authToken"    # Ljava/lang/String;

    .line 332
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->M0s8NeYn(JLjava/lang/Object;ILjava/lang/String;)V

    .line 333
    return-void
.end method

.method public static org_chromium_net_HttpUtil_isAllowedHeader(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "headerName"    # Ljava/lang/String;
    .param p1, "headerValue"    # Ljava/lang/String;

    .line 335
    invoke-static {p0, p1}, LJ/N;->MorcXgQd(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_NetworkActiveNotifier_notifyOfDefaultNetworkActive(J)V
    .locals 0
    .param p0, "nativePtr"    # J

    .line 338
    invoke-static {p0, p1}, LJ/N;->MSZPA7qE(J)V

    .line 339
    return-void
.end method

.method public static org_chromium_net_NetworkChangeNotifier_notifyConnectionCostChanged(JLjava/lang/Object;I)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "newConnectionCost"    # I

    .line 341
    invoke-static {p0, p1, p2, p3}, LJ/N;->Mg0W7eRL(JLjava/lang/Object;I)V

    .line 342
    return-void
.end method

.method public static org_chromium_net_NetworkChangeNotifier_notifyConnectionTypeChanged(JLjava/lang/Object;IJ)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "newConnectionType"    # I
    .param p4, "defaultNetId"    # J

    .line 345
    invoke-static/range {p0 .. p5}, LJ/N;->MbPIImnU(JLjava/lang/Object;IJ)V

    .line 346
    return-void
.end method

.method public static org_chromium_net_NetworkChangeNotifier_notifyMaxBandwidthChanged(JLjava/lang/Object;I)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "subType"    # I

    .line 349
    invoke-static {p0, p1, p2, p3}, LJ/N;->Mt26m31j(JLjava/lang/Object;I)V

    .line 350
    return-void
.end method

.method public static org_chromium_net_NetworkChangeNotifier_notifyOfNetworkConnect(JLjava/lang/Object;JI)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "netId"    # J
    .param p5, "connectionType"    # I

    .line 353
    invoke-static/range {p0 .. p5}, LJ/N;->MBT1i5cd(JLjava/lang/Object;JI)V

    .line 354
    return-void
.end method

.method public static org_chromium_net_NetworkChangeNotifier_notifyOfNetworkDisconnect(JLjava/lang/Object;J)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "netId"    # J

    .line 357
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MDpuHJTB(JLjava/lang/Object;J)V

    .line 358
    return-void
.end method

.method public static org_chromium_net_NetworkChangeNotifier_notifyOfNetworkSoonToDisconnect(JLjava/lang/Object;J)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "netId"    # J

    .line 361
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MiJIMrTb(JLjava/lang/Object;J)V

    .line 362
    return-void
.end method

.method public static org_chromium_net_NetworkChangeNotifier_notifyPurgeActiveNetworkList(JLjava/lang/Object;[J)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "activeNetIds"    # [J

    .line 365
    invoke-static {p0, p1, p2, p3}, LJ/N;->MpF$179U(JLjava/lang/Object;[J)V

    .line 366
    return-void
.end method

.method public static org_chromium_net_ProxyChangeListener_proxySettingsChanged(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 368
    invoke-static {p0, p1, p2}, LJ/N;->MCIk73GZ(JLjava/lang/Object;)V

    .line 369
    return-void
.end method

.method public static org_chromium_net_ProxyChangeListener_proxySettingsChangedTo(JLjava/lang/Object;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "host"    # Ljava/lang/String;
    .param p4, "port"    # I
    .param p5, "pacUrl"    # Ljava/lang/String;
    .param p6, "exclusionList"    # [Ljava/lang/String;

    .line 372
    invoke-static/range {p0 .. p6}, LJ/N;->MyoFZt$2(JLjava/lang/Object;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;)V

    .line 373
    return-void
.end method

.method public static org_chromium_net_X509Util_notifyClientCertStoreChanged()V
    .locals 0

    .line 375
    invoke-static {}, LJ/N;->MJdorYDE()V

    .line 376
    return-void
.end method

.method public static org_chromium_net_X509Util_notifyTrustStoreChanged()V
    .locals 0

    .line 379
    invoke-static {}, LJ/N;->M6C2IQIc()V

    .line 380
    return-void
.end method

.method public static org_chromium_net_impl_CronetBidirectionalStream_createBidirectionalStream(Ljava/lang/Object;JZZIZIJ)J
    .locals 2
    .param p0, "caller"    # Ljava/lang/Object;
    .param p1, "urlRequestContextAdapter"    # J
    .param p3, "sendRequestHeadersAutomatically"    # Z
    .param p4, "trafficStatsTagSet"    # Z
    .param p5, "trafficStatsTag"    # I
    .param p6, "trafficStatsUidSet"    # Z
    .param p7, "trafficStatsUid"    # I
    .param p8, "networkHandle"    # J

    .line 382
    invoke-static/range {p0 .. p9}, LJ/N;->MqTDYvZd(Ljava/lang/Object;JZZIZIJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_net_impl_CronetBidirectionalStream_destroy(JLjava/lang/Object;Z)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "sendOnCanceled"    # Z

    .line 386
    invoke-static {p0, p1, p2, p3}, LJ/N;->MS2l1kNx(JLjava/lang/Object;Z)V

    .line 387
    return-void
.end method

.method public static org_chromium_net_impl_CronetBidirectionalStream_readData(JLjava/lang/Object;Ljava/lang/Object;II)Z
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "byteBuffer"    # Ljava/lang/Object;
    .param p4, "position"    # I
    .param p5, "limit"    # I

    .line 390
    invoke-static/range {p0 .. p5}, LJ/N;->Md_rPmgC(JLjava/lang/Object;Ljava/lang/Object;II)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetBidirectionalStream_sendRequestHeaders(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 394
    invoke-static {p0, p1, p2}, LJ/N;->MGLIR7Sc(JLjava/lang/Object;)V

    .line 395
    return-void
.end method

.method public static org_chromium_net_impl_CronetBidirectionalStream_start(JLjava/lang/Object;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;Z)I
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "priority"    # I
    .param p5, "method"    # Ljava/lang/String;
    .param p6, "headers"    # [Ljava/lang/String;
    .param p7, "endOfStream"    # Z

    .line 398
    invoke-static/range {p0 .. p7}, LJ/N;->McDUim_I(JLjava/lang/Object;Ljava/lang/String;ILjava/lang/String;[Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetBidirectionalStream_writevData(JLjava/lang/Object;[Ljava/lang/Object;[I[IZ)Z
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "buffers"    # [Ljava/lang/Object;
    .param p4, "positions"    # [I
    .param p5, "limits"    # [I
    .param p6, "endOfStream"    # Z

    .line 402
    invoke-static/range {p0 .. p6}, LJ/N;->MwJCBTMQ(JLjava/lang/Object;[Ljava/lang/Object;[I[IZ)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetLibraryLoader_cronetInitOnInitThread()V
    .locals 0

    .line 405
    invoke-static {}, LJ/N;->MROCxiBo()V

    .line 406
    return-void
.end method

.method public static org_chromium_net_impl_CronetLibraryLoader_getCronetVersion()Ljava/lang/String;
    .locals 1

    .line 409
    invoke-static {}, LJ/N;->M6xubM8G()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_net_impl_CronetLibraryLoader_setMinLogLevel(I)V
    .locals 0
    .param p0, "loggingLevel"    # I

    .line 413
    invoke-static {p0}, LJ/N;->Mrxu2pQS(I)V

    .line 414
    return-void
.end method

.method public static org_chromium_net_impl_CronetUploadDataStream_attachUploadDataToRequest(Ljava/lang/Object;JJ)J
    .locals 2
    .param p0, "caller"    # Ljava/lang/Object;
    .param p1, "urlRequestAdapter"    # J
    .param p3, "length"    # J

    .line 416
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MA4X1aZa(Ljava/lang/Object;JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_net_impl_CronetUploadDataStream_createAdapterForTesting(Ljava/lang/Object;)J
    .locals 2
    .param p0, "caller"    # Ljava/lang/Object;

    .line 420
    invoke-static {p0}, LJ/N;->MnDEFloP_ForTesting(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_net_impl_CronetUploadDataStream_createUploadDataStreamForTesting(Ljava/lang/Object;JJ)J
    .locals 2
    .param p0, "caller"    # Ljava/lang/Object;
    .param p1, "length"    # J
    .param p3, "adapter"    # J

    .line 424
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MymnNC4__ForTesting(Ljava/lang/Object;JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_net_impl_CronetUploadDataStream_destroy(J)V
    .locals 0
    .param p0, "nativePtr"    # J

    .line 428
    invoke-static {p0, p1}, LJ/N;->MMW1G0N1(J)V

    .line 429
    return-void
.end method

.method public static org_chromium_net_impl_CronetUploadDataStream_onReadSucceeded(JLjava/lang/Object;IZ)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "bytesRead"    # I
    .param p4, "finalChunk"    # Z

    .line 432
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MpWH3VIr(JLjava/lang/Object;IZ)V

    .line 433
    return-void
.end method

.method public static org_chromium_net_impl_CronetUploadDataStream_onRewindSucceeded(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 436
    invoke-static {p0, p1, p2}, LJ/N;->MFpRjSMv(JLjava/lang/Object;)V

    .line 437
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_addPkp(JLjava/lang/String;[[BZJ)V
    .locals 0
    .param p0, "urlRequestContextConfig"    # J
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "hashes"    # [[B
    .param p4, "includeSubdomains"    # Z
    .param p5, "expirationTime"    # J

    .line 470
    invoke-static/range {p0 .. p6}, LJ/N;->Muq3ic6p(JLjava/lang/String;[[BZJ)V

    .line 471
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_addQuicHint(JLjava/lang/String;II)V
    .locals 0
    .param p0, "urlRequestContextConfig"    # J
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "alternatePort"    # I

    .line 474
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MyRIv1Ij(JLjava/lang/String;II)V

    .line 475
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_configureNetworkQualityEstimatorForTesting(JLjava/lang/Object;ZZZ)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "useLocalHostRequests"    # Z
    .param p4, "useSmallerResponses"    # Z
    .param p5, "disableOfflineCheck"    # Z

    .line 478
    invoke-static/range {p0 .. p5}, LJ/N;->M6sIJDgy_ForTesting(JLjava/lang/Object;ZZZ)V

    .line 479
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_createRequestContextAdapter(J)J
    .locals 2
    .param p0, "urlRequestContextConfig"    # J

    .line 482
    invoke-static {p0, p1}, LJ/N;->M135Cu0D(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_createRequestContextConfig([B)J
    .locals 2
    .param p0, "serializedRequestContextConfigOptions"    # [B

    .line 486
    invoke-static {p0}, LJ/N;->MB3ntV7V([B)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_destroy(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 490
    invoke-static {p0, p1, p2}, LJ/N;->MeBvNXm5(JLjava/lang/Object;)V

    .line 491
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_getEnableTelemetry(JLjava/lang/Object;)Z
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 494
    invoke-static {p0, p1, p2}, LJ/N;->MjAZnhE4(JLjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_getHistogramDeltas()[B
    .locals 1

    .line 498
    invoke-static {}, LJ/N;->M7CZ_Klr()[B

    move-result-object v0

    return-object v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_initRequestContextOnInitThread(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 502
    invoke-static {p0, p1, p2}, LJ/N;->M6Dz0nZ5(JLjava/lang/Object;)V

    .line 503
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_provideRTTObservations(JLjava/lang/Object;Z)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "should"    # Z

    .line 506
    invoke-static {p0, p1, p2, p3}, LJ/N;->MpnFLFF2(JLjava/lang/Object;Z)V

    .line 507
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_provideThroughputObservations(JLjava/lang/Object;Z)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "should"    # Z

    .line 510
    invoke-static {p0, p1, p2, p3}, LJ/N;->MnPUhNKP(JLjava/lang/Object;Z)V

    .line 511
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_startNetLogToDisk(JLjava/lang/Object;Ljava/lang/String;ZI)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "dirPath"    # Ljava/lang/String;
    .param p4, "logAll"    # Z
    .param p5, "maxSize"    # I

    .line 514
    invoke-static/range {p0 .. p5}, LJ/N;->MTULt02u(JLjava/lang/Object;Ljava/lang/String;ZI)V

    .line 515
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_startNetLogToFile(JLjava/lang/Object;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "fileName"    # Ljava/lang/String;
    .param p4, "logAll"    # Z

    .line 518
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MgwJQAH1(JLjava/lang/Object;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequestContext_stopNetLog(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 522
    invoke-static {p0, p1, p2}, LJ/N;->MKFm_qQ7(JLjava/lang/Object;)V

    .line 523
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_addRequestHeader(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .line 439
    invoke-static {p0, p1, p2, p3, p4}, LJ/N;->MvHusd1J(JLjava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_createRequestAdapter(Ljava/lang/Object;JLjava/lang/String;IZZZIZIIJ)J
    .locals 2
    .param p0, "caller"    # Ljava/lang/Object;
    .param p1, "urlRequestContextAdapter"    # J
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "priority"    # I
    .param p5, "disableCache"    # Z
    .param p6, "disableConnectionMigration"    # Z
    .param p7, "trafficStatsTagSet"    # Z
    .param p8, "trafficStatsTag"    # I
    .param p9, "trafficStatsUidSet"    # Z
    .param p10, "trafficStatsUid"    # I
    .param p11, "idempotency"    # I
    .param p12, "networkHandle"    # J

    .line 443
    invoke-static/range {p0 .. p13}, LJ/N;->MuOIsMvf(Ljava/lang/Object;JLjava/lang/String;IZZZIZIIJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_destroy(JLjava/lang/Object;Z)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "sendOnCanceled"    # Z

    .line 447
    invoke-static {p0, p1, p2, p3}, LJ/N;->M4znfYdB(JLjava/lang/Object;Z)V

    .line 448
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_followDeferredRedirect(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 451
    invoke-static {p0, p1, p2}, LJ/N;->Mhp54Oqs(JLjava/lang/Object;)V

    .line 452
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_getStatus(JLjava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "listener"    # Ljava/lang/Object;

    .line 455
    invoke-static {p0, p1, p2, p3}, LJ/N;->MgIIMpT9(JLjava/lang/Object;Ljava/lang/Object;)V

    .line 456
    return-void
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_readData(JLjava/lang/Object;Ljava/lang/Object;II)Z
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "byteBuffer"    # Ljava/lang/Object;
    .param p4, "position"    # I
    .param p5, "capacity"    # I

    .line 459
    invoke-static/range {p0 .. p5}, LJ/N;->MfCxA8r3(JLjava/lang/Object;Ljava/lang/Object;II)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_setHttpMethod(JLjava/lang/Object;Ljava/lang/String;)Z
    .locals 1
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;
    .param p3, "method"    # Ljava/lang/String;

    .line 463
    invoke-static {p0, p1, p2, p3}, LJ/N;->M51RPBJe(JLjava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static org_chromium_net_impl_CronetUrlRequest_start(JLjava/lang/Object;)V
    .locals 0
    .param p0, "nativePtr"    # J
    .param p2, "caller"    # Ljava/lang/Object;

    .line 467
    invoke-static {p0, p1, p2}, LJ/N;->MabZ5m6r(JLjava/lang/Object;)V

    .line 468
    return-void
.end method
