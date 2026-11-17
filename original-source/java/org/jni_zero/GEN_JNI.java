package org.jni_zero;

import J.N;

/* loaded from: classes17.dex */
public class GEN_JNI {
    public static final boolean REQUIRE_MOCK = false;
    public static final boolean TESTING_ENABLED = false;

    public static void org_chromium_base_ApplicationStatus_onApplicationStateChange(int newState) {
        N.MiAkQ_SU(newState);
    }

    public static long org_chromium_base_BaseFeatureMap_getNativeMap() {
        return N.MshdYEWu();
    }

    public static void org_chromium_base_CommandLine_appendSwitch(String switchString) {
        N.M5K_ewhl(switchString);
    }

    public static void org_chromium_base_CommandLine_appendSwitchWithValue(String switchString, String value) {
        N.MUoYiNbY(switchString, value);
    }

    public static void org_chromium_base_CommandLine_appendSwitchesAndArguments(String[] array) {
        N.MPquHBNa(array);
    }

    public static String org_chromium_base_CommandLine_getSwitchValue(String switchString) {
        return N.MZJ2lrZY(switchString);
    }

    public static String[] org_chromium_base_CommandLine_getSwitchesFlattened() {
        return N.MHzche6O();
    }

    public static boolean org_chromium_base_CommandLine_hasSwitch(String switchString) {
        return N.MsCvypjU(switchString);
    }

    public static void org_chromium_base_CommandLine_init(String[] args) {
        N.MDkrKi31(args);
    }

    public static void org_chromium_base_CommandLine_removeSwitch(String switchString) {
        N.M1cMYXGO(switchString);
    }

    public static int org_chromium_base_CpuFeatures_getCoreCount() {
        return N.MOiBJ1qS();
    }

    public static long org_chromium_base_CpuFeatures_getCpuFeatures() {
        return N.ML0T8q1U();
    }

    public static void org_chromium_base_EarlyTraceEvent_recordEarlyAsyncBeginEvent(String name, long id, long timeNanos) {
        N.M_Gv8TwM(name, id, timeNanos);
    }

    public static void org_chromium_base_EarlyTraceEvent_recordEarlyAsyncEndEvent(long id, long timeNanos) {
        N.MrKsqeCD(id, timeNanos);
    }

    public static void org_chromium_base_EarlyTraceEvent_recordEarlyBeginEvent(String name, long timeNanos, int threadId, long threadMillis) {
        N.MrWG2uUW(name, timeNanos, threadId, threadMillis);
    }

    public static void org_chromium_base_EarlyTraceEvent_recordEarlyEndEvent(String name, long timeNanos, int threadId, long threadMillis) {
        N.MmyrhqXB(name, timeNanos, threadId, threadMillis);
    }

    public static void org_chromium_base_EarlyTraceEvent_recordEarlyToplevelBeginEvent(String name, long timeNanos, int threadId, long threadMillis) {
        N.M7UXCmoq(name, timeNanos, threadId, threadMillis);
    }

    public static void org_chromium_base_EarlyTraceEvent_recordEarlyToplevelEndEvent(String name, long timeNanos, int threadId, long threadMillis) {
        N.MRlw2LEn(name, timeNanos, threadId, threadMillis);
    }

    public static boolean org_chromium_base_FeatureList_isInitialized() {
        return N.MFTJCvBh();
    }

    public static String org_chromium_base_FeatureMap_getFieldTrialParamByFeature(long featureMap, String featureName, String paramName) {
        return N.MkEZDArf(featureMap, featureName, paramName);
    }

    public static boolean org_chromium_base_FeatureMap_getFieldTrialParamByFeatureAsBoolean(long featureMap, String featureName, String paramName, boolean defaultValue) {
        return N.MR5ZSvGM(featureMap, featureName, paramName, defaultValue);
    }

    public static double org_chromium_base_FeatureMap_getFieldTrialParamByFeatureAsDouble(long featureMap, String featureName, String paramName, double defaultValue) {
        return N.MVPjCt$S(featureMap, featureName, paramName, defaultValue);
    }

    public static int org_chromium_base_FeatureMap_getFieldTrialParamByFeatureAsInt(long featureMap, String featureName, String paramName, int defaultValue) {
        return N.Me$URWJx(featureMap, featureName, paramName, defaultValue);
    }

