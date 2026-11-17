.class Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;
.super Ljava/lang/Object;
.source "OneShotCallback.java"

# interfaces
.implements Lorg/chromium/base/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/supplier/OneShotCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallbackWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/chromium/base/Callback<",
        "TE;>;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lorg/chromium/base/supplier/OneShotCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    const-class v0, Lorg/chromium/base/supplier/OneShotCallback;

    return-void
.end method

.method private constructor <init>(Lorg/chromium/base/supplier/OneShotCallback;)V
    .locals 0

    .line 48
    .local p0, "this":Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;, "Lorg/chromium/base/supplier/OneShotCallback<TE;>.CallbackWrapper;"
    iput-object p1, p0, Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;->this$0:Lorg/chromium/base/supplier/OneShotCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/chromium/base/supplier/OneShotCallback;Lorg/chromium/base/supplier/OneShotCallback-IA;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;-><init>(Lorg/chromium/base/supplier/OneShotCallback;)V

    return-void
.end method


# virtual methods
.method public synthetic bind(Ljava/lang/Object;)Ljava/lang/Runnable;
    .locals 0

    invoke-static {p0, p1}, Lorg/chromium/base/Callback$-CC;->$default$bind(Lorg/chromium/base/Callback;Ljava/lang/Object;)Ljava/lang/Runnable;

    move-result-object p1

    return-object p1
.end method

.method public onResult(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 51
    .local p0, "this":Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;, "Lorg/chromium/base/supplier/OneShotCallback<TE;>.CallbackWrapper;"
    .local p1, "result":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;->this$0:Lorg/chromium/base/supplier/OneShotCallback;

    invoke-static {v0}, Lorg/chromium/base/supplier/OneShotCallback;->-$$Nest$fgetmCallback(Lorg/chromium/base/supplier/OneShotCallback;)Lorg/chromium/base/Callback;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    .line 52
    iget-object v0, p0, Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;->this$0:Lorg/chromium/base/supplier/OneShotCallback;

    invoke-static {v0}, Lorg/chromium/base/supplier/OneShotCallback;->-$$Nest$fgetmWeakSupplier(Lorg/chromium/base/supplier/OneShotCallback;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/chromium/base/supplier/ObservableSupplier;

    .line 53
    .local v0, "supplier":Lorg/chromium/base/supplier/ObservableSupplier;, "Lorg/chromium/base/supplier/ObservableSupplier<TE;>;"
    if-eqz v0, :cond_0

    .line 55
    iget-object v1, p0, Lorg/chromium/base/supplier/OneShotCallback$CallbackWrapper;->this$0:Lorg/chromium/base/supplier/OneShotCallback;

    invoke-static {v1}, Lorg/chromium/base/supplier/OneShotCallback;->-$$Nest$fgetmCallbackWrapper(Lorg/chromium/base/supplier/OneShotCallback;)Lorg/chromium/base/Callback;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/chromium/base/supplier/ObservableSupplier;->removeObserver(Lorg/chromium/base/Callback;)V

    .line 56
    return-void

    .line 53
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "This can only be called by supplier, which should not be null."

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
