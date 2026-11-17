.class public final Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;
.super Ljava/lang/Object;
.source "FeatureCombinationQueryImpl.kt"

# interfaces
.implements Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;,
        Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nFeatureCombinationQueryImpl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 FeatureCombinationQueryImpl.kt\nandroidx/camera/camera2/impl/FeatureCombinationQueryImpl\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,363:1\n340#1:364\n1557#2:365\n1628#2,3:366\n1863#2,2:370\n1557#2:372\n1628#2,3:373\n1872#2,3:376\n1863#2,2:380\n1#3:369\n1#3:379\n*S KotlinDebug\n*F\n+ 1 FeatureCombinationQueryImpl.kt\nandroidx/camera/camera2/impl/FeatureCombinationQueryImpl\n*L\n101#1:364\n103#1:365\n103#1:366,3\n101#1:370,2\n125#1:372\n125#1:373,3\n269#1:376,3\n340#1:380,2\n101#1:369\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u0000 B2\u00020\u0001:\u0002ABB\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0010\u0010%\u001a\u00020\"2\u0006\u0010&\u001a\u00020\'H\u0016J\u0016\u0010(\u001a\u0008\u0012\u0004\u0012\u00020*0)2\u0006\u0010&\u001a\u00020\'H\u0002J\u000c\u0010+\u001a\u00020**\u00020,H\u0003J\u000c\u0010-\u001a\u00020**\u00020,H\u0003J\u0014\u0010.\u001a\u00020/*\u0002002\u0006\u00101\u001a\u00020,H\u0002J \u00102\u001a\u0004\u0018\u0001032\u000c\u00104\u001a\u0008\u0012\u0004\u0012\u0002000)2\u0006\u00105\u001a\u00020\'H\u0002J\u000c\u00106\u001a\u00020\u0005*\u00020\'H\u0002J\u000f\u00107\u001a\u0004\u0018\u00010\"H\u0002\u00a2\u0006\u0002\u00108JF\u00109\u001a\u0002H:\"\u000c\u0008\u0000\u0010;*\u00060<j\u0002`=\"\u0004\u0008\u0001\u0010:*\u0008\u0012\u0004\u0012\u0002H;0)2\u0018\u0010>\u001a\u0014\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H;0)\u0012\u0004\u0012\u0002H:0?H\u0082\u0008\u00a2\u0006\u0002\u0010@R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R \u0010\n\u001a\u00070\u000b\u00a2\u0006\u0002\u0008\u000c8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0010\u001a\u0004\u0008\r\u0010\u000eR\u001d\u0010\u0011\u001a\u0004\u0018\u00010\u00128BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0010\u001a\u0004\u0008\u0013\u0010\u0014R\u001b\u0010\u0016\u001a\u00020\u00178BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u0010\u001a\u0004\u0008\u0018\u0010\u0019R\"\u0010\u001b\u001a\t\u0018\u00010\u001c\u00a2\u0006\u0002\u0008\u001d8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008 \u0010\u0010\u001a\u0004\u0008\u001e\u0010\u001fR\u001b\u0010!\u001a\u00020\"8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008$\u0010\u0010\u001a\u0004\u0008!\u0010#\u00a8\u0006C"
    }
    d2 = {
        "Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;",
        "Landroidx/camera/core/featuregroup/impl/FeatureCombinationQuery;",
        "context",
        "Landroid/content/Context;",
        "cameraId",
        "",
        "cameraManagerCompat",
        "Landroidx/camera/camera2/internal/compat/CameraManagerCompat;",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V",
        "cameraDeviceSetupCompat",
        "Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;",
        "Lorg/jspecify/annotations/NonNull;",
        "getCameraDeviceSetupCompat",
        "()Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;",
        "cameraDeviceSetupCompat$delegate",
        "Lkotlin/Lazy;",
        "cameraDeviceSetup",
        "Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;",
        "getCameraDeviceSetup",
        "()Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;",
        "cameraDeviceSetup$delegate",
        "cameraCharacteristics",
        "Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
        "getCameraCharacteristics",
        "()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;",
        "cameraCharacteristics$delegate",
        "dynamicRangeProfiles",
        "Landroid/hardware/camera2/params/DynamicRangeProfiles;",
        "Lorg/jspecify/annotations/Nullable;",
        "getDynamicRangeProfiles",
        "()Landroid/hardware/camera2/params/DynamicRangeProfiles;",
        "dynamicRangeProfiles$delegate",
        "isDeferredSurfaceSupported",
        "",
        "()Z",
        "isDeferredSurfaceSupported$delegate",
        "isSupported",
        "sessionConfig",
        "Landroidx/camera/core/impl/SessionConfig;",
        "createOutputConfigurations",
        "",
        "Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;",
        "toConcreteOutputConfiguration",
        "Landroidx/camera/core/impl/SessionConfig$OutputConfig;",
        "toDeferredOutputConfiguration",
        "applyDynamicRange",
        "",
        "Landroid/hardware/camera2/params/OutputConfiguration;",
        "outputConfig",
        "getCamera2SessionConfiguration",
        "Landroid/hardware/camera2/params/SessionConfiguration;",
        "outputConfigs",
        "cameraXSessionConfig",
        "toLogString",
        "hasPlayServicesDependency",
        "()Ljava/lang/Boolean;",
        "use",
        "R",
        "T",
        "Ljava/lang/AutoCloseable;",
        "Lkotlin/AutoCloseable;",
        "block",
        "Lkotlin/Function1;",
        "(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;",
        "CloseableOutputConfiguration",
        "Companion",
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


# static fields
.field public static final Companion:Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion;

.field private static final FCQ_PLAY_SERVICES_IMPL_KEY:Ljava/lang/String; = "androidx.camera.featurecombinationquery.PLAY_SERVICES_IMPL_PROVIDER_KEY"

.field private static final NO_OP_CALLBACK:Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion$NO_OP_CALLBACK$1;

.field private static final TAG:Ljava/lang/String; = "FeatureCombinationQueryImpl"


# instance fields
.field private final cameraCharacteristics$delegate:Lkotlin/Lazy;

.field private final cameraDeviceSetup$delegate:Lkotlin/Lazy;

.field private final cameraDeviceSetupCompat$delegate:Lkotlin/Lazy;

.field private final cameraId:Ljava/lang/String;

.field private final cameraManagerCompat:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

.field private final context:Landroid/content/Context;

.field private final dynamicRangeProfiles$delegate:Lkotlin/Lazy;

.field private final isDeferredSurfaceSupported$delegate:Lkotlin/Lazy;


# direct methods
.method public static synthetic $r8$lambda$99uyZsXTXM4hUsHwG5Iak5LslUU(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Z
    .locals 0

    invoke-static {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->isDeferredSurfaceSupported_delegate$lambda$4(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$LlWvxwbco-DfGeZ9XL3Y1QofQyg(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroid/hardware/camera2/params/DynamicRangeProfiles;
    .locals 0

    invoke-static {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->dynamicRangeProfiles_delegate$lambda$3(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroid/hardware/camera2/params/DynamicRangeProfiles;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$RFwAk0wED2VmJPZWO9fy2780ugg(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;
    .locals 0

    invoke-static {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraDeviceSetup_delegate$lambda$1(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$mx6QY3EI7LiNwPK1hYf8uAoferk(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .locals 0

    invoke-static {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraCharacteristics_delegate$lambda$2(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$zx4xe71x-6iGB7_GzRyqw_Vw5V0(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;
    .locals 0

    invoke-static {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraDeviceSetupCompat_delegate$lambda$0(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->Companion:Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion;

    .line 347
    new-instance v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion$NO_OP_CALLBACK$1;

    invoke-direct {v0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion$NO_OP_CALLBACK$1;-><init>()V

    sput-object v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->NO_OP_CALLBACK:Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion$NO_OP_CALLBACK$1;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraManagerCompat;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cameraId"    # Ljava/lang/String;
    .param p3, "cameraManagerCompat"    # Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cameraId"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "cameraManagerCompat"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->context:Landroid/content/Context;

    .line 54
    iput-object p2, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraId:Ljava/lang/String;

    .line 55
    iput-object p3, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraManagerCompat:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    .line 58
    new-instance v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraDeviceSetupCompat$delegate:Lkotlin/Lazy;

    .line 74
    new-instance v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraDeviceSetup$delegate:Lkotlin/Lazy;

    .line 82
    new-instance v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraCharacteristics$delegate:Lkotlin/Lazy;

    .line 90
    new-instance v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda3;-><init>(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->dynamicRangeProfiles$delegate:Lkotlin/Lazy;

    .line 95
    new-instance v0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$$ExternalSyntheticLambda4;-><init>(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->isDeferredSurfaceSupported$delegate:Lkotlin/Lazy;

    .line 52
    return-void
.end method

.method private final applyDynamicRange(Landroid/hardware/camera2/params/OutputConfiguration;Landroidx/camera/core/impl/SessionConfig$OutputConfig;)V
    .locals 3
    .param p1, "$this$applyDynamicRange"    # Landroid/hardware/camera2/params/OutputConfiguration;
    .param p2, "outputConfig"    # Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 209
    invoke-direct {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->getDynamicRangeProfiles()Landroid/hardware/camera2/params/DynamicRangeProfiles;

    move-result-object v0

    .line 210
    .local v0, "dynamicRangeProfiles":Landroid/hardware/camera2/params/DynamicRangeProfiles;
    if-nez v0, :cond_0

    .line 211
    return-void

    .line 214
    :cond_0
    nop

    .line 215
    nop

    .line 217
    invoke-virtual {p2}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v1

    .line 218
    nop

    .line 216
    invoke-static {v1, v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangeConversions;->dynamicRangeToFirstSupportedProfile(Landroidx/camera/core/DynamicRange;Landroid/hardware/camera2/params/DynamicRangeProfiles;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    .line 214
    invoke-virtual {p1, v1, v2}, Landroid/hardware/camera2/params/OutputConfiguration;->setDynamicRangeProfile(J)V

    .line 221
    return-void

    .line 216
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Required value was null."

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static final cameraCharacteristics_delegate$lambda$2(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .locals 2
    .param p0, "this$0"    # Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;

    .line 83
    nop

    .line 84
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraManagerCompat:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    iget-object v1, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->getCameraCharacteristicsCompat(Ljava/lang/String;)Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0
    :try_end_0
    .catch Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 87
    return-object v0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    .local v0, "e":Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;
    invoke-static {v0}, Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;->createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;

    move-result-object v1

    throw v1
.end method

.method private static final cameraDeviceSetupCompat_delegate$lambda$0(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;
    .locals 2
    .param p0, "this$0"    # Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;

    .line 59
    new-instance v0, Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompatFactory;

    iget-object v1, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompatFactory;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompatFactory;->getCameraDeviceSetupCompat(Ljava/lang/String;)Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;

    move-result-object v0

    return-object v0
.end method

.method private static final cameraDeviceSetup_delegate$lambda$1(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;
    .locals 2
    .param p0, "this$0"    # Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;

    .line 75
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraManagerCompat:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->unwrap()Landroid/hardware/camera2/CameraManager;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraManager;->isCameraDeviceSetupSupported(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraManagerCompat:Landroidx/camera/camera2/internal/compat/CameraManagerCompat;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/CameraManagerCompat;->unwrap()Landroid/hardware/camera2/CameraManager;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraManager;->getCameraDeviceSetup(Ljava/lang/String;)Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;

    move-result-object v0

    goto :goto_0

    .line 78
    :cond_0
    const/4 v0, 0x0

    .line 79
    :goto_0
    return-object v0
.end method

.method private final createOutputConfigurations(Landroidx/camera/core/impl/SessionConfig;)Ljava/util/List;
    .locals 13
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/SessionConfig;",
            ")",
            "Ljava/util/List<",
            "Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;",
            ">;"
        }
    .end annotation

    .line 125
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getOutputConfigs()Ljava/util/List;

    move-result-object v0

    const-string v1, "getOutputConfigs(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 372
    .local v1, "$i$f$map":I
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .local v2, "destination$iv$iv":Ljava/util/Collection;
    move-object v3, v0

    .local v3, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 373
    .local v4, "$i$f$mapTo":I
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 374
    .local v6, "item$iv$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .local v7, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    const/4 v8, 0x0

    .line 126
    .local v8, "$i$a$-map-FeatureCombinationQueryImpl$createOutputConfigurations$outputConfigs$1":I
    invoke-direct {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->isDeferredSurfaceSupported()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 127
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v7}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->toDeferredOutputConfiguration(Landroidx/camera/core/impl/SessionConfig$OutputConfig;)Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;

    move-result-object v9

    goto :goto_1

    .line 129
    :cond_0
    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, v7}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->toConcreteOutputConfiguration(Landroidx/camera/core/impl/SessionConfig$OutputConfig;)Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;

    move-result-object v9

    .line 131
    :goto_1
    move-object v10, v9

    .local v10, "$this$createOutputConfigurations_u24lambda_u248_u24lambda_u247":Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;
    const/4 v11, 0x0

    .line 132
    .local v11, "$i$a$-apply-FeatureCombinationQueryImpl$createOutputConfigurations$outputConfigs$1$1":I
    nop

    .line 133
    invoke-virtual {v7}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v12

    invoke-virtual {v12}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v12

    if-eqz v12, :cond_1

    .line 135
    invoke-virtual {v10}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;->getValue()Landroid/hardware/camera2/params/OutputConfiguration;

    move-result-object v12

    invoke-direct {p0, v12, v7}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->applyDynamicRange(Landroid/hardware/camera2/params/OutputConfiguration;Landroidx/camera/core/impl/SessionConfig$OutputConfig;)V

    .line 137
    :cond_1
    nop

    .line 131
    .end local v10    # "$this$createOutputConfigurations_u24lambda_u248_u24lambda_u247":Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;
    .end local v11    # "$i$a$-apply-FeatureCombinationQueryImpl$createOutputConfigurations$outputConfigs$1$1":I
    nop

    .line 137
    nop

    .line 374
    .end local v7    # "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .end local v8    # "$i$a$-map-FeatureCombinationQueryImpl$createOutputConfigurations$outputConfigs$1":I
    invoke-interface {v2, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 375
    .end local v6    # "item$iv$iv":Ljava/lang/Object;
    :cond_2
    nop

    .end local v2    # "destination$iv$iv":Ljava/util/Collection;
    .end local v3    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$mapTo":I
    check-cast v2, Ljava/util/List;

    .line 372
    nop

    .line 125
    .end local v0    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$map":I
    nop

    .line 124
    nop

    .line 140
    .local v2, "outputConfigs":Ljava/util/List;
    return-object v2
.end method

.method private static final dynamicRangeProfiles_delegate$lambda$3(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Landroid/hardware/camera2/params/DynamicRangeProfiles;
    .locals 1
    .param p0, "this$0"    # Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;

    .line 91
    invoke-direct {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->getCameraCharacteristics()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->fromCameraCharacteristics(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;

    move-result-object v0

    .line 92
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/params/DynamicRangesCompat;->toDynamicRangeProfiles()Landroid/hardware/camera2/params/DynamicRangeProfiles;

    move-result-object v0

    return-object v0
.end method

.method private final getCamera2SessionConfiguration(Ljava/util/List;Landroidx/camera/core/impl/SessionConfig;)Landroid/hardware/camera2/params/SessionConfiguration;
    .locals 7
    .param p1, "outputConfigs"    # Ljava/util/List;
    .param p2, "cameraXSessionConfig"    # Landroidx/camera/core/impl/SessionConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/OutputConfiguration;",
            ">;",
            "Landroidx/camera/core/impl/SessionConfig;",
            ")",
            "Landroid/hardware/camera2/params/SessionConfiguration;"
        }
    .end annotation

    .line 228
    new-instance v0, Landroid/hardware/camera2/params/SessionConfiguration;

    .line 229
    nop

    .line 230
    nop

    .line 231
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    .line 232
    sget-object v2, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->NO_OP_CALLBACK:Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$Companion$NO_OP_CALLBACK$1;

    check-cast v2, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    .line 228
    const/4 v3, 0x0

    invoke-direct {v0, v3, p1, v1, v2}, Landroid/hardware/camera2/params/SessionConfiguration;-><init>(ILjava/util/List;Ljava/util/concurrent/Executor;Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)V

    .line 227
    nop

    .line 235
    .local v0, "camera2SessionConfig":Landroid/hardware/camera2/params/SessionConfiguration;
    invoke-direct {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->getCameraDeviceSetup()Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;

    move-result-object v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 237
    .local v1, "cameraDeviceSetup":Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;
    :cond_0
    nop

    .line 238
    nop

    .line 239
    invoke-virtual {p2}, Landroidx/camera/core/impl/SessionConfig;->getTemplateType()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    .line 240
    move-object v3, v2

    .local v3, "$this$getCamera2SessionConfiguration_u24lambda_u249":Landroid/hardware/camera2/CaptureRequest$Builder;
    const/4 v4, 0x0

    .line 241
    .local v4, "$i$a$-apply-FeatureCombinationQueryImpl$getCamera2SessionConfiguration$1":I
    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_TARGET_FPS_RANGE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p2}, Landroidx/camera/core/impl/SessionConfig;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 243
    nop

    .line 244
    invoke-virtual {p2}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/core/impl/CaptureConfig;->getPreviewStabilizationMode()I

    move-result v5

    .line 245
    nop

    .line 244
    const/4 v6, 0x2

    if-ne v5, v6, :cond_1

    .line 247
    nop

    .line 248
    sget-object v5, Landroid/hardware/camera2/CaptureRequest;->CONTROL_VIDEO_STABILIZATION_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 249
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 247
    invoke-virtual {v3, v5, v6}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 252
    :cond_1
    nop

    .line 240
    .end local v3    # "$this$getCamera2SessionConfiguration_u24lambda_u249":Landroid/hardware/camera2/CaptureRequest$Builder;
    .end local v4    # "$i$a$-apply-FeatureCombinationQueryImpl$getCamera2SessionConfiguration$1":I
    nop

    .line 253
    invoke-virtual {v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v2

    .line 237
    invoke-virtual {v0, v2}, Landroid/hardware/camera2/params/SessionConfiguration;->setSessionParameters(Landroid/hardware/camera2/CaptureRequest;)V

    .line 255
    return-object v0
.end method

.method private final getCameraCharacteristics()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .locals 1

    .line 82
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraCharacteristics$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    return-object v0
.end method

.method private final getCameraDeviceSetup()Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;
    .locals 1

    .line 74
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraDeviceSetup$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/CameraDevice$CameraDeviceSetup;

    return-object v0
.end method

.method private final getCameraDeviceSetupCompat()Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;
    .locals 1

    .line 58
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->cameraDeviceSetupCompat$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;

    return-object v0
.end method

.method private final getDynamicRangeProfiles()Landroid/hardware/camera2/params/DynamicRangeProfiles;
    .locals 1

    .line 90
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->dynamicRangeProfiles$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/camera2/params/DynamicRangeProfiles;

    return-object v0
.end method

.method private final hasPlayServicesDependency()Ljava/lang/Boolean;
    .locals 6

    .line 294
    nop

    .line 295
    :try_start_0
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 296
    iget-object v1, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 297
    nop

    .line 295
    const/16 v2, 0x84

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 294
    nop

    .line 293
    nop

    .line 304
    .local v0, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->services:[Landroid/content/pm/ServiceInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 305
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 308
    :cond_0
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->services:[Landroid/content/pm/ServiceInfo;

    invoke-static {v1}, Lkotlin/jvm/internal/ArrayIteratorKt;->iterator([Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ServiceInfo;

    .line 311
    .local v3, "serviceInfo":Landroid/content/pm/ServiceInfo;
    nop

    .line 312
    iget-object v4, v3, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    if-eqz v4, :cond_1

    .line 313
    iget-object v4, v3, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    const-string v5, "androidx.camera.featurecombinationquery.PLAY_SERVICES_IMPL_PROVIDER_KEY"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 315
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 319
    .end local v3    # "serviceInfo":Landroid/content/pm/ServiceInfo;
    :cond_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1

    .line 299
    .end local v0    # "packageInfo":Landroid/content/pm/PackageInfo;
    :catch_0
    move-exception v0

    .line 301
    .local v0, "<unused var>":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, 0x0

    return-object v1
.end method

.method private final isDeferredSurfaceSupported()Z
    .locals 1

    .line 95
    iget-object v0, p0, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->isDeferredSurfaceSupported$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method private static final isDeferredSurfaceSupported_delegate$lambda$4(Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;)Z
    .locals 2
    .param p0, "this$0"    # Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;

    .line 97
    invoke-direct {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->hasPlayServicesDependency()Ljava/lang/Boolean;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private final toConcreteOutputConfiguration(Landroidx/camera/core/impl/SessionConfig$OutputConfig;)Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;
    .locals 8
    .param p1, "$this$toConcreteOutputConfiguration"    # Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 154
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    .line 156
    const-class v1, Landroid/media/MediaCodec;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/32 v0, 0x10000

    goto :goto_0

    .line 159
    :cond_0
    const-class v1, Landroid/view/SurfaceHolder;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-wide/16 v0, 0x800

    goto :goto_0

    .line 160
    :cond_1
    const-class v1, Landroid/graphics/SurfaceTexture;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-wide/16 v0, 0x100

    goto :goto_0

    .line 163
    :cond_2
    const-wide/16 v0, 0x0

    .line 154
    :goto_0
    nop

    .line 153
    move-wide v6, v0

    .line 167
    .local v6, "usageFlag":J
    nop

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "toConcreteOutputConfiguration: surface containerClass = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 169
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v1

    .line 168
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 169
    nop

    .line 168
    const-string v1, ", usageFlag = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 169
    nop

    .line 168
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 166
    const-string v1, "FeatureCombinationQueryImpl"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v2

    .line 175
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v0

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v3

    .line 176
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedStreamFormat()I

    move-result v4

    .line 177
    nop

    .line 178
    nop

    .line 173
    const/4 v5, 0x1

    invoke-static/range {v2 .. v7}, Landroid/media/ImageReader;->newInstance(IIIIJ)Landroid/media/ImageReader;

    move-result-object v0

    const-string v1, "newInstance(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 172
    nop

    .line 181
    .local v0, "imageReader":Landroid/media/ImageReader;
    new-instance v1, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;

    new-instance v2, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/view/Surface;)V

    invoke-direct {v1, v2, v0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;-><init>(Landroid/hardware/camera2/params/OutputConfiguration;Landroid/media/ImageReader;)V

    return-object v1
.end method

.method private final toDeferredOutputConfiguration(Landroidx/camera/core/impl/SessionConfig$OutputConfig;)Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;
    .locals 5
    .param p1, "$this$toDeferredOutputConfiguration"    # Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .line 187
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v0

    .line 190
    .local v0, "surfaceClass":Ljava/lang/Class;
    nop

    .line 191
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "toDeferredOutputConfiguration: surface containerClass = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 189
    const-string v2, "FeatureCombinationQueryImpl"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    new-instance v1, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;

    .line 195
    if-eqz v0, :cond_1

    .line 197
    new-instance v2, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-direct {v2, v3, v0}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(Landroid/util/Size;Ljava/lang/Class;)V

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Required value was null."

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 203
    :cond_1
    new-instance v2, Landroid/hardware/camera2/params/OutputConfiguration;

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedStreamFormat()I

    move-result v3

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(ILandroid/util/Size;)V

    .line 194
    :goto_0
    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-direct {v1, v2, v4, v3, v4}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;-><init>(Landroid/hardware/camera2/params/OutputConfiguration;Landroid/media/ImageReader;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v1
.end method

.method private final toLogString(Landroidx/camera/core/impl/SessionConfig;)Ljava/lang/String;
    .locals 11
    .param p1, "$this$toLogString"    # Landroidx/camera/core/impl/SessionConfig;

    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "sessionParameters=["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fpsRange="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getExpectedFrameRateRange()Landroid/util/Range;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    nop

    .line 264
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", previewStabilizationMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCaptureConfig()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/impl/CaptureConfig;->getPreviewStabilizationMode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 263
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    const-string v1, "], "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    const-string v1, "outputConfigurations=["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    invoke-virtual {p1}, Landroidx/camera/core/impl/SessionConfig;->getOutputConfigs()Ljava/util/List;

    move-result-object v1

    const-string v2, "getOutputConfigs(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$forEachIndexed$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 376
    .local v2, "$i$f$forEachIndexed":I
    const/4 v3, 0x0

    .line 377
    .local v3, "index$iv":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "item$iv":Ljava/lang/Object;
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "index$iv":I
    .local v6, "index$iv":I
    if-gez v3, :cond_0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_0
    move-object v7, v5

    check-cast v7, Landroidx/camera/core/impl/SessionConfig$OutputConfig;

    .local v3, "index":I
    .local v7, "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    const/4 v8, 0x0

    .line 270
    .local v8, "$i$a$-forEachIndexed-FeatureCombinationQueryImpl$toLogString$1":I
    if-eqz v3, :cond_1

    .line 271
    const-string v9, ","

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    :cond_1
    nop

    .line 274
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "{format="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v7}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedStreamFormat()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 275
    nop

    .line 274
    const-string v10, ", size="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 275
    invoke-virtual {v7}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/camera/core/impl/DeferrableSurface;->getPrescribedSize()Landroid/util/Size;

    move-result-object v10

    .line 274
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 276
    nop

    .line 274
    const-string v10, ", dynamicRange="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 276
    invoke-virtual {v7}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getDynamicRange()Landroidx/camera/core/DynamicRange;

    move-result-object v10

    .line 274
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 277
    nop

    .line 274
    const-string v10, ", class="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 277
    invoke-virtual {v7}, Landroidx/camera/core/impl/SessionConfig$OutputConfig;->getSurface()Landroidx/camera/core/impl/DeferrableSurface;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/camera/core/impl/DeferrableSurface;->getContainerClass()Ljava/lang/Class;

    move-result-object v10

    .line 274
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0x7d

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 273
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    nop

    .line 377
    .end local v3    # "index":I
    .end local v7    # "outputConfig":Landroidx/camera/core/impl/SessionConfig$OutputConfig;
    .end local v8    # "$i$a$-forEachIndexed-FeatureCombinationQueryImpl$toLogString$1":I
    move v3, v6

    .end local v5    # "item$iv":Ljava/lang/Object;
    goto :goto_0

    .line 378
    .end local v6    # "index$iv":I
    .local v3, "index$iv":I
    :cond_2
    nop

    .line 280
    .end local v1    # "$this$forEachIndexed$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEachIndexed":I
    .end local v3    # "index$iv":I
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "toString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1
.end method

.method private final use(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;
    .locals 10
    .param p1, "$this$use"    # Ljava/util/List;
    .param p2, "block"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/AutoCloseable;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/util/List<",
            "+TT;>;+TR;>;)TR;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 340
    .local v0, "$i$f$use":I
    invoke-interface {p2, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    .line 379
    .local v2, "it":Ljava/lang/Object;
    const/4 v3, 0x0

    .line 340
    .local v3, "$i$a$-also-FeatureCombinationQueryImpl$use$1":I
    move-object v4, p1

    check-cast v4, Ljava/lang/Iterable;

    .local v4, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 380
    .local v5, "$i$f$forEach":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    .local v7, "element$iv":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Ljava/lang/AutoCloseable;

    .local v8, "it":Ljava/lang/AutoCloseable;
    const/4 v9, 0x0

    .line 340
    .local v9, "$i$a$-forEach-FeatureCombinationQueryImpl$use$1$1":I
    invoke-interface {v8}, Ljava/lang/AutoCloseable;->close()V

    .line 380
    .end local v8    # "it":Ljava/lang/AutoCloseable;
    .end local v9    # "$i$a$-forEach-FeatureCombinationQueryImpl$use$1$1":I
    nop

    .end local v7    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 381
    :cond_0
    nop

    .line 340
    .end local v4    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$forEach":I
    nop

    .end local v2    # "it":Ljava/lang/Object;
    .end local v3    # "$i$a$-also-FeatureCombinationQueryImpl$use$1":I
    return-object v1
.end method


# virtual methods
.method public isSupported(Landroidx/camera/core/impl/SessionConfig;)Z
    .locals 14
    .param p1, "sessionConfig"    # Landroidx/camera/core/impl/SessionConfig;

    const-string/jumbo v0, "sessionConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 101
    invoke-direct {p0, p1}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->createOutputConfigurations(Landroidx/camera/core/impl/SessionConfig;)Ljava/util/List;

    move-result-object v0

    .local v0, "$this$use$iv":Ljava/util/List;
    move-object v1, p0

    .local v1, "this_$iv":Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;
    const/4 v2, 0x0

    .line 364
    .local v2, "$i$f$use":I
    move-object v3, v0

    .local v3, "outputConfigs":Ljava/util/List;
    const/4 v4, 0x0

    .line 103
    .local v4, "$i$a$-use-FeatureCombinationQueryImpl$isSupported$1":I
    move-object v5, v3

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 365
    .local v6, "$i$f$map":I
    new-instance v7, Ljava/util/ArrayList;

    const/16 v8, 0xa

    invoke-static {v5, v8}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v7, Ljava/util/Collection;

    .local v7, "destination$iv$iv":Ljava/util/Collection;
    move-object v8, v5

    .local v8, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 366
    .local v9, "$i$f$mapTo":I
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 367
    .local v11, "item$iv$iv":Ljava/lang/Object;
    move-object v12, v11

    check-cast v12, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;

    .local v12, "it":Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;
    const/4 v13, 0x0

    .line 103
    .local v13, "$i$a$-map-FeatureCombinationQueryImpl$isSupported$1$camera2SessionConfiguration$1":I
    invoke-virtual {v12}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;->getValue()Landroid/hardware/camera2/params/OutputConfiguration;

    move-result-object v12

    .line 367
    .end local v12    # "it":Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl$CloseableOutputConfiguration;
    .end local v13    # "$i$a$-map-FeatureCombinationQueryImpl$isSupported$1$camera2SessionConfiguration$1":I
    invoke-interface {v7, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 368
    .end local v11    # "item$iv$iv":Ljava/lang/Object;
    :cond_0
    nop

    .end local v7    # "destination$iv$iv":Ljava/util/Collection;
    .end local v8    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$mapTo":I
    check-cast v7, Ljava/util/List;

    .line 365
    nop

    .line 103
    .end local v5    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$map":I
    invoke-direct {p0, v7, p1}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->getCamera2SessionConfiguration(Ljava/util/List;Landroidx/camera/core/impl/SessionConfig;)Landroid/hardware/camera2/params/SessionConfiguration;

    move-result-object v5

    const/4 v6, 0x0

    if-nez v5, :cond_1

    .line 104
    return v6

    .line 102
    :cond_1
    nop

    .line 107
    .local v5, "camera2SessionConfiguration":Landroid/hardware/camera2/params/SessionConfiguration;
    invoke-direct {p0}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->getCameraDeviceSetupCompat()Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;

    move-result-object v7

    .line 108
    invoke-interface {v7, v5}, Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat;->isSessionConfigurationSupported(Landroid/hardware/camera2/params/SessionConfiguration;)Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat$SupportQueryResult;

    move-result-object v7

    .line 109
    invoke-virtual {v7}, Landroidx/camera/featurecombinationquery/CameraDeviceSetupCompat$SupportQueryResult;->getSupported()I

    move-result v7

    .line 106
    nop

    .line 112
    .local v7, "supported":I
    nop

    .line 113
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "isSupported: supported = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " for session config with "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 114
    invoke-direct {p0, p1}, Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;->toLogString(Landroidx/camera/core/impl/SessionConfig;)Ljava/lang/String;

    move-result-object v9

    .line 113
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 111
    const-string v9, "FeatureCombinationQueryImpl"

    invoke-static {v9, v8}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    const/4 v8, 0x1

    if-ne v7, v8, :cond_2

    move v6, v8

    .line 364
    .end local v3    # "outputConfigs":Ljava/util/List;
    .end local v4    # "$i$a$-use-FeatureCombinationQueryImpl$isSupported$1":I
    .end local v5    # "camera2SessionConfiguration":Landroid/hardware/camera2/params/SessionConfiguration;
    .end local v7    # "supported":I
    :cond_2
    move v3, v6

    .line 369
    .local v3, "it$iv":Z
    const/4 v4, 0x0

    .line 364
    .local v4, "$i$a$-also-FeatureCombinationQueryImpl$use$1$iv":I
    move-object v5, v0

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$forEach$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 370
    .local v7, "$i$f$forEach":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .local v9, "element$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Ljava/lang/AutoCloseable;

    .local v10, "it$iv":Ljava/lang/AutoCloseable;
    const/4 v11, 0x0

    .line 364
    .local v11, "$i$a$-forEach-FeatureCombinationQueryImpl$use$1$1$iv":I
    invoke-interface {v10}, Ljava/lang/AutoCloseable;->close()V

    .line 370
    .end local v10    # "it$iv":Ljava/lang/AutoCloseable;
    .end local v11    # "$i$a$-forEach-FeatureCombinationQueryImpl$use$1$1$iv":I
    nop

    .end local v9    # "element$iv$iv":Ljava/lang/Object;
    goto :goto_1

    .line 371
    :cond_3
    nop

    .line 364
    .end local v5    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$forEach":I
    nop

    .line 101
    .end local v0    # "$this$use$iv":Ljava/util/List;
    .end local v1    # "this_$iv":Landroidx/camera/camera2/impl/FeatureCombinationQueryImpl;
    .end local v2    # "$i$f$use":I
    .end local v3    # "it$iv":Z
    .end local v4    # "$i$a$-also-FeatureCombinationQueryImpl$use$1$iv":I
    return v6
.end method
