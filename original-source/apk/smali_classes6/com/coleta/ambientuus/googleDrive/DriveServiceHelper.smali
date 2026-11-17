.class public Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
.super Ljava/lang/Object;
.source "DriveServiceHelper.java"


# static fields
.field private static final REQUEST_AUTHORIZATION:I = 0x3e9

.field public static TAG:Ljava/lang/String;


# instance fields
.field private final account:Landroid/accounts/Account;

.field private final activity:Landroid/app/Activity;

.field private final dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

.field private final mContext:Landroid/content/Context;

.field private final mDriveService:Lcom/google/api/services/drive/Drive;

.field private final mExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method public static synthetic $r8$lambda$0GvtphzFAFjEzfS4uLJ6_kCOC6A(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;ILjava/lang/Void;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->lambda$deleteFilesSequentially$5(Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;ILjava/lang/Void;)V

    return-void
.end method

.method public static synthetic $r8$lambda$2GoT-5KnGbpL6_EEAmxvC8HqXpE(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;ILjava/lang/Exception;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->lambda$deleteFilesSequentially$6(Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;ILjava/lang/Exception;)V

    return-void
.end method

.method public static synthetic $r8$lambda$8vTiYRlFeAZA3cifK-GZpHkXY5s(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Landroid/content/Intent;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->lambda$listFiles$2(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic $r8$lambda$CKSmiUjGU-P_QHRn6RH5iN53RXU(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/lang/String;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->lambda$deleteFile$4(Ljava/lang/String;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method

.method public static synthetic $r8$lambda$XFJ6IaouQYHNlfvrYNnfgACs4_0(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->lambda$listFiles$3(Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method

.method public static synthetic $r8$lambda$mn97X04JPzMhTcia87IIQM91cQk(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/api/client/http/ByteArrayContent;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->lambda$createFile$0(Lcom/google/api/client/http/ByteArrayContent;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void
.end method

.method public static synthetic $r8$lambda$oHHPsfumqgpxRpAL0m2IewAo-jM(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/api/services/drive/model/FileList;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->lambda$cleanOldFiles$7(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/api/services/drive/model/FileList;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 42
    const-string v0, "DriveServiceHelper"

    sput-object v0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/google/api/services/drive/Drive;Landroid/content/Context;Landroid/accounts/Account;Lcom/coleta/ambientuus/ui/ProgressDialogHelper;Landroid/app/Activity;)V
    .locals 1
    .param p1, "driveService"    # Lcom/google/api/services/drive/Drive;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "account"    # Landroid/accounts/Account;
    .param p4, "dialogHelper"    # Lcom/coleta/ambientuus/ui/ProgressDialogHelper;
    .param p5, "activity"    # Landroid/app/Activity;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mExecutor:Ljava/util/concurrent/Executor;

    .line 49
    iput-object p1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mDriveService:Lcom/google/api/services/drive/Drive;

    .line 50
    iput-object p2, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mContext:Landroid/content/Context;

    .line 51
    iput-object p3, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->account:Landroid/accounts/Account;

    .line 52
    iput-object p4, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    .line 53
    iput-object p5, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->activity:Landroid/app/Activity;

    .line 54
    return-void
.end method

.method private createFile(Lcom/google/api/client/http/ByteArrayContent;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .param p1, "dbExport"    # Lcom/google/api/client/http/ByteArrayContent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/api/client/http/ByteArrayContent;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 75
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 77
    .local v0, "taskCompletionSource":Lcom/google/android/gms/tasks/TaskCompletionSource;, "Lcom/google/android/gms/tasks/TaskCompletionSource<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, p1, v0}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda5;-><init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/api/client/http/ByteArrayContent;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 127
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    return-object v1
.end method

.method private deleteFilesSequentially(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;I)V
    .locals 7
    .param p1, "driveHelper"    # Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
    .param p3, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    .local p2, "fileIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-lt p3, v0, :cond_0

    .line 184
    return-void

    .line 187
    :cond_0
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    .line 188
    .local v3, "fileId":Ljava/lang/String;
    invoke-virtual {p1, v3}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->deleteFile(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda7;

    move-object v2, p0

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    .end local p1    # "driveHelper":Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
    .end local p2    # "fileIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local p3    # "index":I
    .local v4, "driveHelper":Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
    .local v5, "fileIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v6, "index":I
    invoke-direct/range {v1 .. v6}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda7;-><init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;I)V

    .line 189
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v1, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda8;

    invoke-direct/range {v1 .. v6}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda8;-><init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;I)V

    .line 197
    invoke-virtual {p1, v1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    .line 205
    return-void
.end method

.method private synthetic lambda$cleanOldFiles$7(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/api/services/drive/model/FileList;)V
    .locals 9
    .param p1, "driveHelper"    # Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
    .param p2, "fileList"    # Lcom/google/api/services/drive/model/FileList;

    .line 209
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 210
    .local v0, "dateFormat":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 212
    .local v1, "today":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 213
    .local v2, "filesToDelete":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p2}, Lcom/google/api/services/drive/model/FileList;->getFiles()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/api/services/drive/model/File;

    .line 215
    .local v4, "file":Lcom/google/api/services/drive/model/File;
    :try_start_0
    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getCreatedTime()Lcom/google/api/client/util/DateTime;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/api/client/util/DateTime;->toString()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0xa

    invoke-virtual {v6, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 216
    .local v5, "createdDateStr":Ljava/lang/String;
    const-string v6, "-"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 218
    .local v6, "fileDate":I
    sub-int v7, v1, v6

    const/16 v8, 0x1e

    if-lt v7, v8, :cond_0

    .line 219
    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 223
    .end local v5    # "createdDateStr":Ljava/lang/String;
    .end local v6    # "fileDate":I
    :cond_0
    goto :goto_1

    .line 221
    :catch_0
    move-exception v5

    .line 222
    .local v5, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->TAG:Ljava/lang/String;

    const-string v7, "Erro ao processar data do arquivo"

    invoke-static {v6, v7, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 224
    .end local v4    # "file":Lcom/google/api/services/drive/model/File;
    .end local v5    # "e":Ljava/lang/Exception;
    :goto_1
    goto :goto_0

    .line 226
    :cond_1
    :try_start_1
    invoke-direct {p0, p1, v2, v5}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->deleteFilesSequentially(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 229
    nop

    .line 230
    return-void

    .line 227
    :catch_1
    move-exception v3

    .line 228
    .local v3, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method static synthetic lambda$cleanOldFiles$8(Ljava/lang/Exception;)V
    .locals 2
    .param p0, "e"    # Ljava/lang/Exception;

    .line 231
    sget-object v0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->TAG:Ljava/lang/String;

    const-string v1, "Erro ao listar arquivos"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 232
    return-void
.end method

.method private synthetic lambda$createFile$0(Lcom/google/api/client/http/ByteArrayContent;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 7
    .param p1, "dbExport"    # Lcom/google/api/client/http/ByteArrayContent;
    .param p2, "taskCompletionSource"    # Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 79
    :try_start_0
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 80
    .local v0, "deviceName":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 81
    :cond_0
    const-string v1, "Device"
    :try_end_0
    .catch Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-object v0, v1

    .line 86
    :cond_1
    :try_start_1
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd_MM_yyyy_HH_mm_ss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 87
    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 90
    .local v1, "timestamp":Ljava/lang/String;
    goto :goto_0

    .line 88
    .end local v1    # "timestamp":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 89
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    move-object v1, v2

    .line 92
    .local v1, "timestamp":Ljava/lang/String;
    :goto_0
    const-string v2, "%s_%s.db"

    const-string v3, "[^a-zA-Z0-9.-]"

    const-string v4, "_"

    .line 93
    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const/4 v3, 0x1

    aput-object v1, v4, v3

    .line 92
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, "filename":Ljava/lang/String;
    new-instance v3, Lcom/google/api/services/drive/model/File;

    invoke-direct {v3}, Lcom/google/api/services/drive/model/File;-><init>()V

    const-string v4, "root"

    .line 98
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/api/services/drive/model/File;->setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;

    move-result-object v3

    const-string v4, "application/x-sqlite3"

    .line 99
    invoke-virtual {v3, v4}, Lcom/google/api/services/drive/model/File;->setMimeType(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v3

    .line 100
    invoke-virtual {v3, v2}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    move-result-object v3

    .line 102
    .local v3, "metadata":Lcom/google/api/services/drive/model/File;
    iget-object v4, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v4}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v4

    invoke-virtual {v4, v3, p1}, Lcom/google/api/services/drive/Drive$Files;->create(Lcom/google/api/services/drive/model/File;Lcom/google/api/client/http/AbstractInputStreamContent;)Lcom/google/api/services/drive/Drive$Files$Create;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/api/services/drive/Drive$Files$Create;->execute()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/api/services/drive/model/File;
    :try_end_2
    .catch Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 104
    .local v4, "googleFile":Lcom/google/api/services/drive/model/File;
    :try_start_3
    iget-object v5, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v5}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v5

    invoke-virtual {v5, v3, p1}, Lcom/google/api/services/drive/Drive$Files;->create(Lcom/google/api/services/drive/model/File;Lcom/google/api/client/http/AbstractInputStreamContent;)Lcom/google/api/services/drive/Drive$Files$Create;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/api/services/drive/Drive$Files$Create;->execute()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/api/services/drive/model/File;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-object v4, v5

    .line 107
    goto :goto_1

    .line 105
    :catch_1
    move-exception v5

    .line 106
    .local v5, "e":Ljava/io/IOException;
    :try_start_4
    invoke-virtual {p2, v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 108
    .end local v5    # "e":Ljava/io/IOException;
    :goto_1
    if-nez v4, :cond_2

    .line 109
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Null result when requesting file creation."

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_2

    .line 111
    :cond_2
    invoke-virtual {v4}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2, v5}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_4
    .catch Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    .line 122
    .end local v0    # "deviceName":Ljava/lang/String;
    .end local v1    # "timestamp":Ljava/lang/String;
    .end local v2    # "filename":Ljava/lang/String;
    .end local v3    # "metadata":Lcom/google/api/services/drive/model/File;
    .end local v4    # "googleFile":Lcom/google/api/services/drive/model/File;
    :catch_2
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_3

    .line 113
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v0

    .line 114
    .local v0, "e":Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;
    const-string v1, "Permiss\u00e3o necess\u00e1ria para acessar o Drive."

    const-string v2, "DriveServiceHelper"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    invoke-virtual {v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 116
    .local v1, "intent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 117
    .local v3, "context":Landroid/content/Context;
    instance-of v4, v3, Landroid/app/Activity;

    if-eqz v4, :cond_3

    .line 118
    move-object v2, v3

    check-cast v2, Landroid/app/Activity;

    const/16 v4, 0x3e9

    invoke-virtual {v2, v1, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_2

    .line 120
    :cond_3
    const-string v4, "Contexto n\u00e3o \u00e9 uma Activity. N\u00e3o foi poss\u00edvel solicitar permiss\u00e3o."

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .end local v0    # "e":Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v3    # "context":Landroid/content/Context;
    :goto_2
    nop

    .line 125
    :goto_3
    return-void
.end method

.method private synthetic lambda$deleteFile$4(Ljava/lang/String;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 2
    .param p1, "fileID"    # Ljava/lang/String;
    .param p2, "taskCompletionSource"    # Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 170
    :try_start_0
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/api/services/drive/Drive$Files;->delete(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Delete;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Delete;->execute()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    nop

    .line 174
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    .line 175
    return-void

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private synthetic lambda$deleteFilesSequentially$5(Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;ILjava/lang/Void;)V
    .locals 3
    .param p1, "fileId"    # Ljava/lang/String;
    .param p2, "driveHelper"    # Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
    .param p3, "fileIds"    # Ljava/util/List;
    .param p4, "index"    # I
    .param p5, "aVoid"    # Ljava/lang/Void;

    .line 190
    sget-object v0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Arquivo deletado: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    add-int/lit8 v0, p4, 0x1

    :try_start_0
    invoke-direct {p0, p2, p3, v0}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->deleteFilesSequentially(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    nop

    .line 196
    return-void

    .line 193
    :catch_0
    move-exception v0

    .line 194
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private synthetic lambda$deleteFilesSequentially$6(Ljava/lang/String;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;ILjava/lang/Exception;)V
    .locals 3
    .param p1, "fileId"    # Ljava/lang/String;
    .param p2, "driveHelper"    # Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
    .param p3, "fileIds"    # Ljava/util/List;
    .param p4, "index"    # I
    .param p5, "e"    # Ljava/lang/Exception;

    .line 198
    sget-object v0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Falha ao deletar arquivo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 200
    add-int/lit8 v0, p4, 0x1

    :try_start_0
    invoke-direct {p0, p2, p3, v0}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->deleteFilesSequentially(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/util/List;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 203
    nop

    .line 204
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 202
    .local v0, "ex":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private synthetic lambda$listFiles$2(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .line 154
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->activity:Landroid/app/Activity;

    const/16 v1, 0x3e9

    invoke-virtual {v0, p1, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private synthetic lambda$listFiles$3(Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 4
    .param p1, "taskCompletionSource"    # Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 145
    :try_start_0
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files;->list()Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v0

    const-string v1, "drive"

    .line 146
    invoke-virtual {v0, v1}, Lcom/google/api/services/drive/Drive$Files$List;->setSpaces(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v0

    const-string v1, "files(createdTime,id,name)"

    .line 147
    invoke-virtual {v0, v1}, Lcom/google/api/services/drive/Drive$Files$List;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v0

    .line 148
    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$List;->execute()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/FileList;

    .line 150
    .local v0, "result":Lcom/google/api/services/drive/model/FileList;
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "result":Lcom/google/api/services/drive/model/FileList;
    goto :goto_0

    .line 156
    :catch_0
    move-exception v0

    .line 157
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    goto :goto_1

    .line 151
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 152
    .local v0, "urae":Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;
    invoke-virtual {v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 153
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->activity:Landroid/app/Activity;

    new-instance v3, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0, v1}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda6;-><init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Landroid/content/Intent;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 158
    .end local v0    # "urae":Lcom/google/api/client/googleapis/extensions/android/gms/auth/UserRecoverableAuthIOException;
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    nop

    .line 159
    :goto_1
    return-void
.end method

.method static synthetic lambda$performBackup$1(Ljava/lang/Exception;)V
    .locals 2
    .param p0, "exception"    # Ljava/lang/Exception;

    .line 137
    sget-object v0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->TAG:Ljava/lang/String;

    const-string v1, "N\u00e3o foi possivel criar arquivo."

    invoke-static {v0, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method private performBackup(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;)V
    .locals 3
    .param p1, "driveHelper"    # Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

    .line 132
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    const-string v1, "Exportando banco de dados"

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->updateMessage(Ljava/lang/String;)V

    .line 133
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mContext:Landroid/content/Context;

    const-string v1, "bf_app_ambientus.db"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->exportDatabase(Ljava/lang/String;)Lcom/google/api/client/http/ByteArrayContent;

    move-result-object v0

    .line 135
    .local v0, "dbExport":Lcom/google/api/client/http/ByteArrayContent;
    iget-object v1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    const-string v2, "Iniciando cria\u00e7\u00e3o do arquivo no Drive"

    invoke-virtual {v1, v2}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->updateMessage(Ljava/lang/String;)V

    .line 136
    invoke-direct {p1, v0}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->createFile(Lcom/google/api/client/http/ByteArrayContent;)Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    new-instance v2, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda0;-><init>()V

    .line 137
    invoke-virtual {v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    .line 138
    return-void
.end method


# virtual methods
.method public backupDatabase()V
    .locals 8

    .line 236
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mContext:Landroid/content/Context;

    .line 238
    const-string v1, "https://www.googleapis.com/auth/drive.file"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    .line 236
    invoke-static {v0, v1}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->usingOAuth2(Landroid/content/Context;Ljava/util/Collection;)Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    move-result-object v0

    .line 241
    .local v0, "credential":Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;
    iget-object v1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->account:Landroid/accounts/Account;

    invoke-virtual {v0, v1}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->setSelectedAccount(Landroid/accounts/Account;)Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    .line 243
    new-instance v1, Lcom/google/api/services/drive/Drive$Builder;

    .line 244
    invoke-static {}, Lcom/google/api/client/extensions/android/http/AndroidHttp;->newCompatibleTransport()Lcom/google/api/client/http/HttpTransport;

    move-result-object v2

    new-instance v3, Lcom/google/api/client/json/gson/GsonFactory;

    invoke-direct {v3}, Lcom/google/api/client/json/gson/GsonFactory;-><init>()V

    invoke-direct {v1, v2, v3, v0}, Lcom/google/api/services/drive/Drive$Builder;-><init>(Lcom/google/api/client/http/HttpTransport;Lcom/google/api/client/json/JsonFactory;Lcom/google/api/client/http/HttpRequestInitializer;)V

    .line 247
    const-string v2, "Coleta Ambientus"

    invoke-virtual {v1, v2}, Lcom/google/api/services/drive/Drive$Builder;->setApplicationName(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Builder;

    move-result-object v1

    .line 248
    invoke-virtual {v1}, Lcom/google/api/services/drive/Drive$Builder;->build()Lcom/google/api/services/drive/Drive;

    move-result-object v3

    .line 250
    .local v3, "googleDriveService":Lcom/google/api/services/drive/Drive;
    new-instance v2, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

    iget-object v4, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->account:Landroid/accounts/Account;

    iget-object v6, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    iget-object v7, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->activity:Landroid/app/Activity;

    invoke-direct/range {v2 .. v7}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;-><init>(Lcom/google/api/services/drive/Drive;Landroid/content/Context;Landroid/accounts/Account;Lcom/coleta/ambientuus/ui/ProgressDialogHelper;Landroid/app/Activity;)V

    .line 255
    .local v2, "driveHelper":Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;
    invoke-direct {p0, v2}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->performBackup(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;)V

    .line 257
    iget-object v1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->dialogHelper:Lcom/coleta/ambientuus/ui/ProgressDialogHelper;

    const-string v4, "Limpando arquivos antigos"

    invoke-virtual {v1, v4}, Lcom/coleta/ambientuus/ui/ProgressDialogHelper;->updateMessage(Ljava/lang/String;)V

    .line 258
    invoke-virtual {p0, v2}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->cleanOldFiles(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;)V

    .line 259
    return-void
.end method

.method public cleanOldFiles(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;)V
    .locals 2
    .param p1, "driveHelper"    # Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;

    .line 208
    invoke-virtual {p1}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->listFiles()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda2;-><init>()V

    .line 230
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnFailureListener(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/android/gms/tasks/Task;

    .line 233
    return-void
.end method

.method public deleteFile(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .param p1, "fileID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 166
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 168
    .local v0, "taskCompletionSource":Lcom/google/android/gms/tasks/TaskCompletionSource;, "Lcom/google/android/gms/tasks/TaskCompletionSource<Ljava/lang/Void;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, p1, v0}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda3;-><init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Ljava/lang/String;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 177
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    return-object v1
.end method

.method public exportDatabase(Ljava/lang/String;)Lcom/google/api/client/http/ByteArrayContent;
    .locals 6
    .param p1, "dbPath"    # Ljava/lang/String;

    .line 56
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 58
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 59
    .local v1, "dbFile":Ljava/io/File;
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 61
    .local v2, "fis":Ljava/io/FileInputStream;
    const/16 v3, 0x400

    new-array v3, v3, [B

    .line 63
    .local v3, "buffer":[B
    :goto_0
    invoke-virtual {v2, v3}, Ljava/io/FileInputStream;->read([B)I

    move-result v4

    move v5, v4

    .local v5, "length":I
    if-lez v4, :cond_0

    .line 64
    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .end local v1    # "dbFile":Ljava/io/File;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v3    # "buffer":[B
    .end local v5    # "length":I
    goto :goto_1

    .line 67
    :catch_0
    move-exception v1

    .line 68
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 71
    .end local v1    # "e":Ljava/io/IOException;
    :goto_1
    new-instance v1, Lcom/google/api/client/http/ByteArrayContent;

    const-string v2, "application/x-sqlite3"

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/api/client/http/ByteArrayContent;-><init>(Ljava/lang/String;[B)V

    return-object v1
.end method

.method public listFiles()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/api/services/drive/model/FileList;",
            ">;"
        }
    .end annotation

    .line 141
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 143
    .local v0, "taskCompletionSource":Lcom/google/android/gms/tasks/TaskCompletionSource;, "Lcom/google/android/gms/tasks/TaskCompletionSource<Lcom/google/api/services/drive/model/FileList;>;"
    iget-object v1, p0, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;->mExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, v0}, Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper$$ExternalSyntheticLambda4;-><init>(Lcom/coleta/ambientuus/googleDrive/DriveServiceHelper;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 161
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v1

    return-object v1
.end method
