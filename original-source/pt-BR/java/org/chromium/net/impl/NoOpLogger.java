package org.chromium.net.impl;

import org.chromium.net.impl.CronetLogger;

/* carregado de: classes17.dex */
public final class NoOpLogger extends CronetLogger {
    @Override // org.chromium.net.impl.CronetLogger
    public void logCronetEngineCreation(int cronetEngineId, CronetLogger.CronetEngineBuilderInfo engineBuilderInfo, CronetLogger.CronetVersion version, CronetLogger.CronetSource source) {
    }

    @Override // org.chromium.net.impl.CronetLogger
    public void logCronetTrafficInfo(int cronetEngineId, CronetLogger.CronetTrafficInfo trafficInfo) {
    }
}
