package org.chromium.base;

/* loaded from: classes17.dex */
public interface UnownedUserData {
    boolean informOnDetachmentFromHost();

    void onDetachedFromHost(UnownedUserDataHost unownedUserDataHost);

    /* renamed from: org.chromium.base.UnownedUserData$-CC, reason: invalid class name */
    public final /* synthetic */ class CC {
        public static void $default$onDetachedFromHost(UnownedUserData _this, UnownedUserDataHost host) {
        }

        public static boolean $default$informOnDetachmentFromHost(UnownedUserData _this) {
            return true;
        }
    }
}
