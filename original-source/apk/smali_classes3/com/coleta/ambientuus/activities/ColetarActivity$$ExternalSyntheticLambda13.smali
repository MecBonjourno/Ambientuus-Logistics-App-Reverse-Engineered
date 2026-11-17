.class public final synthetic Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;


# instance fields
.field public final synthetic f$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

.field public final synthetic f$1:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda13;->f$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iput-object p2, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda13;->f$1:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onItemSelected(Ljava/lang/Object;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda13;->f$0:Lcom/coleta/ambientuus/activities/ColetarActivity;

    iget-object v1, p0, Lcom/coleta/ambientuus/activities/ColetarActivity$$ExternalSyntheticLambda13;->f$1:Landroid/view/View;

    check-cast p1, Lcom/coleta/ambientuus/dto/ClienteMTR;

    invoke-static {v0, v1, p1}, Lcom/coleta/ambientuus/activities/ColetarActivity;->$r8$lambda$CW_jky8GhBemSFuhptH_VuEoAzY(Lcom/coleta/ambientuus/activities/ColetarActivity;Landroid/view/View;Lcom/coleta/ambientuus/dto/ClienteMTR;)V

    return-void
.end method
