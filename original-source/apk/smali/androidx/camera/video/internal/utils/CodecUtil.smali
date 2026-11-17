.class public final Landroidx/camera/video/internal/utils/CodecUtil;
.super Ljava/lang/Object;
.source "CodecUtil.java"


# static fields
.field private static final MAX_CODEC_INFO_CACHE_COUNT:I = 0xa

.field private static final sCodecInfoCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 43
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static createCodec(Landroidx/camera/video/internal/encoder/EncoderConfig;)Landroid/media/MediaCodec;
    .locals 1
    .param p0, "encoderConfig"    # Landroidx/camera/video/internal/encoder/EncoderConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 53
    invoke-interface {p0}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/video/internal/utils/CodecUtil;->createCodec(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    return-object v0
.end method

.method private static createCodec(Ljava/lang/String;)Landroid/media/MediaCodec;
    .locals 2
    .param p0, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 88
    :try_start_0
    invoke-static {p0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 89
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v1, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    invoke-direct {v1, v0}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static findCodecAndGetCodecInfo(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 4
    .param p0, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 64
    sget-object v0, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    monitor-enter v0

    .line 65
    :try_start_0
    sget-object v1, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    invoke-virtual {v1, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/MediaCodecInfo;

    .line 66
    .local v1, "codecInfo":Landroid/media/MediaCodecInfo;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 67
    if-eqz v1, :cond_0

    .line 68
    return-object v1

    .line 70
    :cond_0
    const/4 v0, 0x0

    .line 72
    .local v0, "codec":Landroid/media/MediaCodec;
    :try_start_1
    invoke-static {p0}, Landroidx/camera/video/internal/utils/CodecUtil;->createCodec(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v2

    move-object v0, v2

    .line 73
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v2

    move-object v1, v2

    .line 74
    sget-object v2, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    monitor-enter v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 75
    :try_start_2
    sget-object v3, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    invoke-virtual {v3, p0, v1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 77
    nop

    .line 79
    if-eqz v0, :cond_1

    .line 80
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 77
    :cond_1
    return-object v1

    .line 76
    :catchall_0
    move-exception v3

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .end local v0    # "codec":Landroid/media/MediaCodec;
    .end local v1    # "codecInfo":Landroid/media/MediaCodecInfo;
    .end local p0    # "mimeType":Ljava/lang/String;
    :try_start_4
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 79
    .restart local v0    # "codec":Landroid/media/MediaCodec;
    .restart local v1    # "codecInfo":Landroid/media/MediaCodecInfo;
    .restart local p0    # "mimeType":Ljava/lang/String;
    :catchall_1
    move-exception v2

    if-eqz v0, :cond_2

    .line 80
    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    .line 82
    :cond_2
    throw v2

    .line 66
    .end local v0    # "codec":Landroid/media/MediaCodec;
    .end local v1    # "codecInfo":Landroid/media/MediaCodecInfo;
    :catchall_2
    move-exception v1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v1
.end method
