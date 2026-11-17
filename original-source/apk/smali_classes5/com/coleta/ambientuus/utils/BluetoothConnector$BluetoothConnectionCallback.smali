.class public interface abstract Lcom/coleta/ambientuus/utils/BluetoothConnector$BluetoothConnectionCallback;
.super Ljava/lang/Object;
.source "BluetoothConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/utils/BluetoothConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "BluetoothConnectionCallback"
.end annotation


# virtual methods
.method public abstract onConnected(Landroid/bluetooth/BluetoothSocket;)V
.end method

.method public abstract onError(Ljava/lang/String;)V
.end method
