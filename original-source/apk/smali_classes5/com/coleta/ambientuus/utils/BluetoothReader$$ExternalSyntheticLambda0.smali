.class public final synthetic Lcom/coleta/ambientuus/utils/BluetoothReader$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/coleta/ambientuus/utils/BluetoothReader;

.field public final synthetic f$1:Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;


# direct methods
.method public synthetic constructor <init>(Lcom/coleta/ambientuus/utils/BluetoothReader;Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader$$ExternalSyntheticLambda0;->f$0:Lcom/coleta/ambientuus/utils/BluetoothReader;

    iput-object p2, p0, Lcom/coleta/ambientuus/utils/BluetoothReader$$ExternalSyntheticLambda0;->f$1:Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/coleta/ambientuus/utils/BluetoothReader$$ExternalSyntheticLambda0;->f$0:Lcom/coleta/ambientuus/utils/BluetoothReader;

    iget-object v1, p0, Lcom/coleta/ambientuus/utils/BluetoothReader$$ExternalSyntheticLambda0;->f$1:Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/utils/BluetoothReader;->$r8$lambda$tOYadpXGFtjXB-t1IhpFcZZlstU(Lcom/coleta/ambientuus/utils/BluetoothReader;Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;)V

    return-void
.end method
