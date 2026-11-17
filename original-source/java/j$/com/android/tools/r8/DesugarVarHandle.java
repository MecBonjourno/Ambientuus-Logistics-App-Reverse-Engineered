package j$.com.android.tools.r8;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import sun.misc.Unsafe;

/* compiled from: D8$$SyntheticClass */
/* loaded from: classes15.dex */
public final /* synthetic */ class DesugarVarHandle {
    public final /* synthetic */ Unsafe U;
    public final /* synthetic */ long arrayIndexScale;
    public final /* synthetic */ long offset;
    public final /* synthetic */ Class recv;
    public final /* synthetic */ Class type;

    public /* synthetic */ DesugarVarHandle(Class cls) {
        Field unsafeField = getUnsafeField();
        unsafeField.setAccessible(true);
        this.U = (Unsafe) unsafeField.get(null);
        if (!cls.isArray()) {
            throw new IllegalArgumentException("not an array " + cls.getSimpleName());
        }
        Class<?> componentType = cls.getComponentType();
        if (componentType.isArray()) {
            throw new UnsupportedOperationException("Using a VarHandle for a multidimensional array " + arrayRequiringNativeSupport());
        }
        if (componentType.isPrimitive() && componentType != Integer.TYPE && componentType != Long.TYPE) {
            throw new UnsupportedOperationException("Using a VarHandle for an array of type '" + componentType.getName() + "' " + arrayRequiringNativeSupport());
        }
        this.recv = cls;
        this.type = cls.getComponentType();
        this.offset = this.U.arrayBaseOffset(this.recv);
        this.arrayIndexScale = this.U.arrayIndexScale(this.recv);
    }

    public /* synthetic */ DesugarVarHandle(Class cls, String str, Class cls2) {
        Field unsafeField = getUnsafeField();
        unsafeField.setAccessible(true);
        this.U = (Unsafe) unsafeField.get(null);
        this.recv = cls;
        this.type = cls.getDeclaredField(str).getType();
        if (cls2.isPrimitive() && cls2 != Integer.TYPE && cls2 != Long.TYPE) {
            throw new UnsupportedOperationException("Using a VarHandle for a field of type '" + cls2.getName() + "' requires native VarHandle support available from Android 13. VarHandle desugaring only supports primitive types int and long and reference types.");
        }
        this.offset = this.U.objectFieldOffset(cls.getDeclaredField(str));
        this.arrayIndexScale = 0L;
    }

    public /* synthetic */ String arrayRequiringNativeSupport() {
        return "requires native VarHandle support available from Android 13. VarHandle desugaring only supports single dimensional arrays of primitive typesint and long and reference types.";
    }

    public /* synthetic */ Object boxIntIfPossible(int i, Class cls) {
        if (cls == Long.class) {
            return Long.valueOf(i);
        }
        if (cls == Float.class) {
            return Float.valueOf(i);
        }
        if (cls == Double.class) {
            return Double.valueOf(i);
        }
        throw desugarWrongMethodTypeException();
    }

    public /* synthetic */ Object boxLongIfPossible(long j, Class cls) {
        if (cls == Float.class) {
            return Float.valueOf(j);
        }
        if (cls == Double.class) {
            return Double.valueOf(j);
        }
        throw desugarWrongMethodTypeException();
    }

    public /* synthetic */ boolean compareAndSet(Object obj, int i, int i2) {
        return this.type == Integer.TYPE ? this.U.compareAndSwapInt(obj, this.offset, i, i2) : this.type == Long.TYPE ? this.U.compareAndSwapLong(obj, this.offset, i, i2) : compareAndSet(obj, Integer.valueOf(i), Integer.valueOf(i2));
    }

    public /* synthetic */ boolean compareAndSet(Object obj, int i, Object obj2, Object obj3) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        return this.recv == int[].class ? this.U.compareAndSwapInt(obj, j, toIntIfPossible(obj2, false), toIntIfPossible(obj3, false)) : this.recv == long[].class ? this.U.compareAndSwapLong(obj, j, toLongIfPossible(obj2, false), toLongIfPossible(obj3, false)) : DesugarVarHandle$$ExternalSyntheticBackportWithForwarding0.m(this.U, obj, j, obj2, obj3);
    }

    public /* synthetic */ boolean compareAndSet(Object obj, long j, long j2) {
        return this.type == Long.TYPE ? this.U.compareAndSwapLong(obj, this.offset, j, j2) : compareAndSet(obj, Long.valueOf(j), Long.valueOf(j2));
    }

    public /* synthetic */ boolean compareAndSet(Object obj, Object obj2, Object obj3) {
        return this.type == Integer.TYPE ? this.U.compareAndSwapInt(obj, this.offset, toIntIfPossible(obj2, false), toIntIfPossible(obj3, false)) : this.type == Long.TYPE ? this.U.compareAndSwapLong(obj, this.offset, toLongIfPossible(obj2, false), toLongIfPossible(obj3, false)) : DesugarVarHandle$$ExternalSyntheticBackportWithForwarding0.m(this.U, obj, this.offset, obj2, obj3);
    }

    public /* synthetic */ boolean compareAndSet(int[] iArr, int i, int i2, int i3) {
        if (this.recv != int[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.compareAndSwapInt(iArr, this.offset + (i * this.arrayIndexScale), i2, i3);
    }

    public /* synthetic */ boolean compareAndSet(long[] jArr, int i, long j, long j2) {
        if (this.recv != long[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.compareAndSwapLong(jArr, this.offset + (i * this.arrayIndexScale), j, j2);
    }

    public /* synthetic */ RuntimeException desugarWrongMethodTypeException() {
        return new RuntimeException("java.lang.invoke.WrongMethodTypeException");
    }

    public /* synthetic */ int get(Object obj) {
        if (this.type == Integer.TYPE) {
            return this.U.getInt(obj, this.offset);
        }
        if (this.type != Long.TYPE) {
            return toIntIfPossible(this.U.getObject(obj, this.offset), true);
        }
        throw desugarWrongMethodTypeException();
    }

    public /* synthetic */ int get(int[] iArr, int i) {
        if (this.recv != int[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.getInt(iArr, this.offset + (i * this.arrayIndexScale));
    }

    /* renamed from: get, reason: collision with other method in class */
    public /* synthetic */ long m783get(Object obj) {
        return this.type == Long.TYPE ? this.U.getLong(obj, this.offset) : this.type == Integer.TYPE ? this.U.getInt(obj, this.offset) : toLongIfPossible(this.U.getObject(obj, this.offset), true);
    }

    public /* synthetic */ long get(long[] jArr, int i) {
        if (this.recv != long[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.getLong(jArr, this.offset + (i * this.arrayIndexScale));
    }

    /* renamed from: get, reason: collision with other method in class */
    public /* synthetic */ Object m784get(Object obj) {
        return this.type == Integer.TYPE ? Integer.valueOf(this.U.getInt(obj, this.offset)) : this.type == Long.TYPE ? Long.valueOf(this.U.getLong(obj, this.offset)) : this.U.getObject(obj, this.offset);
    }

    public /* synthetic */ Object get(Object obj, int i) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        return this.type == Integer.TYPE ? Integer.valueOf(this.U.getInt(obj, j)) : this.type == Long.TYPE ? Integer.valueOf((int) this.U.getLong(obj, j)) : this.U.getObject(obj, j);
    }

    public /* synthetic */ Object get(Object obj, int i, Class cls) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        if (this.type == Integer.TYPE) {
            return boxIntIfPossible(this.U.getInt(obj, j), cls);
        }
        if (this.type == Long.TYPE) {
            return boxLongIfPossible(this.U.getLong(obj, j), cls);
        }
        Object object = this.U.getObject(obj, j);
        return (!(object instanceof Integer) || cls == Integer.class) ? (!(object instanceof Long) || cls == Long.class) ? object : boxLongIfPossible(((Long) object).longValue(), cls) : boxIntIfPossible(((Integer) object).intValue(), cls);
    }

    public /* synthetic */ Object get(Object obj, Class cls) {
        return this.type == Integer.TYPE ? boxIntIfPossible(this.U.getInt(obj, this.offset), cls) : this.type == Long.TYPE ? boxLongIfPossible(this.U.getLong(obj, this.offset), cls) : this.U.getObject(obj, this.offset);
    }

    public /* synthetic */ Field getUnsafeField() {
        try {
            return Unsafe.class.getDeclaredField("theUnsafe");
        } catch (NoSuchFieldException e) {
            for (Field field : Unsafe.class.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) && Unsafe.class.isAssignableFrom(field.getType())) {
                    return field;
                }
            }
            throw new UnsupportedOperationException("Couldn't find the Unsafe", e);
        }
    }

    public /* synthetic */ int getVolatile(Object obj) {
        if (this.type == Integer.TYPE) {
            return this.U.getIntVolatile(obj, this.offset);
        }
        if (this.type != Long.TYPE) {
            return toIntIfPossible(this.U.getObjectVolatile(obj, this.offset), true);
        }
        throw desugarWrongMethodTypeException();
    }

    public /* synthetic */ int getVolatile(int[] iArr, int i) {
        if (this.recv != int[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.getIntVolatile(iArr, this.offset + (i * this.arrayIndexScale));
    }

    /* renamed from: getVolatile, reason: collision with other method in class */
    public /* synthetic */ long m785getVolatile(Object obj) {
        return this.type == Long.TYPE ? this.U.getLongVolatile(obj, this.offset) : this.type == Integer.TYPE ? this.U.getIntVolatile(obj, this.offset) : toLongIfPossible(this.U.getObjectVolatile(obj, this.offset), true);
    }

    public /* synthetic */ long getVolatile(long[] jArr, int i) {
        if (this.recv != long[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.getLongVolatile(jArr, this.offset + (i * this.arrayIndexScale));
    }

    /* renamed from: getVolatile, reason: collision with other method in class */
    public /* synthetic */ Object m786getVolatile(Object obj) {
        return this.type == Integer.TYPE ? Integer.valueOf(this.U.getIntVolatile(obj, this.offset)) : this.type == Long.TYPE ? Long.valueOf(this.U.getLongVolatile(obj, this.offset)) : this.U.getObjectVolatile(obj, this.offset);
    }

    public /* synthetic */ Object getVolatile(Object obj, int i) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        return this.type == Integer.TYPE ? Integer.valueOf(this.U.getIntVolatile(obj, j)) : this.type == Long.TYPE ? Integer.valueOf((int) this.U.getLongVolatile(obj, j)) : this.U.getObjectVolatile(obj, j);
    }

    public /* synthetic */ Object getVolatile(Object obj, int i, Class cls) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        if (this.type == Integer.TYPE) {
            return boxIntIfPossible(this.U.getIntVolatile(obj, j), cls);
        }
        if (this.type == Long.TYPE) {
            return boxLongIfPossible(this.U.getLongVolatile(obj, j), cls);
        }
        Object objectVolatile = this.U.getObjectVolatile(obj, j);
        return (!(objectVolatile instanceof Integer) || cls == Integer.class) ? (!(objectVolatile instanceof Long) || cls == Long.class) ? objectVolatile : boxLongIfPossible(((Long) objectVolatile).longValue(), cls) : boxIntIfPossible(((Integer) objectVolatile).intValue(), cls);
    }

    public /* synthetic */ Object getVolatile(Object obj, Class cls) {
        return this.type == Integer.TYPE ? boxIntIfPossible(this.U.getIntVolatile(obj, this.offset), cls) : this.type == Long.TYPE ? boxLongIfPossible(this.U.getLongVolatile(obj, this.offset), cls) : this.U.getObjectVolatile(obj, this.offset);
    }

    public /* synthetic */ void set(Object obj, int i) {
        if (this.type == Integer.TYPE) {
            this.U.putInt(obj, this.offset, i);
        } else if (this.type == Long.TYPE) {
            this.U.putLong(obj, this.offset, i);
        } else {
            set(obj, Integer.valueOf(i));
        }
    }

    public /* synthetic */ void set(Object obj, int i, Object obj2) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        if (this.recv == int[].class) {
            this.U.putInt(obj, j, toIntIfPossible(obj2, false));
        } else if (this.recv == long[].class) {
            this.U.putLong(obj, j, toLongIfPossible(obj2, false));
        } else {
            this.U.putObject(obj, j, obj2);
        }
    }

    public /* synthetic */ void set(Object obj, long j) {
        if (this.type == Long.TYPE) {
            this.U.putLong(obj, this.offset, j);
        } else {
            if (this.type == Integer.TYPE) {
                throw desugarWrongMethodTypeException();
            }
            this.U.putObject(obj, this.offset, Long.valueOf(j));
        }
    }

    public /* synthetic */ void set(Object obj, Object obj2) {
        if (this.type == Integer.TYPE) {
            set(obj, toIntIfPossible(obj2, false));
        } else if (this.type == Long.TYPE) {
            set(obj, toLongIfPossible(obj2, false));
        } else {
            this.U.putObject(obj, this.offset, obj2);
        }
    }

    public /* synthetic */ void set(int[] iArr, int i, int i2) {
        if (this.recv != int[].class) {
            throw new UnsupportedOperationException();
        }
        this.U.putInt(iArr, this.offset + (i * this.arrayIndexScale), i2);
    }

    public /* synthetic */ void set(long[] jArr, int i, long j) {
        if (this.recv != long[].class) {
            throw new UnsupportedOperationException();
        }
        this.U.putLong(jArr, this.offset + (i * this.arrayIndexScale), j);
    }

    public /* synthetic */ void setRelease(Object obj, int i) {
        if (this.type == Integer.TYPE) {
            this.U.putOrderedInt(obj, this.offset, i);
        } else if (this.type == Long.TYPE) {
            this.U.putOrderedLong(obj, this.offset, i);
        } else {
            setRelease(obj, Integer.valueOf(i));
        }
    }

    public /* synthetic */ void setRelease(Object obj, int i, Object obj2) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        if (this.recv == int[].class) {
            this.U.putOrderedInt(obj, j, toIntIfPossible(obj2, false));
        } else if (this.recv == long[].class) {
            this.U.putOrderedLong(obj, j, toLongIfPossible(obj2, false));
        } else {
            this.U.putOrderedObject(obj, j, obj2);
        }
    }

    public /* synthetic */ void setRelease(Object obj, long j) {
        if (this.type == Long.TYPE) {
            this.U.putOrderedLong(obj, this.offset, j);
        } else {
            if (this.type == Integer.TYPE) {
                throw desugarWrongMethodTypeException();
            }
            this.U.putOrderedObject(obj, this.offset, Long.valueOf(j));
        }
    }

    public /* synthetic */ void setRelease(Object obj, Object obj2) {
        if (this.type == Integer.TYPE) {
            setRelease(obj, toIntIfPossible(obj2, false));
        } else if (this.type == Long.TYPE) {
            setRelease(obj, toLongIfPossible(obj2, false));
        } else {
            this.U.putOrderedObject(obj, this.offset, obj2);
        }
    }

    public /* synthetic */ void setRelease(int[] iArr, int i, int i2) {
        if (this.recv != int[].class) {
            throw new UnsupportedOperationException();
        }
        this.U.putOrderedInt(iArr, this.offset + (i * this.arrayIndexScale), i2);
    }

    public /* synthetic */ void setRelease(long[] jArr, int i, long j) {
        if (this.recv != long[].class) {
            throw new UnsupportedOperationException();
        }
        this.U.putOrderedLong(jArr, this.offset + (i * this.arrayIndexScale), j);
    }

    public /* synthetic */ void setVolatile(Object obj, int i) {
        if (this.type == Integer.TYPE) {
            this.U.putIntVolatile(obj, this.offset, i);
        } else if (this.type == Long.TYPE) {
            this.U.putLongVolatile(obj, this.offset, i);
        } else {
            setVolatile(obj, Integer.valueOf(i));
        }
    }

    public /* synthetic */ void setVolatile(Object obj, int i, Object obj2) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        if (this.recv == int[].class) {
            this.U.putIntVolatile(obj, j, toIntIfPossible(obj2, false));
        } else if (this.recv == long[].class) {
            this.U.putLongVolatile(obj, j, toLongIfPossible(obj2, false));
        } else {
            this.U.putObjectVolatile(obj, j, obj2);
        }
    }

    public /* synthetic */ void setVolatile(Object obj, long j) {
        if (this.type == Long.TYPE) {
            this.U.putLongVolatile(obj, this.offset, j);
        } else {
            if (this.type == Integer.TYPE) {
                throw desugarWrongMethodTypeException();
            }
            this.U.putObjectVolatile(obj, this.offset, Long.valueOf(j));
        }
    }

    public /* synthetic */ void setVolatile(Object obj, Object obj2) {
        if (this.type == Integer.TYPE) {
            setVolatile(obj, toIntIfPossible(obj2, false));
        } else if (this.type == Long.TYPE) {
            setVolatile(obj, toLongIfPossible(obj2, false));
        } else {
            this.U.putObjectVolatile(obj, this.offset, obj2);
        }
    }

    public /* synthetic */ void setVolatile(int[] iArr, int i, int i2) {
        if (this.recv != int[].class) {
            throw new UnsupportedOperationException();
        }
        this.U.putIntVolatile(iArr, this.offset + (i * this.arrayIndexScale), i2);
    }

    public /* synthetic */ void setVolatile(long[] jArr, int i, long j) {
        if (this.recv != long[].class) {
            throw new UnsupportedOperationException();
        }
        this.U.putLongVolatile(jArr, this.offset + (i * this.arrayIndexScale), j);
    }

    public /* synthetic */ int toIntIfPossible(Object obj, boolean z) {
        if (obj instanceof Integer) {
            return ((Integer) obj).intValue();
        }
        if (obj instanceof Byte) {
            return ((Byte) obj).byteValue();
        }
        if (obj instanceof Character) {
            return ((Character) obj).charValue();
        }
        if (obj instanceof Short) {
            return ((Short) obj).shortValue();
        }
        if (z) {
            throw new ClassCastException();
        }
        throw desugarWrongMethodTypeException();
    }

    public /* synthetic */ long toLongIfPossible(Object obj, boolean z) {
        return obj instanceof Long ? ((Long) obj).longValue() : toIntIfPossible(obj, z);
    }

    public /* synthetic */ boolean weakCompareAndSet(Object obj, int i, int i2) {
        return this.type == Integer.TYPE ? this.U.compareAndSwapInt(obj, this.offset, i, i2) : this.type == Long.TYPE ? this.U.compareAndSwapLong(obj, this.offset, i, i2) : compareAndSet(obj, Integer.valueOf(i), Integer.valueOf(i2));
    }

    public /* synthetic */ boolean weakCompareAndSet(Object obj, int i, Object obj2, Object obj3) {
        if (!this.recv.isArray() || this.recv != obj.getClass()) {
            throw new UnsupportedOperationException();
        }
        long j = this.offset + (i * this.arrayIndexScale);
        return this.recv == int[].class ? this.U.compareAndSwapInt(obj, j, toIntIfPossible(obj2, false), toIntIfPossible(obj3, false)) : this.recv == long[].class ? this.U.compareAndSwapLong(obj, j, toLongIfPossible(obj2, false), toLongIfPossible(obj3, false)) : DesugarVarHandle$$ExternalSyntheticBackportWithForwarding0.m(this.U, obj, j, obj2, obj3);
    }

    public /* synthetic */ boolean weakCompareAndSet(Object obj, long j, long j2) {
        return this.type == Long.TYPE ? this.U.compareAndSwapLong(obj, this.offset, j, j2) : compareAndSet(obj, Long.valueOf(j), Long.valueOf(j2));
    }

    public /* synthetic */ boolean weakCompareAndSet(Object obj, Object obj2, Object obj3) {
        return this.type == Integer.TYPE ? this.U.compareAndSwapInt(obj, this.offset, toIntIfPossible(obj2, false), toIntIfPossible(obj3, false)) : this.type == Long.TYPE ? this.U.compareAndSwapLong(obj, this.offset, toLongIfPossible(obj2, false), toLongIfPossible(obj3, false)) : DesugarVarHandle$$ExternalSyntheticBackportWithForwarding0.m(this.U, obj, this.offset, obj2, obj3);
    }

    public /* synthetic */ boolean weakCompareAndSet(int[] iArr, int i, int i2, int i3) {
        if (this.recv != int[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.compareAndSwapInt(iArr, this.offset + (i * this.arrayIndexScale), i2, i3);
    }

    public /* synthetic */ boolean weakCompareAndSet(long[] jArr, int i, long j, long j2) {
        if (this.recv != long[].class) {
            throw new UnsupportedOperationException();
        }
        return this.U.compareAndSwapLong(jArr, this.offset + (i * this.arrayIndexScale), j, j2);
    }
}
