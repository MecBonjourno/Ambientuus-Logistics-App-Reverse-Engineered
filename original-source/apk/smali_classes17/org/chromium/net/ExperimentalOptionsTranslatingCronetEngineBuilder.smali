.class final Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;
.super Lorg/chromium/net/ICronetEngineBuilder;
.source "ExperimentalOptionsTranslatingCronetEngineBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;
    }
.end annotation


# static fields
.field private static final SUPPORTED_OPTIONS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

.field private final mExperimentalOptionsPatches:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;",
            ">;"
        }
    .end annotation
.end field

.field private mParsedExperimentalOptions:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 28
    new-instance v0, Ljava/util/HashSet;

    .line 29
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 30
    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v5, v5, [Ljava/lang/Integer;

    const/4 v7, 0x0

    aput-object v2, v5, v7

    aput-object v4, v5, v1

    aput-object v6, v5, v3

    .line 29
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 28
    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->SUPPORTED_OPTIONS:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Lorg/chromium/net/ICronetEngineBuilder;)V
    .locals 1
    .param p1, "delegate"    # Lorg/chromium/net/ICronetEngineBuilder;

    .line 37
    invoke-direct {p0}, Lorg/chromium/net/ICronetEngineBuilder;-><init>()V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mExperimentalOptionsPatches:Ljava/util/List;

    .line 38
    iput-object p1, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    .line 39
    return-void
.end method

