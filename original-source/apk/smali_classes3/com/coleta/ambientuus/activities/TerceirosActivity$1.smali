.class Lcom/coleta/ambientuus/activities/TerceirosActivity$1;
.super Ljava/lang/Object;
.source "TerceirosActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/TerceirosActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/TerceirosActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/TerceirosActivity;

    .line 87
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 90
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->-$$Nest$fgetspinnerTerceirosBombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->-$$Nest$fgetspinnerTerceirosBombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->-$$Nest$fgetspinnerTerceirosBombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x0

    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->-$$Nest$fputspinnerTerceirosBombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity;Ljava/lang/Integer;)V

    .line 91
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity;->-$$Nest$fgetspinnerTerceirosBombonaSel(Lcom/coleta/ambientuus/activities/TerceirosActivity;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_2

    .line 92
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    const-string v1, "Selecione um terceiro para destinar a Bombona"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 93
    .local v0, "toast":Landroid/widget/Toast;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 94
    .end local v0    # "toast":Landroid/widget/Toast;
    goto :goto_2

    .line 95
    :cond_2
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$1;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity;

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/TerceirosActivity$1$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$1$1;-><init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$1;)V

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 112
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 114
    :goto_2
    return-void
.end method
