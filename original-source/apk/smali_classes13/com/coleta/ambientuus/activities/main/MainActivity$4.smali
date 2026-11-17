.class Lcom/coleta/ambientuus/activities/main/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$GoogleSignInCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/main/MainActivity;->googleLogin()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;


# direct methods
.method public static synthetic $r8$lambda$K8SuhrKih-dyhWF2QXseGEQf4ss(Lcom/coleta/ambientuus/activities/main/MainActivity$4;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->lambda$onSuccess$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$VhJMYmnwWNnI5fFxOsw8zBfV5Kw(Lcom/coleta/ambientuus/activities/main/MainActivity$4;)V
    .locals 0

    invoke-direct {p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->lambda$onCancelled$2()V

    return-void
.end method

.method public static synthetic $r8$lambda$bH1IIbu3NWASo0WRS8Xy0tgDD58(Lcom/coleta/ambientuus/activities/main/MainActivity$4;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->lambda$onError$1(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/coleta/ambientuus/activities/main/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/activities/main/MainActivity;

    .line 494
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private synthetic lambda$onCancelled$2()V
    .locals 3

    .line 522
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    const-string v1, "Login Cancelado"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 523
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 522
    return-void
.end method

.method private synthetic lambda$onError$1(Ljava/lang/String;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/String;

    .line 515
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private synthetic lambda$onSuccess$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "idToken"    # Ljava/lang/String;

    .line 499
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Logado com "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 500
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 502
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    const-string v1, "googleSign"

    invoke-virtual {v0, v1, v2}, Lcom/coleta/ambientuus/activities/main/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 503
    .local v0, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 504
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "isLoggedIn"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 505
    const-string v2, "name"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 506
    const-string v2, "e_mail"

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 507
    const-string v2, "ID"

    invoke-interface {v1, v2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 508
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 509
    return-void
.end method


# virtual methods
.method public onCancelled()V
    .locals 2

    .line 521
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$4$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/coleta/ambientuus/activities/main/MainActivity$4$$ExternalSyntheticLambda1;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity$4;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 525
    return-void
.end method

.method public onError(Ljava/lang/String;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/String;

    .line 514
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$4$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/coleta/ambientuus/activities/main/MainActivity$4$$ExternalSyntheticLambda2;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity$4;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 517
    return-void
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "displayName"    # Ljava/lang/String;
    .param p3, "idToken"    # Ljava/lang/String;

    .line 498
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/main/MainActivity$4;->this$0:Lcom/coleta/ambientuus/activities/main/MainActivity;

    new-instance v1, Lcom/coleta/ambientuus/activities/main/MainActivity$4$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/coleta/ambientuus/activities/main/MainActivity$4$$ExternalSyntheticLambda0;-><init>(Lcom/coleta/ambientuus/activities/main/MainActivity$4;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 510
    return-void
.end method
