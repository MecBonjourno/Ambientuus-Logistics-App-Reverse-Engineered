.class Lorg/apache/commons/lang/Entities;
.super Ljava/lang/Object;
.source "Entities.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang/Entities$BinaryEntityMap;,
        Lorg/apache/commons/lang/Entities$ArrayEntityMap;,
        Lorg/apache/commons/lang/Entities$LookupEntityMap;,
        Lorg/apache/commons/lang/Entities$TreeEntityMap;,
        Lorg/apache/commons/lang/Entities$HashEntityMap;,
        Lorg/apache/commons/lang/Entities$MapIntMap;,
        Lorg/apache/commons/lang/Entities$PrimitiveEntityMap;,
        Lorg/apache/commons/lang/Entities$EntityMap;
    }
.end annotation


# static fields
.field private static final APOS_ARRAY:[[Ljava/lang/String;

.field private static final BASIC_ARRAY:[[Ljava/lang/String;

.field public static final HTML32:Lorg/apache/commons/lang/Entities;

.field public static final HTML40:Lorg/apache/commons/lang/Entities;

.field static final HTML40_ARRAY:[[Ljava/lang/String;

.field static final ISO8859_1_ARRAY:[[Ljava/lang/String;

.field public static final XML:Lorg/apache/commons/lang/Entities;


# instance fields
.field map:Lorg/apache/commons/lang/Entities$EntityMap;


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 45
    const/4 v0, 0x4

    new-array v1, v0, [[Ljava/lang/String;

    const-string v2, "quot"

    const-string v3, "34"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "amp"

    const-string v4, "38"

    filled-new-array {v2, v4}, [Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "lt"

    const-string v5, "60"

    filled-new-array {v2, v5}, [Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x2

    aput-object v2, v1, v5

    const-string v2, "gt"

    const-string v6, "62"

    filled-new-array {v2, v6}, [Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x3

    aput-object v2, v1, v6

    sput-object v1, Lorg/apache/commons/lang/Entities;->BASIC_ARRAY:[[Ljava/lang/String;

    .line 51
    new-array v1, v4, [[Ljava/lang/String;

    const-string v2, "apos"

    const-string v7, "39"

    filled-new-array {v2, v7}, [Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    sput-object v1, Lorg/apache/commons/lang/Entities;->APOS_ARRAY:[[Ljava/lang/String;

    .line 55
    const/16 v1, 0x60

    new-array v2, v1, [[Ljava/lang/String;

    const-string v7, "nbsp"

    const-string v8, "160"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v3

    const-string v7, "iexcl"

    const-string v8, "161"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v4

    const-string v7, "cent"

    const-string v8, "162"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v5

    const-string v7, "pound"

    const-string v8, "163"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    const-string v7, "curren"

    const-string v8, "164"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v0

    const-string v7, "yen"

    const-string v8, "165"

    filled-new-array {v7, v8}, [Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x5

    aput-object v7, v2, v8

    const-string v7, "brvbar"

    const-string v9, "166"

    filled-new-array {v7, v9}, [Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x6

    aput-object v7, v2, v9

    const-string v7, "sect"

    const-string v10, "167"

    filled-new-array {v7, v10}, [Ljava/lang/String;

    move-result-object v7

    const/4 v10, 0x7

    aput-object v7, v2, v10

    const-string v7, "uml"

    const-string v11, "168"

    filled-new-array {v7, v11}, [Ljava/lang/String;

    move-result-object v7

    const/16 v11, 0x8

    aput-object v7, v2, v11

    const-string v7, "copy"

    const-string v12, "169"

    filled-new-array {v7, v12}, [Ljava/lang/String;

    move-result-object v7

    const/16 v12, 0x9

    aput-object v7, v2, v12

    const-string v7, "ordf"

    const-string v13, "170"

    filled-new-array {v7, v13}, [Ljava/lang/String;

    move-result-object v7

    const/16 v13, 0xa

    aput-object v7, v2, v13

    const-string v7, "laquo"

    const-string v14, "171"

    filled-new-array {v7, v14}, [Ljava/lang/String;

    move-result-object v7

    const/16 v14, 0xb

    aput-object v7, v2, v14

    const-string v7, "not"

    const-string v15, "172"

    filled-new-array {v7, v15}, [Ljava/lang/String;

    move-result-object v7

    const/16 v15, 0xc

    aput-object v7, v2, v15

    const-string v7, "shy"

    move/from16 v16, v0

    const-string v0, "173"

    filled-new-array {v7, v0}, [Ljava/lang/String;

    move-result-object v0

    const/16 v7, 0xd

    aput-object v0, v2, v7

    const-string v0, "reg"

    move/from16 v17, v1

    const-string v1, "174"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xe

    aput-object v0, v2, v1

    const-string v0, "macr"

    move/from16 v18, v1

    const-string v1, "175"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xf

    aput-object v0, v2, v1

    const-string v0, "deg"

    move/from16 v19, v1

    const-string v1, "176"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x10

    aput-object v0, v2, v1

    const-string v0, "plusmn"

    move/from16 v20, v1

    const-string v1, "177"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x11

    aput-object v0, v2, v1

    const-string v0, "sup2"

    move/from16 v21, v1

    const-string v1, "178"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x12

    aput-object v0, v2, v1

    const-string v0, "sup3"

    move/from16 v22, v1

    const-string v1, "179"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x13

    aput-object v0, v2, v1

    const-string v0, "acute"

    move/from16 v23, v1

    const-string v1, "180"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x14

    aput-object v0, v2, v1

    const-string v0, "micro"

    move/from16 v24, v1

    const-string v1, "181"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x15

    aput-object v0, v2, v1

    const-string v0, "para"

    const-string v1, "182"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x16

    aput-object v0, v2, v1

    const-string v0, "middot"

    const-string v1, "183"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x17

    aput-object v0, v2, v1

    const-string v0, "cedil"

    const-string v1, "184"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x18

    aput-object v0, v2, v1

    const-string v0, "sup1"

    const-string v1, "185"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x19

    aput-object v0, v2, v1

    const-string v0, "ordm"

    const-string v1, "186"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1a

    aput-object v0, v2, v1

    const-string v0, "raquo"

    const-string v1, "187"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1b

    aput-object v0, v2, v1

    const-string v0, "frac14"

    const-string v1, "188"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1c

    aput-object v0, v2, v1

    const-string v0, "frac12"

    const-string v1, "189"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1d

    aput-object v0, v2, v1

    const-string v0, "frac34"

    const-string v1, "190"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1e

    aput-object v0, v2, v1

    const-string v0, "iquest"

    const-string v1, "191"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1f

    aput-object v0, v2, v1

    const-string v0, "Agrave"

    const-string v1, "192"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x20

    aput-object v0, v2, v1

    const-string v0, "Aacute"

    const-string v1, "193"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x21

    aput-object v0, v2, v1

    const-string v0, "Acirc"

    const-string v1, "194"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x22

    aput-object v0, v2, v1

    const-string v0, "Atilde"

    const-string v1, "195"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x23

    aput-object v0, v2, v1

    const-string v0, "Auml"

    const-string v1, "196"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x24

    aput-object v0, v2, v1

    const-string v0, "Aring"

    const-string v1, "197"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x25

    aput-object v0, v2, v1

    const-string v0, "AElig"

    const-string v1, "198"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x26

    aput-object v0, v2, v1

    const-string v0, "Ccedil"

    const-string v1, "199"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x27

    aput-object v0, v2, v1

    const-string v0, "Egrave"

    const-string v1, "200"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x28

    aput-object v0, v2, v1

    const-string v0, "Eacute"

    const-string v1, "201"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x29

    aput-object v0, v2, v1

    const-string v0, "Ecirc"

    const-string v1, "202"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2a

    aput-object v0, v2, v1

    const-string v0, "Euml"

    const-string v1, "203"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2b

    aput-object v0, v2, v1

    const-string v0, "Igrave"

    const-string v1, "204"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2c

    aput-object v0, v2, v1

    const-string v0, "Iacute"

    const-string v1, "205"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2d

    aput-object v0, v2, v1

    const-string v0, "Icirc"

    const-string v1, "206"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    aput-object v0, v2, v1

    const-string v0, "Iuml"

    const-string v1, "207"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    aput-object v0, v2, v1

    const-string v0, "ETH"

    const-string v1, "208"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x30

    aput-object v0, v2, v1

    const-string v0, "Ntilde"

    const-string v1, "209"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x31

    aput-object v0, v2, v1

    const-string v0, "Ograve"

    const-string v1, "210"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x32

    aput-object v0, v2, v1

    const-string v0, "Oacute"

    const-string v1, "211"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x33

    aput-object v0, v2, v1

    const-string v0, "Ocirc"

    const-string v1, "212"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x34

    aput-object v0, v2, v1

    const-string v0, "Otilde"

    const-string v1, "213"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x35

    aput-object v0, v2, v1

    const-string v0, "Ouml"

    const-string v1, "214"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x36

    aput-object v0, v2, v1

    const-string v0, "times"

    const-string v1, "215"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x37

    aput-object v0, v2, v1

    const-string v0, "Oslash"

    const-string v1, "216"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x38

    aput-object v0, v2, v1

    const-string v0, "Ugrave"

    const-string v1, "217"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x39

    aput-object v0, v2, v1

    const-string v0, "Uacute"

    const-string v1, "218"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3a

    aput-object v0, v2, v1

    const-string v0, "Ucirc"

    const-string v1, "219"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3b

    aput-object v0, v2, v1

    const-string v0, "Uuml"

    const-string v1, "220"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3c

    aput-object v0, v2, v1

    const-string v0, "Yacute"

    const-string v1, "221"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3d

    aput-object v0, v2, v1

    const-string v0, "THORN"

    const-string v1, "222"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3e

    aput-object v0, v2, v1

    const-string v0, "szlig"

    const-string v1, "223"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3f

    aput-object v0, v2, v1

    const-string v0, "agrave"

    const-string v1, "224"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x40

    aput-object v0, v2, v1

    const-string v0, "aacute"

    const-string v1, "225"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x41

    aput-object v0, v2, v1

    const-string v0, "acirc"

    const-string v1, "226"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x42

    aput-object v0, v2, v1

    const-string v0, "atilde"

    const-string v1, "227"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x43

    aput-object v0, v2, v1

    const-string v0, "auml"

    const-string v1, "228"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x44

    aput-object v0, v2, v1

    const-string v0, "aring"

    const-string v1, "229"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x45

    aput-object v0, v2, v1

    const-string v0, "aelig"

    const-string v1, "230"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x46

    aput-object v0, v2, v1

    const-string v0, "ccedil"

    const-string v1, "231"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x47

    aput-object v0, v2, v1

    const-string v0, "egrave"

    const-string v1, "232"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x48

    aput-object v0, v2, v1

    const-string v0, "eacute"

    const-string v1, "233"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x49

    aput-object v0, v2, v1

    const-string v0, "ecirc"

    const-string v1, "234"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x4a

    aput-object v0, v2, v1

    const-string v0, "euml"

    const-string v1, "235"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x4b

    aput-object v0, v2, v1

    const-string v0, "igrave"

    const-string v1, "236"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x4c

    aput-object v0, v2, v1

    const-string v0, "iacute"

    const-string v1, "237"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x4d

    aput-object v0, v2, v1

    const-string v0, "icirc"

    const-string v1, "238"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x4e

    aput-object v0, v2, v1

    const-string v0, "iuml"

    const-string v1, "239"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x4f

    aput-object v0, v2, v1

    const-string v0, "eth"

    const-string v1, "240"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x50

    aput-object v0, v2, v1

    const-string v0, "ntilde"

    const-string v1, "241"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x51

    aput-object v0, v2, v1

    const-string v0, "ograve"

    const-string v1, "242"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x52

    aput-object v0, v2, v1

    const-string v0, "oacute"

    const-string v1, "243"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x53

    aput-object v0, v2, v1

    const-string v0, "ocirc"

    const-string v1, "244"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x54

    aput-object v0, v2, v1

    const-string v0, "otilde"

    const-string v1, "245"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x55

    aput-object v0, v2, v1

    const-string v0, "ouml"

    const-string v1, "246"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x56

    aput-object v0, v2, v1

    const-string v0, "divide"

    const-string v1, "247"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x57

    aput-object v0, v2, v1

    const-string v0, "oslash"

    const-string v1, "248"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x58

    aput-object v0, v2, v1

    const-string v0, "ugrave"

    const-string v1, "249"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x59

    aput-object v0, v2, v1

    const-string v0, "uacute"

    const-string v1, "250"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5a

    aput-object v0, v2, v1

    const-string v0, "ucirc"

    const-string v1, "251"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5b

    aput-object v0, v2, v1

    const-string v0, "uuml"

    const-string v1, "252"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5c

    aput-object v0, v2, v1

    const-string v0, "yacute"

    const-string v1, "253"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5d

    aput-object v0, v2, v1

    const-string v0, "thorn"

    const-string v1, "254"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5e

    aput-object v0, v2, v1

    const-string v0, "yuml"

    const-string v1, "255"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x5f

    aput-object v0, v2, v1

    sput-object v2, Lorg/apache/commons/lang/Entities;->ISO8859_1_ARRAY:[[Ljava/lang/String;

    .line 155
    const/16 v0, 0x97

    new-array v0, v0, [[Ljava/lang/String;

    const-string v1, "fnof"

    const-string v2, "402"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    const-string v1, "Alpha"

    const-string v2, "913"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    const-string v1, "Beta"

    const-string v2, "914"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    const-string v1, "Gamma"

    const-string v2, "915"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v6

    const-string v1, "Delta"

    const-string v2, "916"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v16

    const-string v1, "Epsilon"

    const-string v2, "917"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v8

    const-string v1, "Zeta"

    const-string v2, "918"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v9

    const-string v1, "Eta"

    const-string v2, "919"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v10

    const-string v1, "Theta"

    const-string v2, "920"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v11

    const-string v1, "Iota"

    const-string v2, "921"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v12

    const-string v1, "Kappa"

    const-string v2, "922"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v13

    const-string v1, "Lambda"

    const-string v2, "923"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v14

    const-string v1, "Mu"

    const-string v2, "924"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v15

    const-string v1, "Nu"

    const-string v2, "925"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v7

    const-string v1, "Xi"

    const-string v2, "926"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v18

    const-string v1, "Omicron"

    const-string v2, "927"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v19

    const-string v1, "Pi"

    const-string v2, "928"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v20

    const-string v1, "Rho"

    const-string v2, "929"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v21

    const-string v1, "Sigma"

    const-string v2, "931"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v22

    const-string v1, "Tau"

    const-string v2, "932"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v23

    const-string v1, "Upsilon"

    const-string v2, "933"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v24

    const-string v1, "Phi"

    const-string v2, "934"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x15

    aput-object v1, v0, v2

    const-string v1, "Chi"

    const-string v2, "935"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x16

    aput-object v1, v0, v2

    const-string v1, "Psi"

    const-string v2, "936"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x17

    aput-object v1, v0, v2

    const-string v1, "Omega"

    const-string v2, "937"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x18

    aput-object v1, v0, v2

    const-string v1, "alpha"

    const-string v2, "945"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x19

    aput-object v1, v0, v2

    const-string v1, "beta"

    const-string v2, "946"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    const-string v1, "gamma"

    const-string v2, "947"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    const-string v1, "delta"

    const-string v2, "948"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    const-string v1, "epsilon"

    const-string v2, "949"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    const-string v1, "zeta"

    const-string v2, "950"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    const-string v1, "eta"

    const-string v2, "951"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    const-string v1, "theta"

    const-string v2, "952"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x20

    aput-object v1, v0, v2

    const-string v1, "iota"

    const-string v2, "953"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x21

    aput-object v1, v0, v2

    const-string v1, "kappa"

    const-string v2, "954"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x22

    aput-object v1, v0, v2

    const-string v1, "lambda"

    const-string v2, "955"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x23

    aput-object v1, v0, v2

    const-string v1, "mu"

    const-string v2, "956"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x24

    aput-object v1, v0, v2

    const-string v1, "nu"

    const-string v2, "957"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x25

    aput-object v1, v0, v2

    const-string v1, "xi"

    const-string v2, "958"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x26

    aput-object v1, v0, v2

    const-string v1, "omicron"

    const-string v2, "959"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x27

    aput-object v1, v0, v2

    const-string v1, "pi"

    const-string v2, "960"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x28

    aput-object v1, v0, v2

    const-string v1, "rho"

    const-string v2, "961"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x29

    aput-object v1, v0, v2

    const-string v1, "sigmaf"

    const-string v2, "962"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    const-string v1, "sigma"

    const-string v2, "963"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    const-string v1, "tau"

    const-string v2, "964"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2c

    aput-object v1, v0, v2

    const-string v1, "upsilon"

    const-string v2, "965"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2d

    aput-object v1, v0, v2

    const-string v1, "phi"

    const-string v2, "966"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2e

    aput-object v1, v0, v2

    const-string v1, "chi"

    const-string v2, "967"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x2f

    aput-object v1, v0, v2

    const-string v1, "psi"

    const-string v2, "968"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x30

    aput-object v1, v0, v2

    const-string v1, "omega"

    const-string v2, "969"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x31

    aput-object v1, v0, v2

    const-string v1, "thetasym"

    const-string v2, "977"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x32

    aput-object v1, v0, v2

    const-string v1, "upsih"

    const-string v2, "978"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x33

    aput-object v1, v0, v2

    const-string v1, "piv"

    const-string v2, "982"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x34

    aput-object v1, v0, v2

    const-string v1, "bull"

    const-string v2, "8226"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x35

    aput-object v1, v0, v2

    const-string v1, "hellip"

    const-string v2, "8230"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x36

    aput-object v1, v0, v2

    const-string v1, "prime"

    const-string v2, "8242"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x37

    aput-object v1, v0, v2

    const-string v1, "Prime"

    const-string v2, "8243"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x38

    aput-object v1, v0, v2

    const-string v1, "oline"

    const-string v2, "8254"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x39

    aput-object v1, v0, v2

    const-string v1, "frasl"

    const-string v2, "8260"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3a

    aput-object v1, v0, v2

    const-string v1, "weierp"

    const-string v2, "8472"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3b

    aput-object v1, v0, v2

    const-string v1, "image"

    const-string v2, "8465"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3c

    aput-object v1, v0, v2

    const-string v1, "real"

    const-string v2, "8476"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3d

    aput-object v1, v0, v2

    const-string v1, "trade"

    const-string v2, "8482"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3e

    aput-object v1, v0, v2

    const-string v1, "alefsym"

    const-string v2, "8501"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3f

    aput-object v1, v0, v2

    const-string v1, "larr"

    const-string v2, "8592"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x40

    aput-object v1, v0, v2

    const-string v1, "uarr"

    const-string v2, "8593"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x41

    aput-object v1, v0, v2

    const-string v1, "rarr"

    const-string v2, "8594"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x42

    aput-object v1, v0, v2

    const-string v1, "darr"

    const-string v2, "8595"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x43

    aput-object v1, v0, v2

    const-string v1, "harr"

    const-string v2, "8596"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x44

    aput-object v1, v0, v2

    const-string v1, "crarr"

    const-string v2, "8629"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x45

    aput-object v1, v0, v2

    const-string v1, "lArr"

    const-string v2, "8656"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x46

    aput-object v1, v0, v2

    const-string v1, "uArr"

    const-string v2, "8657"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x47

    aput-object v1, v0, v2

    const-string v1, "rArr"

    const-string v2, "8658"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x48

    aput-object v1, v0, v2

    const-string v1, "dArr"

    const-string v2, "8659"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x49

    aput-object v1, v0, v2

    const-string v1, "hArr"

    const-string v2, "8660"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x4a

    aput-object v1, v0, v2

    const-string v1, "forall"

    const-string v2, "8704"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x4b

    aput-object v1, v0, v2

    const-string v1, "part"

    const-string v2, "8706"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x4c

    aput-object v1, v0, v2

    const-string v1, "exist"

    const-string v2, "8707"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x4d

    aput-object v1, v0, v2

    const-string v1, "empty"

    const-string v2, "8709"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x4e

    aput-object v1, v0, v2

    const-string v1, "nabla"

    const-string v2, "8711"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x4f

    aput-object v1, v0, v2

    const-string v1, "isin"

    const-string v2, "8712"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x50

    aput-object v1, v0, v2

    const-string v1, "notin"

    const-string v2, "8713"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x51

    aput-object v1, v0, v2

    const-string v1, "ni"

    const-string v2, "8715"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x52

    aput-object v1, v0, v2

    const-string v1, "prod"

    const-string v2, "8719"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x53

    aput-object v1, v0, v2

    const-string v1, "sum"

    const-string v2, "8721"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x54

    aput-object v1, v0, v2

    const-string v1, "minus"

    const-string v2, "8722"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x55

    aput-object v1, v0, v2

    const-string v1, "lowast"

    const-string v2, "8727"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x56

    aput-object v1, v0, v2

    const-string v1, "radic"

    const-string v2, "8730"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x57

    aput-object v1, v0, v2

    const-string v1, "prop"

    const-string v2, "8733"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x58

    aput-object v1, v0, v2

    const-string v1, "infin"

    const-string v2, "8734"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x59

    aput-object v1, v0, v2

    const-string v1, "ang"

    const-string v2, "8736"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5a

    aput-object v1, v0, v2

    const-string v1, "and"

    const-string v2, "8743"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5b

    aput-object v1, v0, v2

    const-string v1, "or"

    const-string v2, "8744"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5c

    aput-object v1, v0, v2

    const-string v1, "cap"

    const-string v2, "8745"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5d

    aput-object v1, v0, v2

    const-string v1, "cup"

    const-string v2, "8746"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5e

    aput-object v1, v0, v2

    const-string v1, "int"

    const-string v2, "8747"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5f

    aput-object v1, v0, v2

    const-string v1, "there4"

    const-string v2, "8756"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v17

    const-string v1, "sim"

    const-string v2, "8764"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x61

    aput-object v1, v0, v2

    const-string v1, "cong"

    const-string v2, "8773"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x62

    aput-object v1, v0, v2

    const-string v1, "asymp"

    const-string v2, "8776"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x63

    aput-object v1, v0, v2

    const-string v1, "ne"

    const-string v2, "8800"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x64

    aput-object v1, v0, v2

    const-string v1, "equiv"

    const-string v2, "8801"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x65

    aput-object v1, v0, v2

    const-string v1, "le"

    const-string v2, "8804"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x66

    aput-object v1, v0, v2

    const-string v1, "ge"

    const-string v2, "8805"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x67

    aput-object v1, v0, v2

    const-string v1, "sub"

    const-string v2, "8834"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x68

    aput-object v1, v0, v2

    const-string v1, "sup"

    const-string v2, "8835"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x69

    aput-object v1, v0, v2

    const-string v1, "sube"

    const-string v2, "8838"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x6a

    aput-object v1, v0, v2

    const-string v1, "supe"

    const-string v2, "8839"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x6b

    aput-object v1, v0, v2

    const-string v1, "oplus"

    const-string v2, "8853"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x6c

    aput-object v1, v0, v2

    const-string v1, "otimes"

    const-string v2, "8855"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x6d

    aput-object v1, v0, v2

    const-string v1, "perp"

    const-string v2, "8869"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x6e

    aput-object v1, v0, v2

    const-string v1, "sdot"

    const-string v2, "8901"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x6f

    aput-object v1, v0, v2

    const-string v1, "lceil"

    const-string v2, "8968"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x70

    aput-object v1, v0, v2

    const-string v1, "rceil"

    const-string v2, "8969"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x71

    aput-object v1, v0, v2

    const-string v1, "lfloor"

    const-string v2, "8970"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x72

    aput-object v1, v0, v2

    const-string v1, "rfloor"

    const-string v2, "8971"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x73

    aput-object v1, v0, v2

    const-string v1, "lang"

    const-string v2, "9001"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x74

    aput-object v1, v0, v2

    const-string v1, "rang"

    const-string v2, "9002"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x75

    aput-object v1, v0, v2

    const-string v1, "loz"

    const-string v2, "9674"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x76

    aput-object v1, v0, v2

    const-string v1, "spades"

    const-string v2, "9824"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x77

    aput-object v1, v0, v2

    const-string v1, "clubs"

    const-string v2, "9827"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x78

    aput-object v1, v0, v2

    const-string v1, "hearts"

    const-string v2, "9829"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x79

    aput-object v1, v0, v2

    const-string v1, "diams"

    const-string v2, "9830"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x7a

    aput-object v1, v0, v2

    const-string v1, "OElig"

    const-string v2, "338"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x7b

    aput-object v1, v0, v2

    const-string v1, "oelig"

    const-string v2, "339"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x7c

    aput-object v1, v0, v2

    const-string v1, "Scaron"

    const-string v2, "352"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x7d

    aput-object v1, v0, v2

    const-string v1, "scaron"

    const-string v2, "353"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x7e

    aput-object v1, v0, v2

    const-string v1, "Yuml"

    const-string v2, "376"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x7f

    aput-object v1, v0, v2

    const-string v1, "circ"

    const-string v2, "710"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    aput-object v1, v0, v2

    const-string v1, "tilde"

    const-string v2, "732"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x81

    aput-object v1, v0, v2

    const-string v1, "ensp"

    const-string v2, "8194"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x82

    aput-object v1, v0, v2

    const-string v1, "emsp"

    const-string v2, "8195"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x83

    aput-object v1, v0, v2

    const-string v1, "thinsp"

    const-string v2, "8201"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x84

    aput-object v1, v0, v2

    const-string v1, "zwnj"

    const-string v2, "8204"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x85

    aput-object v1, v0, v2

    const-string v1, "zwj"

    const-string v2, "8205"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x86

    aput-object v1, v0, v2

    const-string v1, "lrm"

    const-string v2, "8206"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x87

    aput-object v1, v0, v2

    const-string v1, "rlm"

    const-string v2, "8207"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x88

    aput-object v1, v0, v2

    const-string v1, "ndash"

    const-string v2, "8211"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x89

    aput-object v1, v0, v2

    const-string v1, "mdash"

    const-string v2, "8212"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8a

    aput-object v1, v0, v2

    const-string v1, "lsquo"

    const-string v2, "8216"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8b

    aput-object v1, v0, v2

    const-string v1, "rsquo"

    const-string v2, "8217"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8c

    aput-object v1, v0, v2

    const-string v1, "sbquo"

    const-string v2, "8218"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8d

    aput-object v1, v0, v2

    const-string v1, "ldquo"

    const-string v2, "8220"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8e

    aput-object v1, v0, v2

    const-string v1, "rdquo"

    const-string v2, "8221"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8f

    aput-object v1, v0, v2

    const-string v1, "bdquo"

    const-string v2, "8222"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x90

    aput-object v1, v0, v2

    const-string v1, "dagger"

    const-string v2, "8224"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x91

    aput-object v1, v0, v2

    const-string v1, "Dagger"

    const-string v2, "8225"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x92

    aput-object v1, v0, v2

    const-string v1, "permil"

    const-string v2, "8240"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x93

    aput-object v1, v0, v2

    const-string v1, "lsaquo"

    const-string v2, "8249"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x94

    aput-object v1, v0, v2

    const-string v1, "rsaquo"

    const-string v2, "8250"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x95

    aput-object v1, v0, v2

    const-string v1, "euro"

    const-string v2, "8364"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x96

    aput-object v1, v0, v2

    sput-object v0, Lorg/apache/commons/lang/Entities;->HTML40_ARRAY:[[Ljava/lang/String;

    .line 374
    new-instance v0, Lorg/apache/commons/lang/Entities;

    invoke-direct {v0}, Lorg/apache/commons/lang/Entities;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    .line 375
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    sget-object v1, Lorg/apache/commons/lang/Entities;->BASIC_ARRAY:[[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/Entities;->addEntities([[Ljava/lang/String;)V

    .line 376
    sget-object v0, Lorg/apache/commons/lang/Entities;->XML:Lorg/apache/commons/lang/Entities;

    sget-object v1, Lorg/apache/commons/lang/Entities;->APOS_ARRAY:[[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/Entities;->addEntities([[Ljava/lang/String;)V

    .line 380
    new-instance v0, Lorg/apache/commons/lang/Entities;

    invoke-direct {v0}, Lorg/apache/commons/lang/Entities;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/Entities;->HTML32:Lorg/apache/commons/lang/Entities;

    .line 381
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML32:Lorg/apache/commons/lang/Entities;

    sget-object v1, Lorg/apache/commons/lang/Entities;->BASIC_ARRAY:[[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/Entities;->addEntities([[Ljava/lang/String;)V

    .line 382
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML32:Lorg/apache/commons/lang/Entities;

    sget-object v1, Lorg/apache/commons/lang/Entities;->ISO8859_1_ARRAY:[[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang/Entities;->addEntities([[Ljava/lang/String;)V

    .line 386
    new-instance v0, Lorg/apache/commons/lang/Entities;

    invoke-direct {v0}, Lorg/apache/commons/lang/Entities;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/Entities;->HTML40:Lorg/apache/commons/lang/Entities;

    .line 387
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML40:Lorg/apache/commons/lang/Entities;

    invoke-static {v0}, Lorg/apache/commons/lang/Entities;->fillWithHtml40Entities(Lorg/apache/commons/lang/Entities;)V

    .line 388
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 726
    new-instance v0, Lorg/apache/commons/lang/Entities$LookupEntityMap;

    invoke-direct {v0}, Lorg/apache/commons/lang/Entities$LookupEntityMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang/Entities;->map:Lorg/apache/commons/lang/Entities$EntityMap;

    return-void
.end method

.method private createStringWriter(Ljava/lang/String;)Ljava/io/StringWriter;
    .locals 7
    .param p1, "str"    # Ljava/lang/String;

    .line 884
    new-instance v0, Ljava/io/StringWriter;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    int-to-double v1, v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    int-to-double v3, v3

    const-wide v5, 0x3fb999999999999aL    # 0.1

    mul-double/2addr v3, v5

    add-double/2addr v1, v3

    double-to-int v1, v1

    invoke-direct {v0, v1}, Ljava/io/StringWriter;-><init>(I)V

    return-object v0
.end method

.method private doUnescape(Ljava/io/Writer;Ljava/lang/String;I)V
    .locals 17
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "str"    # Ljava/lang/String;
    .param p3, "firstAmp"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 928
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, 0x0

    move/from16 v4, p3

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/Writer;->write(Ljava/lang/String;II)V

    .line 929
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    .line 930
    .local v5, "len":I
    move/from16 v0, p3

    move v6, v0

    .local v6, "i":I
    :goto_0
    if-ge v6, v5, :cond_8

    .line 931
    invoke-virtual {v2, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 932
    .local v7, "c":C
    const/16 v8, 0x26

    const/4 v9, 0x1

    if-ne v7, v8, :cond_7

    .line 933
    add-int/lit8 v10, v6, 0x1

    .line 934
    .local v10, "nextIdx":I
    const/16 v11, 0x3b

    invoke-virtual {v2, v11, v10}, Ljava/lang/String;->indexOf(II)I

    move-result v12

    .line 935
    .local v12, "semiColonIdx":I
    const/4 v13, -0x1

    if-ne v12, v13, :cond_0

    .line 936
    invoke-virtual {v1, v7}, Ljava/io/Writer;->write(I)V

    .line 937
    move-object/from16 v3, p0

    goto/16 :goto_8

    .line 939
    :cond_0
    add-int/lit8 v0, v6, 0x1

    invoke-virtual {v2, v8, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v14

    .line 940
    .local v14, "amphersandIdx":I
    if-eq v14, v13, :cond_1

    if-ge v14, v12, :cond_1

    .line 942
    invoke-virtual {v1, v7}, Ljava/io/Writer;->write(I)V

    .line 943
    move-object/from16 v3, p0

    goto/16 :goto_8

    .line 945
    :cond_1
    invoke-virtual {v2, v10, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    .line 946
    .local v15, "entityContent":Ljava/lang/String;
    const/16 v16, -0x1

    .line 947
    .local v16, "entityValue":I
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v11

    .line 948
    .local v11, "entityContentLen":I
    if-lez v11, :cond_5

    .line 949
    invoke-virtual {v15, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x23

    if-ne v0, v3, :cond_4

    .line 951
    if-le v11, v9, :cond_3

    .line 952
    invoke-virtual {v15, v9}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 954
    .local v3, "isHexChar":C
    sparse-switch v3, :sswitch_data_0

    .line 961
    :try_start_0
    invoke-virtual {v15, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 957
    :sswitch_0
    const/4 v0, 0x2

    invoke-virtual {v15, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const/16 v8, 0x10

    invoke-static {v0, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 958
    .end local v16    # "entityValue":I
    .local v0, "entityValue":I
    goto :goto_2

    .line 967
    .end local v0    # "entityValue":I
    .restart local v16    # "entityValue":I
    :catch_0
    move-exception v0

    goto :goto_3

    .line 961
    :goto_1
    const/16 v8, 0xa

    invoke-static {v0, v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 964
    .end local v16    # "entityValue":I
    .restart local v0    # "entityValue":I
    :goto_2
    const v8, 0xffff

    if-le v0, v8, :cond_2

    .line 965
    const/4 v0, -0x1

    .line 969
    :cond_2
    move/from16 v16, v0

    goto :goto_4

    .line 968
    .local v0, "e":Ljava/lang/NumberFormatException;
    .restart local v16    # "entityValue":I
    :goto_3
    const/4 v8, -0x1

    move/from16 v16, v8

    .line 969
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v3    # "isHexChar":C
    :goto_4
    move-object/from16 v3, p0

    move/from16 v0, v16

    goto :goto_6

    .line 951
    :cond_3
    move-object/from16 v3, p0

    goto :goto_5

    .line 972
    :cond_4
    move-object/from16 v3, p0

    invoke-virtual {v3, v15}, Lorg/apache/commons/lang/Entities;->entityValue(Ljava/lang/String;)I

    move-result v16

    move/from16 v0, v16

    goto :goto_6

    .line 948
    :cond_5
    move-object/from16 v3, p0

    .line 976
    :goto_5
    move/from16 v0, v16

    .end local v16    # "entityValue":I
    .local v0, "entityValue":I
    :goto_6
    if-ne v0, v13, :cond_6

    .line 977
    const/16 v8, 0x26

    invoke-virtual {v1, v8}, Ljava/io/Writer;->write(I)V

    .line 978
    invoke-virtual {v1, v15}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 979
    const/16 v8, 0x3b

    invoke-virtual {v1, v8}, Ljava/io/Writer;->write(I)V

    goto :goto_7

    .line 981
    :cond_6
    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(I)V

    .line 983
    :goto_7
    move v6, v12

    .end local v0    # "entityValue":I
    .end local v10    # "nextIdx":I
    .end local v11    # "entityContentLen":I
    .end local v12    # "semiColonIdx":I
    .end local v14    # "amphersandIdx":I
    .end local v15    # "entityContent":Ljava/lang/String;
    goto :goto_8

    .line 985
    :cond_7
    move-object/from16 v3, p0

    invoke-virtual {v1, v7}, Ljava/io/Writer;->write(I)V

    .line 930
    .end local v7    # "c":C
    :goto_8
    add-int/2addr v6, v9

    const/4 v3, 0x0

    goto/16 :goto_0

    :cond_8
    move-object/from16 v3, p0

    .line 988
    .end local v6    # "i":I
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x58 -> :sswitch_0
        0x78 -> :sswitch_0
    .end sparse-switch
.end method

.method static fillWithHtml40Entities(Lorg/apache/commons/lang/Entities;)V
    .locals 1
    .param p0, "entities"    # Lorg/apache/commons/lang/Entities;

    .line 399
    sget-object v0, Lorg/apache/commons/lang/Entities;->BASIC_ARRAY:[[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/Entities;->addEntities([[Ljava/lang/String;)V

    .line 400
    sget-object v0, Lorg/apache/commons/lang/Entities;->ISO8859_1_ARRAY:[[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/Entities;->addEntities([[Ljava/lang/String;)V

    .line 401
    sget-object v0, Lorg/apache/commons/lang/Entities;->HTML40_ARRAY:[[Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/Entities;->addEntities([[Ljava/lang/String;)V

    .line 402
    return-void
.end method


# virtual methods
.method public addEntities([[Ljava/lang/String;)V
    .locals 4
    .param p1, "entityArray"    # [[Ljava/lang/String;

    .line 737
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 738
    aget-object v1, p1, v0

    const/4 v2, 0x0

    aget-object v1, v1, v2

    aget-object v2, p1, v0

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang/Entities;->addEntity(Ljava/lang/String;I)V

    .line 737
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 740
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public addEntity(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .line 753
    iget-object v0, p0, Lorg/apache/commons/lang/Entities;->map:Lorg/apache/commons/lang/Entities$EntityMap;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/lang/Entities$EntityMap;->add(Ljava/lang/String;I)V

    .line 754
    return-void
.end method

.method public entityName(I)Ljava/lang/String;
    .locals 1
    .param p1, "value"    # I

    .line 766
    iget-object v0, p0, Lorg/apache/commons/lang/Entities;->map:Lorg/apache/commons/lang/Entities$EntityMap;

    invoke-interface {v0, p1}, Lorg/apache/commons/lang/Entities$EntityMap;->name(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public entityValue(Ljava/lang/String;)I
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 779
    iget-object v0, p0, Lorg/apache/commons/lang/Entities;->map:Lorg/apache/commons/lang/Entities$EntityMap;

    invoke-interface {v0, p1}, Lorg/apache/commons/lang/Entities$EntityMap;->value(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .line 797
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/Entities;->createStringWriter(Ljava/lang/String;)Ljava/io/StringWriter;

    move-result-object v0

    .line 799
    .local v0, "stringWriter":Ljava/io/StringWriter;
    :try_start_0
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/lang/Entities;->escape(Ljava/io/Writer;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 804
    nop

    .line 805
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 800
    :catch_0
    move-exception v1

    .line 803
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v2, v1}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public escape(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 6
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 826
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    .line 827
    .local v0, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_2

    .line 828
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 829
    .local v2, "c":C
    invoke-virtual {p0, v2}, Lorg/apache/commons/lang/Entities;->entityName(I)Ljava/lang/String;

    move-result-object v3

    .line 830
    .local v3, "entityName":Ljava/lang/String;
    const/16 v4, 0x3b

    if-nez v3, :cond_1

    .line 831
    const/16 v5, 0x7f

    if-le v2, v5, :cond_0

    .line 832
    const-string v5, "&#"

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 833
    const/16 v5, 0xa

    invoke-static {v2, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 834
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 836
    :cond_0
    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(I)V

    goto :goto_1

    .line 839
    :cond_1
    const/16 v5, 0x26

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 840
    invoke-virtual {p1, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 841
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 827
    .end local v2    # "c":C
    .end local v3    # "entityName":Ljava/lang/String;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 844
    .end local v1    # "i":I
    :cond_2
    return-void
.end method

.method public unescape(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .line 861
    const/16 v0, 0x26

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 862
    .local v0, "firstAmp":I
    if-gez v0, :cond_0

    .line 863
    return-object p1

    .line 865
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/commons/lang/Entities;->createStringWriter(Ljava/lang/String;)Ljava/io/StringWriter;

    move-result-object v1

    .line 867
    .local v1, "stringWriter":Ljava/io/StringWriter;
    :try_start_0
    invoke-direct {p0, v1, p1, v0}, Lorg/apache/commons/lang/Entities;->doUnescape(Ljava/io/Writer;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 872
    nop

    .line 873
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 868
    :catch_0
    move-exception v2

    .line 871
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lorg/apache/commons/lang/UnhandledException;

    invoke-direct {v3, v2}, Lorg/apache/commons/lang/UnhandledException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public unescape(Ljava/io/Writer;Ljava/lang/String;)V
    .locals 1
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 905
    const/16 v0, 0x26

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 906
    .local v0, "firstAmp":I
    if-gez v0, :cond_0

    .line 907
    invoke-virtual {p1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 908
    return-void

    .line 910
    :cond_0
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/lang/Entities;->doUnescape(Ljava/io/Writer;Ljava/lang/String;I)V

    .line 912
    return-void
.end method
