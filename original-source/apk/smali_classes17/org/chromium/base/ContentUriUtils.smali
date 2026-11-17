.class public abstract Lorg/chromium/base/ContentUriUtils;
.super Ljava/lang/Object;
.source "ContentUriUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/ContentUriUtils$FileProviderUtil;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final TAG:Ljava/lang/String; = "ContentUriUtils"

.field private static sFileProviderUtil:Lorg/chromium/base/ContentUriUtils$FileProviderUtil;

.field private static final sLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    nop

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/chromium/base/ContentUriUtils;->sLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static contentUriExists(Ljava/lang/String;)Z
    .locals 3
    .param p0, "uriString"    # Ljava/lang/String;

    .line 100
    const/4 v0, 0x0

    .line 102
    .local v0, "asf":Landroid/content/res/AssetFileDescriptor;
    :try_start_0
    invoke-static {p0}, Lorg/chromium/base/ContentUriUtils;->getAssetFileDescriptor(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    .end local v0    # "asf":Landroid/content/res/AssetFileDescriptor;
    .local v1, "asf":Landroid/content/res/AssetFileDescriptor;
    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 107
    :goto_0
    if-eqz v1, :cond_1

    .line 109
    :try_start_1
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 112
    goto :goto_1

    .line 110
    :catch_0
    move-exception v2

    .line 103
    :cond_1
    :goto_1
    return v0

    .line 107
    .end local v1    # "asf":Landroid/content/res/AssetFileDescriptor;
    .restart local v0    # "asf":Landroid/content/res/AssetFileDescriptor;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    .line 109
    :try_start_2
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 112
    goto :goto_2

    .line 110
    :catch_1
    move-exception v2

    .line 114
    :cond_2
    :goto_2
    throw v1
.end method

.method public static delete(Ljava/lang/String;)Z
    .locals 3
    .param p0, "uriString"    # Ljava/lang/String;

    .line 300
    invoke-static {p0}, Lorg/chromium/base/ContentUriUtils;->isContentUri(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 301
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 302
    .local v0, "parsedUri":Landroid/net/Uri;
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 303
    .local v1, "resolver":Landroid/content/ContentResolver;
    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 300
    .end local v0    # "parsedUri":Landroid/net/Uri;
    .end local v1    # "resolver":Landroid/content/ContentResolver;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private static getAssetFileDescriptor(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 10
    .param p0, "uriString"    # Ljava/lang/String;

    .line 141
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 142
    .local v1, "resolver":Landroid/content/ContentResolver;
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 145
    .local v2, "uri":Landroid/net/Uri;
    const/4 v3, 0x0

    :try_start_0
    invoke-static {v2}, Lorg/chromium/base/ContentUriUtils;->isVirtualDocument(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 146
    const-string v0, "*/*"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->getStreamTypes(Landroid/net/Uri;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    .line 147
    .local v4, "streamTypes":[Ljava/lang/String;
    if-eqz v4, :cond_2

    array-length v0, v4

    if-lez v0, :cond_2

    .line 148
    const/4 v0, 0x0

    aget-object v0, v4, v0

    .line 149
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/ContentResolver;->openTypedAssetFileDescriptor(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    move-object v5, v0

    .line 150
    .local v5, "afd":Landroid/content/res/AssetFileDescriptor;
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const-wide/16 v8, 0x0

    cmp-long v0, v6, v8

    if-nez v0, :cond_0

    goto :goto_1

    .line 154
    :cond_0
    :try_start_1
    invoke-virtual {v5}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 157
    goto :goto_0

    .line 155
    :catch_0
    move-exception v0

    .line 158
    :goto_0
    :try_start_2
    new-instance v0, Ljava/lang/SecurityException;

    const-string v6, "Cannot open files with non-zero offset type."

    invoke-direct {v0, v6}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local v1    # "resolver":Landroid/content/ContentResolver;
    .end local v2    # "uri":Landroid/net/Uri;
    .end local p0    # "uriString":Ljava/lang/String;
    throw v0

    .line 160
    .restart local v1    # "resolver":Landroid/content/ContentResolver;
    .restart local v2    # "uri":Landroid/net/Uri;
    .restart local p0    # "uriString":Ljava/lang/String;
    :cond_1
    :goto_1
    return-object v5

    .line 162
    .end local v4    # "streamTypes":[Ljava/lang/String;
    .end local v5    # "afd":Landroid/content/res/AssetFileDescriptor;
    :cond_2
    goto :goto_2

    .line 163
    :cond_3
    const-string v0, "r"

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    move-object v5, v0

    .line 164
    .local v5, "pfd":Landroid/os/ParcelFileDescriptor;
    if-eqz v5, :cond_4

    .line 165
    new-instance v4, Landroid/content/res/AssetFileDescriptor;

    const-wide/16 v6, 0x0

    const-wide/16 v8, -0x1

    invoke-direct/range {v4 .. v9}, Landroid/content/res/AssetFileDescriptor;-><init>(Landroid/os/ParcelFileDescriptor;JJ)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    return-object v4

    .line 170
    .end local v5    # "pfd":Landroid/os/ParcelFileDescriptor;
    :cond_4
    :goto_2
    goto :goto_3

    .line 168
    :catch_1
    move-exception v0

    .line 169
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "ContentUriUtils"

    const-string v5, "Cannot open content uri: %s"

    invoke-static {v4, v5, p0, v0}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 171
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    return-object v3
.end method

.method public static getContentUriFromFile(Ljava/io/File;)Landroid/net/Uri;
    .locals 2
    .param p0, "file"    # Ljava/io/File;

    .line 68
    sget-object v0, Lorg/chromium/base/ContentUriUtils;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 69
    :try_start_0
    sget-object v1, Lorg/chromium/base/ContentUriUtils;->sFileProviderUtil:Lorg/chromium/base/ContentUriUtils$FileProviderUtil;

    if-eqz v1, :cond_0

    .line 70
    sget-object v1, Lorg/chromium/base/ContentUriUtils;->sFileProviderUtil:Lorg/chromium/base/ContentUriUtils$FileProviderUtil;

    invoke-interface {v1, p0}, Lorg/chromium/base/ContentUriUtils$FileProviderUtil;->getContentUriFromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 72
    :cond_0
    monitor-exit v0

    .line 73
    const/4 v0, 0x0

    return-object v0

    .line 72
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getContentUriFromFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "filePathString"    # Ljava/lang/String;

    .line 315
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/chromium/base/ContentUriUtils;->getContentUriFromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 316
    .local v0, "contentUri":Landroid/net/Uri;
    if-eqz v0, :cond_0

    .line 317
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 322
    .end local v0    # "contentUri":Landroid/net/Uri;
    :cond_0
    goto :goto_0

    .line 319
    :catch_0
    move-exception v0

    .line 321
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v1, "ContentUriUtils"

    const-string v2, "Cannot retrieve content uri from file: %s"

    invoke-static {v1, v2, p0, v0}, Lorg/chromium/base/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 323
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getDisplayName(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "columnField"    # Ljava/lang/String;

    .line 184
    const-string v1, ""

    if-nez p0, :cond_0

    return-object v1

    .line 185
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 186
    .local v2, "contentResolver":Landroid/content/ContentResolver;
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v3, p0

    .end local p0    # "uri":Landroid/net/Uri;
    .local v3, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    .local p0, "cursor":Landroid/database/Cursor;
    if-eqz p0, :cond_6

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/4 v4, 0x1

    if-lt v0, v4, :cond_6

    .line 188
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 189
    invoke-interface {p0, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 190
    .local v0, "displayNameIndex":I
    const/4 v4, -0x1

    if-ne v0, v4, :cond_2

    .line 191
    nop

    .line 210
    if-eqz p0, :cond_1

    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0

    .line 191
    :cond_1
    return-object v1

    .line 193
    :cond_2
    :try_start_3
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 196
    .local v4, "displayName":Ljava/lang/String;
    invoke-static {p0}, Lorg/chromium/base/ContentUriUtils;->hasVirtualFlag(Landroid/database/Cursor;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 197
    const-string v5, "*/*"

    invoke-virtual {v2, v3, v5}, Landroid/content/ContentResolver;->getStreamTypes(Landroid/net/Uri;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 198
    .local v5, "mimeTypes":[Ljava/lang/String;
    if-eqz v5, :cond_3

    array-length v6, v5

    if-lez v6, :cond_3

    .line 200
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v7, v5, v7

    invoke-virtual {v6, v7}, Landroid/webkit/MimeTypeMap;->getExtensionFromMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 201
    .local v6, "ext":Ljava/lang/String;
    if-eqz v6, :cond_3

    .line 204
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v4, v7

    .line 208
    .end local v5    # "mimeTypes":[Ljava/lang/String;
    .end local v6    # "ext":Ljava/lang/String;
    :cond_3
    nop

    .line 210
    if-eqz p0, :cond_4

    :try_start_4
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_0

    .line 208
    :cond_4
    return-object v4

    .line 186
    .end local v0    # "displayNameIndex":I
    .end local v4    # "displayName":Ljava/lang/String;
    :catchall_0
    move-exception v0

    move-object v4, v0

    if-eqz p0, :cond_5

    :try_start_5
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_6
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "contentResolver":Landroid/content/ContentResolver;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "columnField":Ljava/lang/String;
    :cond_5
    :goto_0
    throw v4

    .line 210
    .restart local v2    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "columnField":Ljava/lang/String;
    :cond_6
    if-eqz p0, :cond_7

    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/NullPointerException; {:try_start_6 .. :try_end_6} :catch_0

    .line 214
    .end local p0    # "cursor":Landroid/database/Cursor;
    :cond_7
    nop

    .line 215
    return-object v1

    .line 210
    :catch_0
    move-exception v0

    move-object p0, v0

    .line 213
    .local p0, "e":Ljava/lang/NullPointerException;
    return-object v1
.end method

.method public static getMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "uriString"    # Ljava/lang/String;

    .line 125
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 126
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 127
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {v1}, Lorg/chromium/base/ContentUriUtils;->isVirtualDocument(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 128
    const-string v2, "*/*"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->getStreamTypes(Landroid/net/Uri;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 129
    .local v2, "streamTypes":[Ljava/lang/String;
    if-eqz v2, :cond_0

    array-length v3, v2

    if-lez v3, :cond_0

    const/4 v3, 0x0

    aget-object v3, v2, v3

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return-object v3

    .line 131
    .end local v2    # "streamTypes":[Ljava/lang/String;
    :cond_1
    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static hasVirtualFlag(Landroid/database/Cursor;)Z
    .locals 7
    .param p0, "cursor"    # Landroid/database/Cursor;

    .line 278
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    return v2

    .line 279
    :cond_0
    const-string v0, "flags"

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 280
    .local v0, "index":I
    const/4 v1, -0x1

    if-le v0, v1, :cond_1

    .line 281
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const-wide/16 v5, 0x200

    and-long/2addr v3, v5

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-eqz v1, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    nop

    .line 280
    :goto_0
    return v2
.end method

.method public static isContentUri(Ljava/lang/String;)Z
    .locals 4
    .param p0, "uri"    # Ljava/lang/String;

    .line 288
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 289
    :cond_0
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 290
    .local v1, "parsedUri":Landroid/net/Uri;
    if-eqz v1, :cond_1

    const-string v2, "content"

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method private static isVirtualDocument(Landroid/net/Uri;)Z
    .locals 8
    .param p0, "uri"    # Landroid/net/Uri;

    .line 251
    const/4 v1, 0x0

    if-nez p0, :cond_0

    return v1

    .line 252
    :cond_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 253
    return v1

    .line 255
    :cond_1
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 256
    .local v2, "contentResolver":Landroid/content/ContentResolver;
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v3, p0

    .end local p0    # "uri":Landroid/net/Uri;
    .local v3, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    .local p0, "cursor":Landroid/database/Cursor;
    if-eqz p0, :cond_4

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/4 v4, 0x1

    if-lt v0, v4, :cond_4

    .line 258
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 259
    invoke-static {p0}, Lorg/chromium/base/ContentUriUtils;->hasVirtualFlag(Landroid/database/Cursor;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 261
    if-eqz p0, :cond_2

    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0

    .line 259
    :cond_2
    return v0

    .line 256
    :catchall_0
    move-exception v0

    move-object v4, v0

    if-eqz p0, :cond_3

    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v2    # "contentResolver":Landroid/content/ContentResolver;
    .end local v3    # "uri":Landroid/net/Uri;
    :cond_3
    :goto_0
    throw v4

    .line 261
    .restart local v2    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v3    # "uri":Landroid/net/Uri;
    :cond_4
    if-eqz p0, :cond_5

    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_0

    .line 265
    .end local p0    # "cursor":Landroid/database/Cursor;
    :cond_5
    nop

    .line 266
    return v1

    .line 261
    :catch_0
    move-exception v0

    move-object p0, v0

    .line 264
    .local p0, "e":Ljava/lang/NullPointerException;
    return v1
.end method

.method public static maybeGetDisplayName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "uriString"    # Ljava/lang/String;

    .line 227
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 230
    .local v0, "uri":Landroid/net/Uri;
    const/4 v1, 0x0

    :try_start_0
    invoke-static {}, Lorg/chromium/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "_display_name"

    invoke-static {v0, v2, v3}, Lorg/chromium/base/ContentUriUtils;->getDisplayName(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 232
    .local v2, "displayName":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    return-object v1

    .line 233
    .end local v2    # "displayName":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 237
    .local v2, "e":Ljava/lang/Exception;
    const-string v3, "ContentUriUtils"

    const-string v4, "Cannot open content uri: %s"

    invoke-static {v3, v4, p0, v2}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 241
    .end local v2    # "e":Ljava/lang/Exception;
    return-object v1
.end method

.method public static openContentUriForRead(Ljava/lang/String;)I
    .locals 2
    .param p0, "uriString"    # Ljava/lang/String;

    .line 85
    invoke-static {p0}, Lorg/chromium/base/ContentUriUtils;->getAssetFileDescriptor(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v0

    .line 86
    .local v0, "afd":Landroid/content/res/AssetFileDescriptor;
    if-eqz v0, :cond_0

    .line 87
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->detachFd()I

    move-result v1

    return v1

    .line 89
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method public static setFileProviderUtil(Lorg/chromium/base/ContentUriUtils$FileProviderUtil;)V
    .locals 2
    .param p0, "util"    # Lorg/chromium/base/ContentUriUtils$FileProviderUtil;

    .line 53
    sget-object v0, Lorg/chromium/base/ContentUriUtils;->sLock:Ljava/lang/Object;

    monitor-enter v0

    .line 54
    :try_start_0
    sput-object p0, Lorg/chromium/base/ContentUriUtils;->sFileProviderUtil:Lorg/chromium/base/ContentUriUtils$FileProviderUtil;

    .line 55
    monitor-exit v0

    .line 56
    return-void

    .line 55
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
