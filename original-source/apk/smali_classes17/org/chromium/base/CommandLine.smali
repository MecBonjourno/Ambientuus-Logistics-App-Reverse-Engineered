.class public abstract Lorg/chromium/base/CommandLine;
.super Ljava/lang/Object;
.source "CommandLine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/CommandLine$JavaCommandLine;,
        Lorg/chromium/base/CommandLine$NativeCommandLine;,
        Lorg/chromium/base/CommandLine$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final SWITCH_PREFIX:Ljava/lang/String; = "--"

.field private static final SWITCH_TERMINATOR:Ljava/lang/String; = "--"

.field private static final SWITCH_VALUE_SEPARATOR:Ljava/lang/String; = "="

.field private static final TAG:Ljava/lang/String; = "CommandLine"

.field private static final sCommandLine:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/chromium/base/CommandLine;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    nop

    .line 115
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lorg/chromium/base/CommandLine;->sCommandLine:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 260
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/base/CommandLine-IA;)V
    .locals 0

    invoke-direct {p0}, Lorg/chromium/base/CommandLine;-><init>()V

    return-void
.end method

.method public static enableNativeProxy()V
    .locals 3

    .line 225
    sget-object v0, Lorg/chromium/base/CommandLine;->sCommandLine:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Lorg/chromium/base/CommandLine$NativeCommandLine;

    invoke-static {}, Lorg/chromium/base/CommandLine;->getJavaSwitchesOrNull()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/chromium/base/CommandLine$NativeCommandLine;-><init>([Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 226
    return-void
.end method

.method public static getInstance()Lorg/chromium/base/CommandLine;
    .locals 2

    .line 127
    sget-object v0, Lorg/chromium/base/CommandLine;->sCommandLine:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/CommandLine;

    .line 128
    .local v0, "commandLine":Lorg/chromium/base/CommandLine;
    if-eqz v0, :cond_0

    .line 129
    return-object v0

    .line 128
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public static getJavaSwitchesOrNull()[Ljava/lang/String;
    .locals 2

    .line 230
    sget-object v0, Lorg/chromium/base/CommandLine;->sCommandLine:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/CommandLine;

    .line 231
    .local v0, "commandLine":Lorg/chromium/base/CommandLine;
    if-eqz v0, :cond_0

    .line 232
    invoke-virtual {v0}, Lorg/chromium/base/CommandLine;->getCommandLineArguments()[Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 234
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public static init([Ljava/lang/String;)V
    .locals 1
    .param p0, "args"    # [Ljava/lang/String;

    .line 138
    new-instance v0, Lorg/chromium/base/CommandLine$JavaCommandLine;

    invoke-direct {v0, p0}, Lorg/chromium/base/CommandLine$JavaCommandLine;-><init>([Ljava/lang/String;)V

    invoke-static {v0}, Lorg/chromium/base/CommandLine;->setInstance(Lorg/chromium/base/CommandLine;)V

    .line 139
    return-void
.end method

.method public static initFromFile(Ljava/lang/String;)V
    .locals 5
    .param p0, "file"    # Ljava/lang/String;

    .line 147
    invoke-static {p0}, Lorg/chromium/base/CommandLine;->readFileAsUtf8(Ljava/lang/String;)[C

    move-result-object v0

    .line 148
    .local v0, "buffer":[C
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-static {v0}, Lorg/chromium/base/CommandLine;->tokenizeQuotedArguments([C)[Ljava/lang/String;

    move-result-object v1

    .line 149
    .local v1, "tokenized":[Ljava/lang/String;
    :goto_0
    invoke-static {v1}, Lorg/chromium/base/CommandLine;->init([Ljava/lang/String;)V

    .line 152
    if-eqz v1, :cond_1

    .line 153
    const-string v2, "COMMAND-LINE FLAGS: %s (from %s)"

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "CommandLine"

    invoke-static {v4, v2, v3, p0}, Lorg/chromium/base/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 155
    :cond_1
    return-void
.end method

.method public static isInitialized()Z
    .locals 1

    .line 122
    sget-object v0, Lorg/chromium/base/CommandLine;->sCommandLine:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static readFileAsUtf8(Ljava/lang/String;)[C
    .locals 5
    .param p0, "fileName"    # Ljava/lang/String;

    .line 249
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 250
    .local v0, "f":Ljava/io/File;
    :try_start_0
    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    .local v1, "reader":Ljava/io/FileReader;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v2, v2, [C

    .line 252
    .local v2, "buffer":[C
    invoke-virtual {v1, v2}, Ljava/io/FileReader;->read([C)I

    move-result v3

    .line 254
    .local v3, "charsRead":I
    const/4 v4, 0x0

    invoke-static {v2, v4, v3}, Ljava/util/Arrays;->copyOfRange([CII)[C

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 255
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 254
    return-object v4

    .line 250
    .end local v2    # "buffer":[C
    .end local v3    # "charsRead":I
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "f":Ljava/io/File;
    .end local p0    # "fileName":Ljava/lang/String;
    :goto_0
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 255
    .end local v1    # "reader":Ljava/io/FileReader;
    .restart local v0    # "f":Ljava/io/File;
    .restart local p0    # "fileName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 256
    .local v1, "e":Ljava/io/IOException;
    const/4 v2, 0x0

    return-object v2
.end method

.method static resetForTesting()V
    .locals 1

    .line 162
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/chromium/base/CommandLine;->setInstance(Lorg/chromium/base/CommandLine;)V

    .line 163
    return-void
.end method

.method private static setInstance(Lorg/chromium/base/CommandLine;)V
    .locals 1
    .param p0, "commandLine"    # Lorg/chromium/base/CommandLine;

    .line 238
    sget-object v0, Lorg/chromium/base/CommandLine;->sCommandLine:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/CommandLine;

    .line 239
    .local v0, "oldCommandLine":Lorg/chromium/base/CommandLine;
    if-eqz v0, :cond_0

    .line 240
    invoke-virtual {v0}, Lorg/chromium/base/CommandLine;->destroy()V

    .line 242
    :cond_0
    return-void
.end method

.method static tokenizeQuotedArguments([C)[Ljava/lang/String;
    .locals 12
    .param p0, "buffer"    # [C

    .line 176
    array-length v0, p0

    const v1, 0x18000

    if-gt v0, v1, :cond_b

    .line 181
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 182
    .local v0, "args":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 183
    .local v1, "arg":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 184
    .local v2, "noQuote":C
    const/16 v3, 0x27

    .line 185
    .local v3, "singleQuote":C
    const/16 v4, 0x22

    .line 186
    .local v4, "doubleQuote":C
    const/4 v5, 0x0

    .line 187
    .local v5, "currentQuote":C
    array-length v6, p0

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    if-ge v8, v6, :cond_8

    aget-char v9, p0, v8

    .line 189
    .local v9, "c":C
    if-nez v5, :cond_0

    const/16 v10, 0x27

    if-eq v9, v10, :cond_1

    const/16 v10, 0x22

    if-eq v9, v10, :cond_1

    :cond_0
    if-ne v9, v5, :cond_4

    .line 191
    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    if-lez v10, :cond_2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v10

    const/16 v11, 0x5c

    if-ne v10, v11, :cond_2

    .line 193
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {v1, v10, v9}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_2

    .line 195
    :cond_2
    if-nez v5, :cond_3

    move v10, v9

    goto :goto_1

    :cond_3
    move v10, v7

    :goto_1
    move v5, v10

    .end local v5    # "currentQuote":C
    .local v10, "currentQuote":C
    goto :goto_2

    .line 197
    .end local v10    # "currentQuote":C
    .restart local v5    # "currentQuote":C
    :cond_4
    if-nez v5, :cond_5

    invoke-static {v9}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 198
    if-eqz v1, :cond_7

    .line 199
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    const/4 v1, 0x0

    goto :goto_2

    .line 203
    :cond_5
    if-nez v1, :cond_6

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move-object v1, v10

    .line 204
    :cond_6
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 187
    .end local v9    # "c":C
    :cond_7
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 207
    :cond_8
    if-eqz v1, :cond_a

    .line 208
    if-eqz v5, :cond_9

    .line 209
    const-string v6, "CommandLine"

    const-string v7, "Unterminated quoted string: %s"

    invoke-static {v6, v7, v1}, Lorg/chromium/base/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 211
    :cond_9
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 213
    :cond_a
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    return-object v6

    .line 178
    .end local v0    # "args":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v1    # "arg":Ljava/lang/StringBuilder;
    .end local v2    # "noQuote":C
    .end local v3    # "singleQuote":C
    .end local v4    # "doubleQuote":C
    .end local v5    # "currentQuote":C
    :cond_b
    new-instance v0, Ljava/lang/RuntimeException;

    array-length v1, p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Flags file too big: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public abstract appendSwitch(Ljava/lang/String;)V
.end method

.method public abstract appendSwitchWithValue(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract appendSwitchesAndArguments([Ljava/lang/String;)V
.end method

.method protected destroy()V
    .locals 0

    .line 113
    return-void
.end method

.method protected abstract getCommandLineArguments()[Ljava/lang/String;
.end method

.method public abstract getSwitchValue(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public getSwitchValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "switchString"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .line 55
    invoke-virtual {p0, p1}, Lorg/chromium/base/CommandLine;->getSwitchValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "value":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, p2

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1
.end method

.method public abstract getSwitches()Ljava/util/Map;
.end method

.method public abstract hasSwitch(Ljava/lang/String;)Z
.end method

.method public isNativeImplementation()Z
    .locals 1

    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public abstract removeSwitch(Ljava/lang/String;)V
.end method
