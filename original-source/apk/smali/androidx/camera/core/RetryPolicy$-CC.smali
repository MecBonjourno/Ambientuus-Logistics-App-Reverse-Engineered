.class public final synthetic Landroidx/camera/core/RetryPolicy$-CC;
.super Ljava/lang/Object;
.source "RetryPolicy.java"


# direct methods
.method public static $default$getTimeoutInMillis(Landroidx/camera/core/RetryPolicy;)J
    .locals 2
    .param p0, "_this"    # Landroidx/camera/core/RetryPolicy;

    .line 171
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method static constructor <clinit>()V
    .locals 2

    sget-wide v0, Landroidx/camera/core/RetryPolicy;->DEFAULT_RETRY_TIMEOUT_IN_MILLIS:J

    return-void
.end method

.method public static getDefaultRetryTimeoutInMillis()J
    .locals 2

    .line 149
    const-wide/16 v0, 0x1770

    return-wide v0
.end method

.method public static synthetic lambda$static$0(Landroidx/camera/core/RetryPolicy$ExecutionState;)Landroidx/camera/core/RetryPolicy$RetryConfig;
    .locals 1
    .param p0, "executionState"    # Landroidx/camera/core/RetryPolicy$ExecutionState;

    .line 104
    sget-object v0, Landroidx/camera/core/RetryPolicy$RetryConfig;->NOT_RETRY:Landroidx/camera/core/RetryPolicy$RetryConfig;

    return-object v0
.end method
