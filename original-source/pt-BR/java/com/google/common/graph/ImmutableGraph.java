package com.google.common.graph;

import com.google.common.base.Function;
import com.google.common.base.Functions;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.google.common.graph.GraphConstants;
import com.google.errorprone.annotations.Immutable;
import java.util.Set;

@Immutable(containerOf = {"N"})
@ElementTypesAreNonnullByDefault
/* carregado de: classes16.dex */
public class ImmutableGraph<N> extends ForwardingGraph<N> {
    private final BaseGraph<N> backingGraph;

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public /* bridge */ /* sintético */ Set adjacentNodes(Object obj) {
        return super.adjacentNodes(obj);
    }

    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public /* bridge */ /* sintético */ boolean allowsSelfLoops() {
        return super.allowsSelfLoops();
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ int degree(Object obj) {
        return super.degree(obj);
    }

    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ boolean hasEdgeConnecting(EndpointPair endpointPair) {
        return super.hasEdgeConnecting(endpointPair);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ boolean hasEdgeConnecting(Object obj, Object obj2) {
        return super.hasEdgeConnecting(obj, obj2);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ int inDegree(Object obj) {
        return super.inDegree(obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ Set incidentEdges(Object obj) {
        return super.incidentEdges(obj);
    }

    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public /* bridge */ /* sintético */ boolean isDirected() {
        return super.isDirected();
    }

    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public /* bridge */ /* sintético */ ElementOrder nodeOrder() {
        return super.nodeOrder();
    }

    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.BaseGraph, com.google.common.graph.Graph
    public /* bridge */ /* sintético */ Set nodes() {
        return super.nodes();
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public /* bridge */ /* sintético */ int outDegree(Object obj) {
        return super.outDegree(obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.PredecessorsFunction
    public /* bridge */ /* sintético */ Set predecessors(Object obj) {
        return super.predecessors((ImmutableGraph<N>) obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.SuccessorsFunction
    public /* bridge */ /* sintético */ Set successors(Object obj) {
        return super.successors((ImmutableGraph<N>) obj);
    }

    ImmutableGraph(BaseGraph<N> backingGraph) {
        this.backingGraph = backingGraph;
    }

    public static <N> ImmutableGraph<N> copyOf(Graph<N> graph) {
        if (graph instanceof ImmutableGraph) {
            return (ImmutableGraph) graph;
        }
        return new ImmutableGraph<>(new StandardValueGraph(GraphBuilder.from(graph), getNodeConnections(graph), graph.edges().size()));
    }

    @Deprecated
    public static <N> ImmutableGraph<N> copyOf(ImmutableGraph<N> graph) {
        return (ImmutableGraph) Preconditions.checkNotNull(graph);
    }

    @Override // com.google.common.graph.ForwardingGraph, com.google.common.graph.AbstractGraph, com.google.common.graph.AbstractBaseGraph, com.google.common.graph.BaseGraph
    public ElementOrder<N> incidentEdgeOrder() {
        return ElementOrder.stable();
    }

    private static <N> ImmutableMap<N, GraphConnections<N, GraphConstants.Presence>> getNodeConnections(Graph<N> graph) {
        ImmutableMap.Builder<N, GraphConnections<N, GraphConstants.Presence>> nodeConnections = ImmutableMap.builder();
        for (N node : graph.nodes()) {
            nodeConnections.put(node, connectionsOf(graph, node));
        }
        return nodeConnections.buildOrThrow();
    }

    private static <N> GraphConnections<N, GraphConstants.Presence> connectionsOf(Graph<N> graph, N node) {
        Function<N, GraphConstants.Presence> edgeValueFn = Functions.constant(GraphConstants.Presence.EDGE_EXISTS);
        if (graph.isDirected()) {
            return DirectedGraphConnections.ofImmutable(node, graph.incidentEdges(node), edgeValueFn);
        }
        return UndirectedGraphConnections.ofImmutable(Maps.asMap(graph.adjacentNodes(node), edgeValueFn));
    }

    @Override // com.google.common.graph.ForwardingGraph
    BaseGraph<N> delegate() {
        return this.backingGraph;
    }

    public static class Builder<N> {
        private final MutableGraph<N> mutableGraph;

        Builder(GraphBuilder<N> graphBuilder) {
            this.mutableGraph = graphBuilder.copy().incidentEdgeOrder(ElementOrder.stable()).build();
        }

        public Builder<N> addNode(N node) {
            this.mutableGraph.addNode(node);
            return this;
        }

        public Builder<N> putEdge(N nodeU, N nodeV) {
            this.mutableGraph.putEdge(nodeU, nodeV);
            return this;
        }

        public Builder<N> putEdge(EndpointPair<N> endpoints) {
            this.mutableGraph.putEdge(endpoints);
            return this;
        }

        public ImmutableGraph<N> build() {
            return ImmutableGraph.copyOf(this.mutableGraph);
        }
    }
}
