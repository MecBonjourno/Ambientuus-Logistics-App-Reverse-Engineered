.class public Lcom/google/api/client/extensions/android/AndroidUtils;
.super Ljava/lang/Object;
.source "AndroidUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public static checkMinimumSdkLevel(I)V
    .locals 5
    .param p0, "minimumSdkLevel"    # I

    .line 47
    invoke-static {p0}, Lcom/google/api/client/extensions/android/AndroidUtils;->isMinimumSdkLevel(I)Z

    move-result v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 48
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 49
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v1, 0x1

    aput-object v2, v3, v1

    .line 47
    const-string v1, "running on Android SDK level %s but requires minimum %s"

    invoke-static {v0, v1, v3}, Lcom/google/api/client/util/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method public static isMinimumSdkLevel(I)Z
    .locals 1
    .param p0, "minimumSdkLevel"    # I

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
