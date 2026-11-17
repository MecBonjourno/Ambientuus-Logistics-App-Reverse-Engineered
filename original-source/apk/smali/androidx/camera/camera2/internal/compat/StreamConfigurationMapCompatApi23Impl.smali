.class Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatApi23Impl;
.super Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;
.source "StreamConfigurationMapCompatApi23Impl.java"


# direct methods
.method constructor <init>(Landroid/hardware/camera2/params/StreamConfigurationMap;)V
    .locals 0
    .param p1, "map"    # Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 31
    invoke-direct {p0, p1}, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatBaseImpl;-><init>(Landroid/hardware/camera2/params/StreamConfigurationMap;)V

    .line 32
    return-void
.end method


# virtual methods
.method public getOutputMinFrameDuration(ILandroid/util/Size;)J
    .locals 2
    .param p1, "format"    # I
    .param p2, "size"    # Landroid/util/Size;

    .line 41
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatApi23Impl;->mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-virtual {v0, p1, p2}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputMinFrameDuration(ILandroid/util/Size;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getOutputSizes(I)[Landroid/util/Size;
    .locals 1
    .param p1, "format"    # I

    .line 36
    iget-object v0, p0, Landroidx/camera/camera2/internal/compat/StreamConfigurationMapCompatApi23Impl;->mStreamConfigurationMap:Landroid/hardware/camera2/params/StreamConfigurationMap;

    invoke-virtual {v0, p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v0

    return-object v0
.end method
