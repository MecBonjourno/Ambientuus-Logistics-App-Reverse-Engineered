package org.chromium.net;

import java.net.InetAddress;
import java.util.List;
import org.chromium.base.annotations.JNINamespace;

@JNINamespace("net::android")
/* loaded from: classes17.dex */
public class DnsStatus {
    private final List<InetAddress> mDnsServers;
    private final boolean mPrivateDnsActive;
    private final String mPrivateDnsServerName;
    private final String mSearchDomains;

    public DnsStatus(List<InetAddress> dnsServers, boolean privateDnsActive, String privateDnsServerName, String searchDomains) {
        this.mDnsServers = dnsServers;
        this.mPrivateDnsActive = privateDnsActive;
        this.mPrivateDnsServerName = privateDnsServerName != null ? privateDnsServerName : "";
        this.mSearchDomains = searchDomains != null ? searchDomains : "";
    }

    public byte[][] getDnsServers() {
        byte[][] dnsServers = new byte[this.mDnsServers.size()][];
        for (int i = 0; i < this.mDnsServers.size(); i++) {
            dnsServers[i] = this.mDnsServers.get(i).getAddress();
        }
        return dnsServers;
    }

    public boolean getPrivateDnsActive() {
        return this.mPrivateDnsActive;
    }

    public String getPrivateDnsServerName() {
        return this.mPrivateDnsServerName;
    }

    public String getSearchDomains() {
        return this.mSearchDomains;
    }
}
