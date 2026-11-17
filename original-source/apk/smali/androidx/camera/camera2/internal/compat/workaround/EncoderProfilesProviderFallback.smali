.class public final Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;
.super Ljava/lang/Object;
.source "EncoderProfilesProviderFallback.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEncoderProfilesProviderFallback.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EncoderProfilesProviderFallback.kt\nandroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,159:1\n1#2:160\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001BA\u00128\u0008\u0002\u0010\u0002\u001a2\u0012\u0013\u0012\u00110\u0004\u00a2\u0006\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\u0007\u0012\u0013\u0012\u00110\u0008\u00a2\u0006\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\t\u0012\u0004\u0012\u00020\n0\u0003\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001e\u0010\r\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000e\u001a\u00020\u000fJ\u0018\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\nH\u0002J\u0012\u0010\u0015\u001a\u0004\u0018\u00010\n2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002J\u000c\u0010\u0016\u001a\u00020\u0011*\u00020\u0013H\u0002J\u0012\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u0018*\u00020\u0013H\u0002R>\u0010\u0002\u001a2\u0012\u0013\u0012\u00110\u0004\u00a2\u0006\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\u0007\u0012\u0013\u0012\u00110\u0008\u00a2\u0006\u000c\u0008\u0005\u0012\u0008\u0008\u0006\u0012\u0004\u0008\u0008(\t\u0012\u0004\u0012\u00020\n0\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;",
        "",
        "providerFactory",
        "Lkotlin/Function2;",
        "",
        "Lkotlin/ParameterName;",
        "name",
        "cameraId",
        "Landroidx/camera/core/impl/Quirks;",
        "quirks",
        "Landroidx/camera/core/impl/EncoderProfilesProvider;",
        "<init>",
        "(Lkotlin/jvm/functions/Function2;)V",
        "resolveProvider",
        "cameraManager",
        "Landroidx/camera/camera2/internal/compat/CameraManagerCompat;",
        "needFallback",
        "",
        "characteristics",
        "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
        "provider",
        "findProviderWithLargestSize",
        "isExternalCamera",
        "getPrivateFormatSizes",
        "",
        "Landroid/util/Size;",
        "camera-camera2_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final providerFactory:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "Ljava/lang/String;",
            "Landroidx/camera/core/impl/Quirks;",
            "Landroidx/camera/core/impl/EncoderProfilesProvider;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$-4oSyjJf-S9_0FnuWHrPIK-Rhb8(Ljava/lang/String;Landroidx/camera/core/impl/Quirks;)Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;
    .locals 0

    invoke-static {p0, p1}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->_init_$lambda$0(Ljava/lang/String;Landroidx/camera/core/impl/Quirks;)Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;-><init>(Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/functions/Function2;)V
    .locals 1
    .param p1, "providerFactory"    # Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Ljava/lang/String;",
            "-",
            "Landroidx/camera/core/impl/Quirks;",
            "+",
            "Landroidx/camera/core/impl/EncoderProfilesProvider;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "providerFactory"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->providerFactory:Lkotlin/jvm/functions/Function2;

    .line 42
    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function2;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 42
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 50
    new-instance p1, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback$$ExternalSyntheticLambda0;

    invoke-direct {p1}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback$$ExternalSyntheticLambda0;-><init>()V

    .line 42
    :cond_0
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;-><init>(Lkotlin/jvm/functions/Function2;)V

    .line 53
    return-void
.end method

.method private static final _init_$lambda$0(Ljava/lang/String;Landroidx/camera/core/impl/Quirks;)Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;
    .locals 1
    .param p0, "cameraId"    # Ljava/lang/String;
    .param p1, "quirks"    # Landroidx/camera/core/impl/Quirks;

    const-string v0, "cameraId"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "quirks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    new-instance v0, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;

    invoke-direct {v0, p0, p1}, Landroidx/camera/camera2/internal/Camera2EncoderProfilesProvider;-><init>(Ljava/lang/String;Landroidx/camera/core/impl/Quirks;)V

    return-object v0
.end method