    public static String[] org_chromium_base_FeatureMap_getFlattedFieldTrialParamsForFeature(long featureMap, String featureName) {
        return N.MV_QqWU4(featureMap, featureName);
    }

    public static boolean org_chromium_base_FeatureMap_isEnabled(long featureMap, String featureName) {
        return N.M2evocmp(featureMap, featureName);
    }

    public static boolean org_chromium_base_Features_getFieldTrialParamByFeatureAsBoolean(long featurePointer, String paramName, boolean defaultValue) {
        return N.M8R55Xut(featurePointer, paramName, defaultValue);
    }

    public static String org_chromium_base_Features_getFieldTrialParamByFeatureAsString(long featurePointer, String paramName) {
        return N.M9wfStLu(featurePointer, paramName);
    }

    public static boolean org_chromium_base_Features_isEnabled(long featurePointer) {
        return N.MRiRQ_Ey(featurePointer);
    }

    public static boolean org_chromium_base_FieldTrialList_createFieldTrial(String trialName, String groupName) {
        return N.MGqzwlIM(trialName, groupName);
    }

    public static String org_chromium_base_FieldTrialList_findFullName(String trialName) {
        return N.MdC43qwX(trialName);
    }

    public static String org_chromium_base_FieldTrialList_getVariationParameter(String trialName, String parameterKey) {
        return N.MZWMOP4I(trialName, parameterKey);
    }

    public static void org_chromium_base_FieldTrialList_logActiveTrials() {
        N.MHz6Fn06();
    }

    public static boolean org_chromium_base_FieldTrialList_trialExists(String trialName) {
        return N.Mmqqda9c(trialName);
    }

    public static String org_chromium_base_FileUtils_getAbsoluteFilePath(String filePath) {
        return N.MWck3aif(filePath);
    }

    public static boolean org_chromium_base_ImportantFileWriterAndroid_writeFileAtomically(String fileName, byte[] data) {
        return N.MsOKBrZ5(fileName, data);
    }

    public static void org_chromium_base_JavaExceptionReporter_reportJavaException(boolean crashAfterReport, Throwable e) {
        N.MLlibBXh(crashAfterReport, e);
    }

    public static void org_chromium_base_JavaExceptionReporter_reportJavaStackTrace(String stackTrace) {
        N.MmS4zlEt(stackTrace);
    }

    public static void org_chromium_base_JavaHandlerThread_initializeThread(long nativeJavaHandlerThread, long nativeEvent) {
        N.MJcct7gJ(nativeJavaHandlerThread, nativeEvent);
    }

    public static void org_chromium_base_JavaHandlerThread_onLooperStopped(long nativeJavaHandlerThread) {
        N.MYwg$x8E(nativeJavaHandlerThread);
    }

    public static void org_chromium_base_MemoryPressureListener_onMemoryPressure(int pressure) {
        N.MZJzyjAa(pressure);
    }

    public static void org_chromium_base_PathService_override(int what, String path) {
        N.M6H_IiaF(what, path);
    }

    public static void org_chromium_base_PowerMonitor_onBatteryChargingChanged() {
        N.MCImhGql();
    }

    public static void org_chromium_base_PowerMonitor_onThermalStatusChanged(int thermalStatus) {
        N.MQNVaF2F(thermalStatus);
    }

    public static void org_chromium_base_SysUtils_logPageFaultCountToTracing() {
        N.MOXOasS5();
    }

    public static void org_chromium_base_TraceEvent_addViewDump(int id, int parentId, boolean isShown, boolean isDirty, String className, String resourceName, long activityProtoPtr) {
        N.MmnP6i1r(id, parentId, isShown, isDirty, className, resourceName, activityProtoPtr);
    }

    public static void org_chromium_base_TraceEvent_begin(String name, String arg) {
        N.M9XfPu17(name, arg);
    }

    public static void org_chromium_base_TraceEvent_beginToplevel(String target) {
        N.M_y76mct(target);
    }

    public static void org_chromium_base_TraceEvent_beginWithIntArg(String name, int arg) {
        N.MfyKGfoR(name, arg);
    }

    public static void org_chromium_base_TraceEvent_end(String name, String arg, long flow) {
        N.Mw73xTww(name, arg, flow);
    }

    public static void org_chromium_base_TraceEvent_endToplevel(String target) {
        N.MLJecZJ9(target);
    }

    public static void org_chromium_base_TraceEvent_finishAsync(String name, long id) {
        N.MffNhCLU(name, id);
    }

