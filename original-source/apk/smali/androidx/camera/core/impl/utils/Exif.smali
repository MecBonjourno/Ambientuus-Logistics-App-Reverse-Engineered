.class public final Landroidx/camera/core/impl/utils/Exif;
.super Ljava/lang/Object;
.source "Exif.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/Exif$Speed;
    }
.end annotation


# static fields
.field private static final ALL_EXIF_TAGS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final DATETIME_FORMAT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final DATE_FORMAT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final DO_NOT_COPY_EXIF_TAGS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final INVALID_TIMESTAMP:J = -0x1L

.field private static final KILOMETERS_PER_HOUR:Ljava/lang/String; = "K"

.field private static final KNOTS:Ljava/lang/String; = "N"

.field private static final MILES_PER_HOUR:Ljava/lang/String; = "M"

.field private static final TAG:Ljava/lang/String;

.field public static final TAG_THUMBNAIL_ORIENTATION:Ljava/lang/String; = "ThumbnailOrientation"

.field private static final TIME_FORMAT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/SimpleDateFormat;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mExifInterface:Landroidx/exifinterface/media/ExifInterface;

.field private mRemoveTimestamp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 56
    const-class v0, Landroidx/camera/core/impl/utils/Exif;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/utils/Exif;->TAG:Ljava/lang/String;

    .line 58
    new-instance v0, Landroidx/camera/core/impl/utils/Exif$1;

    invoke-direct {v0}, Landroidx/camera/core/impl/utils/Exif$1;-><init>()V

    sput-object v0, Landroidx/camera/core/impl/utils/Exif;->DATE_FORMAT:Ljava/lang/ThreadLocal;

    .line 65
    new-instance v0, Landroidx/camera/core/impl/utils/Exif$2;

    invoke-direct {v0}, Landroidx/camera/core/impl/utils/Exif$2;-><init>()V

    sput-object v0, Landroidx/camera/core/impl/utils/Exif;->TIME_FORMAT:Ljava/lang/ThreadLocal;

    .line 72
    new-instance v0, Landroidx/camera/core/impl/utils/Exif$3;

    invoke-direct {v0}, Landroidx/camera/core/impl/utils/Exif$3;-><init>()V

    sput-object v0, Landroidx/camera/core/impl/utils/Exif;->DATETIME_FORMAT:Ljava/lang/ThreadLocal;

    .line 85
    invoke-static {}, Landroidx/camera/core/impl/utils/Exif;->getAllExifTags()Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/utils/Exif;->ALL_EXIF_TAGS:Ljava/util/List;

    .line 87
    const-string v9, "ThumbnailImageWidth"

    const-string v10, "ThumbnailOrientation"

    const-string v1, "ImageWidth"

    const-string v2, "ImageLength"

    const-string v3, "PixelXDimension"

    const-string v4, "PixelYDimension"

    const-string v5, "Compression"

    const-string v6, "JPEGInterchangeFormat"

    const-string v7, "JPEGInterchangeFormatLength"

    const-string v8, "ThumbnailImageLength"

    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/impl/utils/Exif;->DO_NOT_COPY_EXIF_TAGS:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Landroidx/exifinterface/media/ExifInterface;)V
    .locals 1
    .param p1, "exifInterface"    # Landroidx/exifinterface/media/ExifInterface;

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/core/impl/utils/Exif;->mRemoveTimestamp:Z

    .line 107
    iput-object p1, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    .line 108
    return-void
.end method

