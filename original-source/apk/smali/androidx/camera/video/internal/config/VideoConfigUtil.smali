.class public final Landroidx/camera/video/internal/config/VideoConfigUtil;
.super Ljava/lang/Object;
.source "VideoConfigUtil.java"


# static fields
.field private static final MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "VideoConfigUtil"

.field public static final VIDEO_FRAME_RATE_FIXED_DEFAULT:I = 0x1e


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    .line 93
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 95
    .local v0, "profHevcMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const/16 v3, 0x1000

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const/16 v4, 0x2000

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 103
    .local v5, "profAv1Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v6, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v5, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 110
    .local v6, "profVp9Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    sget-object v7, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v7, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    const/16 v1, 0x4000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    const v1, 0x8000

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_PQ:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v6, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 122
    .local v1, "profDvMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    const/16 v2, 0x100

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT2020_HLG:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const/16 v2, 0x200

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_BT709:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/hevc"

    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/av01"

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/x-vnd.on2.vp9"

    invoke-interface {v2, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v2, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    const-string/jumbo v3, "video/dolby-vision"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .end local v0    # "profHevcMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    .end local v1    # "profDvMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    .end local v5    # "profAv1Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    .end local v6    # "profVp9Map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    return-void
.end method

.method private static getDynamicRangeDefaultMime(Landroidx/camera/core/DynamicRange;)Ljava/lang/String;
    .locals 3
    .param p0, "dynamicRange"    # Landroidx/camera/core/DynamicRange;

    .line 221
    invoke-virtual {p0}, Landroidx/camera/core/DynamicRange;->getEncoding()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 235
    :pswitch_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported dynamic range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nNo supported default mime type available."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :pswitch_1
    const-string/jumbo v0, "video/dolby-vision"

    return-object v0

    .line 230
    :pswitch_2
    const-string/jumbo v0, "video/hevc"

    return-object v0

    .line 233
    :pswitch_3
    const-string/jumbo v0, "video/avc"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static mimeAndProfileToEncoderDataSpace(Ljava/lang/String;I)Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    .locals 4
    .param p0, "mimeType"    # Ljava/lang/String;
    .param p1, "codecProfileLevel"    # I

    .line 362
    sget-object v0, Landroidx/camera/video/internal/config/VideoConfigUtil;->MIME_TO_DATA_SPACE_MAP:Ljava/util/Map;

    .line 363
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 364
    .local v0, "profileToDataSpaceMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;>;"
    if-eqz v0, :cond_0

    .line 365
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    .line 366
    .local v1, "dataSpace":Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    if-eqz v1, :cond_0

    .line 367
    return-object v1

    .line 371
    .end local v1    # "dataSpace":Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    :cond_0
    nop

    .line 372
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    .line 371
    const-string v1, "Unsupported mime type %s or profile level %d. Data space is unspecified."

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "VideoConfigUtil"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    return-object v1
.end method

.method static resolveFrameRates(Landroidx/camera/video/VideoSpec;Landroid/util/Range;)Landroidx/camera/video/internal/config/CaptureEncodeRates;
    .locals 8
    .param p0, "videoSpec"    # Landroidx/camera/video/VideoSpec;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/VideoSpec;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/video/internal/config/CaptureEncodeRates;"
        }
    .end annotation

    .line 380
    .local p1, "expectedCaptureFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    sget-object v0, Landroidx/camera/core/SurfaceRequest;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v0, p1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    const/16 v0, 0x1e

    .local v0, "captureFrameRate":I
    goto :goto_0

    .line 383
    .end local v0    # "captureFrameRate":I
    :cond_0
    invoke-virtual {p1}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 387
    .restart local v0    # "captureFrameRate":I
    :goto_0
    invoke-virtual {p0}, Landroidx/camera/video/VideoSpec;->getEncodeFrameRate()I

    move-result v1

    if-eqz v1, :cond_1

    .line 388
    invoke-virtual {p0}, Landroidx/camera/video/VideoSpec;->getEncodeFrameRate()I

    move-result v1

    .local v1, "encodeFrameRate":I
    goto :goto_1

    .line 390
    .end local v1    # "encodeFrameRate":I
    :cond_1
    move v1, v0

    .line 393
    .restart local v1    # "encodeFrameRate":I
    :goto_1
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 396
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 397
    sget-object v5, Landroidx/camera/core/SurfaceRequest;->FRAME_RATE_RANGE_UNSPECIFIED:Landroid/util/Range;

    invoke-virtual {v5, p1}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 398
    const-string v5, "<UNSPECIFIED>"

    goto :goto_2

    :cond_2
    move-object v5, p1

    :goto_2
    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    const/4 v3, 0x1

    aput-object v4, v6, v3

    const/4 v3, 0x2

    aput-object v5, v6, v3

    .line 393
    const-string v3, "Resolved capture/encode frame rate %dfps/%dfps, [Expected operating range: %s]"

    invoke-static {v2, v3, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "VideoConfigUtil"

    invoke-static {v3, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    new-instance v2, Landroidx/camera/video/internal/config/CaptureEncodeRates;

    invoke-direct {v2, v0, v1}, Landroidx/camera/video/internal/config/CaptureEncodeRates;-><init>(II)V

    return-object v2
.end method

.method public static resolveVideoEncoderConfig(Landroidx/camera/video/internal/config/VideoMimeInfo;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 13
    .param p0, "videoMimeInfo"    # Landroidx/camera/video/internal/config/VideoMimeInfo;
    .param p1, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;
    .param p2, "videoSpec"    # Landroidx/camera/video/VideoSpec;
    .param p3, "surfaceSize"    # Landroid/util/Size;
    .param p4, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/video/internal/config/VideoMimeInfo;",
            "Landroidx/camera/core/impl/Timebase;",
            "Landroidx/camera/video/VideoSpec;",
            "Landroid/util/Size;",
            "Landroidx/camera/core/DynamicRange;",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroidx/camera/video/internal/encoder/VideoEncoderConfig;"
        }
    .end annotation

    .line 256
    .local p5, "expectedFrameRateRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoMimeInfo;->getCompatibleVideoProfile()Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    move-result-object v5

    .line 257
    .local v5, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    if-eqz v5, :cond_0

    .line 258
    new-instance v0, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;

    .line 259
    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v0 .. v7}, Landroidx/camera/video/internal/config/VideoEncoderConfigVideoProfileResolver;-><init>(Ljava/lang/String;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)V

    .local v0, "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;>;"
    goto :goto_0

    .line 262
    .end local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;>;"
    :cond_0
    new-instance v6, Landroidx/camera/video/internal/config/VideoEncoderConfigDefaultResolver;

    invoke-virtual {p0}, Landroidx/camera/video/internal/config/VideoMimeInfo;->getMimeType()Ljava/lang/String;

    move-result-object v7

    move-object v8, p1

    move-object v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-direct/range {v6 .. v12}, Landroidx/camera/video/internal/config/VideoEncoderConfigDefaultResolver;-><init>(Ljava/lang/String;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/VideoSpec;Landroid/util/Size;Landroidx/camera/core/DynamicRange;Landroid/util/Range;)V

    move-object v0, v6

    .line 266
    .restart local v0    # "configSupplier":Landroidx/core/util/Supplier;, "Landroidx/core/util/Supplier<Landroidx/camera/video/internal/encoder/VideoEncoderConfig;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/core/util/Supplier;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    return-object v1
.end method

.method public static resolveVideoMimeInfo(Landroidx/camera/video/MediaSpec;Landroidx/camera/core/DynamicRange;Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;)Landroidx/camera/video/internal/config/VideoMimeInfo;
    .locals 13
    .param p0, "mediaSpec"    # Landroidx/camera/video/MediaSpec;
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .param p2, "encoderProfiles"    # Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;

    .line 146
    invoke-virtual {p1}, Landroidx/camera/core/DynamicRange;->isFullySpecified()Z

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dynamic range must be a fully specified dynamic range [provided dynamic range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 148
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v0

    invoke-static {v0}, Landroidx/camera/video/MediaSpec;->outputFormatToVideoMime(I)Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "mediaSpecVideoMime":Ljava/lang/String;
    move-object v1, v0

    .line 150
    .local v1, "resolvedVideoMime":Ljava/lang/String;
    const/4 v3, 0x0

    .line 151
    .local v3, "compatibleVideoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    const/4 v4, -0x1

    const-string v5, ", dynamic range: "

    const-string v6, "VideoConfigUtil"

    if-eqz p2, :cond_3

    .line 152
    nop

    .line 153
    invoke-static {p1}, Landroidx/camera/video/internal/utils/DynamicRangeUtil;->dynamicRangeToVideoProfileHdrFormats(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;

    move-result-object v7

    .line 154
    .local v7, "encoderHdrFormats":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    nop

    .line 155
    invoke-static {p1}, Landroidx/camera/video/internal/utils/DynamicRangeUtil;->dynamicRangeToVideoProfileBitDepth(Landroidx/camera/core/DynamicRange;)Ljava/util/Set;

    move-result-object v8

    .line 158
    .local v8, "encoderBitDepths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-virtual {p2}, Landroidx/camera/video/internal/VideoValidatedEncoderProfilesProxy;->getVideoProfiles()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;

    .line 160
    .local v10, "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getHdrFormat()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v7, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 161
    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getBitDepth()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v8, v11}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 162
    goto :goto_0

    .line 168
    :cond_1
    invoke-virtual {v10}, Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;->getMediaType()Ljava/lang/String;

    move-result-object v11

    .line 169
    .local v11, "videoProfileMime":Ljava/lang/String;
    invoke-static {v0, v11}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 170
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec video mime matches EncoderProfiles. Using EncoderProfiles to derive VIDEO settings [mime type: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 173
    :cond_2
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v12

    if-ne v12, v4, :cond_0

    .line 174
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "MediaSpec contains OUTPUT_FORMAT_AUTO. Using CamcorderProfile to derive VIDEO settings [mime type: "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    :goto_1
    move-object v3, v10

    .line 182
    move-object v1, v11

    .line 183
    nop

    .line 187
    .end local v7    # "encoderHdrFormats":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v8    # "encoderBitDepths":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v10    # "videoProfile":Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;
    .end local v11    # "videoProfileMime":Ljava/lang/String;
    :cond_3
    if-nez v3, :cond_6

    .line 188
    invoke-virtual {p0}, Landroidx/camera/video/MediaSpec;->getOutputFormat()I

    move-result v7

    if-ne v7, v4, :cond_4

    .line 191
    invoke-static {p1}, Landroidx/camera/video/internal/config/VideoConfigUtil;->getDynamicRangeDefaultMime(Landroidx/camera/core/DynamicRange;)Ljava/lang/String;

    move-result-object v1

    .line 194
    :cond_4
    if-nez p2, :cond_5

    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No EncoderProfiles present. May rely on fallback defaults to derive VIDEO settings [chosen mime type: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 199
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No video EncoderProfile is compatible with requested output format and dynamic range. May rely on fallback defaults to derive VIDEO settings [chosen mime type: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    :cond_6
    :goto_2
    invoke-static {v1}, Landroidx/camera/video/internal/config/VideoMimeInfo;->builder(Ljava/lang/String;)Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;

    move-result-object v2

    .line 207
    .local v2, "mimeInfoBuilder":Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;
    if-eqz v3, :cond_7

    .line 208
    invoke-virtual {v2, v3}, Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;->setCompatibleVideoProfile(Landroidx/camera/core/impl/EncoderProfilesProxy$VideoProfileProxy;)Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;

    .line 211
    :cond_7
    invoke-virtual {v2}, Landroidx/camera/video/internal/config/VideoMimeInfo$Builder;->build()Landroidx/camera/video/internal/config/VideoMimeInfo;

    move-result-object v4

    return-object v4
.end method

.method public static scaleAndClampBitrate(IIIIIIIIILandroid/util/Range;)I
    .locals 30
    .param p0, "baseBitrate"    # I
    .param p1, "actualBitDepth"    # I
    .param p2, "baseBitDepth"    # I
    .param p3, "actualFrameRate"    # I
    .param p4, "baseFrameRate"    # I
    .param p5, "actualWidth"    # I
    .param p6, "baseWidth"    # I
    .param p7, "actualHeight"    # I
    .param p8, "baseHeight"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIIIIIII",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .line 319
    .local p9, "clampedRange":Landroid/util/Range;, "Landroid/util/Range<Ljava/lang/Integer;>;"
    move-object/from16 v0, p9

    new-instance v1, Landroid/util/Rational;

    move/from16 v2, p1

    move/from16 v3, p2

    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V

    .line 321
    .local v1, "bitDepthRatio":Landroid/util/Rational;
    new-instance v4, Landroid/util/Rational;

    move/from16 v5, p3

    move/from16 v6, p4

    invoke-direct {v4, v5, v6}, Landroid/util/Rational;-><init>(II)V

    .line 326
    .local v4, "frameRateRatio":Landroid/util/Rational;
    new-instance v7, Landroid/util/Rational;

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-direct {v7, v8, v9}, Landroid/util/Rational;-><init>(II)V

    .line 327
    .local v7, "widthRatio":Landroid/util/Rational;
    new-instance v10, Landroid/util/Rational;

    move/from16 v11, p7

    move/from16 v12, p8

    invoke-direct {v10, v11, v12}, Landroid/util/Rational;-><init>(II)V

    .line 328
    .local v10, "heightRatio":Landroid/util/Rational;
    move/from16 v13, p0

    int-to-double v14, v13

    .line 329
    invoke-virtual {v1}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    invoke-virtual {v4}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    .line 330
    invoke-virtual {v7}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    invoke-virtual {v10}, Landroid/util/Rational;->doubleValue()D

    move-result-wide v16

    mul-double v14, v14, v16

    double-to-int v14, v14

    .line 332
    .local v14, "resolvedBitrate":I
    const-string v15, ""

    .line 333
    .local v15, "debugString":Ljava/lang/String;
    move-object/from16 v16, v1

    .end local v1    # "bitDepthRatio":Landroid/util/Rational;
    .local v16, "bitDepthRatio":Landroid/util/Rational;
    const-string v1, "VideoConfigUtil"

    invoke-static {v1}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v17

    const/16 v18, 0x1

    const/16 v19, 0x0

    if-eqz v17, :cond_0

    .line 334
    nop

    .line 336
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    .line 337
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    .line 338
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    .line 339
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const/16 v29, 0x2

    const/16 v2, 0xa

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v17, v2, v19

    aput-object v20, v2, v18

    aput-object v21, v2, v29

    const/16 v17, 0x3

    aput-object v22, v2, v17

    const/16 v17, 0x4

    aput-object v23, v2, v17

    const/16 v17, 0x5

    aput-object v24, v2, v17

    const/16 v17, 0x6

    aput-object v25, v2, v17

    const/16 v17, 0x7

    aput-object v26, v2, v17

    const/16 v17, 0x8

    aput-object v27, v2, v17

    const/16 v17, 0x9

    aput-object v28, v2, v17

    .line 334
    const-string v3, "Base Bitrate(%dbps) * Bit Depth Ratio (%d / %d) * Frame Rate Ratio(%d / %d) * Width Ratio(%d / %d) * Height Ratio(%d / %d) = %d"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    goto :goto_0

    .line 333
    :cond_0
    const/16 v29, 0x2

    .line 342
    :goto_0
    sget-object v2, Landroidx/camera/video/VideoSpec;->BITRATE_RANGE_AUTO:Landroid/util/Range;

    invoke-virtual {v2, v0}, Landroid/util/Range;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 344
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/util/Range;->clamp(Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v14

    .line 345
    invoke-static {v1}, Landroidx/camera/core/Logger;->isDebugEnabled(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 346
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 347
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p9, v0, v19

    aput-object v3, v0, v18

    .line 346
    const-string v3, "\nClamped to range %s -> %dbps"

    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 350
    :cond_1
    invoke-static {v1, v15}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    return v14
.end method

.method public static workaroundDataSpaceIfRequired(Landroidx/camera/video/internal/encoder/VideoEncoderConfig;Z)Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .locals 3
    .param p0, "config"    # Landroidx/camera/video/internal/encoder/VideoEncoderConfig;
    .param p1, "hasGlProcessing"    # Z

    .line 280
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->getDataSpace()Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    move-result-object v0

    sget-object v1, Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;->ENCODER_DATA_SPACE_UNSPECIFIED:Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    if-eq v0, v1, :cond_0

    .line 281
    return-object p0

    .line 285
    :cond_0
    const-class v0, Landroidx/camera/video/internal/compat/quirk/MediaCodecDefaultDataSpaceQuirk;

    invoke-static {v0}, Landroidx/camera/video/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/video/internal/compat/quirk/MediaCodecDefaultDataSpaceQuirk;

    .line 287
    .local v0, "quirk":Landroidx/camera/video/internal/compat/quirk/MediaCodecDefaultDataSpaceQuirk;
    if-eqz p1, :cond_1

    if-eqz v0, :cond_1

    .line 288
    invoke-virtual {v0}, Landroidx/camera/video/internal/compat/quirk/MediaCodecDefaultDataSpaceQuirk;->getSuggestedDataSpace()Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;

    move-result-object v1

    .line 289
    .local v1, "dataSpace":Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    invoke-virtual {p0}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig;->toBuilder()Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->setDataSpace(Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;)Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/video/internal/encoder/VideoEncoderConfig$Builder;->build()Landroidx/camera/video/internal/encoder/VideoEncoderConfig;

    move-result-object v2

    return-object v2

    .line 292
    .end local v1    # "dataSpace":Landroidx/camera/video/internal/encoder/VideoEncoderDataSpace;
    :cond_1
    return-object p0
.end method
