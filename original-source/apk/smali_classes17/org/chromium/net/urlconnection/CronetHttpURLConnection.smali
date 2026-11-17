.class public Lorg/chromium/net/urlconnection/CronetHttpURLConnection;
.super Ljava/net/HttpURLConnection;
.source "CronetHttpURLConnection.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;
    }
.end annotation


# static fields
.field private static final CONTENT_LENGTH:Ljava/lang/String; = "Content-Length"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mCronetEngine:Lorg/chromium/net/CronetEngine;

.field private mException:Ljava/io/IOException;

.field private mHasResponseHeadersOrCompleted:Z

.field private mInputStream:Lorg/chromium/net/urlconnection/CronetInputStream;

.field private final mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

.field private mOnRedirectCalled:Z

.field private mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

.field private mRequest:Lorg/chromium/net/UrlRequest;

.field private final mRequestHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mResponseHeadersList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mResponseHeadersMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

.field private mTrafficStatsTag:I

.field private mTrafficStatsTagSet:Z

.field private mTrafficStatsUid:I

.field private mTrafficStatsUidSet:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetmInputStream(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/CronetInputStream;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mInputStream:Lorg/chromium/net/urlconnection/CronetInputStream;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmMessageLoop(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/MessageLoop;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmOutputStream(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/urlconnection/CronetOutputStream;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetmRequest(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Lorg/chromium/net/UrlRequest;
    .locals 0

    iget-object p0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequest:Lorg/chromium/net/UrlRequest;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputmException(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Ljava/io/IOException;)V
    .locals 0

    iput-object p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mException:Ljava/io/IOException;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmHasResponseHeadersOrCompleted(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mHasResponseHeadersOrCompleted:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmOnRedirectCalled(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOnRedirectCalled:Z

    return-void
.end method

.method static bridge synthetic -$$Nest$fputmResponseInfo(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Lorg/chromium/net/UrlResponseInfo;)V
    .locals 0

    iput-object p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 41
    const-class v0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lorg/chromium/net/CronetEngine;)V
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "cronetEngine"    # Lorg/chromium/net/CronetEngine;

    .line 63
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 64
    iput-object p2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    .line 65
    new-instance v0, Lorg/chromium/net/urlconnection/MessageLoop;

    invoke-direct {v0}, Lorg/chromium/net/urlconnection/MessageLoop;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    .line 66
    new-instance v0, Lorg/chromium/net/urlconnection/CronetInputStream;

    invoke-direct {v0, p0}, Lorg/chromium/net/urlconnection/CronetInputStream;-><init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)V

    iput-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mInputStream:Lorg/chromium/net/urlconnection/CronetInputStream;

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    .line 68
    return-void
.end method

.method static synthetic access$000(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Ljava/net/URL;
    .locals 1
    .param p0, "x0"    # Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    .line 40
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->url:Ljava/net/URL;

    return-object v0
.end method

.method static synthetic access$100(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Z
    .locals 1
    .param p0, "x0"    # Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    .line 40
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->instanceFollowRedirects:Z

    return v0
.end method

.method static synthetic access$202(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;Ljava/net/URL;)Ljava/net/URL;
    .locals 0
    .param p0, "x0"    # Lorg/chromium/net/urlconnection/CronetHttpURLConnection;
    .param p1, "x1"    # Ljava/net/URL;

    .line 40
    iput-object p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->url:Ljava/net/URL;

    return-object p1
.end method

.method static synthetic access$300(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)Z
    .locals 1
    .param p0, "x0"    # Lorg/chromium/net/urlconnection/CronetHttpURLConnection;

    .line 40
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->instanceFollowRedirects:Z

    return v0
.end method

.method private checkHasResponseHeaders()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 635
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mHasResponseHeadersOrCompleted:Z

    if-eqz v0, :cond_2

    .line 636
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mException:Ljava/io/IOException;

    if-nez v0, :cond_1

    .line 638
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

    if-eqz v0, :cond_0

    .line 642
    return-void

    .line 639
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Response info is null when there is no exception."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 637
    :cond_1
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mException:Ljava/io/IOException;

    throw v0

    .line 635
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No response."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkTrafficStatsTag()Z
    .locals 3

    .line 308
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsTagSet:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 309
    return v1

    .line 312
    :cond_0
    invoke-static {}, Landroid/net/TrafficStats;->getThreadStatsTag()I

    move-result v0

    .line 313
    .local v0, "tag":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 314
    iput v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsTag:I

    .line 315
    iput-boolean v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsTagSet:Z

    .line 318
    :cond_1
    iget-boolean v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsTagSet:Z

    return v1
.end method

.method private checkTrafficStatsUid()Z
    .locals 3

    .line 322
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsUidSet:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 323
    return v1

    .line 327
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-ge v0, v2, :cond_1

    .line 328
    const/4 v0, 0x0

    return v0

    .line 331
    :cond_1
    invoke-static {}, Landroid/net/TrafficStats;->getThreadStatsUid()I

    move-result v0

    .line 332
    .local v0, "uid":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    .line 333
    iput v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsUid:I

    .line 334
    iput-boolean v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsUidSet:Z

    .line 337
    :cond_2
    iget-boolean v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsUidSet:Z

    return v1
.end method

.method private findRequestProperty(Ljava/lang/String;)I
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .line 517
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 518
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 519
    .local v1, "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 520
    return v0

    .line 517
    .end local v1    # "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 523
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private getAllHeaders()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 670
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 671
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersMap:Ljava/util/Map;

    return-object v0

    .line 673
    :cond_0
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 674
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getAllHeadersAsList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 675
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 676
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 677
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 679
    :cond_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 680
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v3}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0

    .line 682
    :cond_2
    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersMap:Ljava/util/Map;

    .line 683
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersMap:Ljava/util/Map;

    return-object v1
.end method

.method private getAllHeadersAsList()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 687
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersList:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 688
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersList:Ljava/util/List;

    return-object v0

    .line 690
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersList:Ljava/util/List;

    .line 691
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

    invoke-virtual {v0}, Lorg/chromium/net/UrlResponseInfo;->getAllHeadersAsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 693
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "Content-Encoding"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 694
    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersList:Ljava/util/List;

    new-instance v3, Ljava/util/AbstractMap$SimpleImmutableEntry;

    invoke-direct {v3, v1}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/util/Map$Entry;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 697
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    goto :goto_0

    .line 698
    :cond_2
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersList:Ljava/util/List;

    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersList:Ljava/util/List;

    .line 699
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseHeadersList:Ljava/util/List;

    return-object v0
.end method

.method private getHeaderFieldEntry(I)Ljava/util/Map$Entry;
    .locals 3
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 649
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getResponse()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 652
    nop

    .line 653
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getAllHeadersAsList()Ljava/util/List;

    move-result-object v1

    .line 654
    .local v1, "headers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    .line 655
    return-object v0

    .line 657
    :cond_0
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    return-object v0

    .line 650
    .end local v1    # "headers":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    :catch_0
    move-exception v1

    .line 651
    .local v1, "e":Ljava/io/IOException;
    return-object v0
.end method

.method private getResponse()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 614
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    if-eqz v0, :cond_0

    .line 615
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    invoke-virtual {v0}, Lorg/chromium/net/urlconnection/CronetOutputStream;->checkReceivedEnoughContent()V

    .line 616
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->isChunkedUpload()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 618
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    invoke-virtual {v0}, Lorg/chromium/net/urlconnection/CronetOutputStream;->close()V

    .line 621
    :cond_0
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mHasResponseHeadersOrCompleted:Z

    if-nez v0, :cond_1

    .line 622
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->startRequest()V

    .line 624
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    invoke-virtual {v0}, Lorg/chromium/net/urlconnection/MessageLoop;->loop()V

    .line 626
    :cond_1
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->checkHasResponseHeaders()V

    .line 627
    return-void
.end method

.method private getStreamingModeContentLength()J
    .locals 6

    .line 243
    iget v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->fixedContentLength:I

    int-to-long v0, v0

    .line 244
    .local v0, "contentLength":J
    iget-wide v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->fixedContentLengthLong:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 245
    iget-wide v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->fixedContentLengthLong:J

    .line 248
    :cond_0
    return-wide v0
.end method

.method private isChunkedUpload()Z
    .locals 1

    .line 665
    iget v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->chunkLength:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private final setRequestPropertyInternal(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "overwrite"    # Z

    .line 375
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    if-nez v0, :cond_2

    .line 379
    invoke-direct {p0, p1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->findRequestProperty(Ljava/lang/String;)I

    move-result v0

    .line 380
    .local v0, "index":I
    if-ltz v0, :cond_1

    .line 381
    if-eqz p3, :cond_0

    .line 382
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 386
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot add multiple headers of the same key, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". crbug.com/432719."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 392
    :cond_1
    :goto_0
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 393
    return-void

    .line 376
    .end local v0    # "index":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot modify request property after connection is made."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private startRequest()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 255
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    if-eqz v0, :cond_0

    .line 256
    return-void

    .line 258
    :cond_0
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mCronetEngine:Lorg/chromium/net/CronetEngine;

    .line 260
    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;

    invoke-direct {v2, p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection$CronetUrlRequestCallback;-><init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)V

    iget-object v3, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    .line 259
    invoke-virtual {v0, v1, v2, v3}, Lorg/chromium/net/CronetEngine;->newUrlRequestBuilder(Ljava/lang/String;Lorg/chromium/net/UrlRequest$Callback;Ljava/util/concurrent/Executor;)Lorg/chromium/net/UrlRequest$Builder;

    move-result-object v0

    check-cast v0, Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    .line 261
    .local v0, "requestBuilder":Lorg/chromium/net/ExperimentalUrlRequest$Builder;
    iget-boolean v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->doOutput:Z

    if-eqz v1, :cond_5

    .line 262
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->method:Ljava/lang/String;

    const-string v2, "GET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 263
    const-string v1, "POST"

    iput-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->method:Ljava/lang/String;

    .line 265
    :cond_1
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    const-string v2, "Content-Length"

    if-eqz v1, :cond_3

    .line 266
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    .line 267
    invoke-virtual {v1}, Lorg/chromium/net/urlconnection/CronetOutputStream;->getUploadDataProvider()Lorg/chromium/net/UploadDataProvider;

    move-result-object v1

    iget-object v3, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    .line 266
    invoke-virtual {v0, v1, v3}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;->setUploadDataProvider(Lorg/chromium/net/UploadDataProvider;Ljava/util/concurrent/Executor;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    .line 268
    invoke-virtual {p0, v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->isChunkedUpload()Z

    move-result v1

    if-nez v1, :cond_2

    .line 269
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    .line 270
    invoke-virtual {v1}, Lorg/chromium/net/urlconnection/CronetOutputStream;->getUploadDataProvider()Lorg/chromium/net/UploadDataProvider;

    move-result-object v1

    invoke-virtual {v1}, Lorg/chromium/net/UploadDataProvider;->getLength()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    .line 269
    invoke-virtual {p0, v2, v1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    :cond_2
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    invoke-virtual {v1}, Lorg/chromium/net/urlconnection/CronetOutputStream;->setConnected()V

    goto :goto_0

    .line 276
    :cond_3
    invoke-virtual {p0, v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    .line 277
    const-string v1, "0"

    invoke-virtual {p0, v2, v1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    :cond_4
    :goto_0
    const-string v1, "Content-Type"

    invoke-virtual {p0, v1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5

    .line 282
    const-string v2, "application/x-www-form-urlencoded"

    invoke-virtual {p0, v1, v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    :cond_5
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 287
    .local v2, "requestHeader":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v4, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    .line 288
    .end local v2    # "requestHeader":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    goto :goto_1

    .line 289
    :cond_6
    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getUseCaches()Z

    move-result v1

    if-nez v1, :cond_7

    .line 290
    invoke-virtual {v0}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;->disableCache()Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    .line 293
    :cond_7
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;->setHttpMethod(Ljava/lang/String;)Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    .line 294
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->checkTrafficStatsTag()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 295
    iget v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsTag:I

    invoke-virtual {v0, v1}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;->setTrafficStatsTag(I)Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    .line 297
    :cond_8
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->checkTrafficStatsUid()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 298
    iget v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsUid:I

    invoke-virtual {v0, v1}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;->setTrafficStatsUid(I)Lorg/chromium/net/ExperimentalUrlRequest$Builder;

    .line 301
    :cond_9
    invoke-virtual {v0}, Lorg/chromium/net/ExperimentalUrlRequest$Builder;->build()Lorg/chromium/net/ExperimentalUrlRequest;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequest:Lorg/chromium/net/UrlRequest;

    .line 303
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequest:Lorg/chromium/net/UrlRequest;

    invoke-virtual {v1}, Lorg/chromium/net/UrlRequest;->start()V

    .line 304
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    .line 305
    return-void
.end method


# virtual methods
.method public final addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 362
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->setRequestPropertyInternal(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 363
    return-void
.end method

.method public connect()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 80
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->startRequest()V

    .line 81
    return-void
.end method

.method public disconnect()V
    .locals 1

    .line 90
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequest:Lorg/chromium/net/UrlRequest;

    invoke-virtual {v0}, Lorg/chromium/net/UrlRequest;->cancel()V

    .line 93
    :cond_0
    return-void
.end method

.method public getErrorStream()Ljava/io/InputStream;
    .locals 3

    .line 347
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getResponse()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    nop

    .line 351
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

    invoke-virtual {v1}, Lorg/chromium/net/UrlResponseInfo;->getHttpStatusCode()I

    move-result v1

    const/16 v2, 0x190

    if-lt v1, v2, :cond_0

    .line 352
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mInputStream:Lorg/chromium/net/urlconnection/CronetInputStream;

    return-object v0

    .line 354
    :cond_0
    return-object v0

    .line 348
    :catch_0
    move-exception v1

    .line 349
    .local v1, "e":Ljava/io/IOException;
    return-object v0
.end method

.method public final getHeaderField(I)Ljava/lang/String;
    .locals 2
    .param p1, "pos"    # I

    .line 165
    invoke-direct {p0, p1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getHeaderFieldEntry(I)Ljava/util/Map$Entry;

    move-result-object v0

    .line 166
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 167
    const/4 v1, 0x0

    return-object v1

    .line 169
    :cond_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1
.end method

.method public final getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "fieldName"    # Ljava/lang/String;

    .line 134
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getResponse()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    nop

    .line 138
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getAllHeaders()Ljava/util/Map;

    move-result-object v1

    .line 139
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 140
    return-object v0

    .line 142
    :cond_0
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 143
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    return-object v2

    .line 135
    .end local v0    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :catch_0
    move-exception v1

    .line 136
    .local v1, "e":Ljava/io/IOException;
    return-object v0
.end method

.method public final getHeaderFieldKey(I)Ljava/lang/String;
    .locals 2
    .param p1, "pos"    # I

    .line 152
    invoke-direct {p0, p1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getHeaderFieldEntry(I)Ljava/util/Map$Entry;

    move-result-object v0

    .line 153
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 154
    const/4 v1, 0x0

    return-object v1

    .line 156
    :cond_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    return-object v1
.end method

.method public getHeaderFields()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 119
    :try_start_0
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getResponse()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    nop

    .line 123
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getAllHeaders()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getResponse()V

    .line 184
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->instanceFollowRedirects:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOnRedirectCalled:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 185
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cannot read response body of a redirect."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

    invoke-virtual {v0}, Lorg/chromium/net/UrlResponseInfo;->getHttpStatusCode()I

    move-result v0

    const/16 v1, 0x190

    if-ge v0, v1, :cond_2

    .line 192
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mInputStream:Lorg/chromium/net/urlconnection/CronetInputStream;

    return-object v0

    .line 190
    :cond_2
    new-instance v0, Ljava/io/FileNotFoundException;

    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getMoreData(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 460
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequest:Lorg/chromium/net/UrlRequest;

    invoke-virtual {v0, p1}, Lorg/chromium/net/UrlRequest;->read(Ljava/nio/ByteBuffer;)V

    .line 461
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    invoke-virtual {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getReadTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/chromium/net/urlconnection/MessageLoop;->loop(I)V

    .line 462
    return-void
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 201
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->doOutput:Z

    if-eqz v0, :cond_4

    .line 202
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    if-nez v0, :cond_3

    .line 206
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->isChunkedUpload()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    new-instance v0, Lorg/chromium/net/urlconnection/CronetChunkedOutputStream;

    iget v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->chunkLength:I

    iget-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    invoke-direct {v0, p0, v1, v2}, Lorg/chromium/net/urlconnection/CronetChunkedOutputStream;-><init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;ILorg/chromium/net/urlconnection/MessageLoop;)V

    iput-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    .line 209
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->startRequest()V

    goto :goto_0

    .line 211
    :cond_0
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getStreamingModeContentLength()J

    move-result-wide v0

    .line 212
    .local v0, "fixedStreamingModeContentLength":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    .line 213
    new-instance v2, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;

    iget-object v3, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mMessageLoop:Lorg/chromium/net/urlconnection/MessageLoop;

    invoke-direct {v2, p0, v0, v1, v3}, Lorg/chromium/net/urlconnection/CronetFixedModeOutputStream;-><init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;JLorg/chromium/net/urlconnection/MessageLoop;)V

    iput-object v2, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    .line 216
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->startRequest()V

    goto :goto_0

    .line 221
    :cond_1
    sget-object v2, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->TAG:Ljava/lang/String;

    const-string v3, "Outputstream is being buffered in memory."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 222
    const-string v2, "Content-Length"

    invoke-virtual {p0, v2}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 223
    .local v2, "length":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 224
    new-instance v3, Lorg/chromium/net/urlconnection/CronetBufferedOutputStream;

    invoke-direct {v3, p0}, Lorg/chromium/net/urlconnection/CronetBufferedOutputStream;-><init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;)V

    iput-object v3, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    goto :goto_0

    .line 226
    :cond_2
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 227
    .local v3, "lengthParsed":J
    new-instance v5, Lorg/chromium/net/urlconnection/CronetBufferedOutputStream;

    invoke-direct {v5, p0, v3, v4}, Lorg/chromium/net/urlconnection/CronetBufferedOutputStream;-><init>(Lorg/chromium/net/urlconnection/CronetHttpURLConnection;J)V

    iput-object v5, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    goto :goto_0

    .line 203
    .end local v0    # "fixedStreamingModeContentLength":J
    .end local v2    # "length":Ljava/lang/String;
    .end local v3    # "lengthParsed":J
    :cond_3
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Cannot write to OutputStream after receiving response."

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 232
    :cond_4
    :goto_0
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mOutputStream:Lorg/chromium/net/urlconnection/CronetOutputStream;

    return-object v0
.end method

.method public getRequestProperties()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 401
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    if-nez v0, :cond_2

    .line 405
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 407
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 408
    .local v2, "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 413
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 414
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    iget-object v4, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-static {v3}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .end local v2    # "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0

    .line 410
    .restart local v2    # "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v3, "Should not have multiple values."

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 418
    .end local v2    # "entry":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    return-object v1

    .line 402
    .end local v0    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot access request headers after connection is set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRequestProperty(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .line 427
    invoke-direct {p0, p1}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->findRequestProperty(Ljava/lang/String;)I

    move-result v0

    .line 428
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 429
    iget-object v1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mRequestHeaders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    return-object v1

    .line 431
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getResponseCode()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getResponse()V

    .line 110
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

    invoke-virtual {v0}, Lorg/chromium/net/UrlResponseInfo;->getHttpStatusCode()I

    move-result v0

    return v0
.end method

.method public getResponseMessage()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    invoke-direct {p0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->getResponse()V

    .line 101
    iget-object v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mResponseInfo:Lorg/chromium/net/UrlResponseInfo;

    invoke-virtual {v0}, Lorg/chromium/net/UrlResponseInfo;->getHttpStatusText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setConnectTimeout(I)V
    .locals 2
    .param p1, "timeout"    # I

    .line 449
    sget-object v0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->TAG:Ljava/lang/String;

    const-string v1, "setConnectTimeout is not supported by CronetHttpURLConnection"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    return-void
.end method

.method public final setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 370
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->setRequestPropertyInternal(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 371
    return-void
.end method

.method public setTrafficStatsTag(I)V
    .locals 2
    .param p1, "tag"    # I

    .line 481
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    if-nez v0, :cond_0

    .line 485
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsTagSet:Z

    .line 486
    iput p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsTag:I

    .line 487
    return-void

    .line 482
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot modify traffic stats tag after connection is made."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setTrafficStatsUid(I)V
    .locals 2
    .param p1, "uid"    # I

    .line 504
    iget-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->connected:Z

    if-nez v0, :cond_0

    .line 508
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsUidSet:Z

    .line 509
    iput p1, p0, Lorg/chromium/net/urlconnection/CronetHttpURLConnection;->mTrafficStatsUid:I

    .line 510
    return-void

    .line 505
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot modify traffic stats UID after connection is made."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public usingProxy()Z
    .locals 1

    .line 440
    const/4 v0, 0x0

    return v0
.end method
