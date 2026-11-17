.class Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
.super Ljava/lang/Object;
.source "CachingUmaRecorder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/chromium/base/metrics/CachingUmaRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Histogram"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram$Type;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final MAX_SAMPLE_COUNT:I = 0x100


# instance fields
.field private final mMax:I

.field private final mMin:I

.field private final mName:Ljava/lang/String;

.field private final mNumBuckets:I

.field private final mSamples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mType:I


# direct methods
.method static bridge synthetic -$$Nest$fgetmSamples(Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 55
    const-class v0, Lorg/chromium/base/metrics/CachingUmaRecorder;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;III)V
    .locals 3
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "min"    # I
    .param p4, "max"    # I
    .param p5, "numBuckets"    # I

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    if-nez p3, :cond_0

    if-nez p4, :cond_0

    if-nez p5, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Histogram type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " must have no min/max/buckets set"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 120
    :cond_1
    :goto_0
    iput p1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mType:I

    .line 121
    iput-object p2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mName:Ljava/lang/String;

    .line 122
    iput p3, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMin:I

    .line 123
    iput p4, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMax:I

    .line 124
    iput p5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mNumBuckets:I

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    .line 127
    return-void
.end method


# virtual methods
.method declared-synchronized addSample(ILjava/lang/String;IIII)Z
    .locals 2
    .param p1, "type"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "sample"    # I
    .param p4, "min"    # I
    .param p5, "max"    # I
    .param p6, "numBuckets"    # I

    monitor-enter p0

    .line 145
    :try_start_0
    iget v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mType:I

    if-ne v0, p1, :cond_5

    .line 146
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mName:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 147
    iget v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMin:I

    if-ne v0, p4, :cond_3

    .line 148
    iget v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMax:I

    if-ne v0, p5, :cond_2

    .line 149
    iget v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mNumBuckets:I

    if-ne v0, p6, :cond_1

    .line 150
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x100

    if-ge v0, v1, :cond_0

    .line 155
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    monitor-exit p0

    const/4 v0, 0x1

    return v0

    .line 152
    .end local p0    # "this":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "Histogram exceeded sample cache size limit"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 149
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 148
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 147
    :cond_3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 146
    :cond_4
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 145
    :cond_5
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 144
    .end local p1    # "type":I
    .end local p2    # "name":Ljava/lang/String;
    .end local p3    # "sample":I
    .end local p4    # "min":I
    .end local p5    # "max":I
    .end local p6    # "numBuckets":I
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method declared-synchronized flushTo(Lorg/chromium/base/metrics/UmaRecorder;)I
    .locals 14
    .param p1, "recorder"    # Lorg/chromium/base/metrics/UmaRecorder;

    monitor-enter p0

    .line 166
    :try_start_0
    iget v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mType:I

    packed-switch v0, :pswitch_data_0

    .line 192
    .end local p0    # "this":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    move-object v2, p1

    .end local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .local v2, "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    goto/16 :goto_6

    .line 186
    .end local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .restart local p0    # "this":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    .restart local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    :pswitch_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 187
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 188
    .local v1, "sample":I
    iget-object v2, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mName:Ljava/lang/String;

    invoke-interface {p1, v2, v1}, Lorg/chromium/base/metrics/UmaRecorder;->recordSparseHistogram(Ljava/lang/String;I)V

    .line 186
    .end local v1    # "sample":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 190
    .end local v0    # "i":I
    .end local p0    # "this":Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;
    :cond_0
    move-object v2, p1

    goto/16 :goto_5

    .line 180
    :pswitch_1
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 181
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    move v4, v1

    .line 182
    .local v4, "sample":I
    iget-object v3, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mName:Ljava/lang/String;

    iget v5, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMin:I

    iget v6, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMax:I

    iget v7, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mNumBuckets:I

    move-object v2, p1

    .end local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .restart local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    invoke-interface/range {v2 .. v7}, Lorg/chromium/base/metrics/UmaRecorder;->recordLinearHistogram(Ljava/lang/String;IIII)V

    .line 180
    .end local v4    # "sample":I
    add-int/lit8 v0, v0, 0x1

    move-object p1, v2

    goto :goto_1

    .end local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .restart local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    :cond_1
    move-object v2, p1

    .line 184
    .end local v0    # "i":I
    .end local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .restart local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    goto :goto_5

    .line 174
    .end local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .restart local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    :pswitch_2
    move-object v2, p1

    .end local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .restart local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    const/4 p1, 0x0

    .local p1, "i":I
    :goto_2
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 175
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 176
    .local v10, "sample":I
    iget-object v9, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mName:Ljava/lang/String;

    iget v11, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMin:I

    iget v12, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mMax:I

    iget v13, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mNumBuckets:I

    move-object v8, v2

    .end local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .local v8, "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    invoke-interface/range {v8 .. v13}, Lorg/chromium/base/metrics/UmaRecorder;->recordExponentialHistogram(Ljava/lang/String;IIII)V

    .line 174
    .end local v8    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .end local v10    # "sample":I
    .restart local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    .line 178
    .end local p1    # "i":I
    :cond_2
    goto :goto_5

    .line 168
    .end local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .local p1, "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    :pswitch_3
    move-object v2, p1

    .end local p1    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    .restart local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    const/4 p1, 0x0

    .local p1, "i":I
    :goto_3
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_4

    .line 169
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 170
    .local v0, "sample":I
    iget-object v1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mName:Ljava/lang/String;

    if-eqz v0, :cond_3

    const/4 v3, 0x1

    goto :goto_4

    :cond_3
    const/4 v3, 0x0

    :goto_4
    invoke-interface {v2, v1, v3}, Lorg/chromium/base/metrics/UmaRecorder;->recordBooleanHistogram(Ljava/lang/String;Z)V

    .line 168
    .end local v0    # "sample":I
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    .line 172
    .end local p1    # "i":I
    :cond_4
    nop

    .line 194
    :goto_5
    iget-object p1, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    .line 195
    .local p1, "count":I
    iget-object v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mSamples:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    monitor-exit p0

    return p1

    .line 192
    .end local p1    # "count":I
    :goto_6
    :try_start_1
    new-instance p1, Ljava/lang/AssertionError;

    iget v0, p0, Lorg/chromium/base/metrics/CachingUmaRecorder$Histogram;->mType:I

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown histogram type "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 165
    .end local v2    # "recorder":Lorg/chromium/base/metrics/UmaRecorder;
    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
