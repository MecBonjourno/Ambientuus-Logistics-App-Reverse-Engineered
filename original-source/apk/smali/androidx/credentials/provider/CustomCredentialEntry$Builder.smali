.class public final Landroidx/credentials/provider/CustomCredentialEntry$Builder;
.super Ljava/lang/Object;
.source "CustomCredentialEntry.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/credentials/provider/CustomCredentialEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCustomCredentialEntry.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CustomCredentialEntry.kt\nandroidx/credentials/provider/CustomCredentialEntry$Builder\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,907:1\n1#2:908\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u0012\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u000f\u001a\u00020\u00002\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0012\u001a\u00020\u00002\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0012\u0010\u0010J\u0015\u0010\u0015\u001a\u00020\u00002\u0006\u0010\u0014\u001a\u00020\u0013\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0019\u0010\u0019\u001a\u00020\u00002\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0007\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u0015\u0010\u001d\u001a\u00020\u00002\u0006\u0010\u001c\u001a\u00020\u001b\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0015\u0010 \u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0006\u00a2\u0006\u0004\u0008 \u0010\u0010J\u0017\u0010#\u001a\u00020\u00002\u0008\u0010\"\u001a\u0004\u0018\u00010!\u00a2\u0006\u0004\u0008#\u0010$J\u0015\u0010&\u001a\u00020\u00002\u0006\u0010%\u001a\u00020\u001b\u00a2\u0006\u0004\u0008&\u0010\u001eJ\r\u0010(\u001a\u00020\'\u00a2\u0006\u0004\u0008(\u0010)R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010*R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010+R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0007\u0010,R\u0014\u0010\t\u001a\u00020\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\t\u0010-R\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010.R\u0018\u0010\u000e\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010,R\u0018\u0010\"\u001a\u0004\u0018\u00010!8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\"\u0010/R\u0018\u0010\u0011\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010,R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0014\u00100R\u0016\u0010\u001c\u001a\u00020\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u00101R\u0016\u0010\u001f\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010,R\u0016\u0010%\u001a\u00020\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008%\u00101R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u00102\u00a8\u00063"
    }
    d2 = {
        "Landroidx/credentials/provider/CustomCredentialEntry$Builder;",
        "",
        "Landroid/content/Context;",
        "context",
        "",
        "type",
        "",
        "title",
        "Landroid/app/PendingIntent;",
        "pendingIntent",
        "Landroidx/credentials/provider/BeginGetCredentialOption;",
        "beginGetCredentialOption",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetCredentialOption;)V",
        "subtitle",
        "setSubtitle",
        "(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;",
        "typeDisplayName",
        "setTypeDisplayName",
        "Landroid/graphics/drawable/Icon;",
        "icon",
        "setIcon",
        "(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;",
        "Landroidx/credentials/provider/BiometricPromptData;",
        "biometricPromptData",
        "setBiometricPromptData",
        "(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;",
        "",
        "autoSelectAllowed",
        "setAutoSelectAllowed",
        "(Z)Landroidx/credentials/provider/CustomCredentialEntry$Builder;",
        "entryGroupId",
        "setEntryGroupId",
        "j$/time/Instant",
        "lastUsedTime",
        "setLastUsedTime",
        "(Lj$/time/Instant;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;",
        "isDefaultIconPreferredAsSingleProvider",
        "setDefaultIconPreferredAsSingleProvider",
        "Landroidx/credentials/provider/CustomCredentialEntry;",
        "build",
        "()Landroidx/credentials/provider/CustomCredentialEntry;",
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/CharSequence;",
        "Landroid/app/PendingIntent;",
        "Landroidx/credentials/provider/BeginGetCredentialOption;",
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
.field private autoSelectAllowed:Z

.field private final beginGetCredentialOption:Landroidx/credentials/provider/BeginGetCredentialOption;

.field private biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

.field private final context:Landroid/content/Context;

.field private entryGroupId:Ljava/lang/CharSequence;

.field private icon:Landroid/graphics/drawable/Icon;

.field private isDefaultIconPreferredAsSingleProvider:Z

.field private lastUsedTime:Lj$/time/Instant;

.field private final pendingIntent:Landroid/app/PendingIntent;

.field private subtitle:Ljava/lang/CharSequence;

.field private final title:Ljava/lang/CharSequence;

.field private final type:Ljava/lang/String;

.field private typeDisplayName:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetCredentialOption;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "title"    # Ljava/lang/CharSequence;
    .param p4, "pendingIntent"    # Landroid/app/PendingIntent;
    .param p5, "beginGetCredentialOption"    # Landroidx/credentials/provider/BeginGetCredentialOption;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "type"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "title"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pendingIntent"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "beginGetCredentialOption"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 797
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 798
    iput-object p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->context:Landroid/content/Context;

    .line 799
    iput-object p2, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->type:Ljava/lang/String;

    .line 800
    iput-object p3, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->title:Ljava/lang/CharSequence;

    .line 801
    iput-object p4, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->pendingIntent:Landroid/app/PendingIntent;

    .line 802
    iput-object p5, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->beginGetCredentialOption:Landroidx/credentials/provider/BeginGetCredentialOption;

    .line 809
    iget-object v0, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->title:Ljava/lang/CharSequence;

    iput-object v0, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->entryGroupId:Ljava/lang/CharSequence;

    .line 797
    return-void
