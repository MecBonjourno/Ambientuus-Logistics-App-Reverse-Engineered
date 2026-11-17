.class Lcom/coleta/ambientuus/activities/ColetarActivity$3;
.super Ljava/lang/Object;
.source "ColetarActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity;->initFields()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final handler:Landroid/os/Handler;

.field runnable:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;


# direct methods
.method public static synthetic $r8$lambda$swR_xvcee0yJmYZ-mKDfiJA20Ag(Lcom/coleta/ambientuus/activities/ColetarActivity$3;Landroid/text/Editable;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->lambda$afterTextChanged$0(Landroid/text/Editable;)V

    return-void
.end method

.method constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;)V
    .locals 1
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/ColetarActivity;

    .line 353
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 354
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->handler:Landroid/os/Handler;

    .line 355
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->runnable:Ljava/lang/Runnable;

    return-void
.end method

.method private synthetic lambda$afterTextChanged$0(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .line 371
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 372
    .local v0, "textoFinal":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 373
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1, v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$monEtiquetaSelect(Lcom/coleta/ambientuus/activities/ColetarActivity;Ljava/lang/String;)V

    .line 374
    :cond_0
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .param p1, "s"    # Landroid/text/Editable;

    .line 370
    new-instance v0, Lcom/coleta/ambientuus/activities/ColetarActivity$3$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity$3$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/ColetarActivity$3;Landroid/text/Editable;)V

    iput-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->runnable:Ljava/lang/Runnable;

    .line 375
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->runnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 376
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 359
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 2
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .line 363
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->runnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 364
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$3;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 366
    :cond_0
    return-void
.end method
