.class final Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;
.super Ljava/lang/Object;
.source "CameraPresenseProvider.kt"

# interfaces
.implements Landroidx/camera/core/impl/Observable$Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/CameraPresenceProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SourceObservableObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/impl/Observable$Observer<",
        "Ljava/util/List<",
        "+",
        "Landroidx/camera/core/CameraIdentifier;",
        ">;>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCameraPresenseProvider.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CameraPresenseProvider.kt\nandroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,351:1\n1557#2:352\n1628#2,3:353\n1557#2:356\n1628#2,3:357\n*S KotlinDebug\n*F\n+ 1 CameraPresenseProvider.kt\nandroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver\n*L\n109#1:352\n109#1:353,3\n119#1:356\n119#1:357,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0003\n\u0000\u0008\u0082\u0004\u0018\u00002\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0018\u0010\u0006\u001a\u00020\u00072\u000e\u0010\u0008\u001a\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0002H\u0016J\u0010\u0010\t\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000bH\u0016\u00a8\u0006\u000c"
    }
    d2 = {
        "Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;",
        "Landroidx/camera/core/impl/Observable$Observer;",
        "",
        "Landroidx/camera/core/CameraIdentifier;",
        "<init>",
        "(Landroidx/camera/core/impl/CameraPresenceProvider;)V",
        "onNewData",
        "",
        "rawCameraIdentifiers",
        "onError",
        "t",
        "",
        "camera-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/core/impl/CameraPresenceProvider;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/CameraPresenceProvider;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/core/impl/CameraPresenceProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 103
    iput-object p1, p0, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->this$0:Landroidx/camera/core/impl/CameraPresenceProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    const-string/jumbo v0, "t"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->this$0:Landroidx/camera/core/impl/CameraPresenceProvider;

    invoke-static {v0}, Landroidx/camera/core/impl/CameraPresenceProvider;->access$isMonitoring$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 125
    :cond_0
    const-string v0, "CameraPresencePrvdr"

    const-string v1, "Error from source camera presence observable. Triggering refresh."

    invoke-static {v0, v1, p1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 126
    iget-object v0, p0, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->this$0:Landroidx/camera/core/impl/CameraPresenceProvider;

    invoke-static {v0}, Landroidx/camera/core/impl/CameraPresenceProvider;->access$getSourcePresenceObservable$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Landroidx/camera/core/impl/Observable;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroidx/camera/core/impl/Observable;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    .line 127
    :cond_1
    return-void
.end method

.method public bridge synthetic onNewData(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .line 103
    move-object v0, p1

    check-cast v0, Ljava/util/List;

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->onNewData(Ljava/util/List;)V

    return-void
.end method

.method public onNewData(Ljava/util/List;)V
    .locals 17
    .param p1, "rawCameraIdentifiers"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/CameraIdentifier;",
            ">;)V"
        }
    .end annotation

    .line 105
    move-object/from16 v1, p0

    iget-object v0, v1, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->this$0:Landroidx/camera/core/impl/CameraPresenceProvider;

    invoke-static {v0}, Landroidx/camera/core/impl/CameraPresenceProvider;->access$isMonitoring$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 106
    :cond_0
    iget-object v0, v1, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->this$0:Landroidx/camera/core/impl/CameraPresenceProvider;

    invoke-static {v0}, Landroidx/camera/core/impl/CameraPresenceProvider;->access$getCameraFactory$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Landroidx/camera/core/impl/CameraFactory;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    move-object v2, v0

    .line 109
    .local v2, "factory":Landroidx/camera/core/impl/CameraFactory;
    const/16 v0, 0xa

    if-eqz p1, :cond_3

    move-object/from16 v3, p1

    check-cast v3, Ljava/lang/Iterable;

    .local v3, "$this$map$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 352
    .local v4, "$i$f$map":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-static {v3, v0}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v5, Ljava/util/Collection;

    .local v5, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v3

    .local v6, "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 353
    .local v7, "$i$f$mapTo":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 354
    .local v9, "item$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Landroidx/camera/core/CameraIdentifier;

    .local v10, "it":Landroidx/camera/core/CameraIdentifier;
    const/4 v11, 0x0

    .line 109
    .local v11, "$i$a$-map-CameraPresenceProvider$SourceObservableObserver$onNewData$rawIdStrings$1":I
    invoke-virtual {v10}, Landroidx/camera/core/CameraIdentifier;->getInternalId()Ljava/lang/String;

    move-result-object v10

    .line 354
    .end local v10    # "it":Landroidx/camera/core/CameraIdentifier;
    .end local v11    # "$i$a$-map-CameraPresenceProvider$SourceObservableObserver$onNewData$rawIdStrings$1":I
    invoke-interface {v5, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 355
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    :cond_2
    nop

    .end local v5    # "destination$iv$iv":Ljava/util/Collection;
    .end local v6    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapTo":I
    check-cast v5, Ljava/util/List;

    .line 352
    nop

    .line 109
    .end local v3    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$map":I
    goto :goto_1

    :cond_3
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v5

    .line 110
    .local v5, "rawIdStrings":Ljava/util/List;
    :goto_1
    nop

    .line 111
    :try_start_0
    invoke-interface {v2, v5}, Landroidx/camera/core/impl/CameraFactory;->onCameraIdsUpdated(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    invoke-interface {v2}, Landroidx/camera/core/impl/CameraFactory;->getAvailableCameraIds()Ljava/util/Set;

    move-result-object v3

    const-string v4, "getAvailableCameraIds(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/lang/Iterable;

    .restart local v3    # "$this$map$iv":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 356
    .restart local v4    # "$i$f$map":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-static {v3, v0}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(I)V

    move-object v0, v6

    check-cast v0, Ljava/util/Collection;

    .local v0, "destination$iv$iv":Ljava/util/Collection;
    move-object v6, v3

    .restart local v6    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 357
    .restart local v7    # "$i$f$mapTo":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 358
    .restart local v9    # "item$iv$iv":Ljava/lang/Object;
    move-object v11, v9

    check-cast v11, Ljava/lang/String;

    .local v11, "it":Ljava/lang/String;
    const/16 v16, 0x0

    .line 119
    .local v16, "$i$a$-map-CameraPresenceProvider$SourceObservableObserver$onNewData$newFilteredIds$1":I
    sget-object v10, Landroidx/camera/core/CameraIdentifier;->Companion:Landroidx/camera/core/CameraIdentifier$Companion;

    invoke-static {v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v14, 0x6

    const/4 v15, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v10 .. v15}, Landroidx/camera/core/CameraIdentifier$Companion;->create$default(Landroidx/camera/core/CameraIdentifier$Companion;Ljava/lang/String;Ljava/lang/String;Landroidx/camera/core/impl/Identifier;ILjava/lang/Object;)Landroidx/camera/core/CameraIdentifier;

    move-result-object v10

    .line 358
    .end local v11    # "it":Ljava/lang/String;
    .end local v16    # "$i$a$-map-CameraPresenceProvider$SourceObservableObserver$onNewData$newFilteredIds$1":I
    invoke-interface {v0, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 359
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    :cond_4
    nop

    .end local v0    # "destination$iv$iv":Ljava/util/Collection;
    .end local v6    # "$this$mapTo$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$mapTo":I
    check-cast v0, Ljava/util/List;

    .line 356
    nop

    .line 119
    .end local v3    # "$this$map$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$map":I
    nop

    .line 120
    .local v0, "newFilteredIds":Ljava/util/List;
    iget-object v3, v1, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->this$0:Landroidx/camera/core/impl/CameraPresenceProvider;

    invoke-static {v3, v0}, Landroidx/camera/core/impl/CameraPresenceProvider;->access$processFilteredCameraIdUpdate(Landroidx/camera/core/impl/CameraPresenceProvider;Ljava/util/List;)V

    .line 121
    return-void

    .line 112
    .end local v0    # "newFilteredIds":Ljava/util/List;
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "CameraFactory failed to update. Triggering refresh."

    move-object v4, v0

    check-cast v4, Ljava/lang/Throwable;

    const-string v6, "CameraPresencePrvdr"

    invoke-static {v6, v3, v4}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 114
    iget-object v3, v1, Landroidx/camera/core/impl/CameraPresenceProvider$SourceObservableObserver;->this$0:Landroidx/camera/core/impl/CameraPresenceProvider;

    invoke-static {v3}, Landroidx/camera/core/impl/CameraPresenceProvider;->access$getSourcePresenceObservable$p(Landroidx/camera/core/impl/CameraPresenceProvider;)Landroidx/camera/core/impl/Observable;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-interface {v3}, Landroidx/camera/core/impl/Observable;->fetchData()Lcom/google/common/util/concurrent/ListenableFuture;

    .line 115
    :cond_5
    return-void
.end method
