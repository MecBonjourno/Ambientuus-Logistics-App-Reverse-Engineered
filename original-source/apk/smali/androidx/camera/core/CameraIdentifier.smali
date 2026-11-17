.class public final Landroidx/camera/core/CameraIdentifier;
.super Ljava/lang/Object;
.source "CameraIdentifier.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/CameraIdentifier$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCameraIdentifier.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CameraIdentifier.kt\nandroidx/camera/core/CameraIdentifier\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,250:1\n1#2:251\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u0007\u0018\u0000 \u001b2\u00020\u0001:\u0001\u001bB!\u0008\u0002\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000e\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013J\u000e\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u0015J\u0013\u0010\u0016\u001a\u00020\u00112\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016J\u0008\u0010\u001a\u001a\u00020\u0004H\u0016R\u0019\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00038G\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0015\u0010\u0005\u001a\u0004\u0018\u00010\u00068G\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0011\u0010\r\u001a\u00020\u00048G\u00a2\u0006\u0006\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u001c"
    }
    d2 = {
        "Landroidx/camera/core/CameraIdentifier;",
        "",
        "cameraIds",
        "",
        "",
        "compatibilityId",
        "Landroidx/camera/core/impl/Identifier;",
        "<init>",
        "(Ljava/util/List;Landroidx/camera/core/impl/Identifier;)V",
        "getCameraIds",
        "()Ljava/util/List;",
        "getCompatibilityId",
        "()Landroidx/camera/core/impl/Identifier;",
        "internalId",
        "getInternalId",
        "()Ljava/lang/String;",
        "isOf",
        "",
        "camera",
        "Landroidx/camera/core/Camera;",
        "cameraInfo",
        "Landroidx/camera/core/CameraInfo;",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "Companion",
        "camera-core_release"
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
.field public static final Companion:Landroidx/camera/core/CameraIdentifier$Companion;


# instance fields
.field private final cameraIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final compatibilityId:Landroidx/camera/core/impl/Identifier;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/camera/core/CameraIdentifier$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/camera/core/CameraIdentifier$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    return-void
.end method

.method private constructor <init>(Ljava/util/List;Landroidx/camera/core/impl/Identifier;)V
    .locals 2
    .param p1, "cameraIds"    # Ljava/util/List;
    .param p2, "compatibilityId"    # Landroidx/camera/core/impl/Identifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/camera/core/impl/Identifier;",
            ")V"
        }
    .end annotation

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object p1, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    .line 105
    iput-object p2, p0, Landroidx/camera/core/CameraIdentifier;->compatibilityId:Landroidx/camera/core/impl/Identifier;

    .line 107
    nop

    .line 108
    iget-object v0, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "Camera ID set cannot be empty."

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 109
    nop

    .line 87
    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/List;Landroidx/camera/core/impl/Identifier;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/camera/core/CameraIdentifier;-><init>(Ljava/util/List;Landroidx/camera/core/impl/Identifier;)V

    return-void
.end method

.method public static final create(Ljava/lang/String;)Landroidx/camera/core/CameraIdentifier;
    .locals 1
    .param p0, "primaryCameraId"    # Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-virtual {v0, p0}, Landroidx/camera/core/CameraIdentifier$Companion;->create(Ljava/lang/String;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    .line 224
    return-object v0
.end method

