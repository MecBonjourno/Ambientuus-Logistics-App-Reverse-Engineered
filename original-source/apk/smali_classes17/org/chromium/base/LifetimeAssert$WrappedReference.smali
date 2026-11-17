.class Lorg/chromium/base/LifetimeAssert$WrappedReference;
.super Ljava/lang/ref/PhantomReference;
.source "LifetimeAssert.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/LifetimeAssert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WrappedReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/PhantomReference<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static sActiveWrappers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lorg/chromium/base/LifetimeAssert$WrappedReference;",
            ">;"
        }
    .end annotation
.end field

.field private static sReferenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mCreationException:Lorg/chromium/base/LifetimeAssert$CreationException;

.field mSafeToGc:Z

.field final mTargetClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$sfgetsActiveWrappers()Ljava/util/Set;
    .locals 1

    sget-object v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->sActiveWrappers:Ljava/util/Set;

    return-object v0
.end method

.method static bridge synthetic -$$Nest$sfgetsReferenceQueue()Ljava/lang/ref/ReferenceQueue;
    .locals 1

    sget-object v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->sReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    .line 81
    new-instance v0, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v0}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    sput-object v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->sReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 82
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 83
    invoke-static {v0}, Lj$/util/DesugarCollections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->sActiveWrappers:Ljava/util/Set;

    .line 86
    new-instance v0, Lorg/chromium/base/LifetimeAssert$WrappedReference$1;

    const-string v1, "GcStateAssertQueue"

    invoke-direct {v0, v1}, Lorg/chromium/base/LifetimeAssert$WrappedReference$1;-><init>(Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lorg/chromium/base/LifetimeAssert$CreationException;Z)V
    .locals 1
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "creationException"    # Lorg/chromium/base/LifetimeAssert$CreationException;
    .param p3, "safeToGc"    # Z

    .line 74
    sget-object v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->sReferenceQueue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {p0, p1, v0}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 75
    iput-object p2, p0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->mCreationException:Lorg/chromium/base/LifetimeAssert$CreationException;

    .line 76
    iput-boolean p3, p0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->mSafeToGc:Z

    .line 77
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->mTargetClass:Ljava/lang/Class;

    .line 78
    sget-object v0, Lorg/chromium/base/LifetimeAssert$WrappedReference;->sActiveWrappers:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 79
    return-void
.end method
