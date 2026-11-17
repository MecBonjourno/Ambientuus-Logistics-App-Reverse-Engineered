.class public final Landroidx/credentials/provider/CreateEntry$Builder;
.super Ljava/lang/Object;
.source "CreateEntry.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/credentials/provider/CreateEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0008\u000b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0015\u0010\u0010\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0010\u0010\u000fJ\u0015\u0010\u0011\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0011\u0010\u000fJ\u0017\u0010\u0014\u001a\u00020\u00002\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0017\u0010\u0017\u001a\u00020\u00002\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u00002\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0019\u0010\u001f\u001a\u00020\u00002\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001dH\u0007\u00a2\u0006\u0004\u0008\u001f\u0010 J\r\u0010\"\u001a\u00020!\u00a2\u0006\u0004\u0008\"\u0010#R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010$R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010%R$\u0010(\u001a\u0010\u0012\u0004\u0012\u00020\'\u0012\u0006\u0012\u0004\u0018\u00010\u000c0&8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008(\u0010)R\u0018\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010*R\u0018\u0010\u0016\u001a\u0004\u0018\u00010\u00028\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010$R\u0018\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010+R\u0018\u0010,\u001a\u0004\u0018\u00010\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008,\u0010-R\u0018\u0010.\u001a\u0004\u0018\u00010\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008.\u0010-R\u0018\u0010/\u001a\u0004\u0018\u00010\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008/\u0010-R\u0016\u0010\t\u001a\u00020\u00088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\t\u00100R\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u00101\u00a8\u00062"
    }
    d2 = {
        "Landroidx/credentials/provider/CreateEntry$Builder;",
        "",
        "",
        "accountName",
        "Landroid/app/PendingIntent;",
        "pendingIntent",
        "<init>",
        "(Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V",
        "",
        "autoSelectAllowed",
        "setAutoSelectAllowed",
        "(Z)Landroidx/credentials/provider/CreateEntry$Builder;",
        "",
        "count",
        "setPasswordCredentialCount",
        "(I)Landroidx/credentials/provider/CreateEntry$Builder;",
        "setPublicKeyCredentialCount",
        "setTotalCredentialCount",
        "Landroid/graphics/drawable/Icon;",
        "icon",
        "setIcon",
        "(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/CreateEntry$Builder;",
        "description",
        "setDescription",
        "(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CreateEntry$Builder;",
        "j$/time/Instant",
        "lastUsedTime",
        "setLastUsedTime",
        "(Lj$/time/Instant;)Landroidx/credentials/provider/CreateEntry$Builder;",
        "Landroidx/credentials/provider/BiometricPromptData;",
        "biometricPromptData",
        "setBiometricPromptData",
        "(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/CreateEntry$Builder;",
        "Landroidx/credentials/provider/CreateEntry;",
        "build",
        "()Landroidx/credentials/provider/CreateEntry;",
        "Ljava/lang/CharSequence;",
        "Landroid/app/PendingIntent;",
        "",
        "",
        "credentialCountInformationMap",
        "Ljava/util/Map;",
        "Landroid/graphics/drawable/Icon;",
        "Lj$/time/Instant;",
        "passwordCredentialCount",
        "Ljava/lang/Integer;",
        "publicKeyCredentialCount",
        "totalCredentialCount",
        "Z",
        "Landroidx/credentials/provider/BiometricPromptData;",
        "credentials_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final accountName:Ljava/lang/CharSequence;

.field private autoSelectAllowed:Z

.field private biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

.field private credentialCountInformationMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private description:Ljava/lang/CharSequence;

.field private icon:Landroid/graphics/drawable/Icon;

.field private lastUsedTime:Lj$/time/Instant;

.field private passwordCredentialCount:Ljava/lang/Integer;

.field private final pendingIntent:Landroid/app/PendingIntent;

.field private publicKeyCredentialCount:Ljava/lang/Integer;

.field private totalCredentialCount:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V
    .locals 1
    .param p1, "accountName"    # Ljava/lang/CharSequence;
    .param p2, "pendingIntent"    # Landroid/app/PendingIntent;

    const-string v0, "accountName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pendingIntent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 232
    iput-object p1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->accountName:Ljava/lang/CharSequence;

    iput-object p2, p0, Landroidx/credentials/provider/CreateEntry$Builder;->pendingIntent:Landroid/app/PendingIntent;

    .line 233
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Landroidx/credentials/provider/CreateEntry$Builder;->credentialCountInformationMap:Ljava/util/Map;

    .line 232
    return-void
.end method


# virtual methods
.method public final build()Landroidx/credentials/provider/CreateEntry;
    .locals 9

    .line 338
    new-instance v0, Landroidx/credentials/provider/CreateEntry;

    .line 339
    iget-object v1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->accountName:Ljava/lang/CharSequence;

    .line 340
    iget-object v2, p0, Landroidx/credentials/provider/CreateEntry$Builder;->pendingIntent:Landroid/app/PendingIntent;

    .line 341
    iget-object v3, p0, Landroidx/credentials/provider/CreateEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    .line 342
    iget-object v4, p0, Landroidx/credentials/provider/CreateEntry$Builder;->description:Ljava/lang/CharSequence;

    .line 343
    iget-object v5, p0, Landroidx/credentials/provider/CreateEntry$Builder;->lastUsedTime:Lj$/time/Instant;

    .line 344
    iget-object v6, p0, Landroidx/credentials/provider/CreateEntry$Builder;->credentialCountInformationMap:Ljava/util/Map;

    .line 345
    iget-boolean v7, p0, Landroidx/credentials/provider/CreateEntry$Builder;->autoSelectAllowed:Z

    .line 346
    iget-object v8, p0, Landroidx/credentials/provider/CreateEntry$Builder;->biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

    .line 338
    invoke-direct/range {v0 .. v8}, Landroidx/credentials/provider/CreateEntry;-><init>(Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Lj$/time/Instant;Ljava/util/Map;ZLandroidx/credentials/provider/BiometricPromptData;)V

    return-object v0
.end method

.method public final setAutoSelectAllowed(Z)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 0
    .param p1, "autoSelectAllowed"    # Z

    .line 246
    iput-boolean p1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->autoSelectAllowed:Z

    .line 247
    return-object p0
.end method

.method public final setBiometricPromptData(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 0
    .param p1, "biometricPromptData"    # Landroidx/credentials/provider/BiometricPromptData;

    .line 328
    iput-object p1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

    .line 329
    return-object p0
.end method

.method public final setDescription(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 2
    .param p1, "description"    # Ljava/lang/CharSequence;

    .line 307
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0x12c

    if-gt v0, v1, :cond_1

    goto :goto_1

    .line 308
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Description must follow a limit of 300 characters."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 310
    :cond_2
    :goto_1
    iput-object p1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->description:Ljava/lang/CharSequence;

    .line 311
    return-object p0
.end method

.method public final setIcon(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 0
    .param p1, "icon"    # Landroid/graphics/drawable/Icon;

    .line 291
    iput-object p1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    .line 292
    return-object p0
.end method

.method public final setLastUsedTime(Lj$/time/Instant;)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 0
    .param p1, "lastUsedTime"    # Lj$/time/Instant;

    .line 316
    iput-object p1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->lastUsedTime:Lj$/time/Instant;

    .line 317
    return-object p0
.end method

.method public final setPasswordCredentialCount(I)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 3
    .param p1, "count"    # I

    .line 257
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/credentials/provider/CreateEntry$Builder;->passwordCredentialCount:Ljava/lang/Integer;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 258
    iget-object v1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->credentialCountInformationMap:Ljava/util/Map;

    const-string v2, "android.credentials.TYPE_PASSWORD_CREDENTIAL"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    return-object p0
.end method

.method public final setPublicKeyCredentialCount(I)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 3
    .param p1, "count"    # I

    .line 269
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/credentials/provider/CreateEntry$Builder;->publicKeyCredentialCount:Ljava/lang/Integer;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 270
    iget-object v1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->credentialCountInformationMap:Ljava/util/Map;

    const-string v2, "androidx.credentials.TYPE_PUBLIC_KEY_CREDENTIAL"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    return-object p0
.end method

.method public final setTotalCredentialCount(I)Landroidx/credentials/provider/CreateEntry$Builder;
    .locals 3
    .param p1, "count"    # I

    .line 284
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/credentials/provider/CreateEntry$Builder;->totalCredentialCount:Ljava/lang/Integer;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 285
    iget-object v1, p0, Landroidx/credentials/provider/CreateEntry$Builder;->credentialCountInformationMap:Ljava/util/Map;

    const-string v2, "TOTAL_CREDENTIAL_COUNT_TYPE"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    return-object p0
.end method
