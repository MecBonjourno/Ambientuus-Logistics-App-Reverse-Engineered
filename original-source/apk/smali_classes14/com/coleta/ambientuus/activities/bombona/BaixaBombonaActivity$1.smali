.class Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$1;
.super Ljava/lang/Object;
.source "BaixaBombonaActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    .line 64
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 67
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$1;->this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    invoke-static {v0}, Lcom/karumi/dexter/Dexter;->withActivity(Landroid/app/Activity;)Lcom/karumi/dexter/DexterBuilder$Permission;

    move-result-object v0

    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$Permission;->withPermission(Ljava/lang/String;)Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$1$1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$1$1;-><init>(Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$1;)V

    invoke-interface {v0, v1}, Lcom/karumi/dexter/DexterBuilder$SinglePermissionListener;->withListener(Lcom/karumi/dexter/listener/single/PermissionListener;)Lcom/karumi/dexter/DexterBuilder;

    move-result-object v0

    .line 85
    invoke-interface {v0}, Lcom/karumi/dexter/DexterBuilder;->check()V

    .line 86
    return-void
.end method
