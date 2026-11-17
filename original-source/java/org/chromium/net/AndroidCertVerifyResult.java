package org.chromium.net;

import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.chromium.base.annotations.JNINamespace;

@JNINamespace("net::android")
/* loaded from: classes17.dex */
public class AndroidCertVerifyResult {
    private final List<X509Certificate> mCertificateChain;
    private final boolean mIsIssuedByKnownRoot;
    private final int mStatus;

    public AndroidCertVerifyResult(int status, boolean isIssuedByKnownRoot, List<X509Certificate> certificateChain) {
        this.mStatus = status;
        this.mIsIssuedByKnownRoot = isIssuedByKnownRoot;
        this.mCertificateChain = new ArrayList(certificateChain);
    }

    public AndroidCertVerifyResult(int status) {
        this.mStatus = status;
        this.mIsIssuedByKnownRoot = false;
        this.mCertificateChain = Collections.emptyList();
    }

    public int getStatus() {
        return this.mStatus;
    }

    public boolean isIssuedByKnownRoot() {
        return this.mIsIssuedByKnownRoot;
    }

    public byte[][] getCertificateChainEncoded() {
        byte[][] verifiedChainArray = new byte[this.mCertificateChain.size()][];
        for (int i = 0; i < this.mCertificateChain.size(); i++) {
            try {
                verifiedChainArray[i] = this.mCertificateChain.get(i).getEncoded();
            } catch (CertificateEncodingException e) {
                return new byte[0][];
            }
        }
        return verifiedChainArray;
    }
}
