.class public Lcom/coleta/ambientuus/fragments/DatePickerFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "DatePickerFragment.java"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;
    }
.end annotation


# instance fields
.field private listener:Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 32
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onAttach(Landroid/content/Context;)V

    .line 33
    instance-of v0, p1, Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;

    if-eqz v0, :cond_0

    .line 34
    move-object v0, p1

    check-cast v0, Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;

    iput-object v0, p0, Lcom/coleta/ambientuus/fragments/DatePickerFragment;->listener:Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;

    .line 38
    return-void

    .line 36
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Erro"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 22
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 23
    .local v0, "c":Ljava/util/Calendar;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 24
    .local v5, "year":I
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .line 25
    .local v6, "month":I
    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v7

    .line 27
    .local v7, "day":I
    new-instance v2, Landroid/app/DatePickerDialog;

    invoke-virtual {p0}, Lcom/coleta/ambientuus/fragments/DatePickerFragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    move-object v4, p0

    invoke-direct/range {v2 .. v7}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    return-object v2
.end method

.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 7
    .param p1, "datePicker"    # Landroid/widget/DatePicker;
    .param p2, "year"    # I
    .param p3, "month"    # I
    .param p4, "day"    # I

    .line 42
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/DatePickerFragment;->listener:Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/coleta/ambientuus/fragments/DatePickerFragment;->listener:Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v2, p3, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const-string v2, "%02d"

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v6, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v4, v2}, Lcom/coleta/ambientuus/fragments/DatePickerFragment$OnDateSelectedListener;->onDateSelected(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    :cond_0
    return-void
.end method
