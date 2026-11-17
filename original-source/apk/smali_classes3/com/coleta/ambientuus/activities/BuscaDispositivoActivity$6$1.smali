.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6$1;
.super Ljava/lang/Object;
.source "BuscaDispositivoActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;

    .line 356
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 359
    new-instance v0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6$1;->this$1:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$6;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity-IA;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$SearchDevices;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 360
    return-void
.end method
