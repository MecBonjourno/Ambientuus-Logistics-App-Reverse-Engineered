package androidx.camera.core.processing.concurrent;

import androidx.camera.core.processing.SurfaceEdge;
import androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode;
import java.util.List;

/* carregado de: classes.dex */
final class AutoValue_DualSurfaceProcessorNode_In extends DualSurfaceProcessorNode.In {
    private final List<DualOutConfig> outConfigs;
    private final SurfaceEdge primarySurfaceEdge;
    private final SurfaceEdge secondarySurfaceEdge;

    AutoValue_DualSurfaceProcessorNode_In(SurfaceEdge primarySurfaceEdge, SurfaceEdge secondarySurfaceEdge, List<DualOutConfig> outConfigs) {
        if (primarySurfaceEdge == null) {
            throw new NullPointerException("Null primarySurfaceEdge");
        }
        this.primarySurfaceEdge = primarySurfaceEdge;
        if (secondarySurfaceEdge == null) {
            throw new NullPointerException("Null secondarySurfaceEdge");
        }
        this.secondarySurfaceEdge = secondarySurfaceEdge;
        if (outConfigs == null) {
            throw new NullPointerException("Null outConfigs");
        }
        this.outConfigs = outConfigs;
    }

    @Override // androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode.In
    public SurfaceEdge getPrimarySurfaceEdge() {
        return this.primarySurfaceEdge;
    }

    @Override // androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode.In
    public SurfaceEdge getSecondarySurfaceEdge() {
        return this.secondarySurfaceEdge;
    }

    @Override // androidx.camera.core.processing.concurrent.DualSurfaceProcessorNode.In
    public List<DualOutConfig> getOutConfigs() {
        return this.outConfigs;
    }

    public String toString() {
        return "In{primarySurfaceEdge=" + this.primarySurfaceEdge + ", secondarySurfaceEdge=" + this.secondarySurfaceEdge + ", outConfigs=" + this.outConfigs + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof DualSurfaceProcessorNode.In)) {
            return false;
        }
        DualSurfaceProcessorNode.In that = (DualSurfaceProcessorNode.In) o;
        return this.primarySurfaceEdge.equals(that.getPrimarySurfaceEdge()) && this.secondarySurfaceEdge.equals(that.getSecondarySurfaceEdge()) && this.outConfigs.equals(that.getOutConfigs());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((h$ ^ this.primarySurfaceEdge.hashCode()) * 1000003) ^ this.secondarySurfaceEdge.hashCode()) * 1000003) ^ this.outConfigs.hashCode();
    }
}
