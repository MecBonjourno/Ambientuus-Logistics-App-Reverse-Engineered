package org.chromium.base;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import org.chromium.build.BuildConfig;

/* loaded from: classes17.dex */
public class ResettersForTesting {
    private static final LinkedHashSet<Runnable> sClassResetters;
    private static boolean sMethodMode;
    private static final LinkedHashSet<Runnable> sMethodResetters;

    static {
        sClassResetters = BuildConfig.IS_FOR_TEST ? new LinkedHashSet<>() : null;
        sMethodResetters = BuildConfig.IS_FOR_TEST ? new LinkedHashSet<>() : null;
    }

    public static void register(Runnable runnable) {
        if (!BuildConfig.IS_FOR_TEST) {
            return;
        }
        if (sMethodMode) {
            sMethodResetters.add(runnable);
        } else {
            sClassResetters.add(runnable);
        }
    }

    private static void flushResetters(LinkedHashSet activeSet) {
        ArrayList<Runnable> resetters = new ArrayList<>(activeSet);
        activeSet.clear();
        Collections.reverse(resetters);
        Iterator<Runnable> it = resetters.iterator();
        while (it.hasNext()) {
            Runnable resetter = it.next();
            resetter.run();
        }
    }

    public static void onAfterMethod() {
        flushResetters(sMethodResetters);
    }

    public static void onAfterClass() {
        flushResetters(sClassResetters);
        sMethodMode = false;
    }

    public static void setMethodMode() {
        sMethodMode = true;
    }
}
