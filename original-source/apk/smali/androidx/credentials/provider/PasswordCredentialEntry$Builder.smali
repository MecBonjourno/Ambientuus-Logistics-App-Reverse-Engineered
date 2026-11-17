.class public final Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
.super Ljava/lang/Object;
.source "PasswordCredentialEntry.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/credentials/provider/PasswordCredentialEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0018\u00002\u00020\u0001B\'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\r\u001a\u00020\u00002\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0015\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0019\u0010\u0015\u001a\u00020\u00002\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0007\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0015\u0010\u0019\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u0017\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0017\u0010\u001c\u001a\u00020\u00002\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u001c\u0010\u000eJ\u0017\u0010\u001f\u001a\u00020\u00002\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001d\u00a2\u0006\u0004\u0008\u001f\u0010 J\u0015\u0010\"\u001a\u00020\u00002\u0006\u0010!\u001a\u00020\u0017\u00a2\u0006\u0004\u0008\"\u0010\u001aJ\r\u0010$\u001a\u00020#\u00a2\u0006\u0004\u0008$\u0010%R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010&R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010\'R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010(R\u0014\u0010\t\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010)R\u0018\u0010\u000c\u001a\u0004\u0018\u00010\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\'R\u0018\u0010\u001e\u001a\u0004\u0018\u00010\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010*R\u0018\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010+R\u0016\u0010\u0018\u001a\u00020\u00178\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u0010,R\u0018\u0010\u001b\u001a\u0004\u0018\u00010\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\'R\u0016\u0010!\u001a\u00020\u00178\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008!\u0010,R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010-\u00a8\u0006."
    }
    d2 = {
        "Landroidx/credentials/provider/PasswordCredentialEntry$Builder;",
        "",
        "Landroid/content/Context;",
        "context",
        "",
        "username",
        "Landroid/app/PendingIntent;",
        "pendingIntent",
        "Landroidx/credentials/provider/BeginGetPasswordOption;",
        "beginGetPasswordOption",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetPasswordOption;)V",
        "displayName",
        "setDisplayName",
        "(Ljava/lang/CharSequence;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;",
        "Landroid/graphics/drawable/Icon;",
        "icon",
        "setIcon",
        "(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;",
        "Landroidx/credentials/provider/BiometricPromptData;",
        "biometricPromptData",
        "setBiometricPromptData",
        "(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;",
        "",
        "autoSelectAllowed",
        "setAutoSelectAllowed",
        "(Z)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;",
        "affiliatedDomain",
        "setAffiliatedDomain",
        "j$/time/Instant",
        "lastUsedTime",
        "setLastUsedTime",
        "(Lj$/time/Instant;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;",
        "isDefaultIconPreferredAsSingleProvider",
        "setDefaultIconPreferredAsSingleProvider",
        "Landroidx/credentials/provider/PasswordCredentialEntry;",
        "build",
        "()Landroidx/credentials/provider/PasswordCredentialEntry;",
        "Landroid/content/Context;",
        "Ljava/lang/CharSequence;",
        "Landroid/app/PendingIntent;",
        "Landroidx/credentials/provider/BeginGetPasswordOption;",
        "Lj$/time/Instant;",
        "Landroid/graphics/drawable/Icon;",
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
.field private affiliatedDomain:Ljava/lang/CharSequence;

.field private autoSelectAllowed:Z

.field private final beginGetPasswordOption:Landroidx/credentials/provider/BeginGetPasswordOption;

.field private biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

.field private final context:Landroid/content/Context;

.field private displayName:Ljava/lang/CharSequence;

.field private icon:Landroid/graphics/drawable/Icon;

.field private isDefaultIconPreferredAsSingleProvider:Z

.field private lastUsedTime:Lj$/time/Instant;

.field private final pendingIntent:Landroid/app/PendingIntent;

.field private final username:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetPasswordOption;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "username"    # Ljava/lang/CharSequence;
    .param p3, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p4, "beginGetPasswordOption"    # Landroidx/credentials/provider/BeginGetPasswordOption;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "username"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pendingIntent"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "beginGetPasswordOption"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 800
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 801
    iput-object p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->context:Landroid/content/Context;

    .line 802
    iput-object p2, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->username:Ljava/lang/CharSequence;

    .line 803
    iput-object p3, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->pendingIntent:Landroid/app/PendingIntent;

    .line 804
    iput-object p4, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->beginGetPasswordOption:Landroidx/credentials/provider/BeginGetPasswordOption;

    .line 800
    return-void
