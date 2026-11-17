.class public final synthetic Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/ArrayAdapter;

.field public final synthetic f$1:Landroid/widget/TextView;

.field public final synthetic f$2:Ljava/util/function/Function;

.field public final synthetic f$3:Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;

.field public final synthetic f$4:Landroid/app/Dialog;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ArrayAdapter;Landroid/widget/TextView;Ljava/util/function/Function;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;Landroid/app/Dialog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$0:Landroid/widget/ArrayAdapter;

    iput-object p2, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$1:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$2:Ljava/util/function/Function;

    iput-object p4, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$3:Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;

    iput-object p5, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$4:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 10

    .line 0
    iget-object v0, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$0:Landroid/widget/ArrayAdapter;

    iget-object v1, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$1:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$2:Ljava/util/function/Function;

    iget-object v3, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$3:Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;

    iget-object v4, p0, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$$ExternalSyntheticLambda0;->f$4:Landroid/app/Dialog;

    move-object v5, p1

    move-object v6, p2

    move v7, p3

    move-wide v8, p4

    invoke-static/range {v0 .. v9}, Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper;->lambda$showDialog$0(Landroid/widget/ArrayAdapter;Landroid/widget/TextView;Ljava/util/function/Function;Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;Landroid/app/Dialog;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
