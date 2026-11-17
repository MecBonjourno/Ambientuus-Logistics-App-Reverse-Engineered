.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$5;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->initList(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

.field final synthetic val$adapter:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 263
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$5;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$5;->val$adapter:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 266
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$5;->val$adapter:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;

    invoke-virtual {v0, p3}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->setSelectedIndex(I)V

    .line 267
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$5;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$fgetmBtnConnect(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 268
    return-void
.end method
