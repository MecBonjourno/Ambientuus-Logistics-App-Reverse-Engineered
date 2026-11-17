.class public Lcom/coleta/ambientuus/utils/SyncStatus;
.super Ljava/lang/Object;
.source "SyncStatus.java"


# static fields
.field private static final status:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Lcom/coleta/ambientuus/domain/model/SyncState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 10
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    sget-object v1, Lcom/coleta/ambientuus/domain/model/SyncState;->IDLE:Lcom/coleta/ambientuus/domain/model/SyncState;

    invoke-direct {v0, v1}, Landroidx/lifecycle/MutableLiveData;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/coleta/ambientuus/utils/SyncStatus;->status:Landroidx/lifecycle/MutableLiveData;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearObservars(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p0, "owner"    # Landroidx/lifecycle/LifecycleOwner;

    .line 21
    sget-object v0, Lcom/coleta/ambientuus/utils/SyncStatus;->status:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0, p0}, Landroidx/lifecycle/MutableLiveData;->removeObservers(Landroidx/lifecycle/LifecycleOwner;)V

    .line 22
    return-void
.end method

.method public static getStatus()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Lcom/coleta/ambientuus/domain/model/SyncState;",
            ">;"
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/coleta/ambientuus/utils/SyncStatus;->status:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method public static setStatus(Lcom/coleta/ambientuus/domain/model/SyncState;)V
    .locals 1
    .param p0, "value"    # Lcom/coleta/ambientuus/domain/model/SyncState;

    .line 17
    sget-object v0, Lcom/coleta/ambientuus/utils/SyncStatus;->status:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0, p0}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V

    .line 18
    return-void
.end method
