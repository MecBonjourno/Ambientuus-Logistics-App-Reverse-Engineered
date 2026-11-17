.class public Lorg/chromium/net/MimeTypeFilter;
.super Ljava/lang/Object;
.source "MimeTypeFilter.java"

# interfaces
.implements Ljava/io/FileFilter;


# instance fields
.field private mAcceptAllMimeTypes:Z

.field private mAcceptDirectory:Z

.field private mExtensions:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mMimeSupertypes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mMimeTypeMap:Landroid/webkit/MimeTypeMap;

.field private mMimeTypes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Z)V
    .locals 5
    .param p2, "acceptDirectory"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 38
    .local p1, "mimeTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/MimeTypeFilter;->mExtensions:Ljava/util/HashSet;

    .line 27
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeTypes:Ljava/util/HashSet;

    .line 28
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeSupertypes:Ljava/util/HashSet;

    .line 39
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 40
    .local v1, "field":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 41
    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 42
    iget-object v2, p0, Lorg/chromium/net/MimeTypeFilter;->mExtensions:Ljava/util/HashSet;

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 43
    :cond_0
    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 44
    iput-boolean v3, p0, Lorg/chromium/net/MimeTypeFilter;->mAcceptAllMimeTypes:Z

    goto :goto_1

    .line 45
    :cond_1
    const-string v2, "/*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 46
    iget-object v2, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeSupertypes:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 47
    :cond_2
    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 48
    iget-object v2, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeTypes:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 50
    .end local v1    # "field":Ljava/lang/String;
    :cond_3
    :goto_1
    goto :goto_0

    .line 52
    :cond_4
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeTypeMap:Landroid/webkit/MimeTypeMap;

    .line 53
    iput-boolean p2, p0, Lorg/chromium/net/MimeTypeFilter;->mAcceptDirectory:Z

    .line 54
    return-void
.end method

.method private static getMimeSupertype(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "mimeType"    # Ljava/lang/String;

    .line 97
    const-string v0, "/"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method private getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "ext"    # Ljava/lang/String;

    .line 91
    iget-object v0, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeTypeMap:Landroid/webkit/MimeTypeMap;

    invoke-virtual {v0, p1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "mimeType":Ljava/lang/String;
    if-eqz v0, :cond_0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method


# virtual methods
.method public accept(Landroid/net/Uri;Ljava/lang/String;)Z
    .locals 3
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "mimeType"    # Ljava/lang/String;

    .line 62
    const/4 v0, 0x1

    if-eqz p1, :cond_1

    .line 63
    nop

    .line 64
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, "fileExtension":Ljava/lang/String;
    iget-object v2, p0, Lorg/chromium/net/MimeTypeFilter;->mExtensions:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 66
    return v0

    .line 68
    :cond_0
    if-nez p2, :cond_1

    .line 69
    invoke-direct {p0, v1}, Lorg/chromium/net/MimeTypeFilter;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 73
    .end local v1    # "fileExtension":Ljava/lang/String;
    :cond_1
    if-eqz p2, :cond_3

    .line 74
    iget-boolean v1, p0, Lorg/chromium/net/MimeTypeFilter;->mAcceptAllMimeTypes:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeTypes:Ljava/util/HashSet;

    invoke-virtual {v1, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/chromium/net/MimeTypeFilter;->mMimeSupertypes:Ljava/util/HashSet;

    .line 75
    invoke-static {p2}, Lorg/chromium/net/MimeTypeFilter;->getMimeSupertype(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 76
    :cond_2
    return v0

    .line 79
    :cond_3
    const/4 v0, 0x0

    return v0
.end method

.method public accept(Ljava/io/File;)Z
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .line 84
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    iget-boolean v0, p0, Lorg/chromium/net/MimeTypeFilter;->mAcceptDirectory:Z

    return v0

    .line 87
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/chromium/net/MimeTypeFilter;->accept(Landroid/net/Uri;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
