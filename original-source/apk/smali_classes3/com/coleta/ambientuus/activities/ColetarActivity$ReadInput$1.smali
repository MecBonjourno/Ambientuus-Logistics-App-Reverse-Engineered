.class Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;
.super Ljava/lang/Object;
.source "ColetarActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

.field final synthetic val$strInput:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 888
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->val$strInput:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 891
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgettvRecPeso(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 892
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgettvRecPeso(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->val$strInput:Ljava/lang/String;

    const-string v2, "."

    const-string v3, ","

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "[^\\d,]"

    const-string v3, " "

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x21

    const/16 v3, 0x26

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;II)V

    .line 893
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fputbStop(Lcom/coleta/ambientuus/activities/ColetarActivity;Z)V

    .line 894
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v0, v0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v0}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgettvRecPeso(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    .line 895
    .local v0, "txtLength":I
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmMaxChars(Lcom/coleta/ambientuus/activities/ColetarActivity;)I

    move-result v1

    if-le v0, v1, :cond_0

    .line 896
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v1, v1, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgettvRecPeso(Lcom/coleta/ambientuus/activities/ColetarActivity;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v1

    iget-object v2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput$1;->this$1:Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;

    iget-object v2, v2, Lcom/coleta/ambientuus/activities/ColetarActivity$ReadInput;->this$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    invoke-static {v2}, Lcom/coleta/ambientuus/activities/ColetarActivity;->-$$Nest$fgetmMaxChars(Lcom/coleta/ambientuus/activities/ColetarActivity;)I

    move-result v2

    sub-int v2, v0, v2

    const/4 v3, 0x0

    invoke-interface {v1, v3, v2}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 898
    :cond_0
    return-void
.end method
