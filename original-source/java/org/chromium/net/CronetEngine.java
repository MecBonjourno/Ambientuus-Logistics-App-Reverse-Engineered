package org.chromium.net;

import android.content.Context;
import android.util.Log;
import java.io.IOException;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandlerFactory;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;
import org.chromium.net.BidirectionalStream;
import org.chromium.net.ConnectionMigrationOptions;
import org.chromium.net.DnsOptions;
import org.chromium.net.QuicOptions;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UrlRequest;

/* loaded from: classes17.dex */
public abstract class CronetEngine {
    public static final int ACTIVE_REQUEST_COUNT_UNKNOWN = -1;
    public static final int CONNECTION_METRIC_UNKNOWN = -1;
    public static final int EFFECTIVE_CONNECTION_TYPE_2G = 3;
    public static final int EFFECTIVE_CONNECTION_TYPE_3G = 4;
    public static final int EFFECTIVE_CONNECTION_TYPE_4G = 5;
    public static final int EFFECTIVE_CONNECTION_TYPE_OFFLINE = 1;
    public static final int EFFECTIVE_CONNECTION_TYPE_SLOW_2G = 2;
    public static final int EFFECTIVE_CONNECTION_TYPE_UNKNOWN = 0;
    private static final String TAG = CronetEngine.class.getSimpleName();
    public static final long UNBIND_NETWORK_HANDLE = -1;

    public abstract URLStreamHandlerFactory createURLStreamHandlerFactory();

    public abstract byte[] getGlobalMetricsDeltas();

    public abstract String getVersionString();

    public abstract UrlRequest.Builder newUrlRequestBuilder(String str, UrlRequest.Callback callback, Executor executor);

    public abstract URLConnection openConnection(URL url) throws IOException;

    public abstract void shutdown();

    public abstract void startNetLogToFile(String str, boolean z);

    public abstract void stopNetLog();

    public static class Builder {
        public static final int HTTP_CACHE_DISABLED = 0;
        public static final int HTTP_CACHE_DISK = 3;
        public static final int HTTP_CACHE_DISK_NO_HTTP = 2;
        public static final int HTTP_CACHE_IN_MEMORY = 1;
        private static final String TAG = "CronetEngine.Builder";
        protected final ICronetEngineBuilder mBuilderDelegate;

        public static abstract class LibraryLoader {
            public abstract void loadLibrary(String str);
        }

        public Builder(Context context) {
            this(createBuilderDelegate(context));
        }

        public Builder(ICronetEngineBuilder builderDelegate) {
            if (builderDelegate instanceof ExperimentalOptionsTranslatingCronetEngineBuilder) {
                this.mBuilderDelegate = builderDelegate;
            } else {
                this.mBuilderDelegate = new ExperimentalOptionsTranslatingCronetEngineBuilder(builderDelegate);
            }
        }

        public String getDefaultUserAgent() {
            return this.mBuilderDelegate.getDefaultUserAgent();
        }

        public Builder setUserAgent(String userAgent) {
            this.mBuilderDelegate.setUserAgent(userAgent);
            return this;
        }

        public Builder setStoragePath(String value) {
            this.mBuilderDelegate.setStoragePath(value);
            return this;
        }

        public Builder setLibraryLoader(LibraryLoader loader) {
            this.mBuilderDelegate.setLibraryLoader(loader);
            return this;
        }

        public Builder enableQuic(boolean value) {
            this.mBuilderDelegate.enableQuic(value);
            return this;
        }

        public Builder enableHttp2(boolean value) {
            this.mBuilderDelegate.enableHttp2(value);
            return this;
        }

        @Deprecated
        public Builder enableSdch(boolean value) {
            return this;
        }

        public Builder enableBrotli(boolean value) {
            this.mBuilderDelegate.enableBrotli(value);
            return this;
        }

        public Builder enableHttpCache(int cacheMode, long maxSize) {
            this.mBuilderDelegate.enableHttpCache(cacheMode, maxSize);
            return this;
        }

        public Builder addQuicHint(String host, int port, int alternatePort) {
            this.mBuilderDelegate.addQuicHint(host, port, alternatePort);
            return this;
        }

        public Builder addPublicKeyPins(String hostName, Set<byte[]> pinsSha256, boolean includeSubdomains, Date expirationDate) {
            this.mBuilderDelegate.addPublicKeyPins(hostName, pinsSha256, includeSubdomains, expirationDate);
            return this;
        }

        public Builder enablePublicKeyPinningBypassForLocalTrustAnchors(boolean value) {
            this.mBuilderDelegate.enablePublicKeyPinningBypassForLocalTrustAnchors(value);
            return this;
        }

        public Builder setThreadPriority(int priority) {
            this.mBuilderDelegate.setThreadPriority(priority);
            return this;
        }

        public Builder enableNetworkQualityEstimator(boolean value) {
            this.mBuilderDelegate.enableNetworkQualityEstimator(value);
            return this;
        }

        public Builder setQuicOptions(QuicOptions quicOptions) {
            this.mBuilderDelegate.setQuicOptions(quicOptions);
            return this;
        }

        public Builder setQuicOptions(QuicOptions.Builder quicOptionsBuilder) {
            return setQuicOptions(quicOptionsBuilder.build());
        }

        public Builder setDnsOptions(DnsOptions dnsOptions) {
            this.mBuilderDelegate.setDnsOptions(dnsOptions);
            return this;
        }

