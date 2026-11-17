.class Lorg/chromium/base/UnguessableToken$1;
.super Ljava/lang/Object;
.source "UnguessableToken.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/UnguessableToken;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lorg/chromium/base/UnguessableToken;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 73
    invoke-virtual {p0, p1}, Lorg/chromium/base/UnguessableToken$1;->createFromParcel(Landroid/os/Parcel;)Lorg/chromium/base/UnguessableToken;

    move-result-object p1

    return-object p1
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lorg/chromium/base/UnguessableToken;
    .locals 7
    .param p1, "source"    # Landroid/os/Parcel;

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v1

    .line 77
    .local v1, "high":J
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v3

    .line 78
    .local v3, "low":J
    const-wide/16 v5, 0x0

    cmp-long v0, v1, v5

    if-eqz v0, :cond_1

    cmp-long v0, v3, v5

    if-nez v0, :cond_0

    goto :goto_0

    .line 82
    :cond_0
    new-instance v0, Lorg/chromium/base/UnguessableToken;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lorg/chromium/base/UnguessableToken;-><init>(JJLorg/chromium/base/UnguessableToken-IA;)V

    return-object v0

    .line 80
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 73
    invoke-virtual {p0, p1}, Lorg/chromium/base/UnguessableToken$1;->newArray(I)[Lorg/chromium/base/UnguessableToken;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lorg/chromium/base/UnguessableToken;
    .locals 1
    .param p1, "size"    # I

    .line 87
    new-array v0, p1, [Lorg/chromium/base/UnguessableToken;

    return-object v0
.end method
