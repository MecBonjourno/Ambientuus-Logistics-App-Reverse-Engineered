.class public Lorg/chromium/base/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/FileUtils$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "base::android"
.end annotation


# static fields
.field public static DELETE_ALL:Ljava/util/function/Function; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Function<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "FileUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 37
    new-instance v0, Lorg/chromium/base/FileUtils$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Lorg/chromium/base/FileUtils$$ExternalSyntheticLambda0;-><init>()V

    sput-object v0, Lorg/chromium/base/FileUtils;->DELETE_ALL:Ljava/util/function/Function;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static batchDeleteFiles(Ljava/util/List;Ljava/util/function/Function;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/function/Function<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 84
    .local p0, "filePaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local p1, "canDelete":Ljava/util/function/Function;, "Ljava/util/function/Function<Ljava/lang/String;Ljava/lang/Boolean;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 85
    .local v1, "filePath":Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-interface {p1, v1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    invoke-static {v1}, Lorg/chromium/base/ContentUriUtils;->isContentUri(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 87
    invoke-static {v1}, Lorg/chromium/base/ContentUriUtils;->delete(Ljava/lang/String;)Z

    goto :goto_1

    .line 89
    :cond_1
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 90
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {v2, p1}, Lorg/chromium/base/FileUtils;->recursivelyDeleteFile(Ljava/io/File;Ljava/util/function/Function;)Z

    .line 92
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v2    # "file":Ljava/io/File;
    :cond_2
    :goto_1
    goto :goto_0

    .line 93
    :cond_3
    return-void
.end method

.method public static copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 4
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    const/16 v0, 0x2000

    new-array v0, v0, [B

    .line 124
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    move v2, v1

    .local v2, "amountRead":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 125
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 127
    :cond_0
    return-void
.end method

.method public static copyStreamToFile(Ljava/io/InputStream;Ljava/io/File;)V
    .locals 4
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "outFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".tmp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 137
    .local v0, "tmpOutputFile":Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 138
    .local v1, "os":Ljava/io/OutputStream;
    :try_start_0
    const-string v2, "FileUtils"

    const-string v3, "Writing to %s"

    invoke-static {v2, v3, p1}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    invoke-static {p0, v1}, Lorg/chromium/base/FileUtils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 141
    .end local v1    # "os":Ljava/io/OutputStream;
    invoke-virtual {v0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    return-void

    .line 142
    :cond_0
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    .line 137
    .restart local v1    # "os":Ljava/io/OutputStream;
    :catchall_0
    move-exception v2

    :try_start_1
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v2
.end method

.method public static getAbsoluteFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "filePath"    # Ljava/lang/String;

    .line 224
    invoke-static {}, Lorg/chromium/base/FileUtilsJni;->get()Lorg/chromium/base/FileUtils$Natives;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/base/FileUtils$Natives;->getAbsoluteFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "file"    # Ljava/lang/String;

    .line 185
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 186
    .local v0, "lastSep":I
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 187
    .local v1, "lastDot":I
    if-lt v0, v1, :cond_0

    const-string v2, ""

    return-object v2

    .line 188
    :cond_0
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static getFileSizeBytes(Ljava/io/File;)J
    .locals 8
    .param p0, "file"    # Ljava/io/File;

    .line 101
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 102
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 103
    const-wide/16 v0, 0x0

    .line 104
    .local v0, "size":J
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 105
    .local v2, "files":[Ljava/io/File;
    if-nez v2, :cond_1

    .line 106
    return-wide v0

    .line 108
    :cond_1
    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    .line 109
    .local v5, "f":Ljava/io/File;
    invoke-static {v5}, Lorg/chromium/base/FileUtils;->getFileSizeBytes(Ljava/io/File;)J

    move-result-wide v6

    add-long/2addr v0, v6

    .line 108
    .end local v5    # "f":Ljava/io/File;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 111
    :cond_2
    return-wide v0

    .line 113
    .end local v0    # "size":J
    .end local v2    # "files":[Ljava/io/File;
    :cond_3
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getUriForFile(Ljava/io/File;)Landroid/net/Uri;
    .locals 4
    .param p0, "file"    # Ljava/io/File;

    .line 164
    const/4 v0, 0x0

    .line 169
    .local v0, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-static {p0}, Lorg/chromium/base/ContentUriUtils;->getContentUriFromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 172
    goto :goto_0

    .line 170
    :catch_0
    move-exception v1

    .line 171
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not create content uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "FileUtils"

    invoke-static {v3, v2}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    if-nez v0, :cond_0

    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 176
    :cond_0
    return-object v0
.end method

.method static synthetic lambda$static$0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "filepath"    # Ljava/lang/String;

    .line 37
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static queryBitmapFromContentProvider(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .line 194
    const-string v0, "FileUtils"

    .line 195
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "r"

    invoke-virtual {v2, p1, v3}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 196
    .local v2, "parcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    if-nez v2, :cond_1

    .line 197
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Null ParcelFileDescriptor from uri "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    nop

    .line 211
    if-eqz v2, :cond_0

    :try_start_2
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 198
    :cond_0
    return-object v1

    .line 200
    :cond_1
    :try_start_3
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    .line 201
    .local v3, "fileDescriptor":Ljava/io/FileDescriptor;
    if-nez v3, :cond_3

    .line 202
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Null FileDescriptor from uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 203
    nop

    .line 211
    if-eqz v2, :cond_2

    :try_start_4
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 203
    :cond_2
    return-object v1

    .line 205
    :cond_3
    :try_start_5
    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 206
    .local v4, "bitmap":Landroid/graphics/Bitmap;
    if-nez v4, :cond_5

    .line 207
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to decode image from uri "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 208
    nop

    .line 211
    if-eqz v2, :cond_4

    :try_start_6
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 208
    :cond_4
    return-object v1

    .line 210
    :cond_5
    nop

    .line 211
    if-eqz v2, :cond_6

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 210
    :cond_6
    return-object v4

    .line 194
    .end local v3    # "fileDescriptor":Ljava/io/FileDescriptor;
    .end local v4    # "bitmap":Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_7

    :try_start_7
    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v4

    :try_start_8
    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "uri":Landroid/net/Uri;
    :cond_7
    :goto_0
    throw v3
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 211
    .end local v2    # "parcelFileDescriptor":Landroid/os/ParcelFileDescriptor;
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v2

    .line 212
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IO exception when reading uri "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .end local v2    # "e":Ljava/io/IOException;
    return-object v1
.end method

.method public static readStream(Ljava/io/InputStream;)[B
    .locals 2
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 152
    .local v0, "data":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lorg/chromium/base/FileUtils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 153
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method public static recursivelyDeleteFile(Ljava/io/File;Ljava/util/function/Function;)Z
    .locals 4
    .param p0, "currentFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/function/Function<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 50
    .local p1, "canDelete":Ljava/util/function/Function;, "Ljava/util/function/Function<Ljava/lang/String;Ljava/lang/Boolean;>;"
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 53
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 54
    return v1

    .line 56
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 57
    return v1

    .line 60
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 61
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 62
    .local v0, "files":[Ljava/io/File;
    if-eqz v0, :cond_2

    .line 63
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    .line 64
    .local v3, "file":Ljava/io/File;
    invoke-static {v3, p1}, Lorg/chromium/base/FileUtils;->recursivelyDeleteFile(Ljava/io/File;Ljava/util/function/Function;)Z

    .line 63
    .end local v3    # "file":Ljava/io/File;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 69
    .end local v0    # "files":[Ljava/io/File;
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    .line 70
    .local v0, "ret":Z
    if-nez v0, :cond_3

    .line 71
    const-string v1, "FileUtils"

    const-string v2, "Failed to delete: %s"

    invoke-static {v1, v2, p0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    :cond_3
    return v0
.end method
