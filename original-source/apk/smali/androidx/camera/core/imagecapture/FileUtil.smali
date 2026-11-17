.class public final Landroidx/camera/core/imagecapture/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# static fields
.field private static final COPY_BUFFER_SIZE:I = 0x400

.field private static final NOT_PENDING:I = 0x0

.field private static final PENDING:I = 0x1

.field private static final TEMP_FILE_PREFIX:Ljava/lang/String; = "CameraX"

.field private static final TEMP_FILE_SUFFIX:Ljava/lang/String; = ".tmp"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyFileToFile(Ljava/io/File;Ljava/io/File;)Landroid/net/Uri;
    .locals 4
    .param p0, "source"    # Ljava/io/File;
    .param p1, "target"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 192
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 195
    :cond_0
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 201
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 196
    :cond_1
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to overwrite the file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 198
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v3, v1, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static copyFileToMediaStore(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;
    .locals 9
    .param p0, "file"    # Ljava/io/File;
    .param p1, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 163
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 164
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 165
    new-instance v1, Landroid/content/ContentValues;

    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    goto :goto_0

    .line 166
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    :goto_0
    nop

    .line 167
    .local v1, "values":Landroid/content/ContentValues;
    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/camera/core/imagecapture/FileUtil;->setContentValuePendingFlag(Landroid/content/ContentValues;I)V

    .line 168
    const/4 v3, 0x0

    .line 170
    .local v3, "uri":Landroid/net/Uri;
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v0, v5, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v5

    move-object v3, v5

    .line 171
    if-eqz v3, :cond_2

    .line 175
    invoke-static {p0, v3, v0}, Landroidx/camera/core/imagecapture/FileUtil;->copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;Landroid/content/ContentResolver;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    if-eqz v3, :cond_1

    .line 181
    invoke-static {v3, v0, v4}, Landroidx/camera/core/imagecapture/FileUtil;->updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V

    .line 184
    :cond_1
    return-object v3

    .line 172
    :cond_2
    :try_start_1
    new-instance v5, Landroidx/camera/core/ImageCaptureException;

    const-string v6, "Failed to insert a MediaStore URI."

    const/4 v7, 0x0

    invoke-direct {v5, v2, v6, v7}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "contentResolver":Landroid/content/ContentResolver;
    .end local v1    # "values":Landroid/content/ContentValues;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local p0    # "file":Ljava/io/File;
    .end local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    throw v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 180
    .restart local v0    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v1    # "values":Landroid/content/ContentValues;
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local p0    # "file":Ljava/io/File;
    .restart local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 176
    :catch_0
    move-exception v5

    goto :goto_1

    :catch_1
    move-exception v5

    .line 177
    .local v5, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    new-instance v6, Landroidx/camera/core/ImageCaptureException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to write to MediaStore URI: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v2, v7, v5}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "contentResolver":Landroid/content/ContentResolver;
    .end local v1    # "values":Landroid/content/ContentValues;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local p0    # "file":Ljava/io/File;
    .end local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 180
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v0    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v1    # "values":Landroid/content/ContentValues;
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local p0    # "file":Ljava/io/File;
    .restart local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    :goto_2
    if-eqz v3, :cond_3

    .line 181
    invoke-static {v3, v0, v4}, Landroidx/camera/core/imagecapture/FileUtil;->updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V

    .line 183
    :cond_3
    throw v2
.end method

