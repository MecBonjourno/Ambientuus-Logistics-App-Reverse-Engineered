.class Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "LeitorEtiquetaActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;
    .param p2, "enabled"    # Z

    .line 28
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;->-$$Nest$fgetscannerView(Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;)Lme/dm7/barcodescanner/zxing/ZXingScannerView;

    move-result-object v0

    invoke-virtual {v0}, Lme/dm7/barcodescanner/zxing/ZXingScannerView;->stopCamera()V

    .line 32
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/LeitorEtiquetaActivity;->finish()V

    .line 33
    return-void
.end method
