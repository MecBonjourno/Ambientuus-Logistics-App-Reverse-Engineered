.class public Lorg/chromium/base/UnguessableToken;
.super Ljava/lang/Object;
.source "UnguessableToken.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lorg/chromium/base/UnguessableToken;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mHigh:J

.field private final mLow:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    new-instance v0, Lorg/chromium/base/UnguessableToken$1;

    invoke-direct {v0}, Lorg/chromium/base/UnguessableToken$1;-><init>()V

    sput-object v0, Lorg/chromium/base/UnguessableToken;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(JJ)V
    .locals 0
    .param p1, "high"    # J
    .param p3, "low"    # J

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-wide p1, p0, Lorg/chromium/base/UnguessableToken;->mHigh:J

    .line 29
    iput-wide p3, p0, Lorg/chromium/base/UnguessableToken;->mLow:J

    .line 30
    return-void
.end method

.method synthetic constructor <init>(JJLorg/chromium/base/UnguessableToken-IA;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lorg/chromium/base/UnguessableToken;-><init>(JJ)V

    return-void
.end method

.method private static create(JJ)Lorg/chromium/base/UnguessableToken;
    .locals 1
    .param p0, "high"    # J
    .param p2, "low"    # J

    .line 34
    new-instance v0, Lorg/chromium/base/UnguessableToken;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/chromium/base/UnguessableToken;-><init>(JJ)V

    return-object v0
.end method

.method private parcelAndUnparcelForTesting()Lorg/chromium/base/UnguessableToken;
    .locals 2

    .line 97
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 98
    .local v0, "parcel":Landroid/os/Parcel;
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/chromium/base/UnguessableToken;->writeToParcel(Landroid/os/Parcel;I)V

    .line 101
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 102
    sget-object v1, Lorg/chromium/base/UnguessableToken;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v1, v0}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/UnguessableToken;

    .line 103
    .local v1, "token":Lorg/chromium/base/UnguessableToken;
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 105
    return-object v1
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .line 49
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 60
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 62
    :cond_0
    move-object v1, p1

    check-cast v1, Lorg/chromium/base/UnguessableToken;

    iget-wide v1, v1, Lorg/chromium/base/UnguessableToken;->mHigh:J

    iget-wide v3, p0, Lorg/chromium/base/UnguessableToken;->mHigh:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    move-object v1, p1

    check-cast v1, Lorg/chromium/base/UnguessableToken;

    iget-wide v1, v1, Lorg/chromium/base/UnguessableToken;->mLow:J

    iget-wide v3, p0, Lorg/chromium/base/UnguessableToken;->mLow:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 60
    :cond_2
    :goto_0
    return v0
.end method

.method public getHighForSerialization()J
    .locals 2

    .line 39
    iget-wide v0, p0, Lorg/chromium/base/UnguessableToken;->mHigh:J

    return-wide v0
.end method

.method public getLowForSerialization()J
    .locals 2

    .line 44
    iget-wide v0, p0, Lorg/chromium/base/UnguessableToken;->mLow:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 7

    .line 67
    iget-wide v0, p0, Lorg/chromium/base/UnguessableToken;->mLow:J

    iget-wide v2, p0, Lorg/chromium/base/UnguessableToken;->mLow:J

    const/16 v4, 0x20

    ushr-long/2addr v2, v4

    xor-long/2addr v0, v2

    long-to-int v0, v0

    .line 68
    .local v0, "mLowHash":I
    iget-wide v1, p0, Lorg/chromium/base/UnguessableToken;->mHigh:J

    iget-wide v5, p0, Lorg/chromium/base/UnguessableToken;->mHigh:J

    ushr-long v3, v5, v4

    xor-long/2addr v1, v3

    long-to-int v1, v1

    .line 69
    .local v1, "mHighHash":I
    mul-int/lit8 v2, v0, 0x1f

    add-int/2addr v2, v1

    return v2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 54
    iget-wide v0, p0, Lorg/chromium/base/UnguessableToken;->mHigh:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 55
    iget-wide v0, p0, Lorg/chromium/base/UnguessableToken;->mLow:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 56
    return-void
.end method
