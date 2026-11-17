.class public final Lcom/google/protobuf/ListValue$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "ListValue.java"

# interfaces
.implements Lcom/google/protobuf/ListValueOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/ListValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/protobuf/ListValue;",
        "Lcom/google/protobuf/ListValue$Builder;",
        ">;",
        "Lcom/google/protobuf/ListValueOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 202
    invoke-static {}, Lcom/google/protobuf/ListValue;->access$000()Lcom/google/protobuf/ListValue;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 203
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/ListValue$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/ListValue$1;

    .line 195
    invoke-direct {p0}, Lcom/google/protobuf/ListValue$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllValues(Ljava/lang/Iterable;)Lcom/google/protobuf/ListValue$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/protobuf/Value;",
            ">;)",
            "Lcom/google/protobuf/ListValue$Builder;"
        }
    .end annotation

    .line 287
    .local p1, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lcom/google/protobuf/Value;>;"
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 288
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-static {v0, p1}, Lcom/google/protobuf/ListValue;->access$400(Lcom/google/protobuf/ListValue;Ljava/lang/Iterable;)V

    .line 289
    return-object p0
.end method

.method public addValues(ILcom/google/protobuf/Value$Builder;)Lcom/google/protobuf/ListValue$Builder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "builderForValue"    # Lcom/google/protobuf/Value$Builder;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "builderForValue"
        }
    .end annotation

    .line 277
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 278
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    .line 279
    invoke-virtual {p2}, Lcom/google/protobuf/Value$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v1

    check-cast v1, Lcom/google/protobuf/Value;

    .line 278
    invoke-static {v0, p1, v1}, Lcom/google/protobuf/ListValue;->access$300(Lcom/google/protobuf/ListValue;ILcom/google/protobuf/Value;)V

    .line 280
    return-object p0
.end method

.method public addValues(ILcom/google/protobuf/Value;)Lcom/google/protobuf/ListValue$Builder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lcom/google/protobuf/Value;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "value"
        }
    .end annotation

    .line 259
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 260
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-static {v0, p1, p2}, Lcom/google/protobuf/ListValue;->access$300(Lcom/google/protobuf/ListValue;ILcom/google/protobuf/Value;)V

    .line 261
    return-object p0
.end method

.method public addValues(Lcom/google/protobuf/Value$Builder;)Lcom/google/protobuf/ListValue$Builder;
    .locals 2
    .param p1, "builderForValue"    # Lcom/google/protobuf/Value$Builder;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builderForValue"
        }
    .end annotation

    .line 268
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 269
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-virtual {p1}, Lcom/google/protobuf/Value$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v1

    check-cast v1, Lcom/google/protobuf/Value;

    invoke-static {v0, v1}, Lcom/google/protobuf/ListValue;->access$200(Lcom/google/protobuf/ListValue;Lcom/google/protobuf/Value;)V

    .line 270
    return-object p0
.end method

.method public addValues(Lcom/google/protobuf/Value;)Lcom/google/protobuf/ListValue$Builder;
    .locals 1
    .param p1, "value"    # Lcom/google/protobuf/Value;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 250
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 251
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-static {v0, p1}, Lcom/google/protobuf/ListValue;->access$200(Lcom/google/protobuf/ListValue;Lcom/google/protobuf/Value;)V

    .line 252
    return-object p0
.end method

.method public clearValues()Lcom/google/protobuf/ListValue$Builder;
    .locals 1

    .line 295
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 296
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-static {v0}, Lcom/google/protobuf/ListValue;->access$500(Lcom/google/protobuf/ListValue;)V

    .line 297
    return-object p0
.end method

.method public getValues(I)Lcom/google/protobuf/Value;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 225
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-virtual {v0, p1}, Lcom/google/protobuf/ListValue;->getValues(I)Lcom/google/protobuf/Value;

    move-result-object v0

    return-object v0
.end method

.method public getValuesCount()I
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-virtual {v0}, Lcom/google/protobuf/ListValue;->getValuesCount()I

    move-result v0

    return v0
.end method

.method public getValuesList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/protobuf/Value;",
            ">;"
        }
    .end annotation

    .line 211
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    .line 212
    invoke-virtual {v0}, Lcom/google/protobuf/ListValue;->getValuesList()Ljava/util/List;

    move-result-object v0

    .line 211
    invoke-static {v0}, Lj$/util/DesugarCollections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public removeValues(I)Lcom/google/protobuf/ListValue$Builder;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 303
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 304
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-static {v0, p1}, Lcom/google/protobuf/ListValue;->access$600(Lcom/google/protobuf/ListValue;I)V

    .line 305
    return-object p0
.end method

.method public setValues(ILcom/google/protobuf/Value$Builder;)Lcom/google/protobuf/ListValue$Builder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "builderForValue"    # Lcom/google/protobuf/Value$Builder;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "builderForValue"
        }
    .end annotation

    .line 241
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 242
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    .line 243
    invoke-virtual {p2}, Lcom/google/protobuf/Value$Builder;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object v1

    check-cast v1, Lcom/google/protobuf/Value;

    .line 242
    invoke-static {v0, p1, v1}, Lcom/google/protobuf/ListValue;->access$100(Lcom/google/protobuf/ListValue;ILcom/google/protobuf/Value;)V

    .line 244
    return-object p0
.end method

.method public setValues(ILcom/google/protobuf/Value;)Lcom/google/protobuf/ListValue$Builder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # Lcom/google/protobuf/Value;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "index",
            "value"
        }
    .end annotation

    .line 232
    invoke-virtual {p0}, Lcom/google/protobuf/ListValue$Builder;->copyOnWrite()V

    .line 233
    iget-object v0, p0, Lcom/google/protobuf/ListValue$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/protobuf/ListValue;

    invoke-static {v0, p1, p2}, Lcom/google/protobuf/ListValue;->access$100(Lcom/google/protobuf/ListValue;ILcom/google/protobuf/Value;)V

    .line 234
    return-object p0
.end method
