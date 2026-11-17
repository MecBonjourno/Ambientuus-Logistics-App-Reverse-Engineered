.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    .line 121
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "arg0"    # Landroid/view/View;

    .line 124
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 125
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    const-string v1, "Voc\u00ea est\u00e1 com o Bluetooth e Localiza\u00e7\u00e3o do Celular ligado?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 126
    new-instance v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$1;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;)V

    const/4 v2, -0x1

    const-string v3, "Sim"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 151
    new-instance v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$2;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2$2;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$2;)V

    const/4 v2, -0x2

    const-string v3, "N\u00e3o"

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 158
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 159
    return-void
.end method
