package org.chromium.net;

import androidx.camera.core.impl.Quirks$$ExternalSyntheticBackport0;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.chromium.net.CronetEngine;
import org.chromium.net.DnsOptions;
import org.json.JSONException;
import org.json.JSONObject;

/* carregado de: classes17.dex */
final class ExperimentalOptionsTranslatingCronetEngineBuilder extends ICronetEngineBuilder {
    private static final Set<Integer> SUPPORTED_OPTIONS = DesugarCollections.unmodifiableSet(new HashSet(Arrays.asList(1, 2, 3)));
    private final ICronetEngineBuilder mDelegate;
    private final List<ExperimentalOptionsPatch> mExperimentalOptionsPatches = new ArrayList();
    private JSONObject mParsedExperimentalOptions;

    /* JADX INFO: modificadores de acesso alterados de: private */
    @FunctionalInterface
    interface ExperimentalOptionsPatch {
        void applyTo(JSONObject jSONObject) throws JSONException;
    }

    ExperimentalOptionsTranslatingCronetEngineBuilder(ICronetEngineBuilder delegate) {
        this.mDelegate = delegate;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setQuicOptions(final QuicOptions options) {
        if (this.mDelegate.getSupportedConfigOptions().contains(3)) {
            this.mDelegate.setQuicOptions(options);
            return this;
        }
        this.mExperimentalOptionsPatches.add(new ExperimentalOptionsPatch() { // da classe: org.chromium.net.ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda2
            @Override // org.chromium.net.ExperimentalOptionsTranslatingCronetEngineBuilder.ExperimentalOptionsPatch
            public final void applyTo(JSONObject jSONObject) {
                ExperimentalOptionsTranslatingCronetEngineBuilder.lambda$setQuicOptions$0(QuicOptions.this, jSONObject);
            }
        });
        return this;
    }

    static /* sintético */ void lambda$setQuicOptions$0(QuicOptions options, JSONObject experimentalOptions) throws JSONException {
        JSONObject quicOptions = createDefaultIfAbsent(experimentalOptions, "QUIC");
        if (!options.getQuicHostAllowlist().isEmpty()) {
            quicOptions.put("host_whitelist", Quirks$$ExternalSyntheticBackport0.m(",", options.getQuicHostAllowlist()));
        }
        if (!options.getEnabledQuicVersions().isEmpty()) {
            quicOptions.put("quic_version", Quirks$$ExternalSyntheticBackport0.m(",", options.getEnabledQuicVersions()));
        }
        if (!options.getConnectionOptions().isEmpty()) {
            quicOptions.put("connection_options", Quirks$$ExternalSyntheticBackport0.m(",", options.getConnectionOptions()));
        }
        if (!options.getClientConnectionOptions().isEmpty()) {
            quicOptions.put("client_connection_options", Quirks$$ExternalSyntheticBackport0.m(",", options.getClientConnectionOptions()));
        }
        if (!options.getExtraQuicheFlags().isEmpty()) {
            quicOptions.put("set_quic_flags", Quirks$$ExternalSyntheticBackport0.m(",", options.getExtraQuicheFlags()));
        }
        if (options.getInMemoryServerConfigsCacheSize() != null) {
            quicOptions.put("max_server_configs_stored_in_properties", options.getInMemoryServerConfigsCacheSize());
        }
        if (options.getHandshakeUserAgent() != null) {
            quicOptions.put("user_agent_id", options.getHandshakeUserAgent());
        }
        if (options.getRetryWithoutAltSvcOnQuicErrors() != null) {
            quicOptions.put("retry_without_alt_svc_on_quic_errors", options.getRetryWithoutAltSvcOnQuicErrors());
        }
        if (options.getEnableTlsZeroRtt() != null) {
            quicOptions.put("disable_tls_zero_rtt", !options.getEnableTlsZeroRtt().booleanValue());
        }
        if (options.getPreCryptoHandshakeIdleTimeoutSeconds() != null) {
            quicOptions.put("max_idle_time_before_crypto_handshake_seconds", options.getPreCryptoHandshakeIdleTimeoutSeconds());
        }
        if (options.getCryptoHandshakeTimeoutSeconds() != null) {
            quicOptions.put("max_time_before_crypto_handshake_seconds", options.getCryptoHandshakeTimeoutSeconds());
        }
        if (options.getIdleConnectionTimeoutSeconds() != null) {
            quicOptions.put("idle_connection_timeout_seconds", options.getIdleConnectionTimeoutSeconds());
        }
        if (options.getRetransmittableOnWireTimeoutMillis() != null) {
            quicOptions.put("retransmittable_on_wire_timeout_milliseconds", options.getRetransmittableOnWireTimeoutMillis());
        }
        if (options.getCloseSessionsOnIpChange() != null) {
            quicOptions.put("close_sessions_on_ip_change", options.getCloseSessionsOnIpChange());
        }
        if (options.getGoawaySessionsOnIpChange() != null) {
            quicOptions.put("goaway_sessions_on_ip_change", options.getGoawaySessionsOnIpChange());
        }
        if (options.getInitialBrokenServicePeriodSeconds() != null) {
            quicOptions.put("initial_delay_for_broken_alternative_service_seconds", options.getInitialBrokenServicePeriodSeconds());
        }
        if (options.getIncreaseBrokenServicePeriodExponentially() != null) {
            quicOptions.put("exponential_backoff_on_initial_delay", options.getIncreaseBrokenServicePeriodExponentially());
        }
        if (options.getDelayJobsWithAvailableSpdySession() != null) {
            quicOptions.put("delay_main_job_with_available_spdy_session", options.getDelayJobsWithAvailableSpdySession());
        }
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setDnsOptions(final DnsOptions options) {
        if (this.mDelegate.getSupportedConfigOptions().contains(2)) {
            this.mDelegate.setDnsOptions(options);
            return this;
        }
        this.mExperimentalOptionsPatches.add(new ExperimentalOptionsPatch() { // da classe: org.chromium.net.ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda0
            @Override // org.chromium.net.ExperimentalOptionsTranslatingCronetEngineBuilder.ExperimentalOptionsPatch
            public final void applyTo(JSONObject jSONObject) {
                ExperimentalOptionsTranslatingCronetEngineBuilder.lambda$setDnsOptions$1(DnsOptions.this, jSONObject);
            }
        });
        return this;
    }

    static /* sintético */ void lambda$setDnsOptions$1(DnsOptions options, JSONObject experimentalOptions) throws JSONException {
        JSONObject asyncDnsOptions = createDefaultIfAbsent(experimentalOptions, "AsyncDNS");
        if (options.getUseBuiltInDnsResolver() != null) {
            asyncDnsOptions.put("enable", options.getUseBuiltInDnsResolver());
        }
        JSONObject staleDnsOptions = createDefaultIfAbsent(experimentalOptions, "StaleDNS");
        if (options.getEnableStaleDns() != null) {
            staleDnsOptions.put("enable", options.getEnableStaleDns());
        }
        if (options.getPersistHostCache() != null) {
            staleDnsOptions.put("persist_to_disk", options.getPersistHostCache());
        }
        if (options.getPersistHostCachePeriodMillis() != null) {
            staleDnsOptions.put("persist_delay_ms", options.getPersistHostCachePeriodMillis());
        }
        if (options.getStaleDnsOptions() != null) {
            DnsOptions.StaleDnsOptions staleDnsOptionsJava = options.getStaleDnsOptions();
            if (staleDnsOptionsJava.getAllowCrossNetworkUsage() != null) {
                staleDnsOptions.put("allow_other_network", staleDnsOptionsJava.getAllowCrossNetworkUsage());
            }
            if (staleDnsOptionsJava.getFreshLookupTimeoutMillis() != null) {
                staleDnsOptions.put("delay_ms", staleDnsOptionsJava.getFreshLookupTimeoutMillis());
            }
            if (staleDnsOptionsJava.getUseStaleOnNameNotResolved() != null) {
                staleDnsOptions.put("use_stale_on_name_not_resolved", staleDnsOptionsJava.getUseStaleOnNameNotResolved());
            }
            if (staleDnsOptionsJava.getMaxExpiredDelayMillis() != null) {
                staleDnsOptions.put("max_expired_time_ms", staleDnsOptionsJava.getMaxExpiredDelayMillis());
            }
        }
        JSONObject quicOptions = createDefaultIfAbsent(experimentalOptions, "QUIC");
        if (options.getPreestablishConnectionsToStaleDnsResults() != null) {
            quicOptions.put("race_stale_dns_on_connection", options.getPreestablishConnectionsToStaleDnsResults());
        }
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setConnectionMigrationOptions(final ConnectionMigrationOptions options) {
        if (this.mDelegate.getSupportedConfigOptions().contains(1)) {
            this.mDelegate.setConnectionMigrationOptions(options);
            return this;
        }
        this.mExperimentalOptionsPatches.add(new ExperimentalOptionsPatch() { // da classe: org.chromium.net.ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda1
            @Override // org.chromium.net.ExperimentalOptionsTranslatingCronetEngineBuilder.ExperimentalOptionsPatch
            public final void applyTo(JSONObject jSONObject) {
                ExperimentalOptionsTranslatingCronetEngineBuilder.lambda$setConnectionMigrationOptions$2(ConnectionMigrationOptions.this, jSONObject);
            }
        });
        return this;
    }

    static /* sintético */ void lambda$setConnectionMigrationOptions$2(ConnectionMigrationOptions options, JSONObject experimentalOptions) throws JSONException {
        JSONObject quicOptions = createDefaultIfAbsent(experimentalOptions, "QUIC");
        if (options.getEnableDefaultNetworkMigration() != null) {
            quicOptions.put("migrate_sessions_on_network_change_v2", options.getEnableDefaultNetworkMigration());
        }
        if (options.getAllowServerMigration() != null) {
            quicOptions.put("allow_server_migration", options.getAllowServerMigration());
        }
        if (options.getMigrateIdleConnections() != null) {
            quicOptions.put("migrate_idle_sessions", options.getMigrateIdleConnections());
        }
        if (options.getIdleMigrationPeriodSeconds() != null) {
            quicOptions.put("idle_session_migration_period_seconds", options.getIdleMigrationPeriodSeconds());
        }
        if (options.getRetryPreHandshakeErrorsOnAlternateNetwork() != null) {
            quicOptions.put("retry_on_alternate_network_before_handshake", options.getRetryPreHandshakeErrorsOnAlternateNetwork());
        }
        if (options.getMaxTimeOnNonDefaultNetworkSeconds() != null) {
            quicOptions.put("max_time_on_non_default_network_seconds", options.getMaxTimeOnNonDefaultNetworkSeconds());
        }
        if (options.getMaxPathDegradingEagerMigrationsCount() != null) {
            quicOptions.put("max_migrations_to_non_default_network_on_path_degrading", options.getMaxPathDegradingEagerMigrationsCount());
        }
        if (options.getMaxWriteErrorEagerMigrationsCount() != null) {
            quicOptions.put("max_migrations_to_non_default_network_on_write_error", options.getMaxWriteErrorEagerMigrationsCount());
        }
        if (options.getEnablePathDegradationMigration() != null) {
            boolean pathDegradationValue = options.getEnablePathDegradationMigration().booleanValue();
            boolean skipPortMigrationFlag = false;
            if (options.getAllowNonDefaultNetworkUsage() != null) {
                boolean nonDefaultNetworkValue = options.getAllowNonDefaultNetworkUsage().booleanValue();
                if (!pathDegradationValue && nonDefaultNetworkValue) {
                    throw new IllegalArgumentException("Unable to turn on non-default network usage without path degradation migration!");
                }
                if (!pathDegradationValue || !nonDefaultNetworkValue) {
                    quicOptions.put("migrate_sessions_early_v2", false);
                } else {
                    quicOptions.put("migrate_sessions_early_v2", true);
                    skipPortMigrationFlag = true;
                }
            }
            if (!skipPortMigrationFlag) {
                quicOptions.put("allow_port_migration", pathDegradationValue);
            }
        }
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setExperimentalOptions(String options) {
        if (options == null || options.isEmpty()) {
            this.mParsedExperimentalOptions = null;
        } else {
            this.mParsedExperimentalOptions = parseExperimentalOptions(options);
        }
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    protected Set<Integer> getSupportedConfigOptions() {
        return SUPPORTED_OPTIONS;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ExperimentalCronetEngine build() {
        if (this.mParsedExperimentalOptions == null && this.mExperimentalOptionsPatches.isEmpty()) {
            return this.mDelegate.build();
        }
        if (this.mParsedExperimentalOptions == null) {
            this.mParsedExperimentalOptions = new JSONObject();
        }
        for (ExperimentalOptionsPatch patch : this.mExperimentalOptionsPatches) {
            try {
                patch.applyTo(this.mParsedExperimentalOptions);
            } catch (JSONException e) {
                throw new IllegalStateException("Unable to apply JSON patch!", e);
            }
        }
        this.mDelegate.setExperimentalOptions(this.mParsedExperimentalOptions.toString());
        return this.mDelegate.build();
    }

    private static JSONObject parseExperimentalOptions(String jsonString) {
        try {
            return new JSONObject(jsonString);
        } catch (JSONException e) {
            throw new IllegalArgumentException("Experimental options parsing failed", e);
        }
    }

    private static JSONObject createDefaultIfAbsent(JSONObject jsonObject, String key) {
        JSONObject object = jsonObject.optJSONObject(key);
        if (object == null) {
            object = new JSONObject();
            try {
                jsonObject.put(key, object);
            } catch (JSONException e) {
                throw new IllegalArgumentException("Failed adding a default object for key [" + key + "]", e);
            }
        }
        return object;
    }

    ICronetEngineBuilder getDelegate() {
        return this.mDelegate;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder addPublicKeyPins(String hostName, Set<byte[]> pinsSha256, boolean includeSubdomains, Date expirationDate) {
        this.mDelegate.addPublicKeyPins(hostName, pinsSha256, includeSubdomains, expirationDate);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder addQuicHint(String host, int port, int alternatePort) {
        this.mDelegate.addQuicHint(host, port, alternatePort);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder enableHttp2(boolean value) {
        this.mDelegate.enableHttp2(value);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder enableHttpCache(int cacheMode, long maxSize) {
        this.mDelegate.enableHttpCache(cacheMode, maxSize);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder enablePublicKeyPinningBypassForLocalTrustAnchors(boolean value) {
        this.mDelegate.enablePublicKeyPinningBypassForLocalTrustAnchors(value);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder enableQuic(boolean value) {
        this.mDelegate.enableQuic(value);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder enableSdch(boolean value) {
        this.mDelegate.enableSdch(value);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder enableBrotli(boolean value) {
        this.mDelegate.enableBrotli(value);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setLibraryLoader(CronetEngine.Builder.LibraryLoader loader) {
        this.mDelegate.setLibraryLoader(loader);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setStoragePath(String value) {
        this.mDelegate.setStoragePath(value);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setUserAgent(String userAgent) {
        this.mDelegate.setUserAgent(userAgent);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public String getDefaultUserAgent() {
        return this.mDelegate.getDefaultUserAgent();
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder enableNetworkQualityEstimator(boolean value) {
        this.mDelegate.enableNetworkQualityEstimator(value);
        return this;
    }

    @Override // org.chromium.net.ICronetEngineBuilder
    public ICronetEngineBuilder setThreadPriority(int priority) {
        this.mDelegate.setThreadPriority(priority);
        return this;
    }
}
