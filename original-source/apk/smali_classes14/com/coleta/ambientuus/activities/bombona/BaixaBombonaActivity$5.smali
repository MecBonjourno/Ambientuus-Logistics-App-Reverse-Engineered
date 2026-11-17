.class Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$5;
.super Ljava/lang/Object;
.source "BaixaBombonaActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;->verificaBombona(Ljava/lang/String;Landroid/content/DialogInterface;)V
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

    .line 159
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity$5;->this$0:Lcom/coleta/ambientuus/activities/bombona/BaixaBombonaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 161
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 162
    return-void
.end method
