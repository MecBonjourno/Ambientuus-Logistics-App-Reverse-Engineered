.class Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;
.super Landroid/widget/ArrayAdapter;
.source "SearchableSpinnerDialogHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->showDialog(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Ljava/util/function/Function;Landroid/widget/TextView;Ljava/lang/String;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

.field final synthetic val$InitValue:Ljava/lang/String;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$itemToString:Ljava/util/function/Function;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;Landroid/content/Context;ILjava/util/List;Landroid/content/Context;Ljava/util/function/Function;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "resource"    # I

    .line 74
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;"
    .local p4, "objects":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->this$0:Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;

    iput-object p5, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->val$context:Landroid/content/Context;

    iput-object p6, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->val$itemToString:Ljava/util/function/Function;

    iput-object p7, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->val$InitValue:Ljava/lang/String;

    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 85
    .local p0, "this":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;, "Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;"
    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 86
    iget-object v1, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->val$context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x1090003

    invoke-virtual {v1, v2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 87
    new-instance v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;

    invoke-direct {v1}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;-><init>()V

    .line 88
    .local v1, "holder":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;
    const v2, 0x1020014

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;->textView:Landroid/widget/TextView;

    .line 89
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 91
    .end local v1    # "holder":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;
    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;

    .line 94
    .restart local v1    # "holder":Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;
    :goto_0
    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    .line 95
    .local v2, "item":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_3

    .line 96
    const/4 v3, 0x0

    .line 97
    .local v3, "itemText":Ljava/lang/String;
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x18

    if-lt v4, v5, :cond_1

    .line 98
    iget-object v4, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->val$itemToString:Ljava/util/function/Function;

    invoke-interface {v4, v2}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v3, v4

    check-cast v3, Ljava/lang/String;

    .line 100
    :cond_1
    iget-object v4, v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    iget-object v4, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1;->val$InitValue:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 104
    iget-object v0, v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;->textView:Landroid/widget/TextView;

    const/16 v4, 0x55

    const/16 v5, 0x3d

    const/16 v6, 0x50

    const/4 v7, 0x1

    invoke-static {v6, v7, v4, v5}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setBackgroundColor(I)V

    goto :goto_1

    .line 106
    :cond_2
    iget-object v4, v1, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$1$ViewHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 110
    .end local v3    # "itemText":Ljava/lang/String;
    :cond_3
    :goto_1
    return-object p2
.end method
