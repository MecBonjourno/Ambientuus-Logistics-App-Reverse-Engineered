.class public final Lcom/google/android/gms/internal/auth-api/zbav;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-auth@@21.4.0"


# static fields
.field public static final zba:Lcom/google/android/gms/common/Feature;

.field public static final zbb:Lcom/google/android/gms/common/Feature;

.field public static final zbc:Lcom/google/android/gms/common/Feature;

.field public static final zbd:Lcom/google/android/gms/common/Feature;

.field public static final zbe:Lcom/google/android/gms/common/Feature;

.field public static final zbf:Lcom/google/android/gms/common/Feature;

.field public static final zbg:Lcom/google/android/gms/common/Feature;

.field public static final zbh:Lcom/google/android/gms/common/Feature;

.field public static final zbi:Lcom/google/android/gms/common/Feature;

.field public static final zbj:Lcom/google/android/gms/common/Feature;

.field public static final zbk:Lcom/google/android/gms/common/Feature;

.field public static final zbl:Lcom/google/android/gms/common/Feature;

.field public static final zbm:Lcom/google/android/gms/common/Feature;

.field public static final zbn:Lcom/google/android/gms/common/Feature;

.field public static final zbo:Lcom/google/android/gms/common/Feature;

.field public static final zbp:Lcom/google/android/gms/common/Feature;

.field public static final zbq:Lcom/google/android/gms/common/Feature;

.field public static final zbr:Lcom/google/android/gms/common/Feature;

.field public static final zbs:Lcom/google/android/gms/common/Feature;

.field public static final zbt:Lcom/google/android/gms/common/Feature;

.field public static final zbu:Lcom/google/android/gms/common/Feature;

.field public static final zbv:[Lcom/google/android/gms/common/Feature;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/google/android/gms/common/Feature;

    const-string v1, "auth_api_credentials_begin_sign_in"

    const-wide/16 v2, 0x9

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zba:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 2
    const-string v1, "auth_api_credentials_sign_out"

    const-wide/16 v2, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbb:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 3
    const-string v1, "auth_api_credentials_authorize"

    const-wide/16 v2, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbc:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 4
    const-string v1, "auth_api_credentials_revoke_access"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbd:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 5
    const-string v1, "auth_api_credentials_clear_token"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbe:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 6
    const-string v1, "auth_api_credentials_save_password"

    const-wide/16 v4, 0x4

    invoke-direct {v0, v1, v4, v5}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbf:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 7
    const-string v1, "auth_api_credentials_get_sign_in_intent"

    const-wide/16 v4, 0x6

    invoke-direct {v0, v1, v4, v5}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbg:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 8
    const-string v1, "auth_api_credentials_save_account_linking_token"

    const-wide/16 v4, 0x3

    invoke-direct {v0, v1, v4, v5}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbh:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 9
    const-string v1, "auth_api_credentials_get_phone_number_hint_intent"

    invoke-direct {v0, v1, v4, v5}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbi:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 10
    const-string v1, "auth_api_credentials_verify_with_google"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbj:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 11
    const-string v1, "auth_api_credentials_credential_provider"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbk:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 12
    const-string v1, "auth_api_credentials_save_webauthn_credential_specifics"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbl:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 13
    const-string v1, "auth_api_credentials_list_webauthn_credential_specifics"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbm:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 14
    const-string v1, "auth_api_credentials_get_google_passkey_for_export"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbn:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 15
    const-string v1, "auth_api_credentials_get_authentication_intent"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbo:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 16
    const-string v1, "auth_api_credentials_get_registration_intent"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbp:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 17
    const-string v1, "auth_api_credentials_check_key_availability"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbq:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 18
    const-string v1, "auth_api_credentials_has_discoverable_key"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbr:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 19
    const-string v1, "auth_api_credentials_validate_calling_browser"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbs:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 20
    const-string v1, "auth_api_credentials_validate_rp_id_and_calling_package"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbt:Lcom/google/android/gms/common/Feature;

    new-instance v0, Lcom/google/android/gms/common/Feature;

    .line 21
    const-string v1, "auth_api_credentials_get_credential_list_for_browser"

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/common/Feature;-><init>(Ljava/lang/String;J)V

    sput-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zbu:Lcom/google/android/gms/common/Feature;

    sget-object v0, Lcom/google/android/gms/internal/auth-api/zbav;->zba:Lcom/google/android/gms/common/Feature;

    const/16 v1, 0x15

    new-array v1, v1, [Lcom/google/android/gms/common/Feature;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbb:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/4 v0, 0x2

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbc:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/4 v0, 0x3

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbd:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/4 v0, 0x4

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbe:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/4 v0, 0x5

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbf:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/4 v0, 0x6

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbg:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/4 v0, 0x7

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbh:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0x8

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbi:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0x9

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbj:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0xa

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbk:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0xb

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbl:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0xc

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbm:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0xd

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbn:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0xe

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbo:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0xf

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbp:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0x10

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbq:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0x11

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbr:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0x12

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbs:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0x13

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbt:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    const/16 v0, 0x14

    sget-object v2, Lcom/google/android/gms/internal/auth-api/zbav;->zbu:Lcom/google/android/gms/common/Feature;

    aput-object v2, v1, v0

    sput-object v1, Lcom/google/android/gms/internal/auth-api/zbav;->zbv:[Lcom/google/android/gms/common/Feature;

    return-void
.end method
