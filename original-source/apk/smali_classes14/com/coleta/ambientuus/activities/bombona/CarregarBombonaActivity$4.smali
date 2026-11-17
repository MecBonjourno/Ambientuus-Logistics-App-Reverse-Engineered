.class Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;
.super Ljava/lang/Object;
.source "CarregarBombonaActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->digitarBombona()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

.field final synthetic val$imm:Landroid/view/inputmethod/InputMethodManager;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;Landroid/view/inputmethod/InputMethodManager;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 111
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    iput-object p3, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 114
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$4;->val$input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 115
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 116
    return-void
.end method