.method public static final create(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/CameraIdentifier;
    .locals 1
    .param p0, "primaryCameraId"    # Ljava/lang/String;
    .param p1, "secondaryCameraId"    # Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-virtual {v0, p0, p1}, Landroidx/camera/core/CameraIdentifier$Companion;->create(Ljava/lang/String;Ljava/lang/String;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    .line 224
    return-object v0
.end method

.method public static final create(Ljava/lang/String;Ljava/lang/String;Landroidx/camera/core/impl/Identifier;)Landroidx/camera/core/CameraIdentifier;
    .locals 1
    .param p0, "primaryCameraId"    # Ljava/lang/String;
    .param p1, "secondaryCameraId"    # Ljava/lang/String;
    .param p2, "compatibilityId"    # Landroidx/camera/core/impl/Identifier;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-virtual {v0, p0, p1, p2}, Landroidx/camera/core/CameraIdentifier$Companion;->create(Ljava/lang/String;Ljava/lang/String;Landroidx/camera/core/impl/Identifier;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    .line 224
    return-object v0
.end method

.method public static final create(Ljava/util/List;)Landroidx/camera/core/CameraIdentifier;
    .locals 1
    .param p0, "cameraIds"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroidx/camera/core/CameraIdentifier;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-virtual {v0, p0}, Landroidx/camera/core/CameraIdentifier$Companion;->create(Ljava/util/List;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    .line 201
    return-object v0
.end method

.method public static final create(Ljava/util/List;Landroidx/camera/core/impl/Identifier;)Landroidx/camera/core/CameraIdentifier;
    .locals 1
    .param p0, "cameraIds"    # Ljava/util/List;
    .param p1, "compatibilityId"    # Landroidx/camera/core/impl/Identifier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/camera/core/impl/Identifier;",
            ")",
            "Landroidx/camera/core/CameraIdentifier;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-virtual {v0, p0, p1}, Landroidx/camera/core/CameraIdentifier$Companion;->create(Ljava/util/List;Landroidx/camera/core/impl/Identifier;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    .line 201
    return-object v0
.end method

.method public static final fromAdapterInfos(Landroidx/camera/core/impl/AdapterCameraInfo;Landroidx/camera/core/impl/AdapterCameraInfo;)Landroidx/camera/core/CameraIdentifier;
    .locals 1
    .param p0, "primaryInfo"    # Landroidx/camera/core/impl/AdapterCameraInfo;
    .param p1, "secondaryInfo"    # Landroidx/camera/core/impl/AdapterCameraInfo;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-virtual {v0, p0, p1}, Landroidx/camera/core/CameraIdentifier$Companion;->fromAdapterInfos(Landroidx/camera/core/impl/AdapterCameraInfo;Landroidx/camera/core/impl/AdapterCameraInfo;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    .line 247
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .line 161
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 162
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/CameraIdentifier;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 164
    :cond_1
    iget-object v1, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    move-object v3, p1

    check-cast v3, Landroidx/camera/core/CameraIdentifier;

    iget-object v3, v3, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    return v2

    .line 165
    :cond_2
    iget-object v1, p0, Landroidx/camera/core/CameraIdentifier;->compatibilityId:Landroidx/camera/core/impl/Identifier;

    move-object v3, p1

    check-cast v3, Landroidx/camera/core/CameraIdentifier;

    iget-object v3, v3, Landroidx/camera/core/CameraIdentifier;->compatibilityId:Landroidx/camera/core/impl/Identifier;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v2

    .line 167
    :cond_3
    return v0
.end method

.method public final getCameraIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 102
    iget-object v0, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    return-object v0
.end method

.method public final getCompatibilityId()Landroidx/camera/core/impl/Identifier;
    .locals 1

    .line 105
    iget-object v0, p0, Landroidx/camera/core/CameraIdentifier;->compatibilityId:Landroidx/camera/core/impl/Identifier;

    return-object v0
.end method

.method public final getInternalId()Ljava/lang/String;
    .locals 2

    .line 122
    iget-object v0, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 123
    :goto_0
    nop

    .line 121
    const-string v0, "getInternalId() is only available for single-camera identifiers."

    invoke-static {v1, v0}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 125
    iget-object v0, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 171
    iget-object v0, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 172
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Landroidx/camera/core/CameraIdentifier;->compatibilityId:Landroidx/camera/core/impl/Identifier;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroidx/camera/core/impl/Identifier;->hashCode()I

    move-result v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    add-int/2addr v1, v2

    .line 173
    .end local v0    # "result":I
    .local v1, "result":I
    return v1
.end method

.method public final isOf(Landroidx/camera/core/Camera;)Z
    .locals 1
    .param p1, "camera"    # Landroidx/camera/core/Camera;

    const-string v0, "camera"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    invoke-interface {p1}, Landroidx/camera/core/Camera;->getCameraInfo()Landroidx/camera/core/CameraInfo;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/CameraInfo;->getCameraIdentifier()Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final isOf(Landroidx/camera/core/CameraInfo;)Z
    .locals 1
    .param p1, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    const-string v0, "cameraInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    invoke-interface {p1}, Landroidx/camera/core/CameraInfo;->getCameraIdentifier()Landroidx/camera/core/CameraIdentifier;

    move-result-object v0

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CameraIdentifier{cameraIds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 178
    iget-object v1, p0, Landroidx/camera/core/CameraIdentifier;->cameraIds:Ljava/util/List;

    move-object v2, v1

    check-cast v2, Ljava/lang/Iterable;

    const-string v1, ","

    move-object v3, v1

    check-cast v3, Ljava/lang/CharSequence;

    const/16 v9, 0x3e

    const/4 v10, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v2 .. v10}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 177
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 179
    iget-object v1, p0, Landroidx/camera/core/CameraIdentifier;->compatibilityId:Landroidx/camera/core/impl/Identifier;

    if-eqz v1, :cond_0

    .line 251
    nop

    .local v1, "it":Landroidx/camera/core/impl/Identifier;
    const/4 v2, 0x0

    .line 179
    .local v2, "$i$a$-let-CameraIdentifier$toString$1":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ", compatId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "it":Landroidx/camera/core/impl/Identifier;
    .end local v2    # "$i$a$-let-CameraIdentifier$toString$1":I
    if-nez v1, :cond_1

    :cond_0
    const-string v1, ""

    .line 177
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
