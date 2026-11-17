.class Lorg/chromium/base/CommandLine$JavaCommandLine;
.super Lorg/chromium/base/CommandLine;
.source "CommandLine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/CommandLine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JavaCommandLine"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mArgs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mArgsBegin:I

.field private mSwitches:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 262
    const-class v0, Lorg/chromium/base/CommandLine;

    return-void
.end method

.method constructor <init>([Ljava/lang/String;)V
    .locals 3
    .param p1, "args"    # [Ljava/lang/String;

    .line 270
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/chromium/base/CommandLine;-><init>(Lorg/chromium/base/CommandLine-IA;)V

    .line 264
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mSwitches:Ljava/util/HashMap;

    .line 265
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    .line 268
    const/4 v0, 0x1

    iput v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgsBegin:I

    .line 271
    if-eqz p1, :cond_1

    array-length v1, p1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    aget-object v2, p1, v1

    if-nez v2, :cond_0

    goto :goto_0

    .line 274
    :cond_0
    iget-object v2, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    aget-object v1, p1, v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 275
    invoke-direct {p0, p1, v0}, Lorg/chromium/base/CommandLine$JavaCommandLine;->appendSwitchesInternal([Ljava/lang/String;I)V

    goto :goto_1

    .line 272
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    :goto_1
    iget-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 279
    return-void

    .line 278
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method private appendSwitchesInternal([Ljava/lang/String;I)V
    .locals 9
    .param p1, "array"    # [Ljava/lang/String;
    .param p2, "skipCount"    # I

    .line 334
    const/4 v0, 0x1

    .line 335
    .local v0, "parseSwitches":Z
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_4

    aget-object v4, p1, v3

    .line 336
    .local v4, "arg":Ljava/lang/String;
    if-lez p2, :cond_0

    .line 337
    add-int/lit8 p2, p2, -0x1

    .line 338
    goto :goto_2

    .line 341
    :cond_0
    const-string v5, "--"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 342
    const/4 v0, 0x0

    .line 345
    :cond_1
    if-eqz v0, :cond_3

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 346
    const-string v6, "="

    const/4 v7, 0x2

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    .line 347
    .local v6, "parts":[Ljava/lang/String;
    array-length v7, v6

    const/4 v8, 0x1

    if-le v7, v8, :cond_2

    aget-object v7, v6, v8

    goto :goto_1

    :cond_2
    const/4 v7, 0x0

    .line 348
    .local v7, "value":Ljava/lang/String;
    :goto_1
    aget-object v8, v6, v2

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v8, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lorg/chromium/base/CommandLine$JavaCommandLine;->appendSwitchWithValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    .end local v6    # "parts":[Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    goto :goto_2

    .line 350
    :cond_3
    iget-object v5, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    .end local v4    # "arg":Ljava/lang/String;
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 353
    :cond_4
    return-void
.end method


# virtual methods
.method public appendSwitch(Ljava/lang/String;)V
    .locals 1
    .param p1, "switchString"    # Ljava/lang/String;

    .line 306
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/chromium/base/CommandLine$JavaCommandLine;->appendSwitchWithValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    return-void
.end method

.method public appendSwitchWithValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "switchString"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .line 316
    iget-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mSwitches:Ljava/util/HashMap;

    if-nez p2, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    move-object v1, p2

    :goto_0
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "--"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, "combinedSwitchString":Ljava/lang/String;
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 321
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 324
    :cond_1
    iget-object v1, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    iget v2, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgsBegin:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgsBegin:I

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 325
    return-void
.end method

.method public appendSwitchesAndArguments([Ljava/lang/String;)V
    .locals 1
    .param p1, "array"    # [Ljava/lang/String;

    .line 329
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/chromium/base/CommandLine$JavaCommandLine;->appendSwitchesInternal([Ljava/lang/String;I)V

    .line 330
    return-void
.end method

.method protected getCommandLineArguments()[Ljava/lang/String;
    .locals 2

    .line 283
    iget-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getSwitchValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "switchString"    # Ljava/lang/String;

    .line 295
    iget-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mSwitches:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 296
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x0

    :goto_1
    return-object v1
.end method

.method public getSwitches()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 301
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mSwitches:Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public hasSwitch(Ljava/lang/String;)Z
    .locals 1
    .param p1, "switchString"    # Ljava/lang/String;

    .line 288
    iget-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mSwitches:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeSwitch(Ljava/lang/String;)V
    .locals 5
    .param p1, "switchString"    # Ljava/lang/String;

    .line 357
    iget-object v0, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mSwitches:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "--"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 362
    .local v0, "combinedSwitchString":Ljava/lang/String;
    iget v1, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgsBegin:I

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-lez v1, :cond_2

    .line 363
    iget-object v2, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    .line 364
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 365
    :cond_0
    iget v2, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgsBegin:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgsBegin:I

    .line 366
    iget-object v2, p0, Lorg/chromium/base/CommandLine$JavaCommandLine;->mArgs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 362
    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 369
    .end local v1    # "i":I
    :cond_2
    return-void
.end method
