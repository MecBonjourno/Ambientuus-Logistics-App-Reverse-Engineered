.class Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$1;
.super Ljava/lang/Object;
.source "ColetarActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->onPermissionGranted(Lcom/karumi/dexter/listener/PermissionGrantedResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;

.field final synthetic val$e:Ljava/io/IOException;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;Ljava/io/IOException;)V
    .locals 0
    .param p1, "this$2"    # Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1011
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$1;->this$2:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$1;->val$e:Ljava/io/IOException;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1014
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$1;->this$2:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ConnectBT$1$1;->val$e:Ljava/io/IOException;

    .line 1015
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1014
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1016
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1017
    return-void
.end method