.method private static createDefaultIfAbsent(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;

    .line 322
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 323
    .local v0, "object":Lorg/json/JSONObject;
    if-nez v0, :cond_0

    .line 324
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    move-object v0, v1

    .line 326
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    goto :goto_0

    .line 327
    :catch_0
    move-exception v1

    .line 328
    .local v1, "e":Lorg/json/JSONException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed adding a default object for key ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 333
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    :goto_0
    return-object v0
.end method

.method static synthetic lambda$setConnectionMigrationOptions$2(Lorg/chromium/net/ConnectionMigrationOptions;Lorg/json/JSONObject;)V
    .locals 6
    .param p0, "options"    # Lorg/chromium/net/ConnectionMigrationOptions;
    .param p1, "experimentalOptions"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 213
    const-string v0, "QUIC"

    invoke-static {p1, v0}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->createDefaultIfAbsent(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 215
    .local v0, "quicOptions":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getEnableDefaultNetworkMigration()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 216
    nop

    .line 217
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getEnableDefaultNetworkMigration()Ljava/lang/Boolean;

    move-result-object v1

    .line 216
    const-string v2, "migrate_sessions_on_network_change_v2"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    :cond_0
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getAllowServerMigration()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 220
    const-string v1, "allow_server_migration"

    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getAllowServerMigration()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 222
    :cond_1
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMigrateIdleConnections()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 223
    const-string v1, "migrate_idle_sessions"

    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMigrateIdleConnections()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 225
    :cond_2
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getIdleMigrationPeriodSeconds()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 226
    nop

    .line 227
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getIdleMigrationPeriodSeconds()Ljava/lang/Long;

    move-result-object v1

    .line 226
    const-string v2, "idle_session_migration_period_seconds"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 229
    :cond_3
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getRetryPreHandshakeErrorsOnAlternateNetwork()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 230
    nop

    .line 231
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getRetryPreHandshakeErrorsOnAlternateNetwork()Ljava/lang/Boolean;

    move-result-object v1

    .line 230
    const-string v2, "retry_on_alternate_network_before_handshake"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 233
    :cond_4
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMaxTimeOnNonDefaultNetworkSeconds()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 234
    nop

    .line 235
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMaxTimeOnNonDefaultNetworkSeconds()Ljava/lang/Long;

    move-result-object v1

    .line 234
    const-string v2, "max_time_on_non_default_network_seconds"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    :cond_5
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMaxPathDegradingEagerMigrationsCount()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 238
    nop

    .line 239
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMaxPathDegradingEagerMigrationsCount()Ljava/lang/Integer;

    move-result-object v1

    .line 238
    const-string v2, "max_migrations_to_non_default_network_on_path_degrading"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 241
    :cond_6
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMaxWriteErrorEagerMigrationsCount()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 242
    nop

    .line 243
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getMaxWriteErrorEagerMigrationsCount()Ljava/lang/Integer;

    move-result-object v1

    .line 242
    const-string v2, "max_migrations_to_non_default_network_on_write_error"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 245
    :cond_7
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getEnablePathDegradationMigration()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 246
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getEnablePathDegradationMigration()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 248
    .local v1, "pathDegradationValue":Z
    const/4 v2, 0x0

    .line 250
    .local v2, "skipPortMigrationFlag":Z
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getAllowNonDefaultNetworkUsage()Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_b

    .line 251
    invoke-virtual {p0}, Lorg/chromium/net/ConnectionMigrationOptions;->getAllowNonDefaultNetworkUsage()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 252
    .local v3, "nonDefaultNetworkValue":Z
    if-nez v1, :cond_9

    if-nez v3, :cond_8

    goto :goto_0

    .line 254
    :cond_8
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Unable to turn on non-default network usage without path degradation migration!"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 257
    :cond_9
    :goto_0
    const-string v4, "migrate_sessions_early_v2"

    if-eqz v1, :cond_a

    if-eqz v3, :cond_a

    .line 260
    const/4 v5, 0x1

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 261
    const/4 v2, 0x1

    goto :goto_1

    .line 263
    :cond_a
    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 267
    .end local v3    # "nonDefaultNetworkValue":Z
    :cond_b
    :goto_1
    if-nez v2, :cond_c

    .line 268
    const-string v3, "allow_port_migration"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 271
    .end local v1    # "pathDegradationValue":Z
    .end local v2    # "skipPortMigrationFlag":Z
    :cond_c
    return-void
.end method

.method static synthetic lambda$setDnsOptions$1(Lorg/chromium/net/DnsOptions;Lorg/json/JSONObject;)V
    .locals 5
    .param p0, "options"    # Lorg/chromium/net/DnsOptions;
    .param p1, "experimentalOptions"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 149
    const-string v0, "AsyncDNS"

    invoke-static {p1, v0}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->createDefaultIfAbsent(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 151
    .local v0, "asyncDnsOptions":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getUseBuiltInDnsResolver()Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "enable"

    if-eqz v1, :cond_0

    .line 152
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getUseBuiltInDnsResolver()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    :cond_0
    const-string v1, "StaleDNS"

    invoke-static {p1, v1}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->createDefaultIfAbsent(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 157
    .local v1, "staleDnsOptions":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getEnableStaleDns()Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 158
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getEnableStaleDns()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 161
    :cond_1
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getPersistHostCache()Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 162
    const-string v2, "persist_to_disk"

    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getPersistHostCache()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    :cond_2
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getPersistHostCachePeriodMillis()Ljava/lang/Long;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 166
    const-string v2, "persist_delay_ms"

    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getPersistHostCachePeriodMillis()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 169
    :cond_3
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getStaleDnsOptions()Lorg/chromium/net/DnsOptions$StaleDnsOptions;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 170
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getStaleDnsOptions()Lorg/chromium/net/DnsOptions$StaleDnsOptions;

    move-result-object v2

    .line 172
    .local v2, "staleDnsOptionsJava":Lorg/chromium/net/DnsOptions$StaleDnsOptions;
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getAllowCrossNetworkUsage()Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 173
    nop

    .line 174
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getAllowCrossNetworkUsage()Ljava/lang/Boolean;

    move-result-object v3

    .line 173
    const-string v4, "allow_other_network"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 177
    :cond_4
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getFreshLookupTimeoutMillis()Ljava/lang/Long;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 178
    nop

    .line 179
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getFreshLookupTimeoutMillis()Ljava/lang/Long;

    move-result-object v3

    .line 178
    const-string v4, "delay_ms"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    :cond_5
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getUseStaleOnNameNotResolved()Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_6

    .line 183
    nop

    .line 184
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getUseStaleOnNameNotResolved()Ljava/lang/Boolean;

    move-result-object v3

    .line 183
    const-string v4, "use_stale_on_name_not_resolved"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 187
    :cond_6
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getMaxExpiredDelayMillis()Ljava/lang/Long;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 188
    nop

    .line 189
    invoke-virtual {v2}, Lorg/chromium/net/DnsOptions$StaleDnsOptions;->getMaxExpiredDelayMillis()Ljava/lang/Long;

    move-result-object v3

    .line 188
    const-string v4, "max_expired_time_ms"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 193
    .end local v2    # "staleDnsOptionsJava":Lorg/chromium/net/DnsOptions$StaleDnsOptions;
    :cond_7
    const-string v2, "QUIC"

    invoke-static {p1, v2}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->createDefaultIfAbsent(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 194
    .local v2, "quicOptions":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getPreestablishConnectionsToStaleDnsResults()Ljava/lang/Boolean;

    move-result-object v3

    if-eqz v3, :cond_8

    .line 195
    nop

    .line 196
    invoke-virtual {p0}, Lorg/chromium/net/DnsOptions;->getPreestablishConnectionsToStaleDnsResults()Ljava/lang/Boolean;

    move-result-object v3

    .line 195
    const-string v4, "race_stale_dns_on_connection"

    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 198
    :cond_8
    return-void
.end method

.method static synthetic lambda$setQuicOptions$0(Lorg/chromium/net/QuicOptions;Lorg/json/JSONObject;)V
    .locals 4
    .param p0, "options"    # Lorg/chromium/net/QuicOptions;
    .param p1, "experimentalOptions"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 51
    const-string v0, "QUIC"

    invoke-static {p1, v0}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->createDefaultIfAbsent(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 55
    .local v0, "quicOptions":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getQuicHostAllowlist()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    const-string v2, ","

    if-nez v1, :cond_0

    .line 56
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getQuicHostAllowlist()Ljava/util/Set;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/impl/Quirks$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "host_whitelist"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    :cond_0
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getEnabledQuicVersions()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 59
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getEnabledQuicVersions()Ljava/util/Set;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/impl/Quirks$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "quic_version"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    :cond_1
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getConnectionOptions()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 62
    nop

    .line 63
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getConnectionOptions()Ljava/util/Set;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/impl/Quirks$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    .line 62
    const-string v3, "connection_options"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    :cond_2
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getClientConnectionOptions()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 66
    nop

    .line 67
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getClientConnectionOptions()Ljava/util/Set;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/impl/Quirks$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    .line 66
    const-string v3, "client_connection_options"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    :cond_3
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getExtraQuicheFlags()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 70
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getExtraQuicheFlags()Ljava/util/Set;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/impl/Quirks$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "set_quic_flags"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 73
    :cond_4
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getInMemoryServerConfigsCacheSize()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 74
    nop

    .line 75
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getInMemoryServerConfigsCacheSize()Ljava/lang/Integer;

    move-result-object v1

    .line 74
    const-string v2, "max_server_configs_stored_in_properties"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    :cond_5
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getHandshakeUserAgent()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 79
    const-string v1, "user_agent_id"

    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getHandshakeUserAgent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 82
    :cond_6
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getRetryWithoutAltSvcOnQuicErrors()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 83
    nop

    .line 84
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getRetryWithoutAltSvcOnQuicErrors()Ljava/lang/Boolean;

    move-result-object v1

    .line 83
    const-string v2, "retry_without_alt_svc_on_quic_errors"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    :cond_7
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getEnableTlsZeroRtt()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 88
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getEnableTlsZeroRtt()Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    const-string v2, "disable_tls_zero_rtt"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 91
    :cond_8
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getPreCryptoHandshakeIdleTimeoutSeconds()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 92
    nop

    .line 93
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getPreCryptoHandshakeIdleTimeoutSeconds()Ljava/lang/Long;

    move-result-object v1

    .line 92
    const-string v2, "max_idle_time_before_crypto_handshake_seconds"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 96
    :cond_9
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getCryptoHandshakeTimeoutSeconds()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_a

    .line 97
    nop

    .line 98
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getCryptoHandshakeTimeoutSeconds()Ljava/lang/Long;

    move-result-object v1

    .line 97
    const-string v2, "max_time_before_crypto_handshake_seconds"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 101
    :cond_a
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getIdleConnectionTimeoutSeconds()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_b

    .line 102
    nop

    .line 103
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getIdleConnectionTimeoutSeconds()Ljava/lang/Long;

    move-result-object v1

    .line 102
    const-string v2, "idle_connection_timeout_seconds"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 106
    :cond_b
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getRetransmittableOnWireTimeoutMillis()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_c

    .line 107
    nop

    .line 108
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getRetransmittableOnWireTimeoutMillis()Ljava/lang/Long;

    move-result-object v1

    .line 107
    const-string v2, "retransmittable_on_wire_timeout_milliseconds"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 111
    :cond_c
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getCloseSessionsOnIpChange()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_d

    .line 112
    nop

    .line 113
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getCloseSessionsOnIpChange()Ljava/lang/Boolean;

    move-result-object v1

    .line 112
    const-string v2, "close_sessions_on_ip_change"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 116
    :cond_d
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getGoawaySessionsOnIpChange()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_e

    .line 117
    nop

    .line 118
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getGoawaySessionsOnIpChange()Ljava/lang/Boolean;

    move-result-object v1

    .line 117
    const-string v2, "goaway_sessions_on_ip_change"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 121
    :cond_e
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getInitialBrokenServicePeriodSeconds()Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_f

    .line 122
    nop

    .line 123
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getInitialBrokenServicePeriodSeconds()Ljava/lang/Long;

    move-result-object v1

    .line 122
    const-string v2, "initial_delay_for_broken_alternative_service_seconds"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 126
    :cond_f
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getIncreaseBrokenServicePeriodExponentially()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_10

    .line 127
    nop

    .line 128
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getIncreaseBrokenServicePeriodExponentially()Ljava/lang/Boolean;

    move-result-object v1

    .line 127
    const-string v2, "exponential_backoff_on_initial_delay"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 131
    :cond_10
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getDelayJobsWithAvailableSpdySession()Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_11

    .line 132
    nop

    .line 133
    invoke-virtual {p0}, Lorg/chromium/net/QuicOptions;->getDelayJobsWithAvailableSpdySession()Ljava/lang/Boolean;

    move-result-object v1

    .line 132
    const-string v2, "delay_main_job_with_available_spdy_session"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 135
    :cond_11
    return-void
.end method

.method private static parseExperimentalOptions(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .param p0, "jsonString"    # Ljava/lang/String;

    .line 315
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 316
    :catch_0
    move-exception v0

    .line 317
    .local v0, "e":Lorg/json/JSONException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Experimental options parsing failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public addPublicKeyPins(Ljava/lang/String;Ljava/util/Set;ZLjava/util/Date;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "hostName"    # Ljava/lang/String;
    .param p3, "includeSubdomains"    # Z
    .param p4, "expirationDate"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "[B>;Z",
            "Ljava/util/Date;",
            ")",
            "Lorg/chromium/net/ICronetEngineBuilder;"
        }
    .end annotation

    .line 350
    .local p2, "pinsSha256":Ljava/util/Set;, "Ljava/util/Set<[B>;"
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/chromium/net/ICronetEngineBuilder;->addPublicKeyPins(Ljava/lang/String;Ljava/util/Set;ZLjava/util/Date;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 351
    return-object p0
.end method

.method public addQuicHint(Ljava/lang/String;II)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "alternatePort"    # I

    .line 356
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/ICronetEngineBuilder;->addQuicHint(Ljava/lang/String;II)Lorg/chromium/net/ICronetEngineBuilder;

    .line 357
    return-object p0
.end method

.method public build()Lorg/chromium/net/ExperimentalCronetEngine;
    .locals 4

    .line 293
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mParsedExperimentalOptions:Lorg/json/JSONObject;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mExperimentalOptionsPatches:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Lorg/chromium/net/ICronetEngineBuilder;->build()Lorg/chromium/net/ExperimentalCronetEngine;

    move-result-object v0

    return-object v0

    .line 297
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mParsedExperimentalOptions:Lorg/json/JSONObject;

    if-nez v0, :cond_1

    .line 298
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mParsedExperimentalOptions:Lorg/json/JSONObject;

    .line 301
    :cond_1
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mExperimentalOptionsPatches:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;

    .line 303
    .local v1, "patch":Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;
    :try_start_0
    iget-object v2, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mParsedExperimentalOptions:Lorg/json/JSONObject;

    invoke-interface {v1, v2}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;->applyTo(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 306
    nop

    .line 307
    .end local v1    # "patch":Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;
    goto :goto_0

    .line 304
    .restart local v1    # "patch":Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;
    :catch_0
    move-exception v0

    .line 305
    .local v0, "e":Lorg/json/JSONException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Unable to apply JSON patch!"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 309
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v1    # "patch":Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$ExperimentalOptionsPatch;
    :cond_2
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    iget-object v1, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mParsedExperimentalOptions:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/ICronetEngineBuilder;->setExperimentalOptions(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 310
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Lorg/chromium/net/ICronetEngineBuilder;->build()Lorg/chromium/net/ExperimentalCronetEngine;

    move-result-object v0

    return-object v0
.end method

.method public enableBrotli(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "value"    # Z

    .line 392
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableBrotli(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 393
    return-object p0
.end method

.method public enableHttp2(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "value"    # Z

    .line 362
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableHttp2(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 363
    return-object p0
.end method

.method public enableHttpCache(IJ)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "cacheMode"    # I
    .param p2, "maxSize"    # J

    .line 368
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1, p2, p3}, Lorg/chromium/net/ICronetEngineBuilder;->enableHttpCache(IJ)Lorg/chromium/net/ICronetEngineBuilder;

    .line 369
    return-object p0
.end method

.method public enableNetworkQualityEstimator(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "value"    # Z

    .line 421
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableNetworkQualityEstimator(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 422
    return-object p0
.end method

.method public enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "value"    # Z

    .line 374
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enablePublicKeyPinningBypassForLocalTrustAnchors(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 375
    return-object p0
.end method

.method public enableQuic(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "value"    # Z

    .line 380
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableQuic(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 381
    return-object p0
.end method

.method public enableSdch(Z)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "value"    # Z

    .line 386
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->enableSdch(Z)Lorg/chromium/net/ICronetEngineBuilder;

    .line 387
    return-object p0
.end method

.method public getDefaultUserAgent()Ljava/lang/String;
    .locals 1

    .line 416
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Lorg/chromium/net/ICronetEngineBuilder;->getDefaultUserAgent()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getDelegate()Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1

    .line 338
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    return-object v0
.end method

.method protected getSupportedConfigOptions()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 288
    sget-object v0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->SUPPORTED_OPTIONS:Ljava/util/Set;

    return-object v0
.end method

.method public setConnectionMigrationOptions(Lorg/chromium/net/ConnectionMigrationOptions;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 2
    .param p1, "options"    # Lorg/chromium/net/ConnectionMigrationOptions;

    .line 205
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Lorg/chromium/net/ICronetEngineBuilder;->getSupportedConfigOptions()Ljava/util/Set;

    move-result-object v0

    .line 206
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 205
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setConnectionMigrationOptions(Lorg/chromium/net/ConnectionMigrationOptions;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 208
    return-object p0

    .line 212
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mExperimentalOptionsPatches:Ljava/util/List;

    new-instance v1, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda1;

    invoke-direct {v1, p1}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda1;-><init>(Lorg/chromium/net/ConnectionMigrationOptions;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    return-object p0
.end method

.method public setDnsOptions(Lorg/chromium/net/DnsOptions;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 2
    .param p1, "options"    # Lorg/chromium/net/DnsOptions;

    .line 142
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Lorg/chromium/net/ICronetEngineBuilder;->getSupportedConfigOptions()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setDnsOptions(Lorg/chromium/net/DnsOptions;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 144
    return-object p0

    .line 148
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mExperimentalOptionsPatches:Ljava/util/List;

    new-instance v1, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda0;-><init>(Lorg/chromium/net/DnsOptions;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    return-object p0
.end method

.method public setExperimentalOptions(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "options"    # Ljava/lang/String;

    .line 278
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 281
    :cond_0
    invoke-static {p1}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->parseExperimentalOptions(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mParsedExperimentalOptions:Lorg/json/JSONObject;

    goto :goto_1

    .line 279
    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mParsedExperimentalOptions:Lorg/json/JSONObject;

    .line 283
    :goto_1
    return-object p0
.end method

.method public setLibraryLoader(Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "loader"    # Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;

    .line 398
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setLibraryLoader(Lorg/chromium/net/CronetEngine$Builder$LibraryLoader;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 399
    return-object p0
.end method

.method public setQuicOptions(Lorg/chromium/net/QuicOptions;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 2
    .param p1, "options"    # Lorg/chromium/net/QuicOptions;

    .line 44
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0}, Lorg/chromium/net/ICronetEngineBuilder;->getSupportedConfigOptions()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setQuicOptions(Lorg/chromium/net/QuicOptions;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 46
    return-object p0

    .line 50
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mExperimentalOptionsPatches:Ljava/util/List;

    new-instance v1, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda2;

    invoke-direct {v1, p1}, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder$$ExternalSyntheticLambda2;-><init>(Lorg/chromium/net/QuicOptions;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    return-object p0
.end method

.method public setStoragePath(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 404
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setStoragePath(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 405
    return-object p0
.end method

.method public setThreadPriority(I)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "priority"    # I

    .line 427
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setThreadPriority(I)Lorg/chromium/net/ICronetEngineBuilder;

    .line 428
    return-object p0
.end method

.method public setUserAgent(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;
    .locals 1
    .param p1, "userAgent"    # Ljava/lang/String;

    .line 410
    iget-object v0, p0, Lorg/chromium/net/ExperimentalOptionsTranslatingCronetEngineBuilder;->mDelegate:Lorg/chromium/net/ICronetEngineBuilder;

    invoke-virtual {v0, p1}, Lorg/chromium/net/ICronetEngineBuilder;->setUserAgent(Ljava/lang/String;)Lorg/chromium/net/ICronetEngineBuilder;

    .line 411
    return-object p0
.end method
