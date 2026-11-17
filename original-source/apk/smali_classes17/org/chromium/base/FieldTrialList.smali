.class public Lorg/chromium/base/FieldTrialList;
.super Ljava/lang/Object;
.source "FieldTrialList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/FieldTrialList$Natives;
    }
.end annotation

.annotation runtime Lorg/chromium/build/annotations/MainDex;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFieldTrial(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;
    .param p1, "groupName"    # Ljava/lang/String;

    .line 59
    invoke-static {}, Lorg/chromium/base/FieldTrialListJni;->get()Lorg/chromium/base/FieldTrialList$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/FieldTrialList$Natives;->createFieldTrial(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static findFullName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;

    .line 24
    invoke-static {}, Lorg/chromium/base/FieldTrialListJni;->get()Lorg/chromium/base/FieldTrialList$Natives;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/base/FieldTrialList$Natives;->findFullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVariationParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;
    .param p1, "parameterKey"    # Ljava/lang/String;

    .line 41
    invoke-static {}, Lorg/chromium/base/FieldTrialListJni;->get()Lorg/chromium/base/FieldTrialList$Natives;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/chromium/base/FieldTrialList$Natives;->getVariationParameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static logActiveTrials()V
    .locals 1

    .line 49
    invoke-static {}, Lorg/chromium/base/FieldTrialListJni;->get()Lorg/chromium/base/FieldTrialList$Natives;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/base/FieldTrialList$Natives;->logActiveTrials()V

    .line 50
    return-void
.end method

.method public static trialExists(Ljava/lang/String;)Z
    .locals 1
    .param p0, "trialName"    # Ljava/lang/String;

    .line 32
    invoke-static {}, Lorg/chromium/base/FieldTrialListJni;->get()Lorg/chromium/base/FieldTrialList$Natives;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/chromium/base/FieldTrialList$Natives;->trialExists(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
