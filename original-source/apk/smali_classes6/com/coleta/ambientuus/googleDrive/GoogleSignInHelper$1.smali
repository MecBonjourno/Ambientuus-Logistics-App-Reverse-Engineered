.class Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;
.super Ljava/lang/Object;
.source "GoogleSignInHelper.java"

# interfaces
.implements Landroidx/credentials/CredentialManagerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->signIn(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/credentials/CredentialManagerCallback<",
        "Landroidx/credentials/GetCredentialResponse;",
        "Landroidx/credentials/exceptions/GetCredentialException;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;

    .line 67
    iput-object p1, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;->this$0:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroidx/credentials/exceptions/GetCredentialException;)V
    .locals 1
    .param p1, "e"    # Landroidx/credentials/exceptions/GetCredentialException;

    .line 75
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;->this$0:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;

    invoke-static {v0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->-$$Nest$mhandleSignInError(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Landroidx/credentials/exceptions/GetCredentialException;)V

    .line 76
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .locals 0

    .line 67
    check-cast p1, Landroidx/credentials/exceptions/GetCredentialException;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;->onError(Landroidx/credentials/exceptions/GetCredentialException;)V

    return-void
.end method

.method public onResult(Landroidx/credentials/GetCredentialResponse;)V
    .locals 1
    .param p1, "response"    # Landroidx/credentials/GetCredentialResponse;

    .line 70
    iget-object v0, p0, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;->this$0:Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;

    invoke-static {v0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;->-$$Nest$mhandleSignInResult(Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper;Landroidx/credentials/GetCredentialResponse;)V

    .line 71
    return-void
.end method

.method public bridge synthetic onResult(Ljava/lang/Object;)V
    .locals 0

    .line 67
    check-cast p1, Landroidx/credentials/GetCredentialResponse;

    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/googleDrive/GoogleSignInHelper$1;->onResult(Landroidx/credentials/GetCredentialResponse;)V

    return-void
.end method
