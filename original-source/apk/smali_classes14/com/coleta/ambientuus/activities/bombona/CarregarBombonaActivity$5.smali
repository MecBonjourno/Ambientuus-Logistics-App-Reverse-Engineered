.class Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$5;
.super Ljava/lang/Object;
.source "CarregarBombonaActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;->verificaBombona(Ljava/lang/String;Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    .line 158
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity$5;->this$0:Lcom/coleta/ambientuus/activities/bombona/CarregarBombonaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 160
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 161
    return-void
.end method
