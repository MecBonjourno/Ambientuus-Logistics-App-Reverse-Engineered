.class Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;
.super Ljava/lang/Object;
.source "SearchableSpinnerDialogHelper.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

.field final synthetic val$adapter:Landroid/widget/ArrayAdapter;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Landroid/widget/ArrayAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 118
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;"
    iput-object p1, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;->this$0:Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    iput-object p2, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;->val$adapter:Landroid/widget/ArrayAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .line 123
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;"
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .line 119
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;"
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .line 121
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;"
    iget-object v0, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$2;->val$adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v0}, Landroid/widget/ArrayAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    .line 122
    return-void
.end method