    public static void org_chromium_base_TraceEvent_initViewHierarchyDump(long id, Object list) {
        N.Ml5G_GLY(id, list);
    }

    public static void org_chromium_base_TraceEvent_instant(String name, String arg) {
        N.ML40H8ed(name, arg);
    }

    public static void org_chromium_base_TraceEvent_instantAndroidIPC(String name, long durMs) {
        N.MgOW0Igo(name, durMs);
    }

    public static void org_chromium_base_TraceEvent_instantAndroidToolbar(int blockReason, int allowReason, int snapshotDiff) {
        N.MtoXPJsu(blockReason, allowReason, snapshotDiff);
    }

    public static void org_chromium_base_TraceEvent_registerEnabledObserver() {
        N.MFFzPOVw();
    }

    public static long org_chromium_base_TraceEvent_startActivityDump(String name, long dumpProtoPtr) {
        return N.MwX2YEhL(name, dumpProtoPtr);
    }

    public static void org_chromium_base_TraceEvent_startAsync(String name, long id) {
        N.MHopMqLX(name, id);
    }

    public static boolean org_chromium_base_TraceEvent_viewHierarchyDumpEnabled() {
        return N.MnfJQqTB();
    }

    public static void org_chromium_base_TraceEvent_webViewStartupStage1(long startTimeMs, long durationMs) {
        N.MkM80XCq(startTimeMs, durationMs);
    }

    public static void org_chromium_base_TraceEvent_webViewStartupStage2(long startTimeMs, long durationMs, boolean isColdStartup) {
        N.MaLi67Df(startTimeMs, durationMs, isColdStartup);
    }

    public static void org_chromium_base_TraceEvent_webViewStartupTotalFactoryInit(long startTimeMs, long durationMs) {
        N.MsUcOjxl(startTimeMs, durationMs);
    }

    public static void org_chromium_base_jank_1tracker_JankMetricUMARecorder_recordJankMetrics(long[] durationsNs, boolean[] jankStatus, long reportingIntervalStartTime, long reportingIntervalDuration, int scenario) {
        N.MJ46uzUz(durationsNs, jankStatus, reportingIntervalStartTime, reportingIntervalDuration, scenario);
    }

    public static boolean org_chromium_base_library_1loader_LibraryLoader_libraryLoaded(int processType) {
        return N.M81WqFvs(processType);
    }

    public static void org_chromium_base_library_1loader_LibraryPrefetcher_forkAndPrefetchNativeLibrary() {
        N.MUjpxN8d();
    }

    public static int org_chromium_base_library_1loader_LibraryPrefetcher_percentageOfResidentNativeLibraryCode() {
        return N.MdFgVRJJ();
    }

    public static void org_chromium_base_library_1loader_LibraryPrefetcher_periodicallyCollectResidency() {
        N.MLXZo1U6();
    }

    public static long org_chromium_base_metrics_NativeUmaRecorder_addActionCallbackForTesting(Object callback) {
        return N.MEfoV$c9_ForTesting(callback);
    }

    public static long org_chromium_base_metrics_NativeUmaRecorder_createHistogramSnapshotForTesting() {
        return N.MlZcyPle_ForTesting();
    }

    public static void org_chromium_base_metrics_NativeUmaRecorder_destroyHistogramSnapshotForTesting(long snapshotPtr) {
        N.MqHgOQAN_ForTesting(snapshotPtr);
    }

    public static long[] org_chromium_base_metrics_NativeUmaRecorder_getHistogramSamplesForTesting(String name) {
        return N.MDr5ROsj_ForTesting(name);
    }

    public static int org_chromium_base_metrics_NativeUmaRecorder_getHistogramTotalCountForTesting(String name, long snapshotPtr) {
        return N.MP$RSyC4_ForTesting(name, snapshotPtr);
    }

    public static int org_chromium_base_metrics_NativeUmaRecorder_getHistogramValueCountForTesting(String name, int sample, long snapshotPtr) {
        return N.M_1WxmXI_ForTesting(name, sample, snapshotPtr);
    }

    public static long org_chromium_base_metrics_NativeUmaRecorder_recordBooleanHistogram(String name, long nativeHint, boolean sample) {
        return N.MtKTTHie(name, nativeHint, sample);
    }

