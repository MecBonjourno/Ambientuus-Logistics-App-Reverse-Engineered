.class public Lcom/coleta/ambientuus/utils/PesagemPreferences;
.super Ljava/lang/Object;
.source "PesagemPreferences.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;
    }
.end annotation


# static fields
.field private static final CHAVE_TIPO:Ljava/lang/String; = "TIPO_PESAGEM"

.field private static final PREF_NAME:Ljava/lang/String; = "TIPO_PESAGEM"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static deleteTipoPesagem(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .line 19
    const/4 v0, 0x0

    const-string v1, "TIPO_PESAGEM"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 20
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 21
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 22
    return-void
.end method

.method static synthetic lambda$verifyPreferences$0(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "callback"    # Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 49
    sget-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->MANUAL:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-static {p0, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->salvarTipoPesagem(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    .line 50
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 51
    sget-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->MANUAL:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-interface {p1, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;->onTipoPesagemSelecionado(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    .line 52
    return-void
.end method

.method static synthetic lambda$verifyPreferences$1(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "callback"    # Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .line 54
    sget-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-static {p0, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->salvarTipoPesagem(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    .line 55
    invoke-interface {p2}, Landroid/content/DialogInterface;->dismiss()V

    .line 56
    sget-object v0, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->BLUETOOTH:Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    invoke-interface {p1, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;->onTipoPesagemSelecionado(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    .line 57
    return-void
.end method

.method public static obterTipoPesagem(Landroid/content/Context;)Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 32
    const/4 v0, 0x0

    const-string v1, "TIPO_PESAGEM"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 33
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 34
    .local v1, "valor":Ljava/lang/String;
    invoke-static {v1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->fromString(Ljava/lang/String;)Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    move-result-object v2

    .line 35
    .local v2, "tipo":Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    return-object v2
.end method

.method public static salvarTipoPesagem(Landroid/content/Context;Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "tipo"    # Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    .line 26
    const/4 v0, 0x0

    const-string v1, "TIPO_PESAGEM"

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 27
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-virtual {p1}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 28
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 29
    return-void
.end method

.method public static verifyPreferences(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;)V
    .locals 9
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "callback"    # Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;

    .line 39
    invoke-static {p0}, Lcom/coleta/ambientuus/utils/PesagemPreferences;->obterTipoPesagem(Landroid/content/Context;)Lcom/coleta/ambientuus/domain/model/TipoPesagem;

    move-result-object v0

    .line 41
    .local v0, "tipo":Lcom/coleta/ambientuus/domain/model/TipoPesagem;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/coleta/ambientuus/domain/model/TipoPesagem;->getValor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 60
    :cond_0
    invoke-interface {p1, v0}, Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;->onTipoPesagemSelecionado(Lcom/coleta/ambientuus/domain/model/TipoPesagem;)V

    move-object v2, p0

    goto :goto_1

    .line 42
    :cond_1
    :goto_0
    new-instance v7, Lcom/coleta/ambientuus/utils/PesagemPreferences$$ExternalSyntheticLambda0;

    invoke-direct {v7, p0, p1}, Lcom/coleta/ambientuus/utils/PesagemPreferences$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;)V

    new-instance v8, Lcom/coleta/ambientuus/utils/PesagemPreferences$$ExternalSyntheticLambda1;

    invoke-direct {v8, p0, p1}, Lcom/coleta/ambientuus/utils/PesagemPreferences$$ExternalSyntheticLambda1;-><init>(Landroid/content/Context;Lcom/coleta/ambientuus/utils/PesagemPreferences$TipoPesagemCallback;)V

    const-string v3, "Selecionar Tipo de Coleta"

    const-string v4, "Como deseja realizar a pesagem?"

    const-string v5, "Manual"

    const-string v6, "Bluetooth"

    move-object v2, p0

    .end local p0    # "context":Landroid/content/Context;
    .local v2, "context":Landroid/content/Context;
    invoke-static/range {v2 .. v8}, Lcom/coleta/ambientuus/ui/MaterialAlertUtil;->mostrarConfirmacao(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    .line 62
    :goto_1
    return-void
.end method
