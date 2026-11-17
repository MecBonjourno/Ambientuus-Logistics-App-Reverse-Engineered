.class public Landroidx/camera/video/Quality;
.super Ljava/lang/Object;
.source "Quality.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/Quality$ConstantQuality;,
        Landroidx/camera/video/Quality$QualitySource;
    }
.end annotation


# static fields
.field public static final FHD:Landroidx/camera/video/Quality;

.field public static final HD:Landroidx/camera/video/Quality;

.field public static final HIGHEST:Landroidx/camera/video/Quality;

.field public static final LOWEST:Landroidx/camera/video/Quality;

.field static final NONE:Landroidx/camera/video/Quality;

.field private static final QUALITIES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation
.end field

.field private static final QUALITIES_ORDER_BY_SIZE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation
.end field

.field public static final QUALITY_SOURCE_HIGH_SPEED:I = 0x2

.field public static final QUALITY_SOURCE_REGULAR:I = 0x1

.field public static final SD:Landroidx/camera/video/Quality;

.field public static final UHD:Landroidx/camera/video/Quality;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 71
    new-instance v0, Landroid/util/Size;

    const/16 v1, 0x2d0

    const/16 v2, 0x1e0

    invoke-direct {v0, v1, v2}, Landroid/util/Size;-><init>(II)V

    new-instance v3, Landroid/util/Size;

    const/16 v4, 0x280

    invoke-direct {v3, v4, v2}, Landroid/util/Size;-><init>(II)V

    const/4 v2, 0x2

    new-array v4, v2, [Landroid/util/Size;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v3, v4, v0

    .line 75
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 71
    const/4 v4, 0x4

    const/16 v6, 0x7d2

    const-string v7, "SD"

    invoke-static {v4, v6, v7, v3}, Landroidx/camera/video/Quality$ConstantQuality;->of(IILjava/lang/String;Ljava/util/List;)Landroidx/camera/video/Quality$ConstantQuality;

    move-result-object v3

    sput-object v3, Landroidx/camera/video/Quality;->SD:Landroidx/camera/video/Quality;

    .line 84
    new-instance v3, Landroid/util/Size;

    const/16 v6, 0x500

    invoke-direct {v3, v6, v1}, Landroid/util/Size;-><init>(II)V

    .line 88
    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 84
    const/4 v3, 0x5

    const/16 v6, 0x7d3

    const-string v7, "HD"

    invoke-static {v3, v6, v7, v1}, Landroidx/camera/video/Quality$ConstantQuality;->of(IILjava/lang/String;Ljava/util/List;)Landroidx/camera/video/Quality$ConstantQuality;

    move-result-object v1

    sput-object v1, Landroidx/camera/video/Quality;->HD:Landroidx/camera/video/Quality;

    .line 97
    new-instance v1, Landroid/util/Size;

    const/16 v6, 0x780

    const/16 v7, 0x438

    invoke-direct {v1, v6, v7}, Landroid/util/Size;-><init>(II)V

    .line 101
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 97
    const/4 v6, 0x6

    const/16 v7, 0x7d4

    const-string v8, "FHD"

    invoke-static {v6, v7, v8, v1}, Landroidx/camera/video/Quality$ConstantQuality;->of(IILjava/lang/String;Ljava/util/List;)Landroidx/camera/video/Quality$ConstantQuality;

    move-result-object v1

    sput-object v1, Landroidx/camera/video/Quality;->FHD:Landroidx/camera/video/Quality;

    .line 110
    new-instance v1, Landroid/util/Size;

    const/16 v7, 0xf00

    const/16 v8, 0x870

    invoke-direct {v1, v7, v8}, Landroid/util/Size;-><init>(II)V

    .line 114
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 110
    const/16 v7, 0x8

    const/16 v8, 0x7d5

    const-string v9, "UHD"

    invoke-static {v7, v8, v9, v1}, Landroidx/camera/video/Quality$ConstantQuality;->of(IILjava/lang/String;Ljava/util/List;)Landroidx/camera/video/Quality$ConstantQuality;

    move-result-object v1

    sput-object v1, Landroidx/camera/video/Quality;->UHD:Landroidx/camera/video/Quality;

    .line 121
    nop

    .line 125
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 121
    const/16 v7, 0x7d0

    const-string v8, "LOWEST"

    invoke-static {v5, v7, v8, v1}, Landroidx/camera/video/Quality$ConstantQuality;->of(IILjava/lang/String;Ljava/util/List;)Landroidx/camera/video/Quality$ConstantQuality;

    move-result-object v1

    sput-object v1, Landroidx/camera/video/Quality;->LOWEST:Landroidx/camera/video/Quality;

    .line 132
    nop

    .line 136
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    .line 132
    const/16 v7, 0x7d1

    const-string v8, "HIGHEST"

    invoke-static {v0, v7, v8, v1}, Landroidx/camera/video/Quality$ConstantQuality;->of(IILjava/lang/String;Ljava/util/List;)Landroidx/camera/video/Quality$ConstantQuality;

    move-result-object v1

    sput-object v1, Landroidx/camera/video/Quality;->HIGHEST:Landroidx/camera/video/Quality;

    .line 139
    const-string v1, "NONE"

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    const/4 v8, -0x1

    invoke-static {v8, v8, v1, v7}, Landroidx/camera/video/Quality$ConstantQuality;->of(IILjava/lang/String;Ljava/util/List;)Landroidx/camera/video/Quality$ConstantQuality;

    move-result-object v1

    sput-object v1, Landroidx/camera/video/Quality;->NONE:Landroidx/camera/video/Quality;

    .line 142
    new-instance v1, Ljava/util/HashSet;

    new-array v6, v6, [Landroidx/camera/video/Quality;

    sget-object v7, Landroidx/camera/video/Quality;->LOWEST:Landroidx/camera/video/Quality;

    aput-object v7, v6, v5

    sget-object v7, Landroidx/camera/video/Quality;->HIGHEST:Landroidx/camera/video/Quality;

    aput-object v7, v6, v0

    sget-object v7, Landroidx/camera/video/Quality;->SD:Landroidx/camera/video/Quality;

    aput-object v7, v6, v2

    sget-object v7, Landroidx/camera/video/Quality;->HD:Landroidx/camera/video/Quality;

    const/4 v8, 0x3

    aput-object v7, v6, v8

    sget-object v7, Landroidx/camera/video/Quality;->FHD:Landroidx/camera/video/Quality;

    aput-object v7, v6, v4

    sget-object v7, Landroidx/camera/video/Quality;->UHD:Landroidx/camera/video/Quality;

    aput-object v7, v6, v3

    .line 143
    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v1, Landroidx/camera/video/Quality;->QUALITIES:Ljava/util/Set;

    .line 146
    new-array v1, v4, [Landroidx/camera/video/Quality;

    sget-object v3, Landroidx/camera/video/Quality;->UHD:Landroidx/camera/video/Quality;

    aput-object v3, v1, v5

    sget-object v3, Landroidx/camera/video/Quality;->FHD:Landroidx/camera/video/Quality;

    aput-object v3, v1, v0

    sget-object v0, Landroidx/camera/video/Quality;->HD:Landroidx/camera/video/Quality;

    aput-object v0, v1, v2

    sget-object v0, Landroidx/camera/video/Quality;->SD:Landroidx/camera/video/Quality;

    aput-object v0, v1, v8

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/video/Quality;->QUALITIES_ORDER_BY_SIZE:Ljava/util/List;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method synthetic constructor <init>(Landroidx/camera/video/Quality$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/camera/video/Quality$1;

    .line 58
    invoke-direct {p0}, Landroidx/camera/video/Quality;-><init>()V

    return-void
.end method

.method static containsQuality(Landroidx/camera/video/Quality;)Z
    .locals 1
    .param p0, "quality"    # Landroidx/camera/video/Quality;

    .line 149
    sget-object v0, Landroidx/camera/video/Quality;->QUALITIES:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static getSortedQualities()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/video/Quality;",
            ">;"
        }
    .end annotation

    .line 171
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Landroidx/camera/video/Quality;->QUALITIES_ORDER_BY_SIZE:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
