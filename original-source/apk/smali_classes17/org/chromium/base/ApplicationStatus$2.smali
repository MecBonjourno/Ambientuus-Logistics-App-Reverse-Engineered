.class Lorg/chromium/base/ApplicationStatus$2;
.super Ljava/lang/Object;
.source "ApplicationStatus.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/chromium/base/ApplicationStatus;->initialize(Landroid/app/Application;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 339
    const-class v0, Lorg/chromium/base/ApplicationStatus;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 339
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private checkCallback(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 383
    sget-boolean v0, Lorg/chromium/build/BuildConfig;->ENABLE_ASSERTS:Z

    if-eqz v0, :cond_1

    .line 384
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/ApplicationStatus;->reachesWindowCallback(Landroid/view/Window$Callback;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 386
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .line 342
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$smonStateChange(Landroid/app/Activity;I)V

    .line 343
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v0

    .line 344
    .local v0, "callback":Landroid/view/Window$Callback;
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-static {p1, v0}, Lorg/chromium/base/ApplicationStatus;->createWindowCallbackProxy(Landroid/app/Activity;Landroid/view/Window$Callback;)Landroid/view/Window$Callback;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 345
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 349
    const/4 v0, 0x6

    invoke-static {p1, v0}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$smonStateChange(Landroid/app/Activity;I)V

    .line 350
    invoke-direct {p0, p1}, Lorg/chromium/base/ApplicationStatus$2;->checkCallback(Landroid/app/Activity;)V

    .line 351
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 355
    const/4 v0, 0x4

    invoke-static {p1, v0}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$smonStateChange(Landroid/app/Activity;I)V

    .line 356
    invoke-direct {p0, p1}, Lorg/chromium/base/ApplicationStatus$2;->checkCallback(Landroid/app/Activity;)V

    .line 357
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 361
    const/4 v0, 0x3

    invoke-static {p1, v0}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$smonStateChange(Landroid/app/Activity;I)V

    .line 362
    invoke-direct {p0, p1}, Lorg/chromium/base/ApplicationStatus$2;->checkCallback(Landroid/app/Activity;)V

    .line 363
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .line 367
    invoke-direct {p0, p1}, Lorg/chromium/base/ApplicationStatus$2;->checkCallback(Landroid/app/Activity;)V

    .line 368
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 372
    const/4 v0, 0x2

    invoke-static {p1, v0}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$smonStateChange(Landroid/app/Activity;I)V

    .line 373
    invoke-direct {p0, p1}, Lorg/chromium/base/ApplicationStatus$2;->checkCallback(Landroid/app/Activity;)V

    .line 374
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .line 378
    const/4 v0, 0x5

    invoke-static {p1, v0}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$smonStateChange(Landroid/app/Activity;I)V

    .line 379
    invoke-direct {p0, p1}, Lorg/chromium/base/ApplicationStatus$2;->checkCallback(Landroid/app/Activity;)V

    .line 380
    return-void
.end method
