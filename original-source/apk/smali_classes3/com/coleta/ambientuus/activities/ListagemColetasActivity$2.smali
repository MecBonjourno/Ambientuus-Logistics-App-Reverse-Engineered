.class Lcom/coleta/ambientuus/activities/ListagemColetasActivity$2;
.super Ljava/lang/Object;
.source "ListagemColetasActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->createDialogGroup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/ListagemColetasActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/ListagemColetasActivity;

    .line 290
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$2;->this$0:Lcom/coleta/ambientuus/activities/ListagemColetasActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 293
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ListagemColetasActivity$2;->this$0:Lcom/coleta/ambientuus/activities/ListagemColetasActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ListagemColetasActivity;->-$$Nest$fgetdialog(Lcom/coleta/ambientuus/activities/ListagemColetasActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 294
    return-void
.end method
