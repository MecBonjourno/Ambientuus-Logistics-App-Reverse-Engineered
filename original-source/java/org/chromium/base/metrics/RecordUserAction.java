package org.chromium.base.metrics;

import org.chromium.base.TimeUtils;

/* loaded from: classes17.dex */
public class RecordUserAction {
    public static void record(String action) {
        UmaRecorderHolder.get().recordUserAction(action, TimeUtils.elapsedRealtimeMillis());
    }
}
