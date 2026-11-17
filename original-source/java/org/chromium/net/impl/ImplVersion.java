package org.chromium.net.impl;

/* loaded from: classes17.dex */
public class ImplVersion {
    private static final int API_LEVEL = 26;
    private static final String CRONET_VERSION = "119.0.6045.31";
    private static final String LAST_CHANGE = "c76b9b6a188d43a09957c13e835bc6a2fe7ac772-refs/branch-heads/6045@{#604}";

    private ImplVersion() {
    }

    public static String getCronetVersionWithLastChange() {
        return "119.0.6045.31@" + LAST_CHANGE.substring(0, 8);
    }

    public static int getApiLevel() {
        return 26;
    }

    public static String getCronetVersion() {
        return CRONET_VERSION;
    }

    public static String getLastChange() {
        return LAST_CHANGE;
    }
}