    public static long org_chromium_base_metrics_NativeUmaRecorder_recordExponentialHistogram(String name, long nativeHint, int sample, int min, int max, int numBuckets) {
        return N.MILRV9Ch(name, nativeHint, sample, min, max, numBuckets);
    }

    public static long org_chromium_base_metrics_NativeUmaRecorder_recordLinearHistogram(String name, long nativeHint, int sample, int min, int max, int numBuckets) {
        return N.M$oMD214(name, nativeHint, sample, min, max, numBuckets);
    }

    public static long org_chromium_base_metrics_NativeUmaRecorder_recordSparseHistogram(String name, long nativeHint, int sample) {
        return N.Mk1ai9mx(name, nativeHint, sample);
    }

    public static void org_chromium_base_metrics_NativeUmaRecorder_recordUserAction(String name, long millisSinceEvent) {
        N.MTDsfZGe(name, millisSinceEvent);
    }

    public static void org_chromium_base_metrics_NativeUmaRecorder_removeActionCallbackForTesting(long callbackId) {
        N.MUBbgum1_ForTesting(callbackId);
    }

    public static String org_chromium_base_metrics_StatisticsRecorderAndroid_toJson(int verbosityLevel) {
        return N.MvO$oy3r(verbosityLevel);
    }

    public static boolean org_chromium_base_task_TaskRunnerImpl_belongsToCurrentThread(long nativeTaskRunnerAndroid) {
        return N.MdFi6sVQ(nativeTaskRunnerAndroid);
    }

    public static void org_chromium_base_task_TaskRunnerImpl_destroy(long nativeTaskRunnerAndroid) {
        N.MERCiIV8(nativeTaskRunnerAndroid);
    }

    public static long org_chromium_base_task_TaskRunnerImpl_init(int taskRunnerType, int taskTraits) {
        return N.M5_IQXaH(taskRunnerType, taskTraits);
    }

    public static void org_chromium_base_task_TaskRunnerImpl_postDelayedTask(long nativeTaskRunnerAndroid, Object task, long delay, String runnableClassName) {
        N.MGnQU$47(nativeTaskRunnerAndroid, task, delay, runnableClassName);
    }

    public static String org_chromium_net_GURLUtils_getOrigin(String url) {
        return N.MpCt7siL(url);
    }

    public static void org_chromium_net_HttpNegotiateAuthenticator_setResult(long nativeJavaNegotiateResultWrapper, Object caller, int status, String authToken) {
        N.M0s8NeYn(nativeJavaNegotiateResultWrapper, caller, status, authToken);
    }

    public static boolean org_chromium_net_HttpUtil_isAllowedHeader(String headerName, String headerValue) {
        return N.MorcXgQd(headerName, headerValue);
    }

    public static void org_chromium_net_NetworkActiveNotifier_notifyOfDefaultNetworkActive(long nativePtr) {
        N.MSZPA7qE(nativePtr);
    }

    public static void org_chromium_net_NetworkChangeNotifier_notifyConnectionCostChanged(long nativePtr, Object caller, int newConnectionCost) {
        N.Mg0W7eRL(nativePtr, caller, newConnectionCost);
    }

    public static void org_chromium_net_NetworkChangeNotifier_notifyConnectionTypeChanged(long nativePtr, Object caller, int newConnectionType, long defaultNetId) {
        N.MbPIImnU(nativePtr, caller, newConnectionType, defaultNetId);
    }

    public static void org_chromium_net_NetworkChangeNotifier_notifyMaxBandwidthChanged(long nativePtr, Object caller, int subType) {
        N.Mt26m31j(nativePtr, caller, subType);
    }

    public static void org_chromium_net_NetworkChangeNotifier_notifyOfNetworkConnect(long nativePtr, Object caller, long netId, int connectionType) {
        N.MBT1i5cd(nativePtr, caller, netId, connectionType);
    }

    public static void org_chromium_net_NetworkChangeNotifier_notifyOfNetworkDisconnect(long nativePtr, Object caller, long netId) {
        N.MDpuHJTB(nativePtr, caller, netId);
    }

    public static void org_chromium_net_NetworkChangeNotifier_notifyOfNetworkSoonToDisconnect(long nativePtr, Object caller, long netId) {
        N.MiJIMrTb(nativePtr, caller, netId);
    }

    public static void org_chromium_net_NetworkChangeNotifier_notifyPurgeActiveNetworkList(long nativePtr, Object caller, long[] activeNetIds) {
        N.MpF$179U(nativePtr, caller, activeNetIds);
    }

