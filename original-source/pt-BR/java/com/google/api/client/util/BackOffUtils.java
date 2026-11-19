package com.google.api.client.util;

import java.io.IOException;

/* carregado de: classes16.dex */
public final class BackOffUtils {
    public static boolean next(Sleeper sleeper, BackOff backOff) throws InterruptedException, IOException {
        long backOffTime = backOff.nextBackOffMillis();
        if (backOffTime == -1) {
            return false;
        }
        sleeper.sleep(backOffTime);
        return true;
    }

    private BackOffUtils() {
    }
}
