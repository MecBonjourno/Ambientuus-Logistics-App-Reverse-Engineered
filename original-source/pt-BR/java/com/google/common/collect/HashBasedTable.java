package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public class HashBasedTable<R, C, V> extends StandardTable<R, C, V> {
    private static final long serialVersionUID = 0;

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Set cellSet() {
        return super.cellSet();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ void clear() {
        super.clear();
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Map column(Object obj) {
        return super.column(obj);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Set columnKeySet() {
        return super.columnKeySet();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Map columnMap() {
        return super.columnMap();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ boolean contains(@CheckForNull Object obj, @CheckForNull Object obj2) {
        return super.contains(obj, obj2);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ boolean containsColumn(@CheckForNull Object obj) {
        return super.containsColumn(obj);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ boolean containsRow(@CheckForNull Object obj) {
        return super.containsRow(obj);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ boolean containsValue(@CheckForNull Object obj) {
        return super.containsValue(obj);
    }

    @Override // com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ boolean equals(@CheckForNull Object obj) {
        return super.equals(obj);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    @CheckForNull
    public /* bridge */ /* sintético */ Object get(@CheckForNull Object obj, @CheckForNull Object obj2) {
        return super.get(obj, obj2);
    }

    @Override // com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ int hashCode() {
        return super.hashCode();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ boolean isEmpty() {
        return super.isEmpty();
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    @CheckForNull
    public /* bridge */ /* sintético */ Object put(Object obj, Object obj2, Object obj3) {
        return super.put(obj, obj2, obj3);
    }

    @Override // com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ void putAll(Table table) {
        super.putAll(table);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    @CheckForNull
    public /* bridge */ /* sintético */ Object remove(@CheckForNull Object obj, @CheckForNull Object obj2) {
        return super.remove(obj, obj2);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Map row(Object obj) {
        return super.row(obj);
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Set rowKeySet() {
        return super.rowKeySet();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Map rowMap() {
        return super.rowMap();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ int size() {
        return super.size();
    }

    @Override // com.google.common.collect.AbstractTable
    public /* bridge */ /* sintético */ String toString() {
        return super.toString();
    }

    @Override // com.google.common.collect.StandardTable, com.google.common.collect.AbstractTable, com.google.common.collect.Table
    public /* bridge */ /* sintético */ Collection values() {
        return super.values();
    }

    private static class Factory<C, V> implements Supplier<Map<C, V>>, Serializable {
        private static final long serialVersionUID = 0;
        final int expectedSize;

        Factory(int expectedSize) {
            this.expectedSize = expectedSize;
        }

        @Override // com.google.common.base.Supplier
        public Map<C, V> get() {
            return Maps.newLinkedHashMapWithExpectedSize(this.expectedSize);
        }
    }

    public static <R, C, V> HashBasedTable<R, C, V> create() {
        return new HashBasedTable<>(new LinkedHashMap(), new Factory(0));
    }

    public static <R, C, V> HashBasedTable<R, C, V> create(int expectedRows, int expectedCellsPerRow) {
        CollectPreconditions.checkNonnegative(expectedCellsPerRow, "expectedCellsPerRow");
        Map<R, Map<C, V>> backingMap = Maps.newLinkedHashMapWithExpectedSize(expectedRows);
        return new HashBasedTable<>(backingMap, new Factory(expectedCellsPerRow));
    }

    public static <R, C, V> HashBasedTable<R, C, V> create(Table<? extends R, ? extends C, ? extends V> table) {
        HashBasedTable<R, C, V> result = create();
        result.putAll(table);
        return result;
    }

    HashBasedTable(Map<R, Map<C, V>> backingMap, Factory<C, V> factory) {
        super(backingMap, factory);
    }
}
