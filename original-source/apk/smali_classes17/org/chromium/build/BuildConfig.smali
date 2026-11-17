.class public Lorg/chromium/build/BuildConfig;
.super Ljava/lang/Object;
.source "BuildConfig.java"


# static fields
.field public static BUNDLES_SUPPORTED:Z

.field public static ENABLE_ASSERTS:Z

.field public static ISOLATED_SPLITS_ENABLED:Z

.field public static IS_CHROME_BRANDED:Z

.field public static IS_FOR_TEST:Z

.field public static IS_INCREMENTAL_INSTALL:Z

.field public static IS_UBSAN:Z

.field public static MIN_SDK_VERSION:I

.field public static R_STRING_PRODUCT_VERSION:I

.field public static WRITE_CLANG_PROFILING_DATA:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 7
    const/4 v0, 0x1

    sput v0, Lorg/chromium/build/BuildConfig;->MIN_SDK_VERSION:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
