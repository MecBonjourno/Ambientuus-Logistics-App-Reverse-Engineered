.class public Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;
.super Lcom/coleta/ambientuus/activities/main/BaseActivity;
.source "CapaPontoColetaActivity.java"


# static fields
.field private static final ARQUIVO_PREFERENCIA:Ljava/lang/String; = "ArquivoPreferencia"


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;

.field private btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

.field private btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

.field private editando:Ljava/lang/Boolean;

.field private finaliza:Ljava/lang/Boolean;

.field private pendente:Ljava/lang/Boolean;

.field private pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

.field private smClienteAusente:Landroidx/appcompat/widget/SwitchCompat;

.field private smSemResiduo:Landroidx/appcompat/widget/SwitchCompat;


# direct methods
.method public static synthetic $r8$lambda$8_KTMouDWt0yEP6-JQcbcTrZSuw(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->lambda$preparePendente$4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$KYKWSlA2nozmu4YR8pyrhyhSZSk(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->lambda$initButtons$1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$TnI-UL_8XUmECxSPmkalEO1bhVU(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->lambda$preparePendente$5(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$h_apcGsjj1hdH4Fw7i1RWEj5WbE(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->lambda$initButtons$0(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    return-void
.end method

.method public static synthetic $r8$lambda$jvzZvntSu_8xTwF9rZOsVa1BIqs(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->lambda$initSwitchs$3(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$m09_4Vz6RC--GoaYIHELdkBn7nM(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->lambda$initButtons$2(Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;-><init>()V

    return-void
.end method

.method private createRecyclerView()V
    .locals 5

    .line 253
    new-instance v0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    new-instance v1, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 254
    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->selectEtiquetaManifesto(Ljava/lang/Integer;)Ljava/util/ArrayList;

    move-result-object v0

    .line 255
    .local v0, "etiquetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/Etiqueta;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 256
    sget v1, Lcom/coleta/ambientuus/R$id;->rvEtiquetasPontoColeta:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    .line 257
    .local v1, "listagemEtiqueta":Landroidx/recyclerview/widget/RecyclerView;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 258
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v3, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 259
    new-instance v3, Landroidx/recyclerview/widget/DividerItemDecoration;

    .line 260
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    .line 263
    .local v3, "dividerItemDecoration":Landroidx/recyclerview/widget/DividerItemDecoration;
    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 264
    new-instance v2, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;

    invoke-direct {v2, v0}, Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;-><init>(Ljava/util/List;)V

    iput-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;

    .line 265
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/EtiquetaPontoColetaAdapter;

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 266
    .end local v1    # "listagemEtiqueta":Landroidx/recyclerview/widget/RecyclerView;
    .end local v3    # "dividerItemDecoration":Landroidx/recyclerview/widget/DividerItemDecoration;
    goto :goto_0

    .line 267
    :cond_0
    sget v1, Lcom/coleta/ambientuus/R$id;->listagemEtiquetasPontosColetas:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 269
    :goto_0
    return-void
.end method

.method private disableButton()V
    .locals 2

    .line 179
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setEnabled(Z)V

    .line 180
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 181
    return-void
.end method

.method private enableButton()V
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setEnabled(Z)V

    .line 175
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 176
    return-void
.end method

.method private finalizeColetaButtonAction()V
    .locals 7

    .line 197
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 198
    .local v0, "databaseHelper":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 199
    .local v1, "coletaTableManager":Lcom/coleta/ambientuus/database/managers/ColetaTableManager;
    const-string v2, "ArquivoPreferencia"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 200
    .local v2, "preferences":Landroid/content/SharedPreferences;
    const-string v4, "id_rota"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 201
    .local v3, "IdRotaStatico":I
    new-instance v4, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 202
    .local v4, "pontoColetaTableManager":Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smSemResiduo:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v5}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 203
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1, v5, v3}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->insertSemResiduo(Lcom/coleta/ambientuus/dto/PontoColeta;I)V

    .line 204
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v5}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v5

    const-string v6, "500"

    invoke-virtual {v4, v5, v6}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V

    goto :goto_0

    .line 205
    :cond_0
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smClienteAusente:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v5}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 206
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1, v5, v3}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->insertClienteAusente(Lcom/coleta/ambientuus/dto/PontoColeta;I)V

    .line 207
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v5}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v5

    const-string v6, "600"

    invoke-virtual {v4, v5, v6}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 209
    :cond_1
    :goto_0
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->finaliza:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 210
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v5}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v5

    const-string v6, "200"

    invoke-virtual {v4, v5, v6}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 212
    :cond_2
    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-direct {v5, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 213
    .local v5, "intent":Landroid/content/Intent;
    const/high16 v6, 0x24000000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 214
    invoke-virtual {p0, v5}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 216
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->finish()V

    .line 217
    return-void
.end method

.method private hideInfoColetaReturn()V
    .locals 2

    .line 220
    sget v0, Lcom/coleta/ambientuus/R$id;->llColetaSemResiduoClienteAusente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 221
    sget v0, Lcom/coleta/ambientuus/R$id;->clObservacao:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 222
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setVisibility(I)V

    .line 223
    return-void
.end method

.method private initButtons()V
    .locals 2

    .line 118
    sget v0, Lcom/coleta/ambientuus/R$id;->btnIniciarColetaCapa:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    .line 119
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 141
    sget v0, Lcom/coleta/ambientuus/R$id;->btnColetarPonto:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

    .line 142
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->disableButton()V

    .line 144
    return-void
.end method

.method private initInfoPontoColeta()V
    .locals 11

    .line 72
    sget v0, Lcom/coleta/ambientuus/R$id;->tvNomeCliente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 73
    .local v0, "tvNomeCliente":Landroid/widget/TextView;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 74
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getCodCliente()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getRazaoSocial()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 73
    const-string v2, "Cliente: "

    invoke-static {v2, v1}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    sget v1, Lcom/coleta/ambientuus/R$id;->tvEndereco:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 77
    .local v1, "tvEndereco":Landroid/widget/TextView;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 78
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getEndereco()Ljava/lang/String;

    move-result-object v2

    .line 77
    const-string v3, "Endere\u00e7o: "

    invoke-static {v3, v2}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    sget v2, Lcom/coleta/ambientuus/R$id;->tvMtr:I

    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 81
    .local v2, "tvMtr":Landroid/widget/TextView;
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 82
    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v3

    .line 81
    const-string v4, "MTR: "

    invoke-static {v4, v3}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getClienteEmiteMtr()Ljava/lang/String;

    move-result-object v3

    const-string v5, "N"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 85
    iget-object v3, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v3}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v3

    .line 86
    .local v3, "numeroManifesto":Ljava/lang/String;
    const-string v5, "DC"

    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 87
    invoke-static {v4, v3}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 90
    :cond_0
    nop

    .line 91
    const-string v4, ""

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 90
    const-string v5, "DC: "

    invoke-static {v5, v4}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .end local v3    # "numeroManifesto":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 93
    :cond_1
    const-string v3, "Cliente MTR"

    invoke-static {v3}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextBold(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    :goto_1
    sget v3, Lcom/coleta/ambientuus/R$id;->tvDestinador:I

    invoke-virtual {p0, v3}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 97
    .local v3, "tvDestinador":Landroid/widget/TextView;
    iget-object v4, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 98
    invoke-virtual {v4}, Lcom/coleta/ambientuus/dto/PontoColeta;->getDestino()Ljava/lang/String;

    move-result-object v4

    .line 97
    const-string v5, "Destinador: "

    invoke-static {v5, v4}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    sget v4, Lcom/coleta/ambientuus/R$id;->tvResiduo:I

    invoke-virtual {p0, v4}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 101
    .local v4, "tvResiduo":Landroid/widget/TextView;
    iget-object v5, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 102
    invoke-virtual {v5}, Lcom/coleta/ambientuus/dto/PontoColeta;->getTipoResiduo()Ljava/lang/String;

    move-result-object v5

    .line 101
    const-string v6, "Res\u00edduo: "

    invoke-static {v6, v5}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    sget v5, Lcom/coleta/ambientuus/R$id;->tvPeriodicidade:I

    invoke-virtual {p0, v5}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 105
    .local v5, "tvPeriodicidade":Landroid/widget/TextView;
    iget-object v6, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 106
    invoke-virtual {v6}, Lcom/coleta/ambientuus/dto/PontoColeta;->getPeriodicidade()Ljava/lang/String;

    move-result-object v6

    .line 105
    const-string v7, "Periodicidade: "

    invoke-static {v7, v6}, Lcom/coleta/ambientuus/utils/TextStyles;->getTextWithBoldPrefix(Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 108
    sget v6, Lcom/coleta/ambientuus/R$id;->tvObservacoes:I

    invoke-virtual {p0, v6}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 109
    .local v6, "tvObservacoes":Landroid/widget/TextView;
    iget-object v7, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v7}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 110
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v8}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v8}, Lcom/coleta/ambientuus/dto/PontoColeta;->getObservacaoMtr()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 111
    .local v7, "Observacao":Ljava/lang/String;
    const-string v8, "\\n"

    const-string v9, "\n"

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    .line 112
    .local v8, "textoFormatado":Ljava/lang/String;
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .end local v7    # "Observacao":Ljava/lang/String;
    .end local v8    # "textoFormatado":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private initSwitchs()V
    .locals 2

    .line 147
    sget v0, Lcom/coleta/ambientuus/R$id;->smSemResiduo:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smSemResiduo:Landroidx/appcompat/widget/SwitchCompat;

    .line 148
    sget v0, Lcom/coleta/ambientuus/R$id;->smClienteAusente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smClienteAusente:Landroidx/appcompat/widget/SwitchCompat;

    .line 150
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda5;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;)V

    .line 168
    .local v0, "listener":Landroid/widget/CompoundButton$OnCheckedChangeListener;
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smSemResiduo:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 169
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smClienteAusente:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 171
    return-void
.end method

.method private synthetic lambda$initButtons$0(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 3
    .param p1, "tipo"    # Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    .line 127
    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .local v0, "intent":Landroid/content/Intent;
    goto :goto_0

    .line 130
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 132
    .restart local v0    # "intent":Landroid/content/Intent;
    :goto_0
    const/high16 v1, 0x24000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 133
    const-string v1, "ponto"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 134
    const-string v1, "tipo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 135
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 136
    return-void
.end method

.method private synthetic lambda$initButtons$1(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 120
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->editando:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/PontoColetaEtiquetaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 122
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "ponto"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 123
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 124
    .end local v0    # "intent":Landroid/content/Intent;
    goto :goto_0

    .line 125
    :cond_0
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda4;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;)V

    invoke-static {p0, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->verifyPreferences(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;)V

    .line 138
    :goto_0
    return-void
.end method

.method private synthetic lambda$initButtons$2(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 142
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->finalizeColetaButtonAction()V

    return-void
.end method

.method private synthetic lambda$initSwitchs$3(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "v"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 151
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smSemResiduo:Landroidx/appcompat/widget/SwitchCompat;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    if-eqz p2, :cond_0

    .line 152
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smClienteAusente:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    goto :goto_0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smClienteAusente:Landroidx/appcompat/widget/SwitchCompat;

    if-ne p1, v0, :cond_1

    if-eqz p2, :cond_1

    .line 154
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smSemResiduo:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 157
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smSemResiduo:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->smClienteAusente:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 162
    :cond_2
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->disableButton()V

    .line 163
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setEnabled(Z)V

    .line 164
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    goto :goto_2

    .line 158
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->enableButton()V

    .line 159
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setEnabled(Z)V

    .line 160
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnIniciarColetaCapa:Lcom/google/android/material/button/MaterialButton;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 166
    :goto_2
    return-void
.end method

.method private synthetic lambda$preparePendente$4(Landroid/view/View;)V
    .locals 4
    .param p1, "V"    # Landroid/view/View;

    .line 238
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    .line 239
    .local v0, "databaseHelper":Lcom/coleta/ambientuus/database/DatabaseHelper;
    new-instance v1, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 240
    .local v1, "pontoColetaTableManager":Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "100"

    invoke-virtual {v1, v2, v3}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 241
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 242
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v3, 0x24000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 243
    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 244
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->finish()V

    .line 245
    return-void
.end method

.method private synthetic lambda$preparePendente$5(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 247
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->finalizeColetaButtonAction()V

    return-void
.end method

.method private prepareFinaliza()V
    .locals 0

    .line 226
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->hideInfoColetaReturn()V

    .line 227
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->enableButton()V

    .line 228
    return-void
.end method

.method private preparePendente()V
    .locals 2

    .line 231
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->hideInfoColetaReturn()V

    .line 233
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->btnColetarPonto:Lcom/google/android/material/button/MaterialButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/google/android/material/button/MaterialButton;->setVisibility(I)V

    .line 234
    sget v0, Lcom/coleta/ambientuus/R$id;->llColetaPendenteMensagem:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 235
    sget v0, Lcom/coleta/ambientuus/R$id;->llColetaPendenteBotoes:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 237
    sget v0, Lcom/coleta/ambientuus/R$id;->btnColetarSalvarPendente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 247
    sget v0, Lcom/coleta/ambientuus/R$id;->btnColetarPontoPendente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 249
    return-void
.end method

.method private verifyColetaState()V
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pendente:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->preparePendente()V

    goto :goto_0

    .line 191
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->finaliza:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 192
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->prepareFinaliza()V

    .line 194
    :cond_1
    :goto_0
    return-void
.end method

.method private verifyEditando()V
    .locals 2

    .line 184
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->editando:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    sget v0, Lcom/coleta/ambientuus/R$id;->llColetaSemResiduoClienteAusente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 186
    :cond_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "saveInstanceState"    # Landroid/os/Bundle;

    .line 53
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_ponto_coleta_capa:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->setContentView(I)V

    .line 55
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    invoke-static {v0}, Lj$/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/app/ActionBar;

    sget v1, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 56
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "ponto"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/coleta/ambientuus/dto/PontoColeta;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pontoColeta:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 57
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "finaliza"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->finaliza:Ljava/lang/Boolean;

    .line 58
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "pendente"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->pendente:Ljava/lang/Boolean;

    .line 59
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "editando"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->editando:Ljava/lang/Boolean;

    .line 60
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->initInfoPontoColeta()V

    .line 61
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->initButtons()V

    .line 62
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->initSwitchs()V

    .line 63
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->createRecyclerView()V

    .line 65
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->verifyEditando()V

    .line 66
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;->verifyColetaState()V

    .line 67
    return-void
.end method
