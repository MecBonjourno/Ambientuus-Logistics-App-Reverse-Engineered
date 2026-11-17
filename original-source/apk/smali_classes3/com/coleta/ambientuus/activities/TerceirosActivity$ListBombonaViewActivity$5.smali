.class Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$5;
.super Ljava/lang/Object;
.source "TerceirosActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->createDialogGroup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    .line 426
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$5;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 429
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity$5;->this$0:Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;->-$$Nest$fgetdialog(Lcom/coleta/ambientuus/activities/TerceirosActivity$ListBombonaViewActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 430
    return-void
.end method