.method private final findProviderWithLargestSize(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)Landroidx/camera/core/impl/EncoderProfilesProvider;
    .locals 14
    .param p1, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 128
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v0, p0

    check-cast v0, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;

    .line 160
    .local v0, "$this$findProviderWithLargestSize_u24lambda_u241":Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;
    const/4 v1, 0x0

    .line 128
    .local v1, "$i$a$-runCatching-EncoderProfilesProviderFallback$findProviderWithLargestSize$cameraIds$1":I
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraIdList()[Ljava/lang/String;

    move-result-object v2

    .end local v0    # "$this$findProviderWithLargestSize_u24lambda_u241":Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;
    .end local v1    # "$i$a$-runCatching-EncoderProfilesProviderFallback$findProviderWithLargestSize$cameraIds$1":I
    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    move-object v0, v2

    :cond_0
    check-cast v0, [Ljava/lang/String;

    if-nez v0, :cond_1

    return-object v2

    .line 130
    .local v0, "cameraIds":[Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 131
    .local v1, "largestProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    const/4 v2, 0x0

    .line 133
    .local v2, "largestProfileArea":I
    array-length v3, v0

    const/4 v4, 0x0

    move v5, v4

    :goto_1
    if-ge v5, v3, :cond_4

    aget-object v6, v0, v5

    .line 134
    .local v6, "cameraId":Ljava/lang/String;
    invoke-virtual {p1, v6}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v7

    const-string v8, "getCameraCharacteristicsCompat(...)"

    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 135
    .local v7, "characteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    invoke-static {v6, v7}, Landroidx/camera/camera2/internal/compat/quirk/CameraQuirks;->get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/impl/Quirks;

    move-result-object v8

    const-string v9, "get(...)"

    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 136
    .local v8, "quirks":Landroidx/camera/core/impl/Quirks;
    iget-object v9, p0, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->providerFactory:Lkotlin/jvm/functions/Function2;

    invoke-static {v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v9, v6, v8}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 139
    .local v9, "provider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    const/4 v10, 0x1

    invoke-interface {v9, v10}, Landroidx/camera/core/impl/EncoderProfilesProvider;->getAll(I)Landroidx/camera/core/impl/EncoderProfilesProxy;

    move-result-object v10

    if-eqz v10, :cond_2

    invoke-interface {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v10

    if-eqz v10, :cond_2

    invoke-static {v10}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    if-eqz v10, :cond_2

    .local v10, "it":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    const/4 v11, 0x0

    .line 140
    .local v11, "$i$a$-let-EncoderProfilesProviderFallback$findProviderWithLargestSize$profileArea$1":I
    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getWidth()I

    move-result v12

    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHeight()I

    move-result v13

    invoke-static {v12, v13}, Landroidx/camera/core/internal/utils/SizeUtil;->getArea(II)I

    move-result v10

    .line 139
    .end local v10    # "it":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v11    # "$i$a$-let-EncoderProfilesProviderFallback$findProviderWithLargestSize$profileArea$1":I
    goto :goto_2

    .line 141
    :cond_2
    move v10, v4

    .line 139
    :goto_2
    nop

    .line 138
    nop

    .line 143
    .local v10, "profileArea":I
    if-le v10, v2, :cond_3

    .line 144
    move v2, v10

    .line 145
    move-object v1, v9

    .line 133
    .end local v6    # "cameraId":Ljava/lang/String;
    .end local v7    # "characteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .end local v8    # "quirks":Landroidx/camera/core/impl/Quirks;
    .end local v9    # "provider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    .end local v10    # "profileArea":I
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 149
    :cond_4
    return-object v1
.end method

.method private final getPrivateFormatSizes(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Ljava/util/List;
    .locals 2
    .param p1, "$this$getPrivateFormatSizes"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
            ")",
            "Ljava/util/List<",
            "Landroid/util/Size;",
            ">;"
        }
    .end annotation

    .line 156
    invoke-virtual {p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->getStreamConfigurationMapCompat()Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;

    move-result-object v0

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompat;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lkotlin/collections/ArraysKt;->toList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    .line 157
    :cond_0
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method private final isExternalCamera(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z
    .locals 2
    .param p1, "$this$isExternalCamera"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 153
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p1, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method private final needFallback(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/core/impl/EncoderProfilesProvider;)Z
    .locals 2
    .param p1, "characteristics"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p2, "provider"    # Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 111
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->isExternalCamera(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-interface {p2, v0}, Landroidx/camera/core/impl/EncoderProfilesProvider;->hasProfile(I)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public final resolveProvider(Ljava/lang/String;Landroidx/camera/core/impl/Quirks;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)Landroidx/camera/core/impl/EncoderProfilesProvider;
    .locals 5
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "quirks"    # Landroidx/camera/core/impl/Quirks;
    .param p3, "cameraManager"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    const-string v0, "cameraId"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "quirks"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cameraManager"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 74
    const/4 v0, 0x0

    .line 75
    .local v0, "provider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    invoke-virtual {p3, p1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v1

    const-string v2, "getCameraCharacteristicsCompat(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    .local v1, "characteristics":Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    iget-object v2, p0, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->providerFactory:Lkotlin/jvm/functions/Function2;

    invoke-interface {v2, p1, p2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 78
    .local v2, "defaultProvider":Landroidx/camera/core/impl/EncoderProfilesProvider;
    invoke-direct {p0, v1, v2}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->needFallback(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;Landroidx/camera/core/impl/EncoderProfilesProvider;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 81
    invoke-direct {p0, p3}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->findProviderWithLargestSize(Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)Landroidx/camera/core/impl/EncoderProfilesProvider;

    move-result-object v0

    .line 82
    if-eqz v0, :cond_0

    .line 84
    new-instance v3, Landroidx/camera/camera2/internal/compat/workaround/SizeFilteredEncoderProfilesProvider;

    .line 85
    nop

    .line 86
    invoke-direct {p0, v1}, Landroidx/camera/camera2/internal/compat/workaround/EncoderProfilesProviderFallback;->getPrivateFormatSizes(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Ljava/util/List;

    move-result-object v4

    .line 84
    invoke-direct {v3, v0, v4}, Landroidx/camera/camera2/internal/compat/workaround/SizeFilteredEncoderProfilesProvider;-><init>(Landroidx/camera/core/impl/EncoderProfilesProvider;Ljava/util/List;)V

    check-cast v3, Landroidx/camera/core/impl/EncoderProfilesProvider;

    .line 83
    move-object v0, v3

    .line 91
    :cond_0
    if-nez v0, :cond_1

    .line 92
    move-object v0, v2

    .line 95
    :cond_1
    return-object v0
.end method
