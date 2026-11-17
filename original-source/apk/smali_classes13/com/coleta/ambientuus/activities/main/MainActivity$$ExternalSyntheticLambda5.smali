.class public final synthetic Lcom/coleta/ambientuus/activities/main/MainActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/coleta/ambientuus/ui/SearchableSpinnerDialogHelper$OnItemSelectedListener;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onItemSelected(Ljava/lang/Object;)V
    .locals 0

    .line 0
    check-cast p1, Lcom/coleta/ambientuus/dto/Placas;

    invoke-static {p1}, Lcom/coleta/ambientuus/activities/main/MainActivity;->lambda$loadSpinnerDataPlaca$15(Lcom/coleta/ambientuus/dto/Placas;)V

    return-void
.end method
