package j$.util.concurrent;

import j$.util.Map;
import j$.util.Objects;
import j$.util.concurrent.ConcurrentMap;
import j$.util.function.BiConsumer$CC;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* carregado de: classes15.dex */
public interface ConcurrentMap<K, V> extends Map<K, V> {

    /* compiled from: D8$$SyntheticClass */
    /* renomeado de: j$.util.concurrent.ConcurrentMap$-EL, motivo: nome de classe inválido */
    public final /* sintético */ class EL {
        public static /* sintético */ Object compute(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, BiFunction biFunction) {
            return concurrentMap instanceof ConcurrentMap ? ((ConcurrentMap) concurrentMap).compute(obj, biFunction) : CC.$default$compute(concurrentMap, obj, biFunction);
        }

        public static /* sintético */ Object computeIfAbsent(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, Function function) {
            return concurrentMap instanceof ConcurrentMap ? ((ConcurrentMap) concurrentMap).computeIfAbsent(obj, function) : CC.$default$computeIfAbsent(concurrentMap, obj, function);
        }

        public static /* sintético */ Object computeIfPresent(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, BiFunction biFunction) {
            return concurrentMap instanceof ConcurrentMap ? ((ConcurrentMap) concurrentMap).computeIfPresent(obj, biFunction) : CC.$default$computeIfPresent(concurrentMap, obj, biFunction);
        }

        public static /* sintético */ void forEach(java.util.concurrent.ConcurrentMap concurrentMap, BiConsumer biConsumer) {
            if (concurrentMap instanceof ConcurrentMap) {
                ((ConcurrentMap) concurrentMap).forEach(biConsumer);
            } else {
                CC.$default$forEach(concurrentMap, biConsumer);
            }
        }

        public static /* sintético */ Object getOrDefault(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, Object obj2) {
            return concurrentMap instanceof ConcurrentMap ? ((ConcurrentMap) concurrentMap).getOrDefault(obj, obj2) : CC.$default$getOrDefault(concurrentMap, obj, obj2);
        }

        public static /* sintético */ Object merge(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, Object obj2, BiFunction biFunction) {
            return concurrentMap instanceof ConcurrentMap ? ((ConcurrentMap) concurrentMap).merge(obj, obj2, biFunction) : CC.$default$merge(concurrentMap, obj, obj2, biFunction);
        }

        public static /* sintético */ void replaceAll(java.util.concurrent.ConcurrentMap concurrentMap, BiFunction biFunction) {
            if (concurrentMap instanceof ConcurrentMap) {
                ((ConcurrentMap) concurrentMap).replaceAll(biFunction);
            } else {
                CC.$default$replaceAll(concurrentMap, biFunction);
            }
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    V compute(K k, BiFunction<? super K, ? super V, ? extends V> biFunction);

    @Override // java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    V computeIfAbsent(K k, Function<? super K, ? extends V> function);

    @Override // java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    V computeIfPresent(K k, BiFunction<? super K, ? super V, ? extends V> biFunction);

    @Override // java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    void forEach(BiConsumer<? super K, ? super V> biConsumer);

    @Override // java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    V getOrDefault(Object obj, V v);

    @Override // java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    V merge(K k, V v, BiFunction<? super V, ? super V, ? extends V> biFunction);

    @Override // java.util.concurrent.ConcurrentMap, j$.util.concurrent.ConcurrentMap, j$.util.Map
    void replaceAll(BiFunction<? super K, ? super V, ? extends V> biFunction);

    /* renomeado de: j$.util.concurrent.ConcurrentMap$-CC, motivo: nome de classe inválido */
    public final /* sintético */ class CC {
        public static Object $default$getOrDefault(java.util.concurrent.ConcurrentMap _this, Object key, Object obj) {
            Object obj2 = _this.get(key);
            return obj2 != null ? obj2 : obj;
        }

        public static void $default$forEach(java.util.concurrent.ConcurrentMap _this, BiConsumer biConsumer) {
            Objects.requireNonNull(biConsumer);
            for (Map.Entry<K, V> entry : _this.entrySet()) {
                try {
                    K k = entry.getKey();
                    V v = entry.getValue();
                    biConsumer.accept(k, v);
                } catch (IllegalStateException e) {
                }
            }
        }

        public static void $default$replaceAll(final java.util.concurrent.ConcurrentMap _this, final BiFunction biFunction) {
            Objects.requireNonNull(biFunction);
            EL.forEach(_this, new BiConsumer() { // da classe: j$.util.concurrent.ConcurrentMap$$ExternalSyntheticLambda0
                @Override // java.util.function.BiConsumer
                public final void accept(Object obj, Object obj2) {
                    ConcurrentMap.CC.$private$lambda$replaceAll$0(_this, biFunction, obj, obj2);
                }

                @Override // java.util.function.BiConsumer
                public /* sintético */ BiConsumer andThen(BiConsumer biConsumer) {
                    return BiConsumer$CC.$default$andThen(this, biConsumer);
                }
            });
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public static /* sintético */ void $private$lambda$replaceAll$0(java.util.concurrent.ConcurrentMap concurrentMap, BiFunction function, Object k, Object v) {
            while (!concurrentMap.replace(k, v, function.apply(k, v))) {
                Object obj = concurrentMap.get(k);
                v = obj;
                if (obj == null) {
                    return;
                }
            }
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public static Object $default$computeIfAbsent(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, Function function) {
            Object apply;
            Objects.requireNonNull(function);
            Object obj2 = concurrentMap.get(obj);
            Object obj3 = obj2;
            if (obj2 == null && (apply = function.apply(obj)) != null) {
                Object putIfAbsent = concurrentMap.putIfAbsent(obj, apply);
                obj3 = putIfAbsent;
                if (putIfAbsent == null) {
                    return apply;
                }
            }
            return obj3;
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public static Object $default$computeIfPresent(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, BiFunction biFunction) {
            Object apply;
            Objects.requireNonNull(biFunction);
            while (true) {
                Object obj2 = concurrentMap.get(obj);
                if (obj2 != null) {
                    apply = biFunction.apply(obj, obj2);
                    if (apply == null) {
                        if (concurrentMap.remove(obj, obj2)) {
                            break;
                        }
                    } else if (concurrentMap.replace(obj, obj2, apply)) {
                        break;
                    }
                } else {
                    return null;
                }
            }
            return apply;
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public static Object $default$compute(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, BiFunction biFunction) {
            Object apply;
            Object putIfAbsent;
            while (true) {
                Object obj2 = concurrentMap.get(obj);
                do {
                    apply = biFunction.apply(obj, obj2);
                    if (apply != null) {
                        if (obj2 != null) {
                            if (concurrentMap.replace(obj, obj2, apply)) {
                                return apply;
                            }
                        } else {
                            putIfAbsent = concurrentMap.putIfAbsent(obj, apply);
                            obj2 = putIfAbsent;
                        }
                    } else if (obj2 == null || concurrentMap.remove(obj, obj2)) {
                        return null;
                    }
                } while (putIfAbsent != null);
                return apply;
            }
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        public static Object $default$merge(java.util.concurrent.ConcurrentMap concurrentMap, Object obj, Object obj2, BiFunction biFunction) {
            Objects.requireNonNull(biFunction);
            Objects.requireNonNull(obj2);
            while (true) {
                Object obj3 = concurrentMap.get(obj);
                while (obj3 == null) {
                    Object putIfAbsent = concurrentMap.putIfAbsent(obj, obj2);
                    obj3 = putIfAbsent;
                    if (putIfAbsent == null) {
                        return obj2;
                    }
                }
                Object apply = biFunction.apply(obj3, obj2);
                if (apply != null) {
                    if (concurrentMap.replace(obj, obj3, apply)) {
                        return apply;
                    }
                } else if (concurrentMap.remove(obj, obj3)) {
                    return null;
                }
            }
        }
    }
}
