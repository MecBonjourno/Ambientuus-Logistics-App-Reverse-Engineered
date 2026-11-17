.class Lorg/chromium/base/CommandLine$NativeCommandLine;
.super Lorg/chromium/base/CommandLine;
.source "CommandLine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/CommandLine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NativeCommandLine"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 372
    const-class v0, Lorg/chromium/base/CommandLine;

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .locals 1
    .param p1, "args"    # [Ljava/lang/String;

    .line 373
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/chromium/base/CommandLine;-><init>(Lorg/chromium/base/CommandLine-IA;)V

    .line 374
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/CommandLine$Natives;->init([Ljava/lang/String;)V

    .line 375
    return-void
.end method


# virtual methods
.method public appendSwitch(Ljava/lang/String;)V
    .locals 1
    .param p1, "switchString"    # Ljava/lang/String;

    .line 406
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/CommandLine$Natives;->appendSwitch(Ljava/lang/String;)V

    .line 407
    return-void
.end method

.method public appendSwitchWithValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "switchString"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 411
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v0

    if-nez p2, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    move-object v1, p2

    :goto_0
    invoke-interface {v0, p1, v1}, Lorg/chromium/base/CommandLine$Natives;->appendSwitchWithValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    return-void
.end method

.method public appendSwitchesAndArguments([Ljava/lang/String;)V
    .locals 1
    .param p1, "array"    # [Ljava/lang/String;

    .line 416
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/CommandLine$Natives;->appendSwitchesAndArguments([Ljava/lang/String;)V

    .line 417
    return-void
.end method

.method protected destroy()V
    .locals 2

    .line 439
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t destroy native command line after startup"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected getCommandLineArguments()[Ljava/lang/String;
    .locals 1

    .line 431
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public getSwitchValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "switchString"    # Ljava/lang/String;

    .line 384
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/CommandLine$Natives;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSwitches()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 389
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 394
    .local v0, "switches":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v1

    invoke-interface {v1}, Lorg/chromium/base/CommandLine$Natives;->getSwitchesFlattened()[Ljava/lang/String;

    move-result-object v1

    .line 395
    .local v1, "keysAndValues":[Ljava/lang/String;
    array-length v2, v1

    rem-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_1

    .line 396
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 397
    aget-object v3, v1, v2

    .line 398
    .local v3, "key":Ljava/lang/String;
    add-int/lit8 v4, v2, 0x1

    aget-object v4, v1, v4

    .line 399
    .local v4, "value":Ljava/lang/String;
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    .line 401
    .end local v2    # "i":I
    :cond_0
    return-object v0

    .line 395
    :cond_1
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "must have same number of keys and values"

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public hasSwitch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "switchString"    # Ljava/lang/String;

    .line 379
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/CommandLine$Natives;->hasSwitch(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isNativeImplementation()Z
    .locals 1

    .line 426
    const/4 v0, 0x1

    return v0
.end method

.method public removeSwitch(Ljava/lang/String;)V
    .locals 1
    .param p1, "switchString"    # Ljava/lang/String;

    .line 421
    invoke-static {}, Lorg/chromium/base/CommandLineJni;->get()Lorg/chromium/base/CommandLine$Natives;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/CommandLine$Natives;->removeSwitch(Ljava/lang/String;)V

    .line 422
    return-void
.end method
