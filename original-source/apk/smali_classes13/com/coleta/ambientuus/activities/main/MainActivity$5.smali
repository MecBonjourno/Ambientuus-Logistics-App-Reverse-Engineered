.class Lcom/coleta/ambientuus/activities/main/MainActivity$5;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/main/MainActivity;->createDialogSenha()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/main/MainActivity;

    .line 713
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$5;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 716
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$5;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/main/MainActivity;->-$$Nest$fgetdialog(Lcom/coleta/ambientuus/activities/main/MainActivity;)Landroidx/appcompat/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss()V

    .line 717
    return-void
.end method