.end method


# virtual methods
.method public final build()Landroidx/credentials/provider/PasswordCredentialEntry;
    .locals 20

    .line 878
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    if-nez v1, :cond_0

    .line 879
    iget-object v1, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->context:Landroid/content/Context;

    sget v2, Landroidx/credentials/R$drawable;->ic_password:I

    invoke-static {v1, v2}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v1

    iput-object v1, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    .line 882
    :cond_0
    iget-object v1, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->context:Landroid/content/Context;

    sget v2, Landroidx/credentials/R$string;->android_credentials_TYPE_PASSWORD_CREDENTIAL:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "context.getString(R.stri\u2026TYPE_PASSWORD_CREDENTIAL)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 881
    nop

    .line 883
    .local v1, "typeDisplayName":Ljava/lang/String;
    new-instance v2, Landroidx/credentials/provider/PasswordCredentialEntry;

    .line 884
    iget-object v3, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->username:Ljava/lang/CharSequence;

    .line 885
    iget-object v4, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->displayName:Ljava/lang/CharSequence;

    .line 886
    move-object v5, v1

    check-cast v5, Ljava/lang/CharSequence;

    .line 887
    iget-object v6, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->pendingIntent:Landroid/app/PendingIntent;

    .line 888
    iget-object v7, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->lastUsedTime:Lj$/time/Instant;

    .line 889
    iget-object v8, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    invoke-static {v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 890
    iget-boolean v9, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->autoSelectAllowed:Z

    .line 891
    iget-object v10, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->beginGetPasswordOption:Landroidx/credentials/provider/BeginGetPasswordOption;

    .line 892
    iget-boolean v11, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->isDefaultIconPreferredAsSingleProvider:Z

    .line 883
    nop

    .line 893
    iget-object v13, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->affiliatedDomain:Ljava/lang/CharSequence;

    .line 894
    iget-object v14, v0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

    .line 883
    const/16 v18, 0x7200

    const/16 v19, 0x0

    const/4 v12, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-direct/range {v2 .. v19}, Landroidx/credentials/provider/PasswordCredentialEntry;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Lj$/time/Instant;Landroid/graphics/drawable/Icon;ZLandroidx/credentials/provider/BeginGetPasswordOption;ZLjava/lang/CharSequence;Ljava/lang/CharSequence;Landroidx/credentials/provider/BiometricPromptData;ZZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v2
.end method

.method public final setAffiliatedDomain(Ljava/lang/CharSequence;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
    .locals 0
    .param p1, "affiliatedDomain"    # Ljava/lang/CharSequence;

    .line 852
    iput-object p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->affiliatedDomain:Ljava/lang/CharSequence;

    .line 853
    return-object p0
.end method

.method public final setAutoSelectAllowed(Z)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
    .locals 0
    .param p1, "autoSelectAllowed"    # Z

    .line 841
    iput-boolean p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->autoSelectAllowed:Z

    .line 842
    return-object p0
.end method

.method public final setBiometricPromptData(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
    .locals 0
    .param p1, "biometricPromptData"    # Landroidx/credentials/provider/BiometricPromptData;

    .line 834
    iput-object p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

    .line 835
    return-object p0
.end method

.method public final setDefaultIconPreferredAsSingleProvider(Z)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
    .locals 0
    .param p1, "isDefaultIconPreferredAsSingleProvider"    # Z

    .line 872
    iput-boolean p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->isDefaultIconPreferredAsSingleProvider:Z

    .line 873
    return-object p0
.end method

.method public final setDisplayName(Ljava/lang/CharSequence;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
    .locals 0
    .param p1, "displayName"    # Ljava/lang/CharSequence;

    .line 816
    iput-object p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->displayName:Ljava/lang/CharSequence;

    .line 817
    return-object p0
.end method

.method public final setIcon(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Icon;

    const-string v0, "icon"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 822
    iput-object p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    .line 823
    return-object p0
.end method

.method public final setLastUsedTime(Lj$/time/Instant;)Landroidx/credentials/provider/PasswordCredentialEntry$Builder;
    .locals 0
    .param p1, "lastUsedTime"    # Lj$/time/Instant;

    .line 861
    iput-object p1, p0, Landroidx/credentials/provider/PasswordCredentialEntry$Builder;->lastUsedTime:Lj$/time/Instant;

    .line 862
    return-object p0
.end method
