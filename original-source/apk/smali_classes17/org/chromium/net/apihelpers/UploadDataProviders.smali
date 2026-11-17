.class public final Lorg/chromium/net/apihelpers/UploadDataProviders;
.super Ljava/lang/Object;
.source "UploadDataProviders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;,
        Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;,
        Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/os/ParcelFileDescriptor;)Lorg/chromium/net/UploadDataProvider;
    .locals 3
    .param p0, "fd"    # Landroid/os/ParcelFileDescriptor;

    .line 45
    new-instance v0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;

    new-instance v1, Lorg/chromium/net/apihelpers/UploadDataProviders$2;

    invoke-direct {v1, p0}, Lorg/chromium/net/apihelpers/UploadDataProviders$2;-><init>(Landroid/os/ParcelFileDescriptor;)V

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;-><init>(Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;Lorg/chromium/net/apihelpers/UploadDataProviders-IA;)V

    return-object v0
.end method

.method public static create(Ljava/io/File;)Lorg/chromium/net/UploadDataProvider;
    .locals 3
    .param p0, "file"    # Ljava/io/File;

    .line 29
    new-instance v0, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;

    new-instance v1, Lorg/chromium/net/apihelpers/UploadDataProviders$1;

    invoke-direct {v1, p0}, Lorg/chromium/net/apihelpers/UploadDataProviders$1;-><init>(Ljava/io/File;)V

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/apihelpers/UploadDataProviders$FileUploadProvider;-><init>(Lorg/chromium/net/apihelpers/UploadDataProviders$FileChannelProvider;Lorg/chromium/net/apihelpers/UploadDataProviders-IA;)V

    return-object v0
.end method

.method public static create(Ljava/nio/ByteBuffer;)Lorg/chromium/net/UploadDataProvider;
    .locals 3
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .line 65
    new-instance v0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;-><init>(Ljava/nio/ByteBuffer;Lorg/chromium/net/apihelpers/UploadDataProviders-IA;)V

    return-object v0
.end method

.method public static create([B)Lorg/chromium/net/UploadDataProvider;
    .locals 2
    .param p0, "data"    # [B

    .line 87
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1}, Lorg/chromium/net/apihelpers/UploadDataProviders;->create([BII)Lorg/chromium/net/UploadDataProvider;

    move-result-object v0

    return-object v0
.end method

.method public static create([BII)Lorg/chromium/net/UploadDataProvider;
    .locals 3
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .line 77
    new-instance v0, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;

    invoke-static {p0, p1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/apihelpers/UploadDataProviders$ByteBufferUploadProvider;-><init>(Ljava/nio/ByteBuffer;Lorg/chromium/net/apihelpers/UploadDataProviders-IA;)V

    return-object v0
.end method
