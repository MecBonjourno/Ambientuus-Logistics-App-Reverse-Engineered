.class public interface abstract Lcom/coleta/ambientuus/utils/BluetoothReader$OnReadListener;
.super Ljava/lang/Object;
.source "BluetoothReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/utils/BluetoothReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnReadListener"
.end annotation


# virtual methods
.method public abstract onError(Ljava/lang/Exception;)V
.end method

.method public abstract onRead(Ljava/lang/String;)V
.end method
