.class public final Lcom/coleta/ambientuus/BuildConfig;
.super Ljava/lang/Object;
.source "BuildConfig.java"


# static fields
.field public static final APPLICATION_ID:Ljava/lang/String; = "com.coleta.ambientuus.debug"

.field public static final BUILD_TYPE:Ljava/lang/String; = "debug"

.field public static final DEBUG:Z

.field public static final ServerClientIdGoogleAuth:Ljava/lang/String; = "903755048894-rnt9c9dcece0no3ipun5etu80f8o9fbo.apps.googleusercontent.com"

.field public static final URL_BASE:Ljava/lang/String; = "http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/"

.field public static final VERSION_CODE:I = 0x3b

.field public static final VERSION_NAME:Ljava/lang/String; = "1.59-DEBUG"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const-string v0, "true"

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/coleta/ambientuus/BuildConfig;->DEBUG:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
