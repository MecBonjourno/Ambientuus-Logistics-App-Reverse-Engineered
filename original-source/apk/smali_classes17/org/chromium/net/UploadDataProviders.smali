.class public final Lorg/chromium/net/UploadDataProviders;
.super Ljava/lang/Object;
.source "UploadDataProviders.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/os/ParcelFileDescriptor;)Lorg/chromium/net/UploadDataProvider;
    .locals 1
    .param p0, "fd"    # Landroid/os/ParcelFileDescriptor;

    .line 37
    invoke-static {p0}, Lorg/chromium/net/apihelpers/UploadDataProviders;->create(Landroid/os/ParcelFileDescriptor;)Lorg/chromium/net/UploadDataProvider;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/io/File;)Lorg/chromium/net/UploadDataProvider;
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .line 26
    invoke-static {p0}, Lorg/chromium/net/apihelpers/UploadDataProviders;->create(Ljava/io/File;)Lorg/chromium/net/UploadDataProvider;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/nio/ByteBuffer;)Lorg/chromium/net/UploadDataProvider;
    .locals 1
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .line 47
    invoke-static {p0}, Lorg/chromium/net/apihelpers/UploadDataProviders;->create(Ljava/nio/ByteBuffer;)Lorg/chromium/net/UploadDataProvider;

    move-result-object v0

    return-object v0
.end method

.method public static create([B)Lorg/chromium/net/UploadDataProvider;
    .locals 1
    .param p0, "data"    # [B

    .line 69
    invoke-static {p0}, Lorg/chromium/net/apihelpers/UploadDataProviders;->create([B)Lorg/chromium/net/UploadDataProvider;

    move-result-object v0

    return-object v0
.end method

.method public static create([BII)Lorg/chromium/net/UploadDataProvider;
    .locals 1
    .param p0, "data"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .line 59
    invoke-static {p0, p1, p2}, Lorg/chromium/net/apihelpers/UploadDataProviders;->create([BII)Lorg/chromium/net/UploadDataProvider;

    move-result-object v0

    return-object v0
.end method
