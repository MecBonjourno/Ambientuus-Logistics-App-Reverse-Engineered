.class public Lorg/chromium/base/ObserverList;
.super Ljava/lang/Object;
.source "ObserverList.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/ObserverList$ObserverListIterator;,
        Lorg/chromium/base/ObserverList$RewindableIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "TE;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mCount:I

.field private mEnableThreadAsserts:Z

.field private mIterationDepth:I

.field private mNeedsCompact:Z

.field public final mObservers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TE;>;"
        }
    .end annotation
.end field

.field private final mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;


# direct methods
.method static bridge synthetic -$$Nest$fgetmEnableThreadAsserts(Lorg/chromium/base/ObserverList;)Z
    .locals 0

    iget-boolean p0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    return p0
.end method

.method static bridge synthetic -$$Nest$fgetmThreadChecker(Lorg/chromium/base/ObserverList;)Lorg/chromium/base/ThreadUtils$ThreadChecker;
    .locals 0

    iget-object p0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mcapacity(Lorg/chromium/base/ObserverList;)I
    .locals 0

    invoke-direct {p0}, Lorg/chromium/base/ObserverList;->capacity()I

    move-result p0

    return p0
.end method

.method static bridge synthetic -$$Nest$mdecrementIterationDepthAndCompactIfNeeded(Lorg/chromium/base/ObserverList;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/base/ObserverList;->decrementIterationDepthAndCompactIfNeeded()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetObserverAt(Lorg/chromium/base/ObserverList;I)Ljava/lang/Object;
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/base/ObserverList;->getObserverAt(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mincrementIterationDepth(Lorg/chromium/base/ObserverList;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/base/ObserverList;->incrementIterationDepth()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 0

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 53
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    .line 54
    new-instance v0, Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-direct {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    .line 55
    return-void
.end method

.method private capacity()I
    .locals 1

    .line 212
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method private compact()V
    .locals 2

    .line 186
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    if-nez v0, :cond_2

    .line 187
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 188
    iget-object v1, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 189
    iget-object v1, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 187
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 192
    .end local v0    # "i":I
    :cond_1
    return-void

    .line 186
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private decrementIterationDepthAndCompactIfNeeded()V
    .locals 1

    .line 199
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    .line 200
    iget v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    if-ltz v0, :cond_2

    .line 201
    iget v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    if-lez v0, :cond_0

    return-void

    .line 202
    :cond_0
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mNeedsCompact:Z

    if-nez v0, :cond_1

    return-void

    .line 203
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/base/ObserverList;->mNeedsCompact:Z

    .line 204
    invoke-direct {p0}, Lorg/chromium/base/ObserverList;->compact()V

    .line 205
    return-void

    .line 200
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private getObserverAt(I)Ljava/lang/Object;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 216
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private incrementIterationDepth()V
    .locals 1

    .line 195
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    .line 196
    return-void
.end method


# virtual methods
.method public addObserver(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 74
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    .local p1, "obs":Ljava/lang/Object;, "TE;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 77
    :cond_0
    if-eqz p1, :cond_3

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 83
    :cond_1
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    .line 84
    .local v0, "result":Z
    if-eqz v0, :cond_2

    .line 86
    iget v1, p0, Lorg/chromium/base/ObserverList;->mCount:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lorg/chromium/base/ObserverList;->mCount:I

    .line 87
    return v2

    .line 84
    :cond_2
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 78
    .end local v0    # "result":Z
    :cond_3
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public clear()V
    .locals 4

    .line 127
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 129
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lorg/chromium/base/ObserverList;->mCount:I

    .line 131
    iget v1, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    if-nez v1, :cond_1

    .line 132
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 133
    return-void

    .line 136
    :cond_1
    iget-object v1, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 137
    .local v1, "size":I
    iget-boolean v2, p0, Lorg/chromium/base/ObserverList;->mNeedsCompact:Z

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    :cond_2
    or-int/2addr v0, v2

    iput-boolean v0, p0, Lorg/chromium/base/ObserverList;->mNeedsCompact:Z

    .line 138
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_3

    .line 139
    iget-object v2, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v0, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 138
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 141
    .end local v0    # "i":I
    :cond_3
    return-void
.end method

.method public disableThreadAsserts()V
    .locals 1

    .line 62
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    .line 63
    return-void
.end method

.method public hasObserver(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 121
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    .local p1, "obs":Ljava/lang/Object;, "TE;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 123
    :cond_0
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 175
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 177
    :cond_0
    iget v0, p0, Lorg/chromium/base/ObserverList;->mCount:I

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 145
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 147
    :cond_0
    new-instance v0, Lorg/chromium/base/ObserverList$ObserverListIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/chromium/base/ObserverList$ObserverListIterator;-><init>(Lorg/chromium/base/ObserverList;Lorg/chromium/base/ObserverList-IA;)V

    return-object v0
.end method

.method public removeObserver(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 96
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    .local p1, "obs":Ljava/lang/Object;, "TE;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 98
    :cond_0
    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 99
    return v0

    .line 102
    :cond_1
    iget-object v1, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 103
    .local v1, "index":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 104
    return v0

    .line 107
    :cond_2
    iget v0, p0, Lorg/chromium/base/ObserverList;->mIterationDepth:I

    const/4 v2, 0x1

    if-nez v0, :cond_3

    .line 109
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    .line 111
    :cond_3
    iput-boolean v2, p0, Lorg/chromium/base/ObserverList;->mNeedsCompact:Z

    .line 112
    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mObservers:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 114
    :goto_0
    iget v0, p0, Lorg/chromium/base/ObserverList;->mCount:I

    sub-int/2addr v0, v2

    iput v0, p0, Lorg/chromium/base/ObserverList;->mCount:I

    .line 115
    iget v0, p0, Lorg/chromium/base/ObserverList;->mCount:I

    if-ltz v0, :cond_4

    .line 117
    return v2

    .line 115
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public rewindableIterator()Lorg/chromium/base/ObserverList$RewindableIterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/chromium/base/ObserverList$RewindableIterator<",
            "TE;>;"
        }
    .end annotation

    .line 156
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 158
    :cond_0
    new-instance v0, Lorg/chromium/base/ObserverList$ObserverListIterator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/chromium/base/ObserverList$ObserverListIterator;-><init>(Lorg/chromium/base/ObserverList;Lorg/chromium/base/ObserverList-IA;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .line 166
    .local p0, "this":Lorg/chromium/base/ObserverList;, "Lorg/chromium/base/ObserverList<TE;>;"
    iget-boolean v0, p0, Lorg/chromium/base/ObserverList;->mEnableThreadAsserts:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/chromium/base/ObserverList;->mThreadChecker:Lorg/chromium/base/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lorg/chromium/base/ThreadUtils$ThreadChecker;->assertOnValidThread()V

    .line 168
    :cond_0
    iget v0, p0, Lorg/chromium/base/ObserverList;->mCount:I

    return v0
.end method
