package com.google.common.graph;

import java.util.Set;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public abstract class AbstractGraph<N> extends AbstractBaseGraph<N> implements Graph<N> {
    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.PredecessorsFunction
    public /* bridge */ /* sintético */ Iterable predecessors(Object obj) {
        Iterable predecessors;
        predecessors = predecessors((AbstractGraph<N>) ((Graph) obj));
        return predecessors;
    }

    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.SuccessorsFunction
    public /* bridge */ /* sintético */ Iterable successors(Object obj) {
        Iterable successors;
        successors = successors((AbstractGraph<N>) ((Graph) obj));
        return successors;
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ int degree(Object obj) {
        return super.degree(obj);
    }

    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ Set edges() {
        return super.edges();
    }

    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ boolean hasEdgeConnecting(EndpointPair endpointPair) {
        return super.hasEdgeConnecting(endpointPair);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ boolean hasEdgeConnecting(Object obj, Object obj2) {
        return super.hasEdgeConnecting(obj, obj2);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ int inDegree(Object obj) {
        return super.inDegree(obj);
    }

    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ ElementOrder incidentEdgeOrder() {
        return super.incidentEdgeOrder();
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ Set incidentEdges(Object obj) {
        return super.incidentEdges(obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ int outDegree(Object obj) {
        return super.outDegree(obj);
    }

    @Override // com.google.common.graph.Graph
    public final boolean equals(@CheckForNull Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Graph)) {
            return false;
        }
        Graph<?> other = (Graph) obj;
        return isDirected() == other.isDirected() && nodes().equals(other.nodes()) && edges().equals(other.edges());
    }

    @Override // com.google.common.graph.Graph
    public final int hashCode() {
        return edges().hashCode();
    }

    public String toString() {
        boolean isDirected = isDirected();
        boolean allowsSelfLoops = allowsSelfLoops();
        String valueOf = String.valueOf(nodes());
        String valueOf2 = String.valueOf(edges());
        return new StringBuilder(String.valueOf(valueOf).length() + 59 + String.valueOf(valueOf2).length()).append("isDirected: ").append(isDirected).append(", allowsSelfLoops: ").append(allowsSelfLoops).append(", nodes: ").append(valueOf).append(", edges: ").append(valueOf2).toString();
    }
}
