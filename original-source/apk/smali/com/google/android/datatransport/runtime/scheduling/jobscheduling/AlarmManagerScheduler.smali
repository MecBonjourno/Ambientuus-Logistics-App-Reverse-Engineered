.class public Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;
.super Ljava/lang/Object;
.source "AlarmManagerScheduler.java"

# interfaces
.implements Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/WorkScheduler;


# static fields
.field static final ATTEMPT_NUMBER:Ljava/lang/String; = "attemptNumber"

.field static final BACKEND_NAME:Ljava/lang/String; = "backendName"

.field static final EVENT_PRIORITY:Ljava/lang/String; = "priority"

.field static final EXTRAS:Ljava/lang/String; = "extras"

.field private static final LOG_TAG:Ljava/lang/String; = "AlarmManagerScheduler"


# instance fields
.field private alarmManager:Landroid/app/AlarmManager;

.field private final clock:Lcom/google/android/datatransport/runtime/time/Clock;

.field private final config:Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;

.field private final context:Landroid/content/Context;

.field private final eventStore:Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;Landroid/app/AlarmManager;Lcom/google/android/datatransport/runtime/time/Clock;Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;)V
    .locals 0
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "eventStore"    # Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;
    .param p3, "alarmManager"    # Landroid/app/AlarmManager;
    .param p4, "clock"    # Lcom/google/android/datatransport/runtime/time/Clock;
    .param p5, "config"    # Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->context:Landroid/content/Context;

    .line 69
    iput-object p2, p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->eventStore:Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;

    .line 70
    iput-object p3, p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->alarmManager:Landroid/app/AlarmManager;

    .line 71
    iput-object p4, p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->clock:Lcom/google/android/datatransport/runtime/time/Clock;

    .line 72
    iput-object p5, p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->config:Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;

    .line 73
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;Lcom/google/android/datatransport/runtime/time/Clock;Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;)V
    .locals 7
    .param p1, "applicationContext"    # Landroid/content/Context;
    .param p2, "eventStore"    # Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;
    .param p3, "clock"    # Lcom/google/android/datatransport/runtime/time/Clock;
    .param p4, "config"    # Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;

    .line 53
    nop

    .line 56
    const-string v0, "alarm"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/app/AlarmManager;

    .line 53
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    .end local p1    # "applicationContext":Landroid/content/Context;
    .end local p2    # "eventStore":Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;
    .end local p3    # "clock":Lcom/google/android/datatransport/runtime/time/Clock;
    .end local p4    # "config":Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;
    .local v2, "applicationContext":Landroid/content/Context;
    .local v3, "eventStore":Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;
    .local v5, "clock":Lcom/google/android/datatransport/runtime/time/Clock;
    .local v6, "config":Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;
    invoke-direct/range {v1 .. v6}, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;-><init>(Landroid/content/Context;Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;Landroid/app/AlarmManager;Lcom/google/android/datatransport/runtime/time/Clock;Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;)V

    .line 59
    return-void
.end method


# virtual methods
.method isJobServiceOn(Landroid/content/Intent;)Z
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .line 77
    iget-object v0, p0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->context:Landroid/content/Context;

    const/high16 v1, 0x20000000

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method public schedule(Lcom/google/android/datatransport/runtime/TransportContext;I)V
    .locals 1
    .param p1, "transportContext"    # Lcom/google/android/datatransport/runtime/TransportContext;
    .param p2, "attemptNumber"    # I

    .line 82
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->schedule(Lcom/google/android/datatransport/runtime/TransportContext;IZ)V

    .line 83
    return-void
.end method

