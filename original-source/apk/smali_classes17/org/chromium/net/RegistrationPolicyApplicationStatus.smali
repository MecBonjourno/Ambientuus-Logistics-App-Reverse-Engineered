.class public Lorg/chromium/net/RegistrationPolicyApplicationStatus;
.super Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;
.source "RegistrationPolicyApplicationStatus.java"

# interfaces
.implements Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;


# instance fields
.field private mDestroyed:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;-><init>()V

    return-void
.end method


# virtual methods
.method protected destroy()V
    .locals 1

    .line 27
    iget-boolean v0, p0, Lorg/chromium/net/RegistrationPolicyApplicationStatus;->mDestroyed:Z

    if-eqz v0, :cond_0

    return-void

    .line 28
    :cond_0
    invoke-static {p0}, Lorg/chromium/base/ApplicationStatus;->unregisterApplicationStateListener(Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;)V

    .line 29
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/chromium/net/RegistrationPolicyApplicationStatus;->mDestroyed:Z

    .line 30
    return-void
.end method

.method protected init(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V
    .locals 1
    .param p1, "notifier"    # Lorg/chromium/net/NetworkChangeNotifierAutoDetect;

    .line 20
    invoke-super {p0, p1}, Lorg/chromium/net/NetworkChangeNotifierAutoDetect$RegistrationPolicy;->init(Lorg/chromium/net/NetworkChangeNotifierAutoDetect;)V

    .line 21
    invoke-static {p0}, Lorg/chromium/base/ApplicationStatus;->registerApplicationStateListener(Lorg/chromium/base/ApplicationStatus$ApplicationStateListener;)V

    .line 22
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/chromium/net/RegistrationPolicyApplicationStatus;->onApplicationStateChange(I)V

    .line 23
    return-void
.end method

.method public onApplicationStateChange(I)V
    .locals 1
    .param p1, "newState"    # I

    .line 38
    invoke-static {}, Lorg/chromium/base/ApplicationStatus;->hasVisibleActivities()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {p0}, Lorg/chromium/net/RegistrationPolicyApplicationStatus;->register()V

    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {p0}, Lorg/chromium/net/RegistrationPolicyApplicationStatus;->unregister()V

    .line 43
    :goto_0
    return-void
.end method
