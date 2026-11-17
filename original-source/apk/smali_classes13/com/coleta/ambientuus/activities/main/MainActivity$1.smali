.class Lcom/coleta/ambientuus/activities/main/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/main/MainActivity;->initItem()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final cal:Ljava/util/Calendar;

.field private current:Ljava/lang/String;

.field final synthetic this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 1
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/main/MainActivity;

    .line 148
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    const-string v0, ""

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->current:Ljava/lang/String;

    .line 150
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->cal:Ljava/util/Calendar;

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 8
    .param p1, "s"    # Landroid/text/Editable;

    .line 204
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetdataColetaSel(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "dataDigitada":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_1

    .line 207
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd/MM/yyyy"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 208
    .local v1, "formatter":Ljava/text/SimpleDateFormat;
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 211
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 212
    .local v2, "data":Ljava/util/Date;
    if-eqz v2, :cond_0

    .line 213
    invoke-static {v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$sfputdataColeta(Ljava/lang/String;)V

    .line 214
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$mloadSpinnerDataRota(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    .line 215
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v3}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$mloadSpinnerDataPlaca(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 232
    .end local v2    # "data":Ljava/util/Date;
    :cond_0
    goto :goto_0

    .line 217
    :catch_0
    move-exception v2

    .line 219
    .local v2, "e":Ljava/text/ParseException;
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 220
    .local v3, "hoje":Ljava/util/Date;
    invoke-virtual {v1, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 221
    .local v4, "dataHojeFormatada":Ljava/lang/String;
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v5}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetdataColetaSel(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 222
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v5}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetdataColetaSel(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setSelection(I)V

    .line 223
    invoke-static {v4}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$sfputdataColeta(Ljava/lang/String;)V

    .line 225
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    const-string v6, "Erro"

    const-string v7, "Data inv\u00e1lida."

    invoke-static {v5, v6, v7}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->exibirErro(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    :try_start_1
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v5}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$mloadSpinnerDataRota(Lcom/coleta/ambientuus/activities/main/MainActivity;)V

    .line 228
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v5}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$mloadSpinnerDataPlaca(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    .line 231
    goto :goto_0

    .line 229
    :catch_1
    move-exception v5

    .line 230
    .local v5, "ex":Ljava/text/ParseException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 235
    .end local v1    # "formatter":Ljava/text/SimpleDateFormat;
    .end local v2    # "e":Ljava/text/ParseException;
    .end local v3    # "hoje":Ljava/util/Date;
    .end local v4    # "dataHojeFormatada":Ljava/lang/String;
    .end local v5    # "ex":Ljava/text/ParseException;
    :cond_1
    :goto_0
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .line 200
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 18
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .line 154
    move-object/from16 v0, p0

    invoke-interface/range {p1 .. p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->current:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 155
    invoke-interface/range {p1 .. p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "[^\\d.]"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "clean":Ljava/lang/String;
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->current:Ljava/lang/String;

    invoke-virtual {v4, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 158
    .local v2, "cleanC":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    .line 159
    .local v3, "cl":I
    move v4, v3

    .line 160
    .local v4, "sel":I
    const/4 v5, 0x2

    .local v5, "i":I
    :goto_0
    if-gt v5, v3, :cond_0

    const/4 v6, 0x6

    if-ge v5, v6, :cond_0

    .line 161
    add-int/lit8 v4, v4, 0x1

    .line 160
    add-int/lit8 v5, v5, 0x2

    goto :goto_0

    .line 165
    .end local v5    # "i":I
    :cond_0
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    add-int/lit8 v4, v4, -0x1

    .line 167
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x3

    const/16 v7, 0x8

    const/4 v8, 0x4

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x2

    if-ge v5, v7, :cond_2

    .line 168
    const-string v5, "DDMMYYYY"

    .line 169
    .local v5, "ddmmyyyy":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {v5, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 170
    .end local v5    # "ddmmyyyy":Ljava/lang/String;
    move/from16 v17, v10

    goto/16 :goto_5

    .line 172
    :cond_2
    invoke-virtual {v1, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 173
    .local v5, "day":I
    invoke-virtual {v1, v11, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 174
    .local v12, "mon":I
    invoke-virtual {v1, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    .line 176
    .local v13, "year":I
    if-ge v12, v10, :cond_3

    move v14, v10

    goto :goto_1

    :cond_3
    const/16 v14, 0xc

    if-le v12, v14, :cond_4

    goto :goto_1

    :cond_4
    move v14, v12

    .line 177
    .end local v12    # "mon":I
    .local v14, "mon":I
    :goto_1
    iget-object v12, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->cal:Ljava/util/Calendar;

    add-int/lit8 v15, v14, -0x1

    invoke-virtual {v12, v11, v15}, Ljava/util/Calendar;->set(II)V

    .line 178
    const/16 v12, 0x76c

    if-ge v13, v12, :cond_5

    :goto_2
    goto :goto_3

    :cond_5
    const/16 v12, 0x834

    if-le v13, v12, :cond_6

    goto :goto_2

    :cond_6
    move v12, v13

    .line 179
    .end local v13    # "year":I
    .local v12, "year":I
    :goto_3
    iget-object v13, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->cal:Ljava/util/Calendar;

    invoke-virtual {v13, v10, v12}, Ljava/util/Calendar;->set(II)V

    .line 182
    iget-object v13, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->cal:Ljava/util/Calendar;

    const/4 v15, 0x5

    invoke-virtual {v13, v15}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v13

    if-le v5, v13, :cond_7

    iget-object v13, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->cal:Ljava/util/Calendar;

    invoke-virtual {v13, v15}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v13

    goto :goto_4

    :cond_7
    move v13, v5

    .line 183
    .end local v5    # "day":I
    .local v13, "day":I
    :goto_4
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    move/from16 v17, v10

    new-array v10, v6, [Ljava/lang/Object;

    aput-object v5, v10, v9

    aput-object v15, v10, v17

    aput-object v16, v10, v11

    const-string v5, "%02d%02d%04d"

    invoke-static {v5, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 186
    .end local v12    # "year":I
    .end local v13    # "day":I
    .end local v14    # "mon":I
    :goto_5
    nop

    .line 187
    invoke-virtual {v1, v9, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 188
    invoke-virtual {v1, v11, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 189
    invoke-virtual {v1, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v5, v6, v9

    aput-object v10, v6, v17

    aput-object v7, v6, v11

    .line 186
    const-string v5, "%s/%s/%s"

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 191
    invoke-static {v4, v9}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 192
    iput-object v1, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->current:Ljava/lang/String;

    .line 193
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v5}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetdataColetaSel(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;

    move-result-object v5

    iget-object v6, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->current:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 194
    iget-object v5, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v5}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetdataColetaSel(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroid/widget/EditText;

    move-result-object v5

    iget-object v6, v0, Lcom/coleta/ambientuus/activities/main/MainActivity$1;->current:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/EditText;->setSelection(I)V

    .line 196
    .end local v1    # "clean":Ljava/lang/String;
    .end local v2    # "cleanC":Ljava/lang/String;
    .end local v3    # "cl":I
    .end local v4    # "sel":I
    :cond_8
    return-void
.end method