.method private static copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 223
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 224
    .local v0, "in":Ljava/io/InputStream;
    const/16 v1, 0x400

    :try_start_0
    new-array v1, v1, [B

    .line 226
    .local v1, "buf":[B
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "len":I
    if-lez v2, :cond_0

    .line 227
    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 229
    .end local v1    # "buf":[B
    .end local v3    # "len":I
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 230
    .end local v0    # "in":Ljava/io/InputStream;
    return-void

    .line 223
    .restart local v0    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
.end method

.method private static copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;Landroid/content/ContentResolver;)V
    .locals 4
    .param p0, "tempFile"    # Ljava/io/File;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "contentResolver"    # Landroid/content/ContentResolver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    invoke-virtual {p2, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 212
    .local v0, "outputStream":Ljava/io/OutputStream;
    if-eqz v0, :cond_1

    .line 215
    :try_start_0
    invoke-static {p0, v0}, Landroidx/camera/core/imagecapture/FileUtil;->copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 217
    .end local v0    # "outputStream":Ljava/io/OutputStream;
    :cond_0
    return-void

    .line 211
    .restart local v0    # "outputStream":Ljava/io/OutputStream;
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 213
    :cond_1
    :try_start_1
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " cannot be resolved."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .end local v0    # "outputStream":Ljava/io/OutputStream;
    .end local p0    # "tempFile":Ljava/io/File;
    .end local p1    # "uri":Landroid/net/Uri;
    .end local p2    # "contentResolver":Landroid/content/ContentResolver;
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 211
    .restart local v0    # "outputStream":Ljava/io/OutputStream;
    .restart local p0    # "tempFile":Ljava/io/File;
    .restart local p1    # "uri":Landroid/net/Uri;
    .restart local p2    # "contentResolver":Landroid/content/ContentResolver;
    :goto_0
    if-eqz v0, :cond_2

    :try_start_2
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw v1
.end method

.method static createTempFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Ljava/io/File;
    .locals 5
    .param p0, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 63
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    .local v0, "appProvidedFile":Ljava/io/File;
    const-string v1, "CameraX"

    if-eqz v0, :cond_0

    .line 68
    :try_start_1
    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 69
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 70
    invoke-static {v0}, Landroidx/camera/core/imagecapture/FileUtil;->getFileExtensionWithDot(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    return-object v2

    .line 72
    :cond_0
    const-string v2, ".tmp"

    invoke-static {v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1

    .line 74
    .end local v0    # "appProvidedFile":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 75
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Landroidx/camera/core/ImageCaptureException;

    const/4 v2, 0x1

    const-string v3, "Failed to create temp file."

    invoke-direct {v1, v2, v3, v0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getFileExtensionWithDot(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p0, "file"    # Ljava/io/File;

    .line 150
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "fileName":Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 152
    .local v1, "dotIndex":I
    if-ltz v1, :cond_0

    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 155
    :cond_0
    const-string v2, ""

    return-object v2
.end method

.method private static isSaveToFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 1
    .param p0, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 258
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isSaveToMediaStore(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 1
    .param p0, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 252
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 253
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 254
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 252
    :goto_0
    return v0
.end method

.method private static isSaveToOutputStream(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 1
    .param p0, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 262
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static moveFileToTarget(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;
    .locals 6
    .param p0, "tempFile"    # Ljava/io/File;
    .param p1, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 131
    const/4 v0, 0x0

    .line 133
    .local v0, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-static {p1}, Landroidx/camera/core/imagecapture/FileUtil;->isSaveToMediaStore(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    invoke-static {p0, p1}, Landroidx/camera/core/imagecapture/FileUtil;->copyFileToMediaStore(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;

    move-result-object v1

    move-object v0, v1

    goto :goto_0

    .line 135
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/imagecapture/FileUtil;->isSaveToOutputStream(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 136
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/OutputStream;

    invoke-static {p0, v1}, Landroidx/camera/core/imagecapture/FileUtil;->copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V

    goto :goto_0

    .line 137
    :cond_1
    invoke-static {p1}, Landroidx/camera/core/imagecapture/FileUtil;->isSaveToFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 138
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-static {p0, v1}, Landroidx/camera/core/imagecapture/FileUtil;->copyFileToFile(Ljava/io/File;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    .line 144
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 145
    nop

    .line 146
    return-object v0

    .line 144
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 140
    :catch_0
    move-exception v1

    .line 141
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v2, Landroidx/camera/core/ImageCaptureException;

    const-string v3, "Failed to write to OutputStream."

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-direct {v2, v5, v3, v4}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "uri":Landroid/net/Uri;
    .end local p0    # "tempFile":Ljava/io/File;
    .end local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 144
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "uri":Landroid/net/Uri;
    .restart local p0    # "tempFile":Ljava/io/File;
    .restart local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    :goto_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 145
    throw v1
.end method

.method private static setContentValuePendingFlag(Landroid/content/ContentValues;I)V
    .locals 2
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "isPending"    # I

    .line 246
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 247
    const-string v0, "is_pending"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 249
    :cond_0
    return-void
.end method

.method static updateFileExif(Ljava/io/File;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)V
    .locals 4
    .param p0, "tempFile"    # Ljava/io/File;
    .param p1, "originalExif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p3, "rotationDegrees"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 96
    :try_start_0
    invoke-static {p0}, Landroidx/camera/core/impl/utils/Exif;->createFromFile(Ljava/io/File;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v0

    .line 97
    .local v0, "exif":Landroidx/camera/core/impl/utils/Exif;
    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/utils/Exif;->copyToCroppedImage(Landroidx/camera/core/impl/utils/Exif;)V

    .line 99
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->getRotation()I

    move-result v1

    if-nez v1, :cond_0

    if-eqz p3, :cond_0

    .line 103
    invoke-virtual {v0, p3}, Landroidx/camera/core/impl/utils/Exif;->rotate(I)V

    .line 107
    :cond_0
    invoke-virtual {p2}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v1

    .line 108
    .local v1, "metadata":Landroidx/camera/core/ImageCapture$Metadata;
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedHorizontal()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 109
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->flipHorizontally()V

    .line 111
    :cond_1
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedVertical()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 112
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->flipVertically()V

    .line 114
    :cond_2
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 115
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/utils/Exif;->attachLocation(Landroid/location/Location;)V

    .line 117
    :cond_3
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->save()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .end local v0    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .end local v1    # "metadata":Landroidx/camera/core/ImageCapture$Metadata;
    nop

    .line 121
    return-void

    .line 118
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Landroidx/camera/core/ImageCaptureException;

    const/4 v2, 0x1

    const-string v3, "Failed to update Exif data"

    invoke-direct {v1, v2, v3, v0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V
    .locals 2
    .param p0, "outputUri"    # Landroid/net/Uri;
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "isPending"    # I

    .line 237
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 238
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 239
    .local v0, "values":Landroid/content/ContentValues;
    invoke-static {v0, p2}, Landroidx/camera/core/imagecapture/FileUtil;->setContentValuePendingFlag(Landroid/content/ContentValues;I)V

    .line 240
    const/4 v1, 0x0

    invoke-virtual {p1, p0, v0, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 242
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    return-void
.end method
