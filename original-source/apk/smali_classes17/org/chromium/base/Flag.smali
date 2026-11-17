.class public abstract Lorg/chromium/base/Flag;
.super Ljava/lang/Object;
.source "Flag.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static sFlagsCreated:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lorg/chromium/base/Flag;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected final mFeatureName:Ljava/lang/String;

.field protected mValue:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 22
    nop

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/chromium/base/Flag;->sFlagsCreated:Ljava/util/HashMap;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "featureName"    # Ljava/lang/String;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    sget-object v0, Lorg/chromium/base/Flag;->sFlagsCreated:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 32
    iput-object p1, p0, Lorg/chromium/base/Flag;->mFeatureName:Ljava/lang/String;

    .line 33
    sget-object v0, Lorg/chromium/base/Flag;->sFlagsCreated:Ljava/util/HashMap;

    iget-object v1, p0, Lorg/chromium/base/Flag;->mFeatureName:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    return-void

    .line 29
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate flag creation for feature: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static resetAllInMemoryCachedValuesForTesting()V
    .locals 2

    .line 65
    sget-object v0, Lorg/chromium/base/Flag;->sFlagsCreated:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/Flag;

    .line 66
    .local v1, "flag":Lorg/chromium/base/Flag;
    invoke-virtual {v1}, Lorg/chromium/base/Flag;->clearInMemoryCachedValueForTesting()V

    .line 67
    .end local v1    # "flag":Lorg/chromium/base/Flag;
    goto :goto_0

    .line 68
    :cond_0
    return-void
.end method

.method public static resetFlagsForTesting()V
    .locals 1

    .line 56
    invoke-static {}, Lorg/chromium/base/Flag;->resetAllInMemoryCachedValuesForTesting()V

    .line 57
    sget-object v0, Lorg/chromium/base/Flag;->sFlagsCreated:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 58
    return-void
.end method


# virtual methods
.method protected abstract clearInMemoryCachedValueForTesting()V
.end method

.method public getFeatureName()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lorg/chromium/base/Flag;->mFeatureName:Ljava/lang/String;

    return-object v0
.end method

.method public abstract isEnabled()Z
.end method
