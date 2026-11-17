.class public final synthetic Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# instance fields
.field public final synthetic f$0:Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

.field public final synthetic f$1:Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;


# direct methods
.method public synthetic constructor <init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda1;->f$0:Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

    iput-object p2, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda1;->f$1:Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/Object;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda1;->f$0:Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

    iget-object v1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda1;->f$1:Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

    check-cast p1, Lcom/google/api/services/drive/model/FileList;

    invoke-static {v0, v1, p1}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->$r8$lambda$oHHPsfumqgpxRpAL0m2IewAo-jM(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/api/services/drive/model/FileList;)V

    return-void
.end method