        public Builder setDnsOptions(DnsOptions.Builder dnsOptions) {
            return setDnsOptions(dnsOptions.build());
        }

        public Builder setConnectionMigrationOptions(ConnectionMigrationOptions connectionMigrationOptions) {
            this.mBuilderDelegate.setConnectionMigrationOptions(connectionMigrationOptions);
            return this;
        }

        public Builder setConnectionMigrationOptions(ConnectionMigrationOptions.Builder connectionMigrationOptionsBuilder) {
            return setConnectionMigrationOptions(connectionMigrationOptionsBuilder.build());
        }

        public CronetEngine build() {
            int implLevel = getImplementationApiLevel();
            if (implLevel != -1 && implLevel < getMaximumApiLevel()) {
                Log.w(TAG, "The implementation version is lower than the API version. Calls to methods added in API " + (implLevel + 1) + " and newer will likely have no effect.");
            }
            return this.mBuilderDelegate.build();
        }

        private static ICronetEngineBuilder createBuilderDelegate(Context context) {
            List<CronetProvider> providers = new ArrayList<>(CronetProvider.getAllProviders(context));
            CronetProvider provider = getEnabledCronetProviders(context, providers).get(0);
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, String.format("Using '%s' provider for creating CronetEngine.Builder.", provider));
            }
            return provider.createBuilder().mBuilderDelegate;
        }

        static List<CronetProvider> getEnabledCronetProviders(Context context, List<CronetProvider> providers) {
            if (providers.isEmpty()) {
                throw new RuntimeException("Unable to find any Cronet provider. Have you included all necessary jars?");
            }
            Iterator<CronetProvider> i = providers.iterator();
            while (i.hasNext()) {
                CronetProvider provider = i.next();
                if (!provider.isEnabled()) {
                    i.remove();
                }
            }
            if (providers.isEmpty()) {
                throw new RuntimeException("All available Cronet providers are disabled. A provider should be enabled before it can be used.");
            }
            Collections.sort(providers, new Comparator<CronetProvider>() { // from class: org.chromium.net.CronetEngine.Builder.1
                @Override // java.util.Comparator
                public int compare(CronetProvider p1, CronetProvider p2) {
                    if (CronetProvider.PROVIDER_NAME_FALLBACK.equals(p1.getName())) {
                        return 1;
                    }
                    if (CronetProvider.PROVIDER_NAME_FALLBACK.equals(p2.getName())) {
                        return -1;
                    }
                    return -Builder.compareVersions(p1.getVersion(), p2.getVersion());
                }
            });
            return providers;
        }

        static int compareVersions(String s1, String s2) {
            if (s1 == null || s2 == null) {
                throw new IllegalArgumentException("The input values cannot be null");
            }
            String[] s1segments = s1.split("\\.");
            String[] s2segments = s2.split("\\.");
            for (int i = 0; i < s1segments.length && i < s2segments.length; i++) {
                try {
                    int s1segment = Integer.parseInt(s1segments[i]);
                    int s2segment = Integer.parseInt(s2segments[i]);
                    if (s1segment != s2segment) {
                        return Integer.signum(s1segment - s2segment);
                    }
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("Unable to convert version segments into integers: " + s1segments[i] + " & " + s2segments[i], e);
                }
            }
            int i2 = s1segments.length;
            return Integer.signum(i2 - s2segments.length);
        }

        private int getMaximumApiLevel() {
            return ApiVersion.getMaximumAvailableApiLevel();
        }

        private int getImplementationApiLevel() {
            try {
                ClassLoader implClassLoader = this.mBuilderDelegate.getClass().getClassLoader();
                Class<?> implVersionClass = implClassLoader.loadClass("org.chromium.net.impl.ImplVersion");
                Method getApiLevel = implVersionClass.getMethod("getApiLevel", new Class[0]);
                int implementationApiLevel = ((Integer) getApiLevel.invoke(null, new Object[0])).intValue();
                return implementationApiLevel;
            } catch (Exception e) {
                return -1;
            }
        }
    }

    public BidirectionalStream.Builder newBidirectionalStreamBuilder(String url, BidirectionalStream.Callback callback, Executor executor) {
        throw new UnsupportedOperationException("Not implemented.");
    }

    public int getActiveRequestCount() {
        return -1;
    }

    public void addRequestFinishedListener(RequestFinishedInfo.Listener listener) {
    }

    public void removeRequestFinishedListener(RequestFinishedInfo.Listener listener) {
    }

    public int getHttpRttMs() {
        return -1;
    }

    public int getTransportRttMs() {
        return -1;
    }

    public int getDownstreamThroughputKbps() {
        return -1;
    }

    public void startNetLogToDisk(String dirPath, boolean logAll, int maxSize) {
    }

    public void bindToNetwork(long networkHandle) {
    }

    public int getEffectiveConnectionType() {
        return 0;
    }

    public void configureNetworkQualityEstimatorForTesting(boolean useLocalHostRequests, boolean useSmallerResponses, boolean disableOfflineCheck) {
    }

    public void addRttListener(NetworkQualityRttListener listener) {
    }

    public void removeRttListener(NetworkQualityRttListener listener) {
    }

    public void addThroughputListener(NetworkQualityThroughputListener listener) {
    }

    public void removeThroughputListener(NetworkQualityThroughputListener listener) {
    }
}
