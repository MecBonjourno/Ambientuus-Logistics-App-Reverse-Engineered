.class public final synthetic Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

.field public final synthetic f$1:Lcom/google/common/util/concurrent/ListenableFuture;


# direct methods
.method public synthetic constructor <init>(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda1;->f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda1;->f$1:Lcom/google/common/util/concurrent/ListenableFuture;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda1;->f$0:Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity$$ExternalSyntheticLambda1;->f$1:Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;->$r8$lambda$rgaEXwlv3Y6NHwu9wCYk9CoAD4A(Lcom/coleta/ambientuus/activities/pontoColeta/ReaderLeitorActivity;Lcom/google/common/util/concurrent/ListenableFuture;)V

    return-void
.end method