    public static void org_chromium_net_ProxyChangeListener_proxySettingsChanged(long nativePtr, Object caller) {
        N.MCIk73GZ(nativePtr, caller);
    }

    public static void org_chromium_net_ProxyChangeListener_proxySettingsChangedTo(long nativePtr, Object caller, String host, int port, String pacUrl, String[] exclusionList) {
        N.MyoFZt$2(nativePtr, caller, host, port, pacUrl, exclusionList);
    }

    public static void org_chromium_net_X509Util_notifyClientCertStoreChanged() {
        N.MJdorYDE();
    }

    public static void org_chromium_net_X509Util_notifyTrustStoreChanged() {
        N.M6C2IQIc();
    }

    public static long org_chromium_net_impl_CronetBidirectionalStream_createBidirectionalStream(Object caller, long urlRequestContextAdapter, boolean sendRequestHeadersAutomatically, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, long networkHandle) {
        return N.MqTDYvZd(caller, urlRequestContextAdapter, sendRequestHeadersAutomatically, trafficStatsTagSet, trafficStatsTag, trafficStatsUidSet, trafficStatsUid, networkHandle);
    }

    public static void org_chromium_net_impl_CronetBidirectionalStream_destroy(long nativePtr, Object caller, boolean sendOnCanceled) {
        N.MS2l1kNx(nativePtr, caller, sendOnCanceled);
    }

    public static boolean org_chromium_net_impl_CronetBidirectionalStream_readData(long nativePtr, Object caller, Object byteBuffer, int position, int limit) {
        return N.Md_rPmgC(nativePtr, caller, byteBuffer, position, limit);
    }

    public static void org_chromium_net_impl_CronetBidirectionalStream_sendRequestHeaders(long nativePtr, Object caller) {
        N.MGLIR7Sc(nativePtr, caller);
    }

    public static int org_chromium_net_impl_CronetBidirectionalStream_start(long nativePtr, Object caller, String url, int priority, String method, String[] headers, boolean endOfStream) {
        return N.McDUim_I(nativePtr, caller, url, priority, method, headers, endOfStream);
    }

    public static boolean org_chromium_net_impl_CronetBidirectionalStream_writevData(long nativePtr, Object caller, Object[] buffers, int[] positions, int[] limits, boolean endOfStream) {
        return N.MwJCBTMQ(nativePtr, caller, buffers, positions, limits, endOfStream);
    }

    public static void org_chromium_net_impl_CronetLibraryLoader_cronetInitOnInitThread() {
        N.MROCxiBo();
    }

    public static String org_chromium_net_impl_CronetLibraryLoader_getCronetVersion() {
        return N.M6xubM8G();
    }

    public static void org_chromium_net_impl_CronetLibraryLoader_setMinLogLevel(int loggingLevel) {
        N.Mrxu2pQS(loggingLevel);
    }

    public static long org_chromium_net_impl_CronetUploadDataStream_attachUploadDataToRequest(Object caller, long urlRequestAdapter, long length) {
        return N.MA4X1aZa(caller, urlRequestAdapter, length);
    }

    public static long org_chromium_net_impl_CronetUploadDataStream_createAdapterForTesting(Object caller) {
        return N.MnDEFloP_ForTesting(caller);
    }

    public static long org_chromium_net_impl_CronetUploadDataStream_createUploadDataStreamForTesting(Object caller, long length, long adapter) {
        return N.MymnNC4__ForTesting(caller, length, adapter);
    }

    public static void org_chromium_net_impl_CronetUploadDataStream_destroy(long nativePtr) {
        N.MMW1G0N1(nativePtr);
    }

    public static void org_chromium_net_impl_CronetUploadDataStream_onReadSucceeded(long nativePtr, Object caller, int bytesRead, boolean finalChunk) {
        N.MpWH3VIr(nativePtr, caller, bytesRead, finalChunk);
    }

    public static void org_chromium_net_impl_CronetUploadDataStream_onRewindSucceeded(long nativePtr, Object caller) {
        N.MFpRjSMv(nativePtr, caller);
    }

    public static boolean org_chromium_net_impl_CronetUrlRequest_addRequestHeader(long nativePtr, Object caller, String name, String value) {
        return N.MvHusd1J(nativePtr, caller, name, value);
    }

