.class public Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;
.super Lcom/coleta/ambientuus/activities/main/BaseActivity;
.source "ListagemPontoColetaActivity.java"


# instance fields
.field private adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

.field private btnColetarPonto:Landroid/widget/Button;

.field private btnColetarPontoExtra:Landroid/widget/Button;

.field private btnEditarColeta:Landroid/widget/Button;

.field private btnExcluirColeta:Landroid/widget/Button;

.field private db:Lcom/coleta/ambientuus/database/DatabaseHelper;

.field private layoutAguarde:Landroid/widget/LinearLayout;

.field private listagemPontoColeta:Landroidx/recyclerview/widget/RecyclerView;

.field private pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

.field private pontoColetas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;"
        }
    .end annotation
.end field

.field private swColetasPendente:Landroidx/appcompat/widget/SwitchCompat;

.field private tiePesquisar:Lcom/google/android/material/textfield/TextInputEditText;


# direct methods
.method public static synthetic $r8$lambda$2KfVcKtSbkw0Qkj9RmLbGE2EOKg(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$initButton$1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$3wjO64gAx14quELhELx9AMMK_Ug(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Lcom/coleta/ambientuus/domain/model/SyncState;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$onResume$8(Lcom/coleta/ambientuus/domain/model/SyncState;)V

    return-void
.end method

.method public static synthetic $r8$lambda$5EKEG-8rvDko36XAjDKRMm_PS_c(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Lcom/coleta/ambientuus/dto/PontoColeta;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$actionOnAdpaterClick$9(Lcom/coleta/ambientuus/dto/PontoColeta;)V

    return-void
.end method

.method public static synthetic $r8$lambda$7gNtnZnHjLtT-CUSp7mH6ExjaPo(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$initButton$2(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    return-void
.end method

.method public static synthetic $r8$lambda$FSpD2G3SpiryHV8SADBNG1nl2Tg(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$initButton$7(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$KCZ0y0Edfvs8oPm9Ujtr0xRc1v0(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Lcom/coleta/ambientuus/domain/model/SyncState;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$onCreate$0(Lcom/coleta/ambientuus/domain/model/SyncState;)V

    return-void
.end method

.method public static synthetic $r8$lambda$WHlL3qBFYJkzTiNRdgLtbM9_Etw(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$initSwitch$10(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$cToXBp6eDPPs_d3vgJaCmGZpZXY(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$initButton$4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$xEGRbAbf5_wfOwh-RJiAEVCUuJs(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$initButton$3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$xw0UbeQ5rZbyQs4EDKAYDc_6tEA(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->lambda$initButton$5(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$fgetpontoColetas(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetas:Ljava/util/ArrayList;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mfilterPontosColeta(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->filterPontosColeta(Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrefreshRecyclerView(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->refreshRecyclerView(Ljava/util/ArrayList;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;-><init>()V

    return-void
.end method

.method private actionOnAdpaterClick(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;)V
    .locals 1
    .param p1, "adapter"    # Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    .line 260
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {p1, v0}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;->setOnItemSelectListener(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter$OnItemSelectListener;)V

    .line 266
    return-void
.end method

.method private createRecyclerView()V
    .locals 2

    .line 223
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->prepareRecyclerView()Landroidx/recyclerview/widget/RecyclerView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 224
    return-void
.end method

.method private deleteAllEtiquetaAndColetaFromPonto()V
    .locals 3

    .line 332
    new-instance v0, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getNumeroManifesto()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 333
    invoke-virtual {v2}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdCliente()Ljava/lang/Integer;

    move-result-object v2

    .line 332
    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/database/managers/ColetaTableManager;->deleteAllColetasManifesto(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 334
    new-instance v0, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getIdManifesto()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/database/managers/EtiquetaTableManager;->deleteAllManifesto(Ljava/lang/Integer;)V

    .line 335
    new-instance v0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/dto/PontoColeta;->getId()Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "000"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->updateStatus(Ljava/lang/Integer;Ljava/lang/String;)V

    .line 336
    return-void
.end method

.method private disableButtons()V
    .locals 2

    .line 197
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPonto:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 198
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPonto:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 200
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPontoExtra:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 201
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPontoExtra:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 203
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnEditarColeta:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 204
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnEditarColeta:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 206
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnExcluirColeta:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 207
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnExcluirColeta:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButtonDisabled(Landroid/widget/Button;Landroid/content/Context;)V

    .line 208
    return-void
.end method

.method private enableButtons()V
    .locals 4

    .line 168
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "000"

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPonto:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 170
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPonto:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v3, "500"

    invoke-static {v0, v3}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 174
    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v3, "600"

    invoke-static {v0, v3}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 176
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPontoExtra:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 177
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPontoExtra:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 180
    :cond_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v3, "100"

    invoke-static {v0, v3}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 181
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnEditarColeta:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 182
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnEditarColeta:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 185
    :cond_2
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 186
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnExcluirColeta:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 187
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnExcluirColeta:Landroid/widget/Button;

    invoke-static {v0, p0}, Lcom/coleta/ambientuus/utils/ButtonStyles;->aplicarEstiloFullWidthColoredButton(Landroid/widget/Button;Landroid/content/Context;)V

    .line 190
    :cond_3
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/dto/PontoColeta;->getStatus()Ljava/lang/String;

    move-result-object v0

    const-string v1, "900"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 191
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->disableButtons()V

    .line 194
    :cond_4
    return-void
.end method

.method private filterPontosColeta(Ljava/lang/String;)V
    .locals 4
    .param p1, "filter"    # Ljava/lang/String;

    .line 269
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .local v0, "pontoColetasFiltrados":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/PontoColeta;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetas:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 272
    .local v2, "pontoColeta":Lcom/coleta/ambientuus/dto/PontoColeta;
    invoke-virtual {v2, p1}, Lcom/coleta/ambientuus/dto/PontoColeta;->contemTexto(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 273
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 275
    .end local v2    # "pontoColeta":Lcom/coleta/ambientuus/dto/PontoColeta;
    :cond_0
    goto :goto_0

    .line 276
    :cond_1
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->refreshRecyclerView(Ljava/util/ArrayList;)V

    .line 277
    return-void
.end method

.method private getDatabase()V
    .locals 1

    .line 164
    new-instance v0, Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/database/DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    .line 165
    return-void
.end method

.method private initButton()V
    .locals 2

    .line 110
    sget v0, Lcom/coleta/ambientuus/R$id;->btnColetarPonto:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPonto:Landroid/widget/Button;

    .line 111
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPonto:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda7;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    sget v0, Lcom/coleta/ambientuus/R$id;->btnColetarPontoExtra:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPontoExtra:Landroid/widget/Button;

    .line 118
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnColetarPontoExtra:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda8;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    sget v0, Lcom/coleta/ambientuus/R$id;->btnEditarColeta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnEditarColeta:Landroid/widget/Button;

    .line 135
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnEditarColeta:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda9;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    sget v0, Lcom/coleta/ambientuus/R$id;->btnExcluirColeta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnExcluirColeta:Landroid/widget/Button;

    .line 143
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->btnExcluirColeta:Landroid/widget/Button;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda10;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->disableButtons()V

    .line 161
    return-void
.end method

.method private initScreen()V
    .locals 3

    .line 94
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initButton()V

    .line 95
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->getDatabase()V

    .line 96
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->createRecyclerView()V

    .line 97
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initSearchView()V

    .line 98
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initSwitch()V

    .line 100
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$1;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;Z)V

    invoke-virtual {v0, p0, v1}, Landroidx/activity/OnBackPressedDispatcher;->addCallback(Landroidx/lifecycle/LifecycleOwner;Landroidx/activity/OnBackPressedCallback;)V

    .line 107
    return-void
.end method

.method private initSearchView()V
    .locals 2

    .line 280
    sget v0, Lcom/coleta/ambientuus/R$id;->tiePesquisar:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->tiePesquisar:Lcom/google/android/material/textfield/TextInputEditText;

    .line 281
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->tiePesquisar:Lcom/google/android/material/textfield/TextInputEditText;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 301
    return-void
.end method

.method private initSwitch()V
    .locals 2

    .line 304
    sget v0, Lcom/coleta/ambientuus/R$id;->swColetasPendente:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->swColetasPendente:Landroidx/appcompat/widget/SwitchCompat;

    .line 305
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->swColetasPendente:Landroidx/appcompat/widget/SwitchCompat;

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda6;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 314
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->swColetasPendente:Landroidx/appcompat/widget/SwitchCompat;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 315
    return-void
.end method

.method private synthetic lambda$actionOnAdpaterClick$9(Lcom/coleta/ambientuus/dto/PontoColeta;)V
    .locals 0
    .param p1, "selecionado"    # Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 261
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    .line 262
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->disableButtons()V

    .line 264
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->enableButtons()V

    .line 265
    return-void
.end method

.method private synthetic lambda$initButton$1(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 112
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 113
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "ponto"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 114
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 115
    return-void
.end method

.method private synthetic lambda$initButton$2(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 3
    .param p1, "tipo"    # Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    .line 121
    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lj$/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 123
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "EXTRA"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    .line 125
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/IniciarColetaExtraActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 127
    .restart local v0    # "intent":Landroid/content/Intent;
    :goto_0
    const/high16 v1, 0x24000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 128
    const-string v1, "ponto"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 129
    const-string v1, "tipo"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 131
    return-void
.end method

.method private synthetic lambda$initButton$3(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 119
    new-instance v0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-static {p0, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->verifyPreferences(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;)V

    .line 132
    return-void
.end method

.method private synthetic lambda$initButton$4(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 136
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/coleta/ambientuus/activities/pontoColeta/CapaPontoColetaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 137
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "ponto"

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetaSelecionado:Lcom/coleta/ambientuus/dto/PontoColeta;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 138
    const-string v1, "editando"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 139
    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->startActivity(Landroid/content/Intent;)V

    .line 140
    return-void
.end method

.method private synthetic lambda$initButton$5(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 151
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->deleteAllEtiquetaAndColetaFromPonto()V

    .line 152
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->swColetasPendente:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SwitchCompat;->isChecked()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->refreshPontoColeta(Ljava/lang/Boolean;)V

    .line 153
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetas:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->refreshRecyclerView(Ljava/util/ArrayList;)V

    .line 154
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 155
    return-void
.end method

.method static synthetic lambda$initButton$6(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .line 156
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method private synthetic lambda$initButton$7(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .line 144
    new-instance v5, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda4;

    invoke-direct {v5, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda4;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    new-instance v6, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda5;

    invoke-direct {v6}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda5;-><init>()V

    const-string v1, "Deseja Excluir?"

    const-string v2, "Todas as coletas e etiquetas vinculadas a este ponto de coleta ser\u00e3o exclu\u00eddas."

    const-string v3, "Sim"

    const-string v4, "N\u00e3o"

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->mostrarConfirmacao(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    .line 158
    return-void
.end method

.method private synthetic lambda$initSwitch$10(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "v"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .line 306
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->refreshPontoColeta(Ljava/lang/Boolean;)V

    .line 307
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->tiePesquisar:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputEditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 308
    .local v0, "filtro":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 309
    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->filterPontosColeta(Ljava/lang/String;)V

    goto :goto_0

    .line 311
    :cond_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetas:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->refreshRecyclerView(Ljava/util/ArrayList;)V

    .line 313
    :goto_0
    return-void
.end method

.method private synthetic lambda$onCreate$0(Lcom/coleta/ambientuus/domain/model/SyncState;)V
    .locals 2
    .param p1, "status"    # Lcom/coleta/ambientuus/domain/model/SyncState;

    .line 65
    const-string v0, "TESTE"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/SyncState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    sget-object v0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$3;->$SwitchMap$com$coleta$ambientuus$domain$model$SyncState:[I

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/SyncState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/16 v1, 0x8

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 79
    :pswitch_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 80
    const-string v0, "Erro ao sincronizar"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 72
    :pswitch_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 74
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initScreen()V

    .line 76
    goto :goto_0

    .line 68
    :pswitch_2
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 69
    nop

    .line 83
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private synthetic lambda$onResume$8(Lcom/coleta/ambientuus/domain/model/SyncState;)V
    .locals 2
    .param p1, "status"    # Lcom/coleta/ambientuus/domain/model/SyncState;

    .line 231
    const-string v0, "TESTE"

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/SyncState;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    sget-object v0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$3;->$SwitchMap$com$coleta$ambientuus$domain$model$SyncState:[I

    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/SyncState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/16 v1, 0x8

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 245
    :pswitch_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 246
    const-string v0, "Erro ao sincronizar"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 238
    :pswitch_1
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 240
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initScreen()V

    .line 242
    goto :goto_0

    .line 234
    :pswitch_2
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 235
    nop

    .line 249
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private prepareRecyclerView()Landroidx/recyclerview/widget/RecyclerView;
    .locals 2

    .line 211
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->refreshPontoColeta(Ljava/lang/Boolean;)V

    .line 212
    sget v1, Lcom/coleta/ambientuus/R$id;->rv_PontoColeta:I

    invoke-virtual {p0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->listagemPontoColeta:Landroidx/recyclerview/widget/RecyclerView;

    .line 213
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->listagemPontoColeta:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 214
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->listagemPontoColeta:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v1, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 215
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->listagemPontoColeta:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 216
    new-instance v0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetas:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;-><init>(Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    .line 217
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->actionOnAdpaterClick(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;)V

    .line 219
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->listagemPontoColeta:Landroidx/recyclerview/widget/RecyclerView;

    return-object v0
.end method

.method private refreshPontoColeta(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "isChecked"    # Ljava/lang/Boolean;

    .line 318
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 319
    new-instance v0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->selectPontoColetaPendente()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetas:Ljava/util/ArrayList;

    goto :goto_0

    .line 321
    :cond_0
    new-instance v0, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->db:Lcom/coleta/ambientuus/database/DatabaseHelper;

    invoke-virtual {v1}, Lcom/coleta/ambientuus/database/DatabaseHelper;->getDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;-><init>(Landroid/database/sqlite/SQLiteDatabase;)V

    invoke-virtual {v0}, Lcom/coleta/ambientuus/database/managers/PontoColetaTableManager;->selectPontoColeta()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->pontoColetas:Ljava/util/ArrayList;

    .line 323
    :goto_0
    return-void
.end method

.method private refreshRecyclerView(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/coleta/ambientuus/dto/PontoColeta;",
            ">;)V"
        }
    .end annotation

    .line 326
    .local p1, "pontoColetas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/coleta/ambientuus/dto/PontoColeta;>;"
    new-instance v0, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    invoke-direct {v0, p1}, Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;-><init>(Ljava/util/ArrayList;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    .line 327
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    invoke-direct {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->actionOnAdpaterClick(Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;)V

    .line 328
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->listagemPontoColeta:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->adapter:Lcom/coleta/ambientuus/adapters/PontoColetaAdapter;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 329
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "saveInstanceState"    # Landroid/os/Bundle;

    .line 57
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 58
    sget v0, Lcom/coleta/ambientuus/R$layout;->activity_listagem_ponto_coleta:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->setContentView(I)V

    .line 59
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->getSupportActionBar()Landroidx/appcompat/app/ActionBar;

    move-result-object v0

    sget v1, Lcom/coleta/ambientuus/R$mipmap;->ic_launcher:I

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/ActionBar;->setIcon(I)V

    .line 61
    sget v0, Lcom/coleta/ambientuus/R$id;->layoutAguarde:I

    invoke-virtual {p0, v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    .line 62
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->layoutAguarde:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 63
    invoke-static {p0}, Lcom/coleta/ambientuus/utils/SyncStatus;->clearObservars(Landroidx/lifecycle/LifecycleOwner;)V

    .line 64
    invoke-static {}, Lcom/coleta/ambientuus/utils/SyncStatus;->getStatus()Landroidx/lifecycle/LiveData;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, p0, v1}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 85
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .line 89
    invoke-super {p0, p1}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 90
    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;->initScreen()V

    .line 91
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 255
    invoke-super {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onPause()V

    .line 256
    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 228
    invoke-super {p0}, Lcom/coleta/ambientuus/activities/main/BaseActivity;->onResume()V

    .line 229
    invoke-static {p0}, Lcom/coleta/ambientuus/utils/SyncStatus;->clearObservars(Landroidx/lifecycle/LifecycleOwner;)V

    .line 230
    invoke-static {}, Lcom/coleta/ambientuus/utils/SyncStatus;->getStatus()Landroidx/lifecycle/LiveData;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/pontoColeta/ListagemPontoColetaActivity;)V

    invoke-virtual {v0, p0, v1}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 250
    return-void
.end method
