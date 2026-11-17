.class Lcom/coleta/ambientuus/activities/TerceirosActivity$3;
.super Ljava/lang/Object;
.source "TerceirosActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/TerceirosActivity;->digitarBombona()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

.field final synthetic val$imm:Landroid/view/inputmethod/InputMethodManager;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;Landroid/view/inputmethod/InputMethodManager;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/TerceirosActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    iput-object p3, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;->val$input:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 138
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;->val$imm:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;->val$input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 139
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$3;->val$input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->verificaBombona(Ljava/lang/String;Landroid/content/DialogInterface;)V

    .line 140
    return-void
.end method
