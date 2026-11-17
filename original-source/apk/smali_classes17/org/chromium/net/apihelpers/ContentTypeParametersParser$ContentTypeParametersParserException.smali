.class Lorg/chromium/net/apihelpers/ContentTypeParametersParser$ContentTypeParametersParserException;
.super Ljava/text/ParseException;
.source "ContentTypeParametersParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/net/apihelpers/ContentTypeParametersParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ContentTypeParametersParserException"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "offset"    # I

    .line 174
    invoke-direct {p0, p1, p2}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    .line 175
    return-void
.end method
