package org.chromium.net;

import org.chromium.net.HttpUtil;
import org.jni_zero.GEN_JNI;
import org.jni_zero.JniStaticTestMocker;
import org.jni_zero.NativeLibraryLoadedStatus;

/* carregado de: classes17.dex */
class HttpUtilJni implements HttpUtil.Natives {
    public static final JniStaticTestMocker<HttpUtil.Natives> TEST_HOOKS = new JniStaticTestMocker<HttpUtil.Natives>() { // da classe: org.chromium.net.HttpUtilJni.1
        @Override // org.jni_zero.JniStaticTestMocker
        public void setInstanceForTesting(HttpUtil.Natives instance) {
            if (!GEN_JNI.TESTING_ENABLED) {
                throw new RuntimeException("Tried to set a JNI mock when mocks aren't enabled!");
            }
            HttpUtilJni.testInstance = instance;
        }
    };
    private static HttpUtil.Natives testInstance;

    HttpUtilJni() {
    }

    @Override // org.chromium.net.HttpUtil.Natives
    public boolean isAllowedHeader(String headerName, String headerValue) {
        return GEN_JNI.org_chromium_net_HttpUtil_isAllowedHeader(headerName, headerValue);
    }

    public static HttpUtil.Natives get() {
        if (GEN_JNI.TESTING_ENABLED) {
            if (testInstance != null) {
                return testInstance;
            }
            if (GEN_JNI.REQUIRE_MOCK) {
                throw new UnsupportedOperationException("No mock found for the native implementation of HttpUtil.Natives. The current configuration requires implementations be mocked.");
            }
        }
        NativeLibraryLoadedStatus.checkLoaded();
        return new HttpUtilJni();
    }
}
