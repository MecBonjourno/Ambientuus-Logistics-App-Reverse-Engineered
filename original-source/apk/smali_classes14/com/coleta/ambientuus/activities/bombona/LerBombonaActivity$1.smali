.class Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;
.super Ljava/lang/Object;
.source "LerBombonaActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    .line 78
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 81
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;->-$$Nest$fgetspinnerClienteBombonaSel(Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    const-string v1, "Selecione um cliente para destinar a Bombona"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 83
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 84
    .end local v0    # "toast":Landroid/widget/Toast;
    goto :goto_0

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity;

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1$1;-><init>(Lcom/coleta/ambientuus/activities/bombona/LerBombonaActivity$1;)V

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 102
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 104
    :goto_0
    return-void
.end method
