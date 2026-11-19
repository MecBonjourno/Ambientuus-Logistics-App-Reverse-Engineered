package org.chromium.net;

import org.chromium.net.NetworkChangeNotifierAutoDetect;

/* carregado de: classes17.dex */
public class RegistrationPolicyAlwaysRegister extends NetworkChangeNotifierAutoDetect.RegistrationPolicy {
    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.RegistrationPolicy
    protected void init(NetworkChangeNotifierAutoDetect notifier) {
        super.init(notifier);
        register();
    }

    @Override // org.chromium.net.NetworkChangeNotifierAutoDetect.RegistrationPolicy
    protected void destroy() {
    }
}