.method public schedule(Lcom/google/android/datatransport/runtime/TransportContext;IZ)V
    .locals 16
    .param p1, "transportContext"    # Lcom/google/android/datatransport/runtime/TransportContext;
    .param p2, "attemptNumber"    # I
    .param p3, "force"    # Z

    .line 93
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    .line 94
    .local v3, "intentDataBuilder":Landroid/net/Uri$Builder;
    const-string v4, "backendName"

    invoke-virtual {v1}, Lcom/google/android/datatransport/runtime/TransportContext;->getBackendName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 95
    nop

    .line 96
    invoke-virtual {v1}, Lcom/google/android/datatransport/runtime/TransportContext;->getPriority()Lcom/google/android/datatransport/Priority;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/datatransport/runtime/util/PriorityMapping;->toInt(Lcom/google/android/datatransport/Priority;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    .line 95
    const-string/jumbo v5, "priority"

    invoke-virtual {v3, v5, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 97
    invoke-virtual {v1}, Lcom/google/android/datatransport/runtime/TransportContext;->getExtras()[B

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 98
    nop

    .line 99
    invoke-virtual {v1}, Lcom/google/android/datatransport/runtime/TransportContext;->getExtras()[B

    move-result-object v4

    invoke-static {v4, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    .line 98
    const-string v6, "extras"

    invoke-virtual {v3, v6, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 101
    :cond_0
    new-instance v4, Landroid/content/Intent;

    iget-object v6, v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->context:Landroid/content/Context;

    const-class v7, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;

    invoke-direct {v4, v6, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 102
    .local v4, "intent":Landroid/content/Intent;
    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 103
    const-string v6, "attemptNumber"

    invoke-virtual {v4, v6, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 105
    const-string v6, "AlarmManagerScheduler"

    if-nez p3, :cond_1

    invoke-virtual {v0, v4}, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->isJobServiceOn(Landroid/content/Intent;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 106
    const-string v5, "Upload for context %s is already scheduled. Returning..."

    invoke-static {v6, v5, v1}, Lcom/google/android/datatransport/runtime/logging/Logging;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 108
    return-void

    .line 111
    :cond_1
    iget-object v7, v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->eventStore:Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;

    invoke-interface {v7, v1}, Lcom/google/android/datatransport/runtime/scheduling/persistence/EventStore;->getNextCallTime(Lcom/google/android/datatransport/runtime/TransportContext;)J

    move-result-wide v7

    .line 113
    .local v7, "backendTime":J
    iget-object v9, v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->config:Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;

    .line 114
    invoke-virtual {v1}, Lcom/google/android/datatransport/runtime/TransportContext;->getPriority()Lcom/google/android/datatransport/Priority;

    move-result-object v10

    invoke-virtual {v9, v10, v7, v8, v2}, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/SchedulerConfig;->getScheduleDelay(Lcom/google/android/datatransport/Priority;JI)J

    move-result-wide v9

    .line 116
    .local v9, "scheduleDelay":J
    nop

    .line 120
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    .line 121
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    .line 122
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x4

    new-array v14, v14, [Ljava/lang/Object;

    aput-object v1, v14, v5

    const/4 v15, 0x1

    aput-object v11, v14, v15

    const/4 v11, 0x2

    aput-object v12, v14, v11

    const/4 v11, 0x3

    aput-object v13, v14, v11

    .line 116
    const-string v12, "Scheduling upload for context %s in %dms(Backend next call timestamp %d). Attempt %d"

    invoke-static {v6, v12, v14}, Lcom/google/android/datatransport/runtime/logging/Logging;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 124
    iget-object v6, v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->context:Landroid/content/Context;

    invoke-static {v6, v5, v4, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 125
    .local v5, "pendingIntent":Landroid/app/PendingIntent;
    iget-object v6, v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->alarmManager:Landroid/app/AlarmManager;

    iget-object v12, v0, Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerScheduler;->clock:Lcom/google/android/datatransport/runtime/time/Clock;

    .line 126
    invoke-interface {v12}, Lcom/google/android/datatransport/runtime/time/Clock;->getTime()J

    move-result-wide v12

    add-long/2addr v12, v9

    .line 125
    invoke-virtual {v6, v11, v12, v13, v5}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 127
    return-void
.end method
