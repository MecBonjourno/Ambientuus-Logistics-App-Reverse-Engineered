.class final Lorg/chromium/net/apihelpers/ContentTypeParametersParser;
.super Ljava/lang/Object;
.source "ContentTypeParametersParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
    }
.end annotation


# static fields
.field private static final TOKEN_ALLOWED_SPECIAL_CHARS:Ljava/lang/String; = "!#$%&\'*+-.^_`|~"


# instance fields
.field private mCurrentPosition:I

.field private final mHeaderValue:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "mHeaderValue"    # Ljava/lang/String;

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    .line 26
    const/16 v0, 0x3b

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 27
    .local v0, "semicolonIndex":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    add-int/lit8 v1, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    :goto_0
    iput v1, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    .line 28
    return-void
.end method

.method private advance()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
        }
    .end annotation

    .line 138
    invoke-virtual {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->hasMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    iget v0, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    .line 143
    return-void

    .line 139
    :cond_0
    new-instance v0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    const-string v1, "End of header reached"

    iget v2, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private currentChar()C
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
        }
    .end annotation

    .line 130
    invoke-virtual {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->hasMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    iget v1, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0

    .line 131
    :cond_0
    new-instance v0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    const-string v1, "End of header reached"

    iget v2, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-direct {v0, v1, v2}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private getNextQuotedString()Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
        }
    .end annotation

    .line 67
    iget v0, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    .line 68
    .local v0, "start":I
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v1

    const-string v2, "]"

    const-string v3, ": ["

    const/16 v4, 0x22

    if-ne v1, v4, :cond_6

    .line 73
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .line 80
    .local v5, "escapeNext":Z
    :goto_0
    invoke-virtual {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->hasMore()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 86
    const-string v6, "Invalid character at "

    if-eqz v5, :cond_1

    .line 87
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v7

    invoke-static {v7}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->isQuotedPairChar(C)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 92
    const/4 v5, 0x0

    .line 93
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    goto :goto_0

    .line 88
    :cond_0
    new-instance v4, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    iget v7, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    iget-object v8, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-direct {v4, v2, v3}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 95
    :cond_1
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v7

    if-ne v7, v4, :cond_2

    .line 96
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 98
    :cond_2
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v7

    const/16 v8, 0x5c

    if-ne v7, v8, :cond_3

    .line 99
    const/4 v5, 0x1

    .line 100
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    goto :goto_0

    .line 102
    :cond_3
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v7

    invoke-static {v7}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->isQdtextChar(C)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 107
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    goto :goto_0

    .line 103
    :cond_4
    new-instance v4, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    iget v7, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    iget-object v8, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-direct {v4, v2, v3}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 81
    :cond_5
    new-instance v4, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    iget-object v6, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unterminated quoted string at "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2, v0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v4

    .line 69
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    .end local v5    # "escapeNext":Z
    :cond_6
    new-instance v1, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    iget v4, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    iget-object v5, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Not a quoted string: expected \" at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-direct {v1, v2, v3}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private getNextToken()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
        }
    .end annotation

    .line 114
    iget v0, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    .line 115
    .local v0, "start":I
    :goto_0
    invoke-virtual {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->hasMore()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v1

    invoke-static {v1}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->isTokenCharacter(C)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 116
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    goto :goto_0

    .line 118
    :cond_0
    iget v1, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    if-eq v0, v1, :cond_1

    .line 122
    iget-object v1, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    iget v2, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 119
    :cond_1
    new-instance v1, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    iget-object v2, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Token not found at position "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v1
.end method

.method private static isAscii(C)Z
    .locals 1
    .param p0, "ch"    # C

    .line 165
    if-ltz p0, :cond_0

    const/16 v0, 0x7f

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isQdtextChar(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 152
    const/16 v0, 0x5c

    if-eq p0, v0, :cond_0

    const/16 v0, 0x22

    if-eq p0, v0, :cond_0

    invoke-static {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->isQuotedPairChar(C)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isQuotedPairChar(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 156
    invoke-static {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->isWhitespace(C)Z

    move-result v0

    if-nez v0, :cond_1

    const/16 v0, 0x21

    if-gt v0, p0, :cond_0

    const/16 v0, 0xff

    if-gt p0, v0, :cond_0

    const/16 v0, 0x7f

    if-eq p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static isTokenCharacter(C)Z
    .locals 2
    .param p0, "ch"    # C

    .line 160
    invoke-static {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->isAscii(C)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 161
    invoke-static {p0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "!#$%&\'*+-.^_`|~"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 160
    :goto_0
    return v0
.end method

.method private static isWhitespace(C)Z
    .locals 1
    .param p0, "c"    # C

    .line 169
    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0x20

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private optionallySkipWhitespace()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
        }
    .end annotation

    .line 146
    nop

    :goto_0
    invoke-virtual {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->hasMore()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v0

    invoke-static {v0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    goto :goto_0

    .line 149
    :cond_0
    return-void
.end method


# virtual methods
.method getNextParameter()Ljava/util/Map$Entry;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
        }
    .end annotation

    .line 32
    iget v0, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    .line 33
    .local v0, "startPos":I
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->optionallySkipWhitespace()V

    .line 34
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->getNextToken()Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "parameterName":Ljava/lang/String;
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v2

    const/16 v3, 0x3d

    const-string v4, "]"

    const-string v5, ": ["

    if-ne v2, v3, :cond_3

    .line 42
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    .line 45
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v2

    const/16 v3, 0x22

    if-ne v2, v3, :cond_0

    .line 46
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->getNextQuotedString()Ljava/lang/String;

    move-result-object v2

    .local v2, "parameterValue":Ljava/lang/String;
    goto :goto_0

    .line 48
    .end local v2    # "parameterValue":Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->getNextToken()Ljava/lang/String;

    move-result-object v2

    .line 51
    .restart local v2    # "parameterValue":Ljava/lang/String;
    :goto_0
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->optionallySkipWhitespace()V

    .line 53
    invoke-virtual {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->hasMore()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 54
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->currentChar()C

    move-result v3

    const/16 v6, 0x3b

    if-ne v3, v6, :cond_1

    .line 61
    invoke-direct {p0}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->advance()V

    goto :goto_1

    .line 55
    :cond_1
    new-instance v3, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    iget v6, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    iget-object v7, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid parameter format: expected ; at "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-direct {v3, v4, v5}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v3

    .line 63
    :cond_2
    :goto_1
    new-instance v3, Ljava/util/AbstractMap$SimpleEntry;

    invoke-direct {v3, v1, v2}, Ljava/util/AbstractMap$SimpleEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v3

    .line 36
    .end local v2    # "parameterValue":Ljava/lang/String;
    :cond_3
    new-instance v2, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;

    iget v3, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    iget-object v6, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid parameter format: expected = at "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    invoke-direct {v2, v3, v4}, Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;-><init>(Ljava/lang/String;I)V

    throw v2
.end method

.method hasMore()Z
    .locals 2

    .line 126
    iget v0, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mCurrentPosition:I

    iget-object v1, p0, Lorg/chromium/net/apihelpers/ContentTypeParametersParser;->mHeaderValue:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