.end method


# virtual methods
.method public final build()Landroidx/credentials/provider/CustomCredentialEntry;
    .locals 21

    .line 887
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    if-nez v1, :cond_0

    .line 888
    iget-object v1, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->context:Landroid/content/Context;

    sget v2, Landroidx/credentials/R$drawable;->ic_other_sign_in:I

    invoke-static {v1, v2}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v1

    iput-object v1, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    .line 890
    :cond_0
    new-instance v2, Landroidx/credentials/provider/CustomCredentialEntry;

    .line 891
    iget-object v3, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->type:Ljava/lang/String;

    .line 892
    iget-object v4, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->title:Ljava/lang/CharSequence;

    .line 893
    iget-object v5, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->pendingIntent:Landroid/app/PendingIntent;

    .line 894
    iget-boolean v6, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->autoSelectAllowed:Z

    .line 895
    iget-object v7, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->subtitle:Ljava/lang/CharSequence;

    .line 896
    iget-object v8, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->typeDisplayName:Ljava/lang/CharSequence;

    .line 897
    iget-object v9, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    invoke-static {v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 898
    iget-object v10, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->lastUsedTime:Lj$/time/Instant;

    .line 899
    iget-object v11, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->beginGetCredentialOption:Landroidx/credentials/provider/BeginGetCredentialOption;

    .line 900
    iget-boolean v12, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->isDefaultIconPreferredAsSingleProvider:Z

    .line 901
    iget-object v13, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->entryGroupId:Ljava/lang/CharSequence;

    .line 890
    nop

    .line 902
    iget-object v15, v0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

    .line 890
    const v19, 0xe800

    const/16 v20, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v2 .. v20}, Landroidx/credentials/provider/CustomCredentialEntry;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/PendingIntent;ZLjava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/drawable/Icon;Lj$/time/Instant;Landroidx/credentials/provider/BeginGetCredentialOption;ZLjava/lang/CharSequence;Ljava/lang/CharSequence;Landroidx/credentials/provider/BiometricPromptData;ZZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v2
.end method

.method public final setAutoSelectAllowed(Z)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 0
    .param p1, "autoSelectAllowed"    # Z

    .line 849
    iput-boolean p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->autoSelectAllowed:Z

    .line 850
    return-object p0
.end method

.method public final setBiometricPromptData(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 0
    .param p1, "biometricPromptData"    # Landroidx/credentials/provider/BiometricPromptData;

    .line 842
    iput-object p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->biometricPromptData:Landroidx/credentials/provider/BiometricPromptData;

    .line 843
    return-object p0
.end method

.method public final setDefaultIconPreferredAsSingleProvider(Z)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 0
    .param p1, "isDefaultIconPreferredAsSingleProvider"    # Z

    .line 881
    iput-boolean p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->isDefaultIconPreferredAsSingleProvider:Z

    .line 882
    return-object p0
.end method

.method public final setEntryGroupId(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 2
    .param p1, "entryGroupId"    # Ljava/lang/CharSequence;

    const-string v0, "entryGroupId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 860
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 861
    iput-object p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->entryGroupId:Ljava/lang/CharSequence;

    .line 862
    return-object p0

    .line 908
    :cond_1
    const/4 v0, 0x0

    .line 860
    .local v0, "$i$a$-require-CustomCredentialEntry$Builder$setEntryGroupId$1":I
    nop

    .end local v0    # "$i$a$-require-CustomCredentialEntry$Builder$setEntryGroupId$1":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "entryGroupId must not be empty"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setIcon(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 1
    .param p1, "icon"    # Landroid/graphics/drawable/Icon;

    const-string v0, "icon"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 830
    iput-object p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->icon:Landroid/graphics/drawable/Icon;

    .line 831
    return-object p0
.end method

.method public final setLastUsedTime(Lj$/time/Instant;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 0
    .param p1, "lastUsedTime"    # Lj$/time/Instant;

    .line 870
    iput-object p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->lastUsedTime:Lj$/time/Instant;

    .line 871
    return-object p0
.end method

.method public final setSubtitle(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 0
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .line 815
    iput-object p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->subtitle:Ljava/lang/CharSequence;

    .line 816
    return-object p0
.end method

.method public final setTypeDisplayName(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;
    .locals 0
    .param p1, "typeDisplayName"    # Ljava/lang/CharSequence;

    .line 821
    iput-object p1, p0, Landroidx/credentials/provider/CustomCredentialEntry$Builder;->typeDisplayName:Ljava/lang/CharSequence;

    .line 822
    return-object p0
.end method
