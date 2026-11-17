.class Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$1;
.super Landroidx/activity/OnBackPressedCallback;
.source "ReaderLeitorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;
    .param p2, "enabled"    # Z

    .line 50
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    invoke-direct {p0, p2}, Landroidx/activity/OnBackPressedCallback;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public handleOnBackPressed()V
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$1;->this$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    invoke-virtual {v0}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->finish()V

    .line 54
    return-void
.end method
