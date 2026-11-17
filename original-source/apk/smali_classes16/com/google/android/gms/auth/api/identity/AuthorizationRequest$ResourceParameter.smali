.class public final enum Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;
.super Ljava/lang/Enum;
.source "com.google.android.gms:play-services-auth@@21.4.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/auth/api/identity/AuthorizationRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResourceParameter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum ACCOUNT_SELECTION_STATE:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

.field public static final enum ACCOUNT_SELECTION_TOKEN:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

.field public static final enum PICKER_ALLOW_MULTIPLE:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

.field public static final enum PICKER_FILE_IDS:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

.field public static final enum PICKER_MIMETYPES:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

.field public static final enum PICKER_OAUTH_TRIGGER:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

.field private static final synthetic zbb:[Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;


# instance fields
.field final zba:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    const-string v1, "ACCOUNT_SELECTION_TOKEN"

    const/4 v2, 0x0

    const-string v3, "account_selection_token"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->ACCOUNT_SELECTION_TOKEN:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    new-instance v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    .line 2
    const-string v1, "ACCOUNT_SELECTION_STATE"

    const/4 v3, 0x1

    const-string v4, "account_selection_state"

    invoke-direct {v0, v1, v3, v4}, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->ACCOUNT_SELECTION_STATE:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    new-instance v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    .line 3
    const-string v1, "PICKER_ALLOW_MULTIPLE"

    const/4 v4, 0x2

    const-string v5, "allow_multiple"

    invoke-direct {v0, v1, v4, v5}, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_ALLOW_MULTIPLE:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    new-instance v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    .line 4
    const-string v1, "PICKER_MIMETYPES"

    const/4 v5, 0x3

    const-string v6, "mimetypes"

    invoke-direct {v0, v1, v5, v6}, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_MIMETYPES:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    new-instance v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    .line 5
    const-string v1, "PICKER_FILE_IDS"

    const/4 v6, 0x4

    const-string v7, "file_ids"

    invoke-direct {v0, v1, v6, v7}, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_FILE_IDS:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    new-instance v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    .line 6
    const-string v1, "PICKER_OAUTH_TRIGGER"

    const/4 v7, 0x5

    const-string v8, "trigger_onepick"

    invoke-direct {v0, v1, v7, v8}, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_OAUTH_TRIGGER:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    const/4 v0, 0x6

    new-array v0, v0, [Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    sget-object v1, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->ACCOUNT_SELECTION_TOKEN:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->ACCOUNT_SELECTION_STATE:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    aput-object v1, v0, v3

    sget-object v1, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_ALLOW_MULTIPLE:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    aput-object v1, v0, v4

    sget-object v1, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_MIMETYPES:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    aput-object v1, v0, v5

    sget-object v1, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_FILE_IDS:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    aput-object v1, v0, v6

    sget-object v1, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->PICKER_OAUTH_TRIGGER:Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    aput-object v1, v0, v7

    sput-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->zbb:[Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->zba:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 1
    const-class v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    .end local p0    # "name":Ljava/lang/String;
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    return-object p0
.end method

.method public static values()[Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->zbb:[Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    invoke-virtual {v0}, [Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/auth/api/identity/AuthorizationRequest$ResourceParameter;

    return-object v0
.end method
