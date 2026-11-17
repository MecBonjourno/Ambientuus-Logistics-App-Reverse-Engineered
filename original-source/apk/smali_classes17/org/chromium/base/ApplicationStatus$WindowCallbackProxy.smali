.class Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;
.super Ljava/lang/Object;
.source "ApplicationStatus.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/ApplicationStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WindowCallbackProxy"
.end annotation


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field private final mCallback:Landroid/view/Window$Callback;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/view/Window$Callback;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "callback"    # Landroid/view/Window$Callback;

    .line 266
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 267
    iput-object p2, p0, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;->mCallback:Landroid/view/Window$Callback;

    .line 268
    iput-object p1, p0, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;->mActivity:Landroid/app/Activity;

    .line 269
    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 273
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onWindowFocusChanged"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    array-length v0, p3

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    aget-object v1, p3, v0

    instance-of v1, v1, Ljava/lang/Boolean;

    if-eqz v1, :cond_0

    .line 275
    aget-object v0, p3, v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;->onWindowFocusChanged(Z)V

    .line 276
    const/4 v0, 0x0

    return-object v0

    .line 279
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;->mCallback:Landroid/view/Window$Callback;

    invoke-virtual {p2, v0, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 280
    :catch_0
    move-exception v0

    .line 287
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/AbstractMethodError;

    if-eqz v1, :cond_1

    .line 288
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    throw v1

    .line 290
    :cond_1
    throw v0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3
    .param p1, "hasFocus"    # Z

    .line 296
    iget-object v0, p0, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;->mCallback:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 298
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$sfgetsWindowFocusListeners()Lorg/chromium/base/ObserverList;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 299
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$sfgetsWindowFocusListeners()Lorg/chromium/base/ObserverList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/base/ObserverList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;

    .line 300
    .local v1, "listener":Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;
    iget-object v2, p0, Lorg/chromium/base/ApplicationStatus$WindowCallbackProxy;->mActivity:Landroid/app/Activity;

    invoke-interface {v1, v2, p1}, Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;->onWindowFocusChanged(Landroid/app/Activity;Z)V

    .line 301
    .end local v1    # "listener":Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;
    goto :goto_0

    .line 303
    :cond_0
    return-void
.end method
