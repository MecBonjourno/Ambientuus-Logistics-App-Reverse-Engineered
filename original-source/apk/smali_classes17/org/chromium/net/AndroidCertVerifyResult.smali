.class public Lorg/chromium/net/AndroidCertVerifyResult;
.super Ljava/lang/Object;
.source "AndroidCertVerifyResult.java"


# annotations
.annotation runtime Lorg/chromium/base/annotations/JNINamespace;
    value = "net::android"
.end annotation


# instance fields
.field private final mCertificateChain:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private final mIsIssuedByKnownRoot:Z

.field private final mStatus:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "status"    # I

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput p1, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mStatus:I

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mIsIssuedByKnownRoot:Z

    .line 48
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mCertificateChain:Ljava/util/List;

    .line 49
    return-void
.end method

.method public constructor <init>(IZLjava/util/List;)V
    .locals 1
    .param p1, "status"    # I
    .param p2, "isIssuedByKnownRoot"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;)V"
        }
    .end annotation

    .line 39
    .local p3, "certificateChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput p1, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mStatus:I

    .line 41
    iput-boolean p2, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mIsIssuedByKnownRoot:Z

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mCertificateChain:Ljava/util/List;

    .line 43
    return-void
.end method


# virtual methods
.method public getCertificateChainEncoded()[[B
    .locals 3

    .line 63
    iget-object v0, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mCertificateChain:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [[B

    .line 65
    .local v0, "verifiedChainArray":[[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mCertificateChain:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 66
    iget-object v2, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mCertificateChain:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v2

    aput-object v2, v0, v1
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    .end local v1    # "i":I
    :cond_0
    nop

    .line 71
    return-object v0

    .line 68
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/security/cert/CertificateEncodingException;
    const/4 v2, 0x0

    new-array v2, v2, [[B

    return-object v2
.end method

.method public getStatus()I
    .locals 1

    .line 53
    iget v0, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mStatus:I

    return v0
.end method

.method public isIssuedByKnownRoot()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lorg/chromium/net/AndroidCertVerifyResult;->mIsIssuedByKnownRoot:Z

    return v0
.end method
