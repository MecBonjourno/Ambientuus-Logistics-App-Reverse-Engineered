package j$.util;

import java.util.Map;

/* loaded from: classes15.dex */
final class KeyValueHolder<K, V> implements Map.Entry<K, V> {
    final K key;
    final V value;

    /* JADX WARN: Generic types in debug info not equals: j$.util.KeyValueHolder != java.util.KeyValueHolder<K, V> */
    KeyValueHolder(K k, V v) {
        this.key = (K) Objects.requireNonNull(k);
        this.value = (V) Objects.requireNonNull(v);
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.KeyValueHolder != java.util.KeyValueHolder<K, V> */
    @Override // java.util.Map.Entry
    public K getKey() {
        return this.key;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.KeyValueHolder != java.util.KeyValueHolder<K, V> */
    @Override // java.util.Map.Entry
    public V getValue() {
        return this.value;
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.KeyValueHolder != java.util.KeyValueHolder<K, V> */
    @Override // java.util.Map.Entry
    public V setValue(V value) {
        throw new UnsupportedOperationException("not supported");
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.KeyValueHolder != java.util.KeyValueHolder<K, V> */
    @Override // java.util.Map.Entry
    public boolean equals(Object o) {
        if (!(o instanceof Map.Entry)) {
            return false;
        }
        Map.Entry<?, ?> e = (Map.Entry) o;
        return this.key.equals(e.getKey()) && this.value.equals(e.getValue());
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.KeyValueHolder != java.util.KeyValueHolder<K, V> */
    @Override // java.util.Map.Entry
    public int hashCode() {
        return this.key.hashCode() ^ this.value.hashCode();
    }

    /* JADX WARN: Generic types in debug info not equals: j$.util.KeyValueHolder != java.util.KeyValueHolder<K, V> */
    public String toString() {
        return this.key + "=" + this.value;
    }
}
