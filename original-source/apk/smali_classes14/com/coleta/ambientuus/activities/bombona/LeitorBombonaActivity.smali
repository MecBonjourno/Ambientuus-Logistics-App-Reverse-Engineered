.class public Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "LeitorBombonaActivity.java"

# interfaces
.implements Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;


# static fields
.field private static final ARQUIVO_PREFERENCIA:Ljava/lang/String; = "ArquivoPreferencia"


# instance fields
.field private clienteSelectinado:Ljava/lang/String;

.field private idClienteSel:Ljava/lang/Integer;

.field private idVolumeBombona:Ljava/lang/Integer;

.field private origem:Ljava/lang/String;

.field private scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;


# direct methods
.method static bridge synthetic -$$Nest$fgetclienteSelectinado(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->clienteSelectinado:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetidClienteSel(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idClienteSel:Ljava/lang/Integer;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fgetorigem(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mreiniciaLeitor(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->reiniciaLeitor()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method private insereMovimento(Ljava/lang/String;)V
    .locals 20
    .param p1, "codBarras"    # Ljava/lang/String;

    .line 141
    move-object/from16 v0, p0

    move-object/from16 v2, p1

    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v1, v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    move-object v8, v1

    .line 142
    .local v8, "myDb":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;

    invoke-virtual {v8}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/database/managers/BombonaTableManager;->validaCadastroBombona(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 143
    .local v9, "erroCad":Ljava/lang/String;
    const-string v10, ""

    .line 144
    .local v10, "erroMensagem":Ljava/lang/String;
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v11, "TR"

    invoke-virtual {v1, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v3, "B"

    const-string v12, "TC"

    const-string v13, "A"

    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idClienteSel:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    iget-object v1, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idClienteSel:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    .line 174
    :cond_1
    const-string v1, "Selecione um cliente para destinar a Bombona"

    .end local v10    # "erroMensagem":Ljava/lang/String;
    .local v1, "erroMensagem":Ljava/lang/String;
    goto/16 :goto_6

    .line 145
    .end local v1    # "erroMensagem":Ljava/lang/String;
    .restart local v10    # "erroMensagem":Ljava/lang/String;
    :cond_2
    :goto_0
    if-nez v9, :cond_c

    .line 146
    new-instance v1, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    invoke-virtual {v8}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v4, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v2, v4}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 147
    .local v14, "validaBombona":Ljava/lang/String;
    if-nez v14, :cond_b

    .line 148
    sget v1, Lcom/coleta/ambientuus/R$raw;->beep_ok:I

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v15

    .line 149
    .local v15, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v15}, Landroid/media/MediaPlayer;->start()V

    .line 150
    const-string v1, "ArquivoPreferencia"

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 151
    .local v1, "preferences":Landroid/content/SharedPreferences;
    const-string v5, "id_rota"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v16

    .line 152
    .local v16, "spinner_id_rota":I
    const-string v5, "id_frota_veiculo"

    invoke-interface {v1, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v17

    .line 153
    .local v17, "spinner_id_frota_veiculo":I
    move-object v5, v1

    .end local v1    # "preferences":Landroid/content/SharedPreferences;
    .local v5, "preferences":Landroid/content/SharedPreferences;
    new-instance v1, Lcom/coleta/ambientuus/dto/MovimentoBombona;

    .line 154
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v6, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    :goto_1
    iget-object v4, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idClienteSel:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    goto :goto_2

    :cond_3
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v6, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    goto :goto_1

    :cond_4
    :goto_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 155
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v6, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    move-object v3, v11

    goto :goto_3

    :cond_5
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v6, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    move-object v3, v13

    goto :goto_3

    :cond_6
    iget-object v6, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v6, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7

    move-object v3, v12

    .line 157
    :cond_7
    :goto_3
    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    .line 158
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    move-object/from16 v18, v5

    .end local v5    # "preferences":Landroid/content/SharedPreferences;
    .local v18, "preferences":Landroid/content/SharedPreferences;
    const/4 v5, 0x0

    move-object/from16 v19, v4

    move-object v4, v3

    move-object/from16 v3, v19

    invoke-direct/range {v1 .. v7}, Lcom/coleta/ambientuus/dto/MovimentoBombona;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 159
    .local v1, "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    new-instance v2, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    invoke-virtual {v8}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 160
    .local v2, "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    invoke-virtual {v2, v1}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->insert(Lcom/coleta/ambientuus/dto/MovimentoBombona;)V

    .line 162
    iget-object v3, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v3, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    const-string v3, "Bombona Carregada!"

    goto :goto_4

    .line 163
    :cond_8
    iget-object v3, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v3, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    const-string v3, "Bombona Alocada!"

    goto :goto_4

    .line 164
    :cond_9
    iget-object v3, v0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v3, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    const-string v3, "Bombona Alocada em Terceiro!"

    goto :goto_4

    :cond_a
    const-string v3, "Bombona Baixada!"

    :goto_4
    nop

    .line 162
    const/4 v4, 0x1

    invoke-static {v0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    .line 165
    .local v3, "toast":Landroid/widget/Toast;
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 166
    invoke-direct {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->reiniciaLeitor()V

    .line 167
    .end local v1    # "movimentoBombona":Lcom/coleta/ambientuus/dto/MovimentoBombona;
    .end local v2    # "movimentoBombonaTableManager":Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;
    .end local v3    # "toast":Landroid/widget/Toast;
    .end local v15    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v16    # "spinner_id_rota":I
    .end local v17    # "spinner_id_frota_veiculo":I
    .end local v18    # "preferences":Landroid/content/SharedPreferences;
    goto :goto_5

    .line 168
    :cond_b
    move-object v10, v14

    .line 170
    .end local v14    # "validaBombona":Ljava/lang/String;
    :goto_5
    move-object v1, v10

    goto :goto_6

    .line 171
    :cond_c
    move-object v1, v9

    .line 176
    .end local v10    # "erroMensagem":Ljava/lang/String;
    .local v1, "erroMensagem":Ljava/lang/String;
    :goto_6
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_d

    .line 177
    sget v2, Lcom/coleta/ambientuus/R$raw;->beep_erro:I

    invoke-static {v0, v2}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v2

    .line 178
    .local v2, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v2}, Landroid/media/MediaPlayer;->start()V

    .line 179
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v3

    .line 180
    .local v3, "alertDialog":Landroid/app/AlertDialog;
    const-string v4, "Erro"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 181
    invoke-virtual {v3, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 182
    new-instance v4, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$3;

    invoke-direct {v4, v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$3;-><init>(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)V

    const/4 v5, -0x3

    const-string v6, "OK"

    invoke-virtual {v3, v5, v6, v4}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 189
    invoke-virtual {v3}, Landroid/app/AlertDialog;->show()V

    .line 191
    .end local v2    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v3    # "alertDialog":Landroid/app/AlertDialog;
    :cond_d
    return-void
.end method

.method private reiniciaLeitor()V
    .locals 4

    .line 194
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "TR"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "TC"

    const-string v3, "A"

    if-eqz v1, :cond_0

    const-class v1, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    goto :goto_0

    .line 195
    :cond_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-class v1, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    goto :goto_0

    .line 196
    :cond_1
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-class v1, Lcom/coleta/ambientuus/activities/TerceirosActivity;

    goto :goto_0

    :cond_2
    const-class v1, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    :goto_0
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 198
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 199
    :cond_3
    const-string v1, "ClienteSelectinado"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->clienteSelectinado:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 200
    const-string v1, "IdPessoaClienteSelecionado"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idClienteSel:Ljava/lang/Integer;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 202
    :cond_4
    const-string v1, "lido"

    const-string v2, "s"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .line 204
    return-void
.end method


# virtual methods
.method public handleResult(Lcom/google/zxing/Result;)V
    .locals 8
    .param p1, "rawResult"    # Lcom/google/zxing/Result;

    .line 92
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    .line 93
    .local v0, "texto":Ljava/lang/String;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v1}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 94
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "TR"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "A"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "B"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "TC"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_2

    .line 96
    :cond_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "C"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v3, "codigoBarrasBombona"

    if-eqz v1, :cond_2

    .line 97
    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 98
    .local v1, "myDb":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v4, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v4, v0, v2}, Lcom/coleta/ambientuus/database/managers/MovimentoBombonaTableManager;->validaBombona(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "validaBombona":Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 100
    sget v3, Lcom/coleta/ambientuus/R$raw;->beep_erro:I

    invoke-static {p0, v3}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v3

    .line 101
    .local v3, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v3}, Landroid/media/MediaPlayer;->start()V

    .line 102
    new-instance v4, Landroid/app/AlertDialog$Builder;

    invoke-direct {v4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    .line 103
    .local v4, "alertDialog":Landroid/app/AlertDialog;
    const-string v5, "Erro"

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 104
    invoke-virtual {v4, v2}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 105
    new-instance v5, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$2;

    invoke-direct {v5, p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$2;-><init>(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)V

    const/4 v6, -0x3

    const-string v7, "OK"

    invoke-virtual {v4, v6, v7, v5}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 114
    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 115
    .end local v3    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v4    # "alertDialog":Landroid/app/AlertDialog;
    goto :goto_0

    .line 116
    :cond_1
    sget v4, Lcom/coleta/ambientuus/R$raw;->beep_ok:I

    invoke-static {p0, v4}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v4

    .line 117
    .local v4, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v4}, Landroid/media/MediaPlayer;->start()V

    .line 118
    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {v5, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 119
    .local v5, "intent":Landroid/content/Intent;
    invoke-virtual {v5, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 120
    const-string v3, "idVolumeBombona"

    iget-object v6, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idVolumeBombona:Ljava/lang/Integer;

    invoke-virtual {v5, v3, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 121
    const/16 v3, 0x7b

    invoke-virtual {p0, v3, v5}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->setResult(ILandroid/content/Intent;)V

    .line 122
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->finish()V

    .line 124
    .end local v1    # "myDb":Lcom/coleta/ambientuus/database/DatabaseHelper;
    .end local v2    # "validaBombona":Ljava/lang/String;
    .end local v4    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v5    # "intent":Landroid/content/Intent;
    :goto_0
    goto :goto_3

    :cond_2
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "L"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 125
    sget v1, Lcom/coleta/ambientuus/R$raw;->beep_ok:I

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    .line 126
    .local v1, "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 127
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-direct {v2, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 128
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 129
    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->startActivity(Landroid/content/Intent;)V

    .end local v1    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v2    # "intent":Landroid/content/Intent;
    goto :goto_1

    .line 130
    :cond_3
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v2, "ET"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 131
    sget v1, Lcom/coleta/ambientuus/R$raw;->beep_ok:I

    invoke-static {p0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v1

    .line 132
    .restart local v1    # "mediaPlayer":Landroid/media/MediaPlayer;
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 133
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 134
    .restart local v2    # "intent":Landroid/content/Intent;
    const-string v3, "codigoBarrasEtiqueta"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    const/16 v3, 0x7c

    invoke-virtual {p0, v3, v2}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->setResult(ILandroid/content/Intent;)V

    .line 136
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->finish()V

    goto :goto_3

    .line 130
    .end local v1    # "mediaPlayer":Landroid/media/MediaPlayer;
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_4
    :goto_1
    goto :goto_3

    .line 95
    :cond_5
    :goto_2
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->insereMovimento(Ljava/lang/String;)V

    .line 138
    :goto_3
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 35
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    sget v0, Lcom/coleta/ambientuus/R$layout;->reader_leitor_bombona:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->setContentView(I)V

    .line 37
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    .line 38
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v2, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 40
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 41
    .local v0, "extras":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 42
    const-string v2, "ClienteSelectinado"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->clienteSelectinado:Ljava/lang/String;

    .line 43
    const-string v2, "IdPessoaClienteSelecionado"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idClienteSel:Ljava/lang/Integer;

    .line 44
    const-string v2, "ORIGEM"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    .line 45
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->origem:Ljava/lang/String;

    const-string v3, "C"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 46
    const-string v2, "idVolumeBombona"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->idVolumeBombona:Ljava/lang/Integer;

    .line 49
    :cond_0
    sget v2, Lcom/coleta/ambientuus/R$id;->zxscanBombona:I

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    .line 50
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v2, p0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->setResultHandler(Lme/dm7/barcodescanner/zxing/ZXingScannerView$ResultHandler;)V

    .line 51
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v2}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->startCamera()V

    .line 53
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v2

    new-instance v3, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;

    invoke-direct {v3, p0, v1}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$1;-><init>(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;Z)V

    invoke-virtual {v2, p0, v3}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 82
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->scannerView:Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 87
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 88
    return-void
.end method
