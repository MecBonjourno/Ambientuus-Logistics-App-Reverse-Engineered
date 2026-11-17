.class public Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;
.super Ljava/lang/Object;
.source "AutoFlashAEModeDisabler.java"


# instance fields
.field private final mIsCrashWhenTakingPhotoWithAutoFlashAEModeQuirkEnabled:Z

.field private final mIsImageCaptureFailWithAutoFlashQuirkEnabled:Z


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/Quirks;)V
    .locals 1
    .param p1, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/ImageCaptureFailWithAutoFlashQuirk;

    .line 41
    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/Quirks;->contains(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;->mIsImageCaptureFailWithAutoFlashQuirkEnabled:Z

    .line 42
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/CrashWhenTakingPhotoWithAutoFlashAEModeQuirk;

    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;->mIsCrashWhenTakingPhotoWithAutoFlashAEModeQuirkEnabled:Z

    .line 44
    return-void
.end method


# virtual methods
.method public getCorrectedAeMode(I)I
    .locals 1
    .param p1, "aeMode"    # I

    .line 51
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;->mIsImageCaptureFailWithAutoFlashQuirkEnabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/AutoFlashAEModeDisabler;->mIsCrashWhenTakingPhotoWithAutoFlashAEModeQuirkEnabled:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 54
    const/4 v0, 0x1

    return v0

    .line 56
    :cond_1
    return p1
.end method