.method private attachLastModifiedTimestamp()V
    .locals 6

    .line 321
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 322
    .local v0, "now":J
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/Exif;->convertToExifDateTime(J)Ljava/lang/String;

    move-result-object v2

    .line 324
    .local v2, "datetime":Ljava/lang/String;
    iget-object v3, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v4, "DateTime"

    invoke-virtual {v3, v4, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    :try_start_0
    invoke-static {v2}, Landroidx/camera/core/impl/utils/Exif;->convertFromExifDateTime(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    sub-long v3, v0, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    .line 328
    .local v3, "subsec":Ljava/lang/String;
    iget-object v4, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v5, "SubSecTime"

    invoke-virtual {v4, v5, v3}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    .end local v3    # "subsec":Ljava/lang/String;
    goto :goto_0

    .line 329
    :catch_0
    move-exception v3

    .line 331
    :goto_0
    return-void
.end method

.method private static convertFromExifDate(Ljava/lang/String;)Ljava/util/Date;
    .locals 1
    .param p0, "date"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 163
    sget-object v0, Landroidx/camera/core/impl/utils/Exif;->DATE_FORMAT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method private static convertFromExifDateTime(Ljava/lang/String;)Ljava/util/Date;
    .locals 1
    .param p0, "dateTime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 159
    sget-object v0, Landroidx/camera/core/impl/utils/Exif;->DATETIME_FORMAT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method private static convertFromExifTime(Ljava/lang/String;)Ljava/util/Date;
    .locals 1
    .param p0, "time"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 167
    sget-object v0, Landroidx/camera/core/impl/utils/Exif;->TIME_FORMAT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method private static convertToExifDateTime(J)Ljava/lang/String;
    .locals 2
    .param p0, "timestamp"    # J

    .line 155
    sget-object v0, Landroidx/camera/core/impl/utils/Exif;->DATETIME_FORMAT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static createFromFile(Ljava/io/File;)Landroidx/camera/core/impl/utils/Exif;
    .locals 1
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 116
    invoke-virtual {p0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/core/impl/utils/Exif;->createFromFileString(Ljava/lang/String;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v0

    return-object v0
.end method

.method public static createFromFileString(Ljava/lang/String;)Landroidx/camera/core/impl/utils/Exif;
    .locals 2
    .param p0, "filePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    new-instance v0, Landroidx/camera/core/impl/utils/Exif;

    new-instance v1, Landroidx/exifinterface/media/ExifInterface;

    invoke-direct {v1, p0}, Landroidx/exifinterface/media/ExifInterface;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/utils/Exif;-><init>(Landroidx/exifinterface/media/ExifInterface;)V

    return-object v0
.end method

.method public static createFromImageProxy(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/impl/utils/Exif;
    .locals 4
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 126
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 128
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 130
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    new-array v1, v1, [B

    .line 131
    .local v1, "data":[B
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 132
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 133
    .local v2, "inputStream":Ljava/io/InputStream;
    invoke-static {v2}, Landroidx/camera/core/impl/utils/Exif;->createFromInputStream(Ljava/io/InputStream;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v3

    return-object v3
.end method

.method public static createFromInputStream(Ljava/io/InputStream;)Landroidx/camera/core/impl/utils/Exif;
    .locals 2
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    new-instance v0, Landroidx/camera/core/impl/utils/Exif;

    new-instance v1, Landroidx/exifinterface/media/ExifInterface;

    invoke-direct {v1, p0}, Landroidx/exifinterface/media/ExifInterface;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/utils/Exif;-><init>(Landroidx/exifinterface/media/ExifInterface;)V

    return-object v0
.end method

.method public static getAllExifTags()Ljava/util/List;
    .locals 154
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 728
    const-string v152, "NewSubfileType"

    const-string v153, "SubfileType"

    const-string v1, "ImageWidth"

    const-string v2, "ImageLength"

    const-string v3, "BitsPerSample"

    const-string v4, "Compression"

    const-string v5, "PhotometricInterpretation"

    const-string v6, "Orientation"

    const-string v7, "SamplesPerPixel"

    const-string v8, "PlanarConfiguration"

    const-string v9, "YCbCrSubSampling"

    const-string v10, "YCbCrPositioning"

    const-string v11, "XResolution"

    const-string v12, "YResolution"

    const-string v13, "ResolutionUnit"

    const-string v14, "StripOffsets"

    const-string v15, "RowsPerStrip"

    const-string v16, "StripByteCounts"

    const-string v17, "JPEGInterchangeFormat"

    const-string v18, "JPEGInterchangeFormatLength"

    const-string v19, "TransferFunction"

    const-string v20, "WhitePoint"

    const-string v21, "PrimaryChromaticities"

    const-string v22, "YCbCrCoefficients"

    const-string v23, "ReferenceBlackWhite"

    const-string v24, "DateTime"

    const-string v25, "ImageDescription"

    const-string v26, "Make"

    const-string v27, "Model"

    const-string v28, "Software"

    const-string v29, "Artist"

    const-string v30, "Copyright"

    const-string v31, "ExifVersion"

    const-string v32, "FlashpixVersion"

    const-string v33, "ColorSpace"

    const-string v34, "Gamma"

    const-string v35, "PixelXDimension"

    const-string v36, "PixelYDimension"

    const-string v37, "ComponentsConfiguration"

    const-string v38, "CompressedBitsPerPixel"

    const-string v39, "MakerNote"

    const-string v40, "UserComment"

    const-string v41, "RelatedSoundFile"

    const-string v42, "DateTimeOriginal"

    const-string v43, "DateTimeDigitized"

    const-string v44, "OffsetTime"

    const-string v45, "OffsetTimeOriginal"

    const-string v46, "OffsetTimeDigitized"

    const-string v47, "SubSecTime"

    const-string v48, "SubSecTimeOriginal"

    const-string v49, "SubSecTimeDigitized"

    const-string v50, "ExposureTime"

    const-string v51, "FNumber"

    const-string v52, "ExposureProgram"

    const-string v53, "SpectralSensitivity"

    const-string v54, "PhotographicSensitivity"

    const-string v55, "OECF"

    const-string v56, "SensitivityType"

    const-string v57, "StandardOutputSensitivity"

    const-string v58, "RecommendedExposureIndex"

    const-string v59, "ISOSpeed"

    const-string v60, "ISOSpeedLatitudeyyy"

    const-string v61, "ISOSpeedLatitudezzz"

    const-string v62, "ShutterSpeedValue"

    const-string v63, "ApertureValue"

    const-string v64, "BrightnessValue"

    const-string v65, "ExposureBiasValue"

    const-string v66, "MaxApertureValue"

    const-string v67, "SubjectDistance"

    const-string v68, "MeteringMode"

    const-string v69, "LightSource"

    const-string v70, "Flash"

    const-string v71, "SubjectArea"

    const-string v72, "FocalLength"

    const-string v73, "FlashEnergy"

    const-string v74, "SpatialFrequencyResponse"

    const-string v75, "FocalPlaneXResolution"

    const-string v76, "FocalPlaneYResolution"

    const-string v77, "FocalPlaneResolutionUnit"

    const-string v78, "SubjectLocation"

    const-string v79, "ExposureIndex"

    const-string v80, "SensingMethod"

    const-string v81, "FileSource"

    const-string v82, "SceneType"

    const-string v83, "CFAPattern"

    const-string v84, "CustomRendered"

    const-string v85, "ExposureMode"

    const-string v86, "WhiteBalance"

    const-string v87, "DigitalZoomRatio"

    const-string v88, "FocalLengthIn35mmFilm"

    const-string v89, "SceneCaptureType"

    const-string v90, "GainControl"

    const-string v91, "Contrast"

    const-string v92, "Saturation"

    const-string v93, "Sharpness"

    const-string v94, "DeviceSettingDescription"

    const-string v95, "SubjectDistanceRange"

    const-string v96, "ImageUniqueID"

    const-string v97, "CameraOwnerName"

    const-string v98, "BodySerialNumber"

    const-string v99, "LensSpecification"

    const-string v100, "LensMake"

    const-string v101, "LensModel"

    const-string v102, "LensSerialNumber"

    const-string v103, "GPSVersionID"

    const-string v104, "GPSLatitudeRef"

    const-string v105, "GPSLatitude"

    const-string v106, "GPSLongitudeRef"

    const-string v107, "GPSLongitude"

    const-string v108, "GPSAltitudeRef"

    const-string v109, "GPSAltitude"

    const-string v110, "GPSTimeStamp"

    const-string v111, "GPSSatellites"

    const-string v112, "GPSStatus"

    const-string v113, "GPSMeasureMode"

    const-string v114, "GPSDOP"

    const-string v115, "GPSSpeedRef"

    const-string v116, "GPSSpeed"

    const-string v117, "GPSTrackRef"

    const-string v118, "GPSTrack"

    const-string v119, "GPSImgDirectionRef"

    const-string v120, "GPSImgDirection"

    const-string v121, "GPSMapDatum"

    const-string v122, "GPSDestLatitudeRef"

    const-string v123, "GPSDestLatitude"

    const-string v124, "GPSDestLongitudeRef"

    const-string v125, "GPSDestLongitude"

    const-string v126, "GPSDestBearingRef"

    const-string v127, "GPSDestBearing"

    const-string v128, "GPSDestDistanceRef"

    const-string v129, "GPSDestDistance"

    const-string v130, "GPSProcessingMethod"

    const-string v131, "GPSAreaInformation"

    const-string v132, "GPSDateStamp"

    const-string v133, "GPSDifferential"

    const-string v134, "GPSHPositioningError"

    const-string v135, "InteroperabilityIndex"

    const-string v136, "ThumbnailImageLength"

    const-string v137, "ThumbnailImageWidth"

    const-string v138, "ThumbnailOrientation"

    const-string v139, "DNGVersion"

    const-string v140, "DefaultCropSize"

    const-string v141, "ThumbnailImage"

    const-string v142, "PreviewImageStart"

    const-string v143, "PreviewImageLength"

    const-string v144, "AspectFrame"

    const-string v145, "SensorBottomBorder"

    const-string v146, "SensorLeftBorder"

    const-string v147, "SensorRightBorder"

    const-string v148, "SensorTopBorder"

    const-string v149, "ISO"

    const-string v150, "JpgFromRaw"

    const-string v151, "Xmp"

    filled-new-array/range {v1 .. v153}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private parseTimestamp(Ljava/lang/String;)J
    .locals 3
    .param p1, "datetime"    # Ljava/lang/String;

    .line 687
    const-wide/16 v0, -0x1

    if-nez p1, :cond_0

    .line 688
    return-wide v0

    .line 691
    :cond_0
    :try_start_0
    invoke-static {p1}, Landroidx/camera/core/impl/utils/Exif;->convertFromExifDateTime(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 692
    :catch_0
    move-exception v2

    .line 693
    .local v2, "e":Ljava/text/ParseException;
    return-wide v0
.end method

.method private parseTimestamp(Ljava/lang/String;Ljava/lang/String;)J
    .locals 3
    .param p1, "date"    # Ljava/lang/String;
    .param p2, "time"    # Ljava/lang/String;

    .line 665
    const-wide/16 v0, -0x1

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    .line 666
    return-wide v0

    .line 668
    :cond_0
    if-nez p2, :cond_1

    .line 670
    :try_start_0
    invoke-static {p1}, Landroidx/camera/core/impl/utils/Exif;->convertFromExifDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 671
    :catch_0
    move-exception v2

    .line 672
    .local v2, "e":Ljava/text/ParseException;
    return-wide v0

    .line 675
    .end local v2    # "e":Ljava/text/ParseException;
    :cond_1
    if-nez p1, :cond_2

    .line 677
    :try_start_1
    invoke-static {p2}, Landroidx/camera/core/impl/utils/Exif;->convertFromExifTime(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    return-wide v0

    .line 678
    :catch_1
    move-exception v2

    .line 679
    .restart local v2    # "e":Ljava/text/ParseException;
    return-wide v0

    .line 682
    .end local v2    # "e":Ljava/text/ParseException;
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/impl/utils/Exif;->parseTimestamp(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public attachLocation(Landroid/location/Location;)V
    .locals 1
    .param p1, "location"    # Landroid/location/Location;

    .line 645
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v0, p1}, Landroidx/exifinterface/media/ExifInterface;->setGpsInfo(Landroid/location/Location;)V

    .line 646
    return-void
.end method

.method public attachTimestamp()V
    .locals 6

    .line 616
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 617
    .local v0, "now":J
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/Exif;->convertToExifDateTime(J)Ljava/lang/String;

    move-result-object v2

    .line 619
    .local v2, "datetime":Ljava/lang/String;
    iget-object v3, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v4, "DateTimeOriginal"

    invoke-virtual {v3, v4, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    iget-object v3, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v4, "DateTimeDigitized"

    invoke-virtual {v3, v4, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    :try_start_0
    invoke-static {v2}, Landroidx/camera/core/impl/utils/Exif;->convertFromExifDateTime(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    sub-long v3, v0, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    .line 624
    .local v3, "subsec":Ljava/lang/String;
    iget-object v4, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v5, "SubSecTimeOriginal"

    invoke-virtual {v4, v5, v3}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 625
    iget-object v4, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v5, "SubSecTimeDigitized"

    invoke-virtual {v4, v5, v3}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 627
    .end local v3    # "subsec":Ljava/lang/String;
    goto :goto_0

    .line 626
    :catch_0
    move-exception v3

    .line 629
    :goto_0
    const/4 v3, 0x0

    iput-boolean v3, p0, Landroidx/camera/core/impl/utils/Exif;->mRemoveTimestamp:Z

    .line 630
    return-void
.end method

.method public copyToCroppedImage(Landroidx/camera/core/impl/utils/Exif;)V
    .locals 6
    .param p1, "croppedExif"    # Landroidx/camera/core/impl/utils/Exif;

    .line 185
    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Landroidx/camera/core/impl/utils/Exif;->ALL_EXIF_TAGS:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 186
    .local v0, "exifTags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v1, Landroidx/camera/core/impl/utils/Exif;->DO_NOT_COPY_EXIF_TAGS:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 187
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 188
    .local v2, "tag":Ljava/lang/String;
    iget-object v3, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v3, v2}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 189
    .local v3, "originalValue":Ljava/lang/String;
    iget-object v4, p1, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v4, v2}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 190
    .local v4, "croppedExifValue":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-static {v3, v4}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 191
    iget-object v5, p1, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v5, v2, v3}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .end local v2    # "tag":Ljava/lang/String;
    .end local v3    # "originalValue":Ljava/lang/String;
    .end local v4    # "croppedExifValue":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 194
    :cond_1
    return-void
.end method

.method public flipHorizontally()V
    .locals 4

    .line 571
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getOrientation()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 598
    const/4 v0, 0x2

    .local v0, "orientation":I
    goto :goto_0

    .line 591
    .end local v0    # "orientation":I
    :pswitch_0
    const/4 v0, 0x7

    .line 592
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 588
    .end local v0    # "orientation":I
    :pswitch_1
    const/16 v0, 0x8

    .line 589
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 585
    .end local v0    # "orientation":I
    :pswitch_2
    const/4 v0, 0x5

    .line 586
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 582
    .end local v0    # "orientation":I
    :pswitch_3
    const/4 v0, 0x6

    .line 583
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 579
    .end local v0    # "orientation":I
    :pswitch_4
    const/4 v0, 0x3

    .line 580
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 576
    .end local v0    # "orientation":I
    :pswitch_5
    const/4 v0, 0x4

    .line 577
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 573
    .end local v0    # "orientation":I
    :pswitch_6
    const/4 v0, 0x1

    .line 574
    .restart local v0    # "orientation":I
    nop

    .line 601
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v2, "Orientation"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 602
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public flipVertically()V
    .locals 4

    .line 532
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getOrientation()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 559
    const/4 v0, 0x4

    .local v0, "orientation":I
    goto :goto_0

    .line 552
    .end local v0    # "orientation":I
    :pswitch_0
    const/4 v0, 0x5

    .line 553
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 549
    .end local v0    # "orientation":I
    :pswitch_1
    const/4 v0, 0x6

    .line 550
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 546
    .end local v0    # "orientation":I
    :pswitch_2
    const/4 v0, 0x7

    .line 547
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 543
    .end local v0    # "orientation":I
    :pswitch_3
    const/16 v0, 0x8

    .line 544
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 540
    .end local v0    # "orientation":I
    :pswitch_4
    const/4 v0, 0x1

    .line 541
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 537
    .end local v0    # "orientation":I
    :pswitch_5
    const/4 v0, 0x2

    .line 538
    .restart local v0    # "orientation":I
    goto :goto_0

    .line 534
    .end local v0    # "orientation":I
    :pswitch_6
    const/4 v0, 0x3

    .line 535
    .restart local v0    # "orientation":I
    nop

    .line 562
    :goto_0
    iget-object v1, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v2, "Orientation"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 563
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getDescription()Ljava/lang/String;
    .locals 2

    .line 234
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "ImageDescription"

    invoke-virtual {v0, v1}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExifInterface()Landroidx/exifinterface/media/ExifInterface;
    .locals 1

    .line 611
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    return-object v0
.end method

.method public getHeight()I
    .locals 3

    .line 230
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "ImageLength"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getLastModifiedTimestamp()J
    .locals 7

    .line 338
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "DateTime"

    invoke-virtual {v0, v1}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/impl/utils/Exif;->parseTimestamp(Ljava/lang/String;)J

    move-result-wide v0

    .line 339
    .local v0, "timestamp":J
    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 340
    return-wide v2

    .line 343
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v3, "SubSecTime"

    invoke-virtual {v2, v3}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 344
    .local v2, "subSecs":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 346
    :try_start_0
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 347
    .local v3, "sub":J
    :goto_0
    const-wide/16 v5, 0x3e8

    cmp-long v5, v3, v5

    if-lez v5, :cond_1

    .line 348
    const-wide/16 v5, 0xa

    div-long v5, v3, v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v3, v5

    goto :goto_0

    .line 350
    :cond_1
    add-long/2addr v0, v3

    .line 353
    .end local v3    # "sub":J
    goto :goto_1

    .line 351
    :catch_0
    move-exception v3

    .line 356
    :cond_2
    :goto_1
    return-wide v0
.end method

.method public getLocation()Landroid/location/Location;
    .locals 18

    .line 388
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v2, "GPSProcessingMethod"

    invoke-virtual {v1, v2}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 389
    .local v1, "provider":Ljava/lang/String;
    iget-object v2, v0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v2}, Landroidx/exifinterface/media/ExifInterface;->getLatLong()[D

    move-result-object v2

    .line 390
    .local v2, "latlng":[D
    iget-object v3, v0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Landroidx/exifinterface/media/ExifInterface;->getAltitude(D)D

    move-result-wide v6

    .line 391
    .local v6, "altitude":D
    iget-object v3, v0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v8, "GPSSpeed"

    invoke-virtual {v3, v8, v4, v5}, Landroidx/exifinterface/media/ExifInterface;->getAttributeDouble(Ljava/lang/String;D)D

    move-result-wide v8

    .line 392
    .local v8, "speed":D
    iget-object v3, v0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v10, "GPSSpeedRef"

    invoke-virtual {v3, v10}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 393
    .local v3, "speedRef":Ljava/lang/String;
    const-string v10, "K"

    if-nez v3, :cond_0

    move-object v11, v10

    goto :goto_0

    :cond_0
    move-object v11, v3

    .line 394
    .end local v3    # "speedRef":Ljava/lang/String;
    .local v11, "speedRef":Ljava/lang/String;
    :goto_0
    iget-object v3, v0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    .line 396
    const-string v12, "GPSDateStamp"

    invoke-virtual {v3, v12}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iget-object v12, v0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    .line 397
    const-string v13, "GPSTimeStamp"

    invoke-virtual {v12, v13}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 395
    invoke-direct {v0, v3, v12}, Landroidx/camera/core/impl/utils/Exif;->parseTimestamp(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v12

    .line 398
    .local v12, "timestamp":J
    if-nez v2, :cond_1

    .line 399
    const/4 v3, 0x0

    return-object v3

    .line 401
    :cond_1
    if-nez v1, :cond_2

    .line 402
    sget-object v1, Landroidx/camera/core/impl/utils/Exif;->TAG:Ljava/lang/String;

    .line 405
    :cond_2
    new-instance v3, Landroid/location/Location;

    invoke-direct {v3, v1}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 406
    .local v3, "location":Landroid/location/Location;
    const/4 v14, 0x0

    move-wide v15, v4

    aget-wide v4, v2, v14

    invoke-virtual {v3, v4, v5}, Landroid/location/Location;->setLatitude(D)V

    .line 407
    const/16 v17, 0x1

    aget-wide v4, v2, v17

    invoke-virtual {v3, v4, v5}, Landroid/location/Location;->setLongitude(D)V

    .line 408
    cmpl-double v4, v6, v15

    if-eqz v4, :cond_3

    .line 409
    invoke-virtual {v3, v6, v7}, Landroid/location/Location;->setAltitude(D)V

    .line 411
    :cond_3
    cmpl-double v4, v8, v15

    if-eqz v4, :cond_5

    .line 412
    invoke-virtual {v11}, Ljava/lang/String;->hashCode()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    :cond_4
    :pswitch_0
    goto :goto_1

    :pswitch_1
    const-string v4, "N"

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    move/from16 v14, v17

    goto :goto_2

    :pswitch_2
    const-string v4, "M"

    invoke-virtual {v11, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_2

    :pswitch_3
    invoke-virtual {v11, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v14, 0x2

    goto :goto_2

    :goto_1
    const/4 v14, -0x1

    :goto_2
    packed-switch v14, :pswitch_data_1

    .line 422
    invoke-static {v8, v9}, Landroidx/camera/core/impl/utils/Exif$Speed;->fromKilometersPerHour(D)Landroidx/camera/core/impl/utils/Exif$Speed$Converter;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/Exif$Speed$Converter;->toMetersPerSecond()D

    move-result-wide v4

    move-wide v8, v4

    .end local v8    # "speed":D
    .local v4, "speed":D
    goto :goto_3

    .line 417
    .end local v4    # "speed":D
    .restart local v8    # "speed":D
    :pswitch_4
    invoke-static {v8, v9}, Landroidx/camera/core/impl/utils/Exif$Speed;->fromKnots(D)Landroidx/camera/core/impl/utils/Exif$Speed$Converter;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/Exif$Speed$Converter;->toMetersPerSecond()D

    move-result-wide v4

    .line 418
    .end local v8    # "speed":D
    .restart local v4    # "speed":D
    move-wide v8, v4

    goto :goto_3

    .line 414
    .end local v4    # "speed":D
    .restart local v8    # "speed":D
    :pswitch_5
    invoke-static {v8, v9}, Landroidx/camera/core/impl/utils/Exif$Speed;->fromMilesPerHour(D)Landroidx/camera/core/impl/utils/Exif$Speed$Converter;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/utils/Exif$Speed$Converter;->toMetersPerSecond()D

    move-result-wide v4

    .line 415
    .end local v8    # "speed":D
    .restart local v4    # "speed":D
    move-wide v8, v4

    .line 426
    .end local v4    # "speed":D
    .restart local v8    # "speed":D
    :goto_3
    double-to-float v4, v8

    invoke-virtual {v3, v4}, Landroid/location/Location;->setSpeed(F)V

    .line 428
    :cond_5
    const-wide/16 v4, -0x1

    cmp-long v4, v12, v4

    if-eqz v4, :cond_6

    .line 429
    invoke-virtual {v3, v12, v13}, Landroid/location/Location;->setTime(J)V

    .line 431
    :cond_6
    return-object v3

    :pswitch_data_0
    .packed-switch 0x4b
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
    .end packed-switch
.end method

.method public getMetadata()Ljava/lang/String;
    .locals 2

    .line 606
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "Xmp"

    invoke-virtual {v0, v1}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOrientation()I
    .locals 3

    .line 214
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "Orientation"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getRotation()I
    .locals 5

    .line 244
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getOrientation()I

    move-result v0

    const/16 v1, 0x5a

    const/16 v2, 0x10e

    const/16 v3, 0xb4

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    .line 264
    return v4

    .line 258
    :pswitch_0
    return v2

    .line 256
    :pswitch_1
    return v1

    .line 254
    :pswitch_2
    return v1

    .line 252
    :pswitch_3
    return v2

    .line 250
    :pswitch_4
    return v3

    .line 248
    :pswitch_5
    return v3

    .line 246
    :pswitch_6
    return v4

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getTimestamp()J
    .locals 7

    .line 364
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    .line 365
    const-string v1, "DateTimeOriginal"

    invoke-virtual {v0, v1}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/camera/core/impl/utils/Exif;->parseTimestamp(Ljava/lang/String;)J

    move-result-wide v0

    .line 366
    .local v0, "timestamp":J
    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 367
    return-wide v2

    .line 370
    :cond_0
    iget-object v2, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v3, "SubSecTimeOriginal"

    invoke-virtual {v2, v3}, Landroidx/exifinterface/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 371
    .local v2, "subSecs":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 373
    :try_start_0
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 374
    .local v3, "sub":J
    :goto_0
    const-wide/16 v5, 0x3e8

    cmp-long v5, v3, v5

    if-lez v5, :cond_1

    .line 375
    const-wide/16 v5, 0xa

    div-long v5, v3, v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide v3, v5

    goto :goto_0

    .line 377
    :cond_1
    add-long/2addr v0, v3

    .line 380
    .end local v3    # "sub":J
    goto :goto_1

    .line 378
    :catch_0
    move-exception v3

    .line 383
    :cond_2
    :goto_1
    return-wide v0
.end method

.method public getWidth()I
    .locals 3

    .line 225
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "ImageWidth"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public isFlippedHorizontally()Z
    .locals 2

    .line 296
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getOrientation()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    .line 316
    return v1

    .line 310
    :pswitch_0
    return v1

    .line 308
    :pswitch_1
    return v1

    .line 306
    :pswitch_2
    return v1

    .line 304
    :pswitch_3
    return v1

    .line 302
    :pswitch_4
    return v1

    .line 300
    :pswitch_5
    return v1

    .line 298
    :pswitch_6
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isFlippedVertically()Z
    .locals 3

    .line 270
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 290
    return v2

    .line 284
    :pswitch_0
    return v2

    .line 282
    :pswitch_1
    return v1

    .line 280
    :pswitch_2
    return v2

    .line 278
    :pswitch_3
    return v1

    .line 276
    :pswitch_4
    return v1

    .line 274
    :pswitch_5
    return v2

    .line 272
    :pswitch_6
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public removeLocation()V
    .locals 3

    .line 650
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSProcessingMethod"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSLatitude"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 652
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSLatitudeRef"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 653
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSLongitude"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 654
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSLongitudeRef"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSAltitude"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 656
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSAltitudeRef"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 657
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSSpeed"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSSpeedRef"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 659
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSDateStamp"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 660
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "GPSTimeStamp"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    return-void
.end method

.method public removeTimestamp()V
    .locals 3

    .line 634
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "DateTime"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "DateTimeOriginal"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 636
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "DateTimeDigitized"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "SubSecTime"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "SubSecTimeOriginal"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 639
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "SubSecTimeDigitized"

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/core/impl/utils/Exif;->mRemoveTimestamp:Z

    .line 641
    return-void
.end method

.method public rotate(I)V
    .locals 6
    .param p1, "degrees"    # I

    .line 439
    rem-int/lit8 v0, p1, 0x5a

    const-string v1, "Orientation"

    if-eqz v0, :cond_0

    .line 440
    sget-object v0, Landroidx/camera/core/impl/utils/Exif;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 445
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    .line 442
    const-string v3, "Can only rotate in right angles (eg. 0, 90, 180, 270). %d is unsupported."

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 440
    invoke-static {v0, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    .line 448
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 446
    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    return-void

    .line 452
    :cond_0
    rem-int/lit16 p1, p1, 0x168

    .line 454
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getOrientation()I

    move-result v0

    .line 455
    .local v0, "orientation":I
    :goto_0
    if-gez p1, :cond_1

    .line 456
    add-int/lit8 p1, p1, 0x5a

    .line 458
    packed-switch v0, :pswitch_data_0

    .line 485
    const/16 v0, 0x8

    .line 486
    goto :goto_0

    .line 478
    :pswitch_0
    const/4 v0, 0x6

    .line 479
    goto :goto_0

    .line 475
    :pswitch_1
    const/4 v0, 0x2

    .line 476
    goto :goto_0

    .line 472
    :pswitch_2
    const/4 v0, 0x1

    .line 473
    goto :goto_0

    .line 469
    :pswitch_3
    const/4 v0, 0x4

    .line 470
    goto :goto_0

    .line 466
    :pswitch_4
    const/4 v0, 0x7

    .line 467
    goto :goto_0

    .line 463
    :pswitch_5
    const/4 v0, 0x6

    .line 464
    goto :goto_0

    .line 460
    :pswitch_6
    const/4 v0, 0x5

    .line 461
    goto :goto_0

    .line 489
    :cond_1
    :goto_1
    if-lez p1, :cond_2

    .line 490
    add-int/lit8 p1, p1, -0x5a

    .line 492
    packed-switch v0, :pswitch_data_1

    .line 519
    const/4 v0, 0x6

    .line 520
    goto :goto_1

    .line 512
    :pswitch_7
    const/4 v0, 0x1

    .line 513
    goto :goto_1

    .line 509
    :pswitch_8
    const/4 v0, 0x4

    .line 510
    goto :goto_1

    .line 506
    :pswitch_9
    const/4 v0, 0x3

    .line 507
    goto :goto_1

    .line 503
    :pswitch_a
    const/4 v0, 0x2

    .line 504
    goto :goto_1

    .line 500
    :pswitch_b
    const/4 v0, 0x5

    .line 501
    goto :goto_1

    .line 497
    :pswitch_c
    const/16 v0, 0x8

    .line 498
    goto :goto_1

    .line 494
    :pswitch_d
    const/4 v0, 0x7

    .line 495
    goto :goto_1

    .line 523
    :cond_2
    iget-object v2, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch
.end method

.method public save()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    iget-boolean v0, p0, Landroidx/camera/core/impl/utils/Exif;->mRemoveTimestamp:Z

    if-nez v0, :cond_0

    .line 173
    invoke-direct {p0}, Landroidx/camera/core/impl/utils/Exif;->attachLastModifiedTimestamp()V

    .line 175
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v0}, Landroidx/exifinterface/media/ExifInterface;->saveAttributes()V

    .line 176
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 2
    .param p1, "description"    # Ljava/lang/String;

    .line 239
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "ImageDescription"

    invoke-virtual {v0, v1, p1}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    return-void
.end method

.method public setOrientation(I)V
    .locals 3
    .param p1, "orientation"    # I

    .line 220
    iget-object v0, p0, Landroidx/camera/core/impl/utils/Exif;->mExifInterface:Landroidx/exifinterface/media/ExifInterface;

    const-string v1, "Orientation"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroidx/exifinterface/media/ExifInterface;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .line 198
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 203
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getWidth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 204
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getHeight()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 205
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getRotation()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 206
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->isFlippedVertically()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 207
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->isFlippedHorizontally()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 208
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getLocation()Landroid/location/Location;

    move-result-object v6

    .line 209
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getTimestamp()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 210
    invoke-virtual {p0}, Landroidx/camera/core/impl/utils/Exif;->getDescription()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x8

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    const/4 v1, 0x1

    aput-object v2, v9, v1

    const/4 v1, 0x2

    aput-object v3, v9, v1

    const/4 v1, 0x3

    aput-object v4, v9, v1

    const/4 v1, 0x4

    aput-object v5, v9, v1

    const/4 v1, 0x5

    aput-object v6, v9, v1

    const/4 v1, 0x6

    aput-object v7, v9, v1

    const/4 v1, 0x7

    aput-object v8, v9, v1

    .line 198
    const-string v1, "Exif{width=%s, height=%s, rotation=%d, isFlippedVertically=%s, isFlippedHorizontally=%s, location=%s, timestamp=%s, description=%s}"

    invoke-static {v0, v1, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
