package com.google.common.collect;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public final class ArrayListMultimap<K, V> extends ArrayListMultimapGwtSerializationDependencies<K, V> {
    private static final int DEFAULT_VALUES_PER_KEY = 3;
    private static final long serialVersionUID = 0;
    transient int expectedValuesPerKey;

    @Override // com.google.common.collect.AbstractListMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    public /* bridge */ /* sintético */ Map asMap() {
        return super.asMap();
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ void clear() {
        super.clear();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean containsEntry(@CheckForNull Object obj, @CheckForNull Object obj2) {
        return super.containsEntry(obj, obj2);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean containsKey(@CheckForNull Object obj) {
        return super.containsKey(obj);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean containsValue(@CheckForNull Object obj) {
        return super.containsValue(obj);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection entries() {
        return super.entries();
    }

    @Override // com.google.common.collect.AbstractListMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap, com.google.common.collect.ListMultimap
    public /* bridge */ /* sintético */ boolean equals(@CheckForNull Object obj) {
        return super.equals(obj);
    }

    @Override // com.google.common.collect.AbstractListMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ List get(@ParametricNullness Object obj) {
        return super.get(obj);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ int hashCode() {
        return super.hashCode();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean isEmpty() {
        return super.isEmpty();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Set keySet() {
        return super.keySet();
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Multiset keys() {
        return super.keys();
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.AbstractListMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean put(@ParametricNullness Object obj, @ParametricNullness Object obj2) {
        return super.put(obj, obj2);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean putAll(Multimap multimap) {
        return super.putAll(multimap);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean putAll(@ParametricNullness Object obj, Iterable iterable) {
        return super.putAll(obj, iterable);
    }

    @Override // com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ boolean remove(@CheckForNull Object obj, @CheckForNull Object obj2) {
        return super.remove(obj, obj2);
    }

    @Override // com.google.common.collect.AbstractListMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ List removeAll(@CheckForNull Object obj) {
        return super.removeAll(obj);
    }

    @Override // com.google.common.collect.AbstractListMultimap, com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ List replaceValues(@ParametricNullness Object obj, Iterable iterable) {
        return super.replaceValues(obj, iterable);
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ int size() {
        return super.size();
    }

    @Override // com.google.common.collect.AbstractMultimap
    public /* bridge */ /* sintético */ String toString() {
        return super.toString();
    }

    @Override // com.google.common.collect.AbstractMapBasedMultimap, com.google.common.collect.AbstractMultimap, com.google.common.collect.Multimap
    public /* bridge */ /* sintético */ Collection values() {
        return super.values();
    }

    public static <K, V> ArrayListMultimap<K, V> create() {
        return new ArrayListMultimap<>();
    }

    public static <K, V> ArrayListMultimap<K, V> create(int expectedKeys, int expectedValuesPerKey) {
        return new ArrayListMultimap<>(expectedKeys, expectedValuesPerKey);
    }

    public static <K, V> ArrayListMultimap<K, V> create(Multimap<? extends K, ? extends V> multimap) {
        return new ArrayListMultimap<>(multimap);
    }

    private ArrayListMultimap() {
        this(12, 3);
    }

    private ArrayListMultimap(int expectedKeys, int expectedValuesPerKey) {
        super(Platform.newHashMapWithExpectedSize(expectedKeys));
        CollectPreconditions.checkNonnegative(expectedValuesPerKey, "expectedValuesPerKey");
        this.expectedValuesPerKey = expectedValuesPerKey;
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private ArrayListMultimap(com.google.common.collect.Multimap<? extends K, ? extends V> r3) {
        /*
            r2 = this;
            java.util.Set r0 = r3.keySet()
            int r0 = r0.size()
            boolean r1 = r3 instanceof com.google.common.collect.ArrayListMultimap
            if (r1 == 0) goto L13
            r1 = r3
            com.google.common.collect.ArrayListMultimap r1 = (com.google.common.collect.ArrayListMultimap) r1
            int r1 = r1.expectedValuesPerKey
            goto L14
        L13:
            r1 = 3
        L14:
            r2.<init>(r0, r1)
            r2.putAll(r3)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.common.collect.ArrayListMultimap.<init>(com.google.common.collect.Multimap):void");
    }

    /* JADX INFO: modificadores de acesso alterados de: package-private */
    @Override // com.google.common.collect.AbstractListMultimap, com.google.common.collect.AbstractMapBasedMultimap
    public List<V> createCollection() {
        return new ArrayList(this.expectedValuesPerKey);
    }

    @Deprecated
    public void trimToSize() {
        for (Collection<V> collection : backingMap().values()) {
            ArrayList<V> arrayList = (ArrayList) collection;
            arrayList.trimToSize();
        }
    }

    private void writeObject(ObjectOutputStream stream) throws IOException {
        stream.defaultWriteObject();
        Serialization.writeMultimap(this, stream);
    }

    private void readObject(ObjectInputStream stream) throws IOException, ClassNotFoundException {
        stream.defaultReadObject();
        this.expectedValuesPerKey = 3;
        int distinctKeys = Serialization.readCount(stream);
        Map<K, Collection<V>> map = CompactHashMap.create();
        setMap(map);
        Serialization.populateMultimap(this, stream, distinctKeys);
    }
}
