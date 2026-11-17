.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$2;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    .line 152
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$2;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 154
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$2;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const-string v1, "\u00c9 necess\u00e1rio ligar Bluetooth e a Localiza\u00e7\u00e3o do celular!"

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->-$$Nest$mmsg(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Ljava/lang/String;)V

    .line 155
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 156
    return-void
.end method
