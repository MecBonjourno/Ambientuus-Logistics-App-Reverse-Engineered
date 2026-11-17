.class Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$3;
.super Ljava/lang/Object;
.source "LeitorBombonaActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->insereMovimento(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    .line 183
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$3;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .line 185
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 186
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity$3;->this$0:Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;->-$$Nest$mreiniciaLeitor(Lcom/coleta/ambientuus/activities/bombona/LeitorBombonaActivity;)V

    .line 187
    return-void
.end method
