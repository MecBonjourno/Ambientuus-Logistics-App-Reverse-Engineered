.class Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BuscaDispositivoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Landroid/bluetooth/BluetoothDevice;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private myList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation
.end field

.field private selectedColor:I

.field private selectedIndex:I

.field final synthetic this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;


# direct methods
.method static bridge synthetic -$$Nest$fgetselectedIndex(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;)I
    .locals 0

    iget p0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedIndex:I

    return p0
.end method

.method public constructor <init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;Landroid/content/Context;IILjava/util/List;)V
    .locals 0
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "resource"    # I
    .param p4, "textViewResourceId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "II",
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;)V"
        }
    .end annotation

    .line 386
    .local p5, "objects":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->this$0:Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity;

    .line 387
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;IILjava/util/List;)V

    .line 383
    const-string p1, "#abcdef"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedColor:I

    .line 388
    iput-object p2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->context:Landroid/content/Context;

    .line 389
    iput-object p5, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->myList:Ljava/util/List;

    .line 390
    const/4 p1, -0x1

    iput p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedIndex:I

    .line 391
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 404
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->myList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getEntireList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;"
        }
    .end annotation

    .line 427
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->myList:Ljava/util/List;

    return-object v0
.end method

.method public getItem(I)Landroid/bluetooth/BluetoothDevice;
    .locals 1
    .param p1, "position"    # I

    .line 409
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->myList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 380
    invoke-virtual {p0, p1}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->getItem(I)Landroid/bluetooth/BluetoothDevice;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .line 414
    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedItem()Landroid/bluetooth/BluetoothDevice;
    .locals 2

    .line 399
    iget-object v0, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->myList:Ljava/util/List;

    iget v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 6
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .line 432
    move-object v0, p2

    .line 434
    .local v0, "vi":Landroid/view/View;
    if-nez p2, :cond_0

    .line 435
    iget-object v1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/coleta/ambientuus/R$layout;->list_item:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 436
    new-instance v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;

    invoke-direct {v1, p0, v3}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;-><init>(Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity-IA;)V

    .line 438
    .local v1, "holder":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;
    sget v2, Lcom/coleta/ambientuus/R$id;->lstContent:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;->tv:Landroid/widget/TextView;

    .line 440
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    .line 442
    .end local v1    # "holder":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;

    .line 445
    .restart local v1    # "holder":Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;
    :goto_0
    iget v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedIndex:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    iget v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedIndex:I

    if-ne p1, v2, :cond_1

    .line 446
    iget-object v2, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;->tv:Landroid/widget/TextView;

    iget v3, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedColor:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    goto :goto_1

    .line 448
    :cond_1
    iget-object v2, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;->tv:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 450
    :goto_1
    iget-object v2, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->myList:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 451
    .local v2, "device":Landroid/bluetooth/BluetoothDevice;
    iget-object v3, v1, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter$ViewHolder;->tv:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n   "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 453
    return-object v0
.end method

.method public replaceItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/bluetooth/BluetoothDevice;",
            ">;)V"
        }
    .end annotation

    .line 422
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    iput-object p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->myList:Ljava/util/List;

    .line 423
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->notifyDataSetChanged()V

    .line 424
    return-void
.end method

.method public setSelectedIndex(I)V
    .locals 0
    .param p1, "position"    # I

    .line 394
    iput p1, p0, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->selectedIndex:I

    .line 395
    invoke-virtual {p0}, Lcom/coleta/ambientuus/activities/BuscaDispositivoActivity$MyAdapter;->notifyDataSetChanged()V

    .line 396
    return-void
.end method
