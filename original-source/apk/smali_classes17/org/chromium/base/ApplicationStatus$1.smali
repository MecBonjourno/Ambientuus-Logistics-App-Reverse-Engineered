.class Lorg/chromium/base/ApplicationStatus$1;
.super Ljava/lang/Object;
.source "ApplicationStatus.java"

# interfaces
.implements Lorg/chromium/base/ApplicationStatus$WindowFocusChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/chromium/base/ApplicationStatus;->initialize(Landroid/app/Application;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 324
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onWindowFocusChanged(Landroid/app/Activity;Z)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "hasFocus"    # Z

    .line 327
    if-eqz p2, :cond_2

    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$sfgetsActivity()Landroid/app/Activity;

    move-result-object v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 329
    :cond_0
    invoke-static {p1}, Lorg/chromium/base/ApplicationStatus;->getStateForActivity(Landroid/app/Activity;)I

    move-result v0

    .line 331
    .local v0, "state":I
    const/4 v1, 0x6

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    .line 332
    invoke-static {p1}, Lorg/chromium/base/ApplicationStatus;->-$$Nest$sfputsActivity(Landroid/app/Activity;)V

    .line 336
    :cond_1
    return-void

    .line 327
    .end local v0    # "state":I
    :cond_2
    :goto_0
    return-void
.end method