    public static long org_chromium_net_impl_CronetUrlRequest_createRequestAdapter(Object caller, long urlRequestContextAdapter, String url, int priority, boolean disableCache, boolean disableConnectionMigration, boolean trafficStatsTagSet, int trafficStatsTag, boolean trafficStatsUidSet, int trafficStatsUid, int idempotency, long networkHandle) {
        return N.MuOIsMvf(caller, urlRequestContextAdapter, url, priority, disableCache, disableConnectionMigration, trafficStatsTagSet, trafficStatsTag, trafficStatsUidSet, trafficStatsUid, idempotency, networkHandle);
    }

    public static void org_chromium_net_impl_CronetUrlRequest_destroy(long nativePtr, Object caller, boolean sendOnCanceled) {
        N.M4znfYdB(nativePtr, caller, sendOnCanceled);
    }

    public static void org_chromium_net_impl_CronetUrlRequest_followDeferredRedirect(long nativePtr, Object caller) {
        N.Mhp54Oqs(nativePtr, caller);
    }

    public static void org_chromium_net_impl_CronetUrlRequest_getStatus(long nativePtr, Object caller, Object listener) {
        N.MgIIMpT9(nativePtr, caller, listener);
    }

    public static boolean org_chromium_net_impl_CronetUrlRequest_readData(long nativePtr, Object caller, Object byteBuffer, int position, int capacity) {
        return N.MfCxA8r3(nativePtr, caller, byteBuffer, position, capacity);
    }

    public static boolean org_chromium_net_impl_CronetUrlRequest_setHttpMethod(long nativePtr, Object caller, String method) {
        return N.M51RPBJe(nativePtr, caller, method);
    }

    public static void org_chromium_net_impl_CronetUrlRequest_start(long nativePtr, Object caller) {
        N.MabZ5m6r(nativePtr, caller);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_addPkp(long urlRequestContextConfig, String host, byte[][] hashes, boolean includeSubdomains, long expirationTime) {
        N.Muq3ic6p(urlRequestContextConfig, host, hashes, includeSubdomains, expirationTime);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_addQuicHint(long urlRequestContextConfig, String host, int port, int alternatePort) {
        N.MyRIv1Ij(urlRequestContextConfig, host, port, alternatePort);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_configureNetworkQualityEstimatorForTesting(long nativePtr, Object caller, boolean useLocalHostRequests, boolean useSmallerResponses, boolean disableOfflineCheck) {
        N.M6sIJDgy_ForTesting(nativePtr, caller, useLocalHostRequests, useSmallerResponses, disableOfflineCheck);
    }

    public static long org_chromium_net_impl_CronetUrlRequestContext_createRequestContextAdapter(long urlRequestContextConfig) {
        return N.M135Cu0D(urlRequestContextConfig);
    }

    public static long org_chromium_net_impl_CronetUrlRequestContext_createRequestContextConfig(byte[] serializedRequestContextConfigOptions) {
        return N.MB3ntV7V(serializedRequestContextConfigOptions);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_destroy(long nativePtr, Object caller) {
        N.MeBvNXm5(nativePtr, caller);
    }

    public static boolean org_chromium_net_impl_CronetUrlRequestContext_getEnableTelemetry(long nativePtr, Object caller) {
        return N.MjAZnhE4(nativePtr, caller);
    }

    public static byte[] org_chromium_net_impl_CronetUrlRequestContext_getHistogramDeltas() {
        return N.M7CZ_Klr();
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_initRequestContextOnInitThread(long nativePtr, Object caller) {
        N.M6Dz0nZ5(nativePtr, caller);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_provideRTTObservations(long nativePtr, Object caller, boolean should) {
        N.MpnFLFF2(nativePtr, caller, should);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_provideThroughputObservations(long nativePtr, Object caller, boolean should) {
        N.MnPUhNKP(nativePtr, caller, should);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_startNetLogToDisk(long nativePtr, Object caller, String dirPath, boolean logAll, int maxSize) {
        N.MTULt02u(nativePtr, caller, dirPath, logAll, maxSize);
    }

    public static boolean org_chromium_net_impl_CronetUrlRequestContext_startNetLogToFile(long nativePtr, Object caller, String fileName, boolean logAll) {
        return N.MgwJQAH1(nativePtr, caller, fileName, logAll);
    }

    public static void org_chromium_net_impl_CronetUrlRequestContext_stopNetLog(long nativePtr, Object caller) {
        N.MKFm_qQ7(nativePtr, caller);
    }
}
