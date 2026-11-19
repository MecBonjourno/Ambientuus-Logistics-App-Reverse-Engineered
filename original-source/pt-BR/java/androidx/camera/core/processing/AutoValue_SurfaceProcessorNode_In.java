package androidx.camera.core.processing;

import androidx.camera.core.processing.SurfaceProcessorNode;
import androidx.camera.core.processing.util.OutConfig;
import java.util.List;

/* carregado de: classes.dex */
final class AutoValue_SurfaceProcessorNode_In extends SurfaceProcessorNode.In {
    private final List<OutConfig> outConfigs;
    private final SurfaceEdge surfaceEdge;

    AutoValue_SurfaceProcessorNode_In(SurfaceEdge surfaceEdge, List<OutConfig> outConfigs) {
        if (surfaceEdge == null) {
            throw new NullPointerException("Null surfaceEdge");
        }
        this.surfaceEdge = surfaceEdge;
        if (outConfigs == null) {
            throw new NullPointerException("Null outConfigs");
        }
        this.outConfigs = outConfigs;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.In
    public SurfaceEdge getSurfaceEdge() {
        return this.surfaceEdge;
    }

    @Override // androidx.camera.core.processing.SurfaceProcessorNode.In
    public List<OutConfig> getOutConfigs() {
        return this.outConfigs;
    }

    public String toString() {
        return "In{surfaceEdge=" + this.surfaceEdge + ", outConfigs=" + this.outConfigs + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SurfaceProcessorNode.In)) {
            return false;
        }
        SurfaceProcessorNode.In that = (SurfaceProcessorNode.In) o;
        return this.surfaceEdge.equals(that.getSurfaceEdge()) && this.outConfigs.equals(that.getOutConfigs());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.surfaceEdge.hashCode()) * 1000003) ^ this.outConfigs.hashCode();
    }
}
