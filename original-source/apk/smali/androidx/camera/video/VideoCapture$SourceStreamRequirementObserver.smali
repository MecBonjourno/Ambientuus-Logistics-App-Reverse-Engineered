.class Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;
.super Ljava/lang/Object;
.source "VideoCapture.java"

# interfaces
.implements Landroidx/camera/core/impl/Observable$Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/video/VideoCapture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SourceStreamRequirementObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/Observable$Observer<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

.field private mIsSourceStreamRequired:Z


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraControlInternal;)V
    .locals 1
    .param p1, "cameraControl"    # Landroidx/camera/core/impl/CameraControlInternal;

    .line 999
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 997
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mIsSourceStreamRequired:Z

    .line 1000
    iput-object p1, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    .line 1001
    return-void
.end method

.method private updateVideoUsageInCamera(Z)V
    .locals 2
    .param p1, "isRequired"    # Z

    .line 1017
    iget-boolean v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mIsSourceStreamRequired:Z

    if-ne v0, p1, :cond_0

    .line 1018
    return-void

    .line 1020
    :cond_0
    iput-boolean p1, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mIsSourceStreamRequired:Z

    .line 1021
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    if-eqz v0, :cond_2

    .line 1022
    iget-boolean v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mIsSourceStreamRequired:Z

    if-eqz v0, :cond_1

    .line 1023
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraControlInternal;->incrementVideoUsage()V

    goto :goto_0

    .line 1025
    :cond_1
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraControlInternal;->decrementVideoUsage()V

    goto :goto_0

    .line 1028
    :cond_2
    const-string v0, "VideoCapture"

    const-string v1, "SourceStreamRequirementObserver#isSourceStreamRequired: Received new data despite being closed already"

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1032
    :goto_0
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1040
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    const-string v1, "SourceStreamRequirementObserver can be closed from main thread only"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1043
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SourceStreamRequirementObserver#close: mIsSourceStreamRequired = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mIsSourceStreamRequired:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VideoCapture"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1046
    iget-object v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    if-nez v0, :cond_0

    .line 1047
    const-string v0, "SourceStreamRequirementObserver#close: Already closed!"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1048
    return-void

    .line 1052
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->updateVideoUsageInCamera(Z)V

    .line 1053
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->mCameraControl:Landroidx/camera/core/impl/CameraControlInternal;

    .line 1054
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .line 1013
    const-string v0, "VideoCapture"

    const-string v1, "SourceStreamRequirementObserver#onError"

    invoke-static {v0, v1, p1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1014
    return-void
.end method

.method public onNewData(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/Boolean;

    .line 1006
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->isMainThread()Z

    move-result v0

    const-string v1, "SourceStreamRequirementObserver can be updated from main thread only"

    invoke-static {v0, v1}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 1008
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, p1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-direct {p0, v0}, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->updateVideoUsageInCamera(Z)V

    .line 1009
    return-void
.end method

.method public bridge synthetic onNewData(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 994
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Landroidx/camera/video/VideoCapture$SourceStreamRequirementObserver;->onNewData(Ljava/lang/Boolean;)V

    return-void
.end method
