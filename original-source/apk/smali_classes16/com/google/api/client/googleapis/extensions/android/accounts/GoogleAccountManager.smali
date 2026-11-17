.class public final Lcom/google/api/client/googleapis/extensions/android/accounts/GoogleAccountManager;
.super Ljava/lang/Object;
.source "GoogleAccountManager.java"


# static fields
.field public static final ACCOUNT_TYPE:Ljava/lang/String; = "com.google"


# instance fields
.field private final manager:Landroid/accounts/AccountManager;


# direct methods
.method public constructor <init>(Landroid/accounts/AccountManager;)V
    .locals 1
    .param p1, "accountManager"    # Landroid/accounts/AccountManager;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-static {p1}, Lcom/google/api/client/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/accounts/AccountManager;

    iput-object v0, p0, Lcom/google/api/client/googleapis/extensions/android/accounts/GoogleAccountManager;->manager:Landroid/accounts/AccountManager;

    .line 44
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 50
    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/api/client/googleapis/extensions/android/accounts/GoogleAccountManager;-><init>(Landroid/accounts/AccountManager;)V

    .line 51
    return-void
.end method


# virtual methods
.method public getAccountByName(Ljava/lang/String;)Landroid/accounts/Account;
    .locals 5
    .param p1, "accountName"    # Ljava/lang/String;

    .line 78
    if-eqz p1, :cond_1

    .line 79
    invoke-virtual {p0}, Lcom/google/api/client/googleapis/extensions/android/accounts/GoogleAccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 80
    .local v3, "account":Landroid/accounts/Account;
    iget-object v4, v3, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    return-object v3

    .line 79
    .end local v3    # "account":Landroid/accounts/Account;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 85
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAccountManager()Landroid/accounts/AccountManager;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/google/api/client/googleapis/extensions/android/accounts/GoogleAccountManager;->manager:Landroid/accounts/AccountManager;

    return-object v0
.end method

.method public getAccounts()[Landroid/accounts/Account;
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/google/api/client/googleapis/extensions/android/accounts/GoogleAccountManager;->manager:Landroid/accounts/AccountManager;

    const-string v1, "com.google"

    invoke-virtual {v0, v1}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    return-object v0
.end method

.method public invalidateAuthToken(Ljava/lang/String;)V
    .locals 2
    .param p1, "authToken"    # Ljava/lang/String;

    .line 95
    iget-object v0, p0, Lcom/google/api/client/googleapis/extensions/android/accounts/GoogleAccountManager;->manager:Landroid/accounts/AccountManager;

    const-string v1, "com.google"

    invoke-virtual {v0, v1, p1}, Landroid/accounts/AccountManager;->invalidateAuthToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    return-void
.end method
