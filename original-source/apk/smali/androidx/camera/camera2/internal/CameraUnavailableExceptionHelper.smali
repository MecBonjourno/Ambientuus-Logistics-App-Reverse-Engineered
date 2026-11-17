.class public final Landroidx/camera/camera2/internal/CameraUnavailableExceptionHelper;
.super Ljava/lang/Object;
.source "CameraUnavailableExceptionHelper.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFrom(Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;)Landroidx/camera/core/CameraUnavailableException;
    .locals 2
    .param p0, "e"    # Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;

    .line 40
    invoke-virtual {p0}, Landroidx/camera/camera2/internal/compat/CameraAccessExceptionCompat;->getReason()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 60
    const/4 v0, 0x0

    .local v0, "errorCode":I
    goto :goto_0

    .line 57
    .end local v0    # "errorCode":I
    :sswitch_0
    const/4 v0, 0x6

    .line 58
    .restart local v0    # "errorCode":I
    goto :goto_0

    .line 54
    .end local v0    # "errorCode":I
    :sswitch_1
    const/4 v0, 0x5

    .line 55
    .restart local v0    # "errorCode":I
    goto :goto_0

    .line 51
    .end local v0    # "errorCode":I
    :sswitch_2
    const/4 v0, 0x4

    .line 52
    .restart local v0    # "errorCode":I
    goto :goto_0

    .line 48
    .end local v0    # "errorCode":I
    :sswitch_3
    const/4 v0, 0x3

    .line 49
    .restart local v0    # "errorCode":I
    goto :goto_0

    .line 45
    .end local v0    # "errorCode":I
    :sswitch_4
    const/4 v0, 0x2

    .line 46
    .restart local v0    # "errorCode":I
    goto :goto_0

    .line 42
    .end local v0    # "errorCode":I
    :sswitch_5
    const/4 v0, 0x1

    .line 43
    .restart local v0    # "errorCode":I
    nop

    .line 62
    :goto_0
    new-instance v1, Landroidx/camera/core/CameraUnavailableException;

    invoke-direct {v1, v0, p0}, Landroidx/camera/core/CameraUnavailableException;-><init>(ILjava/lang/Throwable;)V

    return-object v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_5
        0x2 -> :sswitch_4
        0x3 -> :sswitch_3
        0x4 -> :sswitch_2
        0x5 -> :sswitch_1
        0x2711 -> :sswitch_0
    .end sparse-switch
.end method
