.class public final synthetic Landroidx/camera/core/impl/ReadableConfig$-CC;
.super Ljava/lang/Object;
.source "ReadableConfig.java"


# direct methods
.method public static $default$containsOption(Landroidx/camera/core/impl/ReadableConfig;Landroidx/camera/core/impl/Config$Option;)Z
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;

    .line 41
    .local p1, "id":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/Config;->containsOption(Landroidx/camera/core/impl/Config$Option;)Z

    move-result v0

    return v0
.end method

.method public static $default$findOptions(Landroidx/camera/core/impl/ReadableConfig;Ljava/lang/String;Landroidx/camera/core/impl/Config$OptionMatcher;)V
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;
    .param p1, "idSearchString"    # Ljava/lang/String;
    .param p2, "matcher"    # Landroidx/camera/core/impl/Config$OptionMatcher;

    .line 57
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroidx/camera/core/impl/Config;->findOptions(Ljava/lang/String;Landroidx/camera/core/impl/Config$OptionMatcher;)V

    .line 58
    return-void
.end method

.method public static $default$getOptionPriority(Landroidx/camera/core/impl/ReadableConfig;Landroidx/camera/core/impl/Config$Option;)Landroidx/camera/core/impl/Config$OptionPriority;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;

    .line 73
    .local p1, "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/Config;->getOptionPriority(Landroidx/camera/core/impl/Config$Option;)Landroidx/camera/core/impl/Config$OptionPriority;

    move-result-object v0

    return-object v0
.end method

.method public static $default$getPriorities(Landroidx/camera/core/impl/ReadableConfig;Landroidx/camera/core/impl/Config$Option;)Ljava/util/Set;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;

    .line 78
    .local p1, "option":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<*>;"
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/Config;->getPriorities(Landroidx/camera/core/impl/Config$Option;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static $default$listOptions(Landroidx/camera/core/impl/ReadableConfig;)Ljava/util/Set;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;

    .line 62
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0}, Landroidx/camera/core/impl/Config;->listOptions()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static $default$retrieveOption(Landroidx/camera/core/impl/ReadableConfig;Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;

    .line 46
    .local p1, "id":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<TValueT;>;"
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0, p1}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static $default$retrieveOption(Landroidx/camera/core/impl/ReadableConfig;Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;

    .line 52
    .local p1, "id":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<TValueT;>;"
    .local p2, "valueIfMissing":Ljava/lang/Object;, "TValueT;"
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroidx/camera/core/impl/Config;->retrieveOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static $default$retrieveOptionWithPriority(Landroidx/camera/core/impl/ReadableConfig;Landroidx/camera/core/impl/Config$Option;Landroidx/camera/core/impl/Config$OptionPriority;)Ljava/lang/Object;
    .locals 1
    .param p0, "_this"    # Landroidx/camera/core/impl/ReadableConfig;
    .param p2, "priority"    # Landroidx/camera/core/impl/Config$OptionPriority;

    .line 68
    .local p1, "id":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<TValueT;>;"
    invoke-interface {p0}, Landroidx/camera/core/impl/ReadableConfig;->getConfig()Landroidx/camera/core/impl/Config;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroidx/camera/core/impl/Config;->retrieveOptionWithPriority(Landroidx/camera/core/impl/Config$Option;Landroidx/camera/core/impl/Config$OptionPriority;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
