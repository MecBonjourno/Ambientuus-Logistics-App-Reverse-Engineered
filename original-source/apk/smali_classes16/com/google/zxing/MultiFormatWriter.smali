.class public final Lcom/google/zxing/MultiFormatWriter;
.super Ljava/lang/Object;
.source "MultiFormatWriter.java"

# interfaces
.implements Lcom/google/zxing/Writer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    return-void
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    .locals 6
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 47
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    .end local p1    # "contents":Ljava/lang/String;
    .end local p2    # "format":Lcom/google/zxing/BarcodeFormat;
    .end local p3    # "width":I
    .end local p4    # "height":I
    .local v1, "contents":Ljava/lang/String;
    .local v2, "format":Lcom/google/zxing/BarcodeFormat;
    .local v3, "width":I
    .local v4, "height":I
    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/MultiFormatWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object p1

    return-object p1
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .locals 7
    .param p1, "contents"    # Ljava/lang/String;
    .param p2, "format"    # Lcom/google/zxing/BarcodeFormat;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 57
    .local p5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    sget-object v0, Lcom/google/zxing/MultiFormatWriter$1;->$SwitchMap$com$google$zxing$BarcodeFormat:[I

    invoke-virtual {p2}, Lcom/google/zxing/BarcodeFormat;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 92
    move-object v2, p1

    move-object v3, p2

    move v4, p3

    .end local p1    # "contents":Ljava/lang/String;
    .end local p2    # "format":Lcom/google/zxing/BarcodeFormat;
    .end local p3    # "width":I
    .local v2, "contents":Ljava/lang/String;
    .local v3, "format":Lcom/google/zxing/BarcodeFormat;
    .local v4, "width":I
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "No encoder available for format "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 89
    .end local v2    # "contents":Ljava/lang/String;
    .end local v3    # "format":Lcom/google/zxing/BarcodeFormat;
    .end local v4    # "width":I
    .restart local p1    # "contents":Ljava/lang/String;
    .restart local p2    # "format":Lcom/google/zxing/BarcodeFormat;
    .restart local p3    # "width":I
    :pswitch_0
    new-instance v0, Lcom/google/zxing/aztec/AztecWriter;

    invoke-direct {v0}, Lcom/google/zxing/aztec/AztecWriter;-><init>()V

    .line 90
    .local v0, "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 86
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_1
    new-instance v0, Lcom/google/zxing/datamatrix/DataMatrixWriter;

    invoke-direct {v0}, Lcom/google/zxing/datamatrix/DataMatrixWriter;-><init>()V

    .line 87
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 83
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_2
    new-instance v0, Lcom/google/zxing/oned/CodaBarWriter;

    invoke-direct {v0}, Lcom/google/zxing/oned/CodaBarWriter;-><init>()V

    .line 84
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 80
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_3
    new-instance v0, Lcom/google/zxing/pdf417/PDF417Writer;

    invoke-direct {v0}, Lcom/google/zxing/pdf417/PDF417Writer;-><init>()V

    .line 81
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 77
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_4
    new-instance v0, Lcom/google/zxing/oned/ITFWriter;

    invoke-direct {v0}, Lcom/google/zxing/oned/ITFWriter;-><init>()V

    .line 78
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 74
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_5
    new-instance v0, Lcom/google/zxing/oned/Code128Writer;

    invoke-direct {v0}, Lcom/google/zxing/oned/Code128Writer;-><init>()V

    .line 75
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 71
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_6
    new-instance v0, Lcom/google/zxing/oned/Code39Writer;

    invoke-direct {v0}, Lcom/google/zxing/oned/Code39Writer;-><init>()V

    .line 72
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 68
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_7
    new-instance v0, Lcom/google/zxing/qrcode/QRCodeWriter;

    invoke-direct {v0}, Lcom/google/zxing/qrcode/QRCodeWriter;-><init>()V

    .line 69
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 65
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_8
    new-instance v0, Lcom/google/zxing/oned/UPCAWriter;

    invoke-direct {v0}, Lcom/google/zxing/oned/UPCAWriter;-><init>()V

    .line 66
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 62
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_9
    new-instance v0, Lcom/google/zxing/oned/EAN13Writer;

    invoke-direct {v0}, Lcom/google/zxing/oned/EAN13Writer;-><init>()V

    .line 63
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    goto :goto_0

    .line 59
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    :pswitch_a
    new-instance v0, Lcom/google/zxing/oned/EAN8Writer;

    invoke-direct {v0}, Lcom/google/zxing/oned/EAN8Writer;-><init>()V

    .line 60
    .restart local v0    # "writer":Lcom/google/zxing/Writer;
    move-object v1, v0

    .line 94
    .end local v0    # "writer":Lcom/google/zxing/Writer;
    .local v1, "writer":Lcom/google/zxing/Writer;
    :goto_0
    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move-object v6, p5

    .end local p1    # "contents":Ljava/lang/String;
    .end local p2    # "format":Lcom/google/zxing/BarcodeFormat;
    .end local p3    # "width":I
    .end local p4    # "height":I
    .end local p5    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    .restart local v2    # "contents":Ljava/lang/String;
    .restart local v3    # "format":Lcom/google/zxing/BarcodeFormat;
    .restart local v4    # "width":I
    .local v5, "height":I
    .local v6, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;*>;"
    invoke-interface/range {v1 .. v6}, Lcom/google/zxing/Writer;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
