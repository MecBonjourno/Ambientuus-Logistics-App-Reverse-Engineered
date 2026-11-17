package androidx.credentials.webauthn;

import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.ranges.RangesKt;
import kotlin.text.Charsets;
import kotlin.text.StringsKt;

/* compiled from: Cbor.kt */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0011\n\u0002\u0010\u0012\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0002#$B\u0005¢\u0006\u0002\u0010\u0002J\u0018\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u0019H\u0002J\u000e\u0010\u001a\u001a\u00020\u00012\u0006\u0010\u001b\u001a\u00020\u0016J\u000e\u0010\u001c\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u0001J\u0018\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001b\u001a\u00020\u00162\u0006\u0010\u001f\u001a\u00020\u0004H\u0002J\u0018\u0010 \u001a\u00020\u00042\u0006\u0010\u001b\u001a\u00020\u00162\u0006\u0010\u001f\u001a\u00020\u0004H\u0002J\u0018\u0010!\u001a\u00020\"2\u0006\u0010\u001b\u001a\u00020\u00162\u0006\u0010\u001f\u001a\u00020\u0004H\u0002R\u0014\u0010\u0003\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0014\u0010\u0007\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0006R\u0014\u0010\t\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u0006R\u0014\u0010\u000b\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u0006R\u0014\u0010\r\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u0006R\u0014\u0010\u000f\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0006R\u0014\u0010\u0011\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0006R\u0014\u0010\u0013\u001a\u00020\u0004X\u0086D¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0006¨\u0006%"}, d2 = {"Landroidx/credentials/webauthn/Cbor;", "", "()V", "TYPE_ARRAY", "", "getTYPE_ARRAY", "()I", "TYPE_BYTE_STRING", "getTYPE_BYTE_STRING", "TYPE_FLOAT", "getTYPE_FLOAT", "TYPE_MAP", "getTYPE_MAP", "TYPE_NEGATIVE_INT", "getTYPE_NEGATIVE_INT", "TYPE_TAG", "getTYPE_TAG", "TYPE_TEXT_STRING", "getTYPE_TEXT_STRING", "TYPE_UNSIGNED_INT", "getTYPE_UNSIGNED_INT", "createArg", "", "type", "arg", "", "decode", "data", "encode", "getArg", "Landroidx/credentials/webauthn/Cbor$Arg;", TypedValues.CycleType.S_WAVE_OFFSET, "getType", "parseItem", "Landroidx/credentials/webauthn/Cbor$Item;", "Arg", "Item", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class Cbor {
    private final int TYPE_UNSIGNED_INT;
    private final int TYPE_NEGATIVE_INT = 1;
    private final int TYPE_BYTE_STRING = 2;
    private final int TYPE_TEXT_STRING = 3;
    private final int TYPE_ARRAY = 4;
    private final int TYPE_MAP = 5;
    private final int TYPE_TAG = 6;
    private final int TYPE_FLOAT = 7;

    /* compiled from: Cbor.kt */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005J\t\u0010\n\u001a\u00020\u0001HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0004HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00012\b\b\u0002\u0010\u0003\u001a\u00020\u0004HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0004HÖ\u0001J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0001¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\t¨\u0006\u0013"}, d2 = {"Landroidx/credentials/webauthn/Cbor$Item;", "", "item", "len", "", "(Ljava/lang/Object;I)V", "getItem", "()Ljava/lang/Object;", "getLen", "()I", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final /* data */ class Item {
        private final Object item;
        private final int len;

        public static /* synthetic */ Item copy$default(Item item, Object obj, int i, int i2, Object obj2) {
            if ((i2 & 1) != 0) {
                obj = item.item;
            }
            if ((i2 & 2) != 0) {
                i = item.len;
            }
            return item.copy(obj, i);
        }

        /* renamed from: component1, reason: from getter */
        public final Object getItem() {
            return this.item;
        }

        /* renamed from: component2, reason: from getter */
        public final int getLen() {
            return this.len;
        }

        public final Item copy(Object item, int len) {
            Intrinsics.checkNotNullParameter(item, "item");
            return new Item(item, len);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Item)) {
                return false;
            }
            Item item = (Item) other;
            return Intrinsics.areEqual(this.item, item.item) && this.len == item.len;
        }

        public int hashCode() {
            return (this.item.hashCode() * 31) + this.len;
        }

        public String toString() {
            return "Item(item=" + this.item + ", len=" + this.len + ')';
        }

        public Item(Object item, int len) {
            Intrinsics.checkNotNullParameter(item, "item");
            this.item = item;
            this.len = len;
        }

        public final Object getItem() {
            return this.item;
        }

        public final int getLen() {
            return this.len;
        }
    }

    /* compiled from: Cbor.kt */
    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\t\u0010\f\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0014"}, d2 = {"Landroidx/credentials/webauthn/Cbor$Arg;", "", "arg", "", "len", "", "(JI)V", "getArg", "()J", "getLen", "()I", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final /* data */ class Arg {
        private final long arg;
        private final int len;

        public static /* synthetic */ Arg copy$default(Arg arg, long j, int i, int i2, Object obj) {
            if ((i2 & 1) != 0) {
                j = arg.arg;
            }
            if ((i2 & 2) != 0) {
                i = arg.len;
            }
            return arg.copy(j, i);
        }

        /* renamed from: component1, reason: from getter */
        public final long getArg() {
            return this.arg;
        }

        /* renamed from: component2, reason: from getter */
        public final int getLen() {
            return this.len;
        }

        public final Arg copy(long arg, int len) {
            return new Arg(arg, len);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Arg)) {
                return false;
            }
            Arg arg = (Arg) other;
            return this.arg == arg.arg && this.len == arg.len;
        }

        public int hashCode() {
            return (OutputConfigurationCompatApi24Impl$OutputConfigurationParamsApi24$$ExternalSyntheticBackport0.m(this.arg) * 31) + this.len;
        }

        public String toString() {
            return "Arg(arg=" + this.arg + ", len=" + this.len + ')';
        }

        public Arg(long arg, int len) {
            this.arg = arg;
            this.len = len;
        }

        public final long getArg() {
            return this.arg;
        }

        public final int getLen() {
            return this.len;
        }
    }

    public final int getTYPE_UNSIGNED_INT() {
        return this.TYPE_UNSIGNED_INT;
    }

    public final int getTYPE_NEGATIVE_INT() {
        return this.TYPE_NEGATIVE_INT;
    }

    public final int getTYPE_BYTE_STRING() {
        return this.TYPE_BYTE_STRING;
    }

    public final int getTYPE_TEXT_STRING() {
        return this.TYPE_TEXT_STRING;
    }

    public final int getTYPE_ARRAY() {
        return this.TYPE_ARRAY;
    }

    public final int getTYPE_MAP() {
        return this.TYPE_MAP;
    }

    public final int getTYPE_TAG() {
        return this.TYPE_TAG;
    }

    public final int getTYPE_FLOAT() {
        return this.TYPE_FLOAT;
    }

    public final Object decode(byte[] data) {
        Intrinsics.checkNotNullParameter(data, "data");
        Item ret = parseItem(data, 0);
        return ret.getItem();
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [T, java.util.Map] */
    public final byte[] encode(Object data) {
        Intrinsics.checkNotNullParameter(data, "data");
        if (data instanceof Number) {
            if (data instanceof Double) {
                throw new IllegalArgumentException("Don't support doubles yet");
            }
            long value = ((Number) data).longValue();
            if (value >= 0) {
                return createArg(this.TYPE_UNSIGNED_INT, value);
            }
            return createArg(this.TYPE_NEGATIVE_INT, (-1) - value);
        }
        if (data instanceof byte[]) {
            return ArraysKt.plus(createArg(this.TYPE_BYTE_STRING, ((byte[]) data).length), (byte[]) data);
        }
        if (data instanceof String) {
            return ArraysKt.plus(createArg(this.TYPE_TEXT_STRING, ((String) data).length()), StringsKt.encodeToByteArray((String) data));
        }
        if (data instanceof List) {
            byte[] ret = createArg(this.TYPE_ARRAY, ((List) data).size());
            for (Object i : (List) data) {
                Intrinsics.checkNotNull(i);
                ret = ArraysKt.plus(ret, encode(i));
            }
            return ret;
        }
        if (data instanceof Map) {
            byte[] ret2 = createArg(this.TYPE_MAP, ((Map) data).size());
            final Ref.ObjectRef byteMap = new Ref.ObjectRef();
            byteMap.element = new LinkedHashMap();
            for (Map.Entry i2 : ((Map) data).entrySet()) {
                Map map = (Map) byteMap.element;
                Object key = i2.getKey();
                Intrinsics.checkNotNull(key);
                byte[] encode = encode(key);
                Object value2 = i2.getValue();
                Intrinsics.checkNotNull(value2);
                map.put(encode, encode(value2));
            }
            ArrayList keysList = new ArrayList(((Map) byteMap.element).keySet());
            CollectionsKt.sortedWith(keysList, new Comparator() { // from class: androidx.credentials.webauthn.Cbor$$ExternalSyntheticLambda0
                @Override // java.util.Comparator
                public final int compare(Object obj, Object obj2) {
                    int encode$lambda$0;
                    encode$lambda$0 = Cbor.encode$lambda$0(Ref.ObjectRef.this, (byte[]) obj, (byte[]) obj2);
                    return encode$lambda$0;
                }
            });
            Iterator it = keysList.iterator();
            while (it.hasNext()) {
                byte[] key2 = (byte[]) it.next();
                Intrinsics.checkNotNullExpressionValue(key2, "key");
                byte[] ret3 = ArraysKt.plus(ret2, key2);
                Object obj = ((Map) byteMap.element).get(key2);
                Intrinsics.checkNotNull(obj);
                ret2 = ArraysKt.plus(ret3, (byte[]) obj);
            }
            return ret2;
        }
        throw new IllegalArgumentException("Bad type");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int encode$lambda$0(Ref.ObjectRef $byteMap, byte[] a, byte[] b) {
        Object obj = ((Map) $byteMap.element).get(a);
        Intrinsics.checkNotNull(obj);
        byte[] aBytes = (byte[]) obj;
        Object obj2 = ((Map) $byteMap.element).get(b);
        Intrinsics.checkNotNull(obj2);
        byte[] bBytes = (byte[]) obj2;
        if (a.length > b.length) {
            return 1;
        }
        if (a.length < b.length) {
            return -1;
        }
        if (aBytes.length > bBytes.length) {
            return 1;
        }
        return aBytes.length < bBytes.length ? -1 : 0;
    }

    private final int getType(byte[] data, int offset) {
        int d = data[offset];
        return (d & 255) >> 5;
    }

    private final Arg getArg(byte[] data, int offset) {
        long arg = data[offset] & 31;
        if (arg < 24) {
            return new Arg(arg, 1);
        }
        if (arg == 24) {
            return new Arg(255 & data[offset + 1], 2);
        }
        if (arg == 25) {
            long ret = (data[offset + 1] & 255) << 8;
            return new Arg((255 & data[offset + 2]) | ret, 3);
        }
        if (arg == 26) {
            long ret2 = (data[offset + 1] & 255) << 24;
            return new Arg((255 & data[offset + 4]) | ret2 | ((data[offset + 2] & 255) << 16) | ((data[offset + 3] & 255) << 8), 5);
        }
        throw new IllegalArgumentException("Bad arg");
    }

    private final Item parseItem(byte[] data, int offset) {
        int itemType = getType(data, offset);
        Arg arg = getArg(data, offset);
        System.out.println((Object) ("Type " + itemType + ' ' + arg.getArg() + ' ' + arg.getLen()));
        if (itemType == this.TYPE_UNSIGNED_INT) {
            return new Item(Long.valueOf(arg.getArg()), arg.getLen());
        }
        if (itemType == this.TYPE_NEGATIVE_INT) {
            return new Item(Long.valueOf((-1) - arg.getArg()), arg.getLen());
        }
        if (itemType == this.TYPE_BYTE_STRING) {
            return new Item(ArraysKt.sliceArray(data, RangesKt.until(arg.getLen() + offset, arg.getLen() + offset + ((int) arg.getArg()))), arg.getLen() + ((int) arg.getArg()));
        }
        if (itemType == this.TYPE_TEXT_STRING) {
            return new Item(new String(ArraysKt.sliceArray(data, RangesKt.until(arg.getLen() + offset, arg.getLen() + offset + ((int) arg.getArg()))), Charsets.UTF_8), arg.getLen() + ((int) arg.getArg()));
        }
        if (itemType == this.TYPE_ARRAY) {
            List ret = new ArrayList();
            int consumed = arg.getLen();
            int arg2 = (int) arg.getArg();
            for (int i = 0; i < arg2; i++) {
                Item item = parseItem(data, offset + consumed);
                ret.add(item.getItem());
                consumed += item.getLen();
            }
            return new Item(CollectionsKt.toList(ret), consumed);
        }
        if (itemType == this.TYPE_MAP) {
            Map ret2 = new LinkedHashMap();
            int consumed2 = arg.getLen();
            int arg3 = (int) arg.getArg();
            for (int i2 = 0; i2 < arg3; i2++) {
                Item key = parseItem(data, offset + consumed2);
                int consumed3 = consumed2 + key.getLen();
                Item value = parseItem(data, offset + consumed3);
                consumed2 = consumed3 + value.getLen();
                ret2.put(key.getItem(), value.getItem());
            }
            return new Item(MapsKt.toMap(ret2), consumed2);
        }
        throw new IllegalArgumentException("Bad type");
    }

    private final byte[] createArg(int type, long arg) {
        int t = type << 5;
        int a = (int) arg;
        if (arg < 24) {
            return new byte[]{(byte) ((t | a) & 255)};
        }
        if (arg <= 255) {
            return new byte[]{(byte) ((t | 24) & 255), (byte) (a & 255)};
        }
        if (arg <= 65535) {
            return new byte[]{(byte) ((t | 25) & 255), (byte) ((a >> 8) & 255), (byte) (a & 255)};
        }
        if (arg <= 4294967295L) {
            return new byte[]{(byte) ((t | 26) & 255), (byte) ((a >> 24) & 255), (byte) ((a >> 16) & 255), (byte) ((a >> 8) & 255), (byte) (a & 255)};
        }
        throw new IllegalArgumentException("bad Arg");
    }
}
