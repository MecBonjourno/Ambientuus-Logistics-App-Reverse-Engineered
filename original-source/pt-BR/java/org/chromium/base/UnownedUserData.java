package org.chromium.base;

/* carregado de: classes17.dex */
public interface UnownedUserData {
    boolean informOnDetachmentFromHost();

    void onDetachedFromHost(UnownedUserDataHost unownedUserDataHost);

    /* renomeado de: org.chromium.base.UnownedUserData$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static void $default$onDetachedFromHost(UnownedUserData _this, UnownedUserDataHost host) {
        }

        public static boolean $default$informOnDetachmentFromHost(UnownedUserData _this) {
            return true;
        }
    }
}
