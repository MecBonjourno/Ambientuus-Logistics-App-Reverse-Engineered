package androidx.camera.camera2.internal;

import android.util.Size;
import androidx.camera.camera2.internal.SupportedSurfaceCombination;
import java.util.List;

/* loaded from: classes.dex */
final class AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs extends SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs {
    private final List<Size> bestSizes;
    private final List<Size> bestSizesForStreamUseCase;
    private final int maxFpsForAllSizes;
    private final int maxFpsForBestSizes;
    private final int maxFpsForStreamUseCase;

    AutoValue_SupportedSurfaceCombination_BestSizesAndMaxFpsForConfigs(List<Size> bestSizes, List<Size> bestSizesForStreamUseCase, int maxFpsForBestSizes, int maxFpsForStreamUseCase, int maxFpsForAllSizes) {
        this.bestSizes = bestSizes;
        this.bestSizesForStreamUseCase = bestSizesForStreamUseCase;
        this.maxFpsForBestSizes = maxFpsForBestSizes;
        this.maxFpsForStreamUseCase = maxFpsForStreamUseCase;
        this.maxFpsForAllSizes = maxFpsForAllSizes;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs
    List<Size> getBestSizes() {
        return this.bestSizes;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs
    List<Size> getBestSizesForStreamUseCase() {
        return this.bestSizesForStreamUseCase;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs
    int getMaxFpsForBestSizes() {
        return this.maxFpsForBestSizes;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs
    int getMaxFpsForStreamUseCase() {
        return this.maxFpsForStreamUseCase;
    }

    @Override // androidx.camera.camera2.internal.SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs
    int getMaxFpsForAllSizes() {
        return this.maxFpsForAllSizes;
    }

    public String toString() {
        return "BestSizesAndMaxFpsForConfigs{bestSizes=" + this.bestSizes + ", bestSizesForStreamUseCase=" + this.bestSizesForStreamUseCase + ", maxFpsForBestSizes=" + this.maxFpsForBestSizes + ", maxFpsForStreamUseCase=" + this.maxFpsForStreamUseCase + ", maxFpsForAllSizes=" + this.maxFpsForAllSizes + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs)) {
            return false;
        }
        SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs that = (SupportedSurfaceCombination.BestSizesAndMaxFpsForConfigs) o;
        if (this.bestSizes != null ? this.bestSizes.equals(that.getBestSizes()) : that.getBestSizes() == null) {
            if (this.bestSizesForStreamUseCase != null ? this.bestSizesForStreamUseCase.equals(that.getBestSizesForStreamUseCase()) : that.getBestSizesForStreamUseCase() == null) {
                if (this.maxFpsForBestSizes == that.getMaxFpsForBestSizes() && this.maxFpsForStreamUseCase == that.getMaxFpsForStreamUseCase() && this.maxFpsForAllSizes == that.getMaxFpsForAllSizes()) {
                    return true;
                }
            }
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((h$ ^ (this.bestSizes == null ? 0 : this.bestSizes.hashCode())) * 1000003) ^ (this.bestSizesForStreamUseCase != null ? this.bestSizesForStreamUseCase.hashCode() : 0)) * 1000003) ^ this.maxFpsForBestSizes) * 1000003) ^ this.maxFpsForStreamUseCase) * 1000003) ^ this.maxFpsForAllSizes;
    }
}
