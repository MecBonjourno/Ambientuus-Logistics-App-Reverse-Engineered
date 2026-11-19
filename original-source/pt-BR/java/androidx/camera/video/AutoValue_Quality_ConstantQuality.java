package androidx.camera.video;

import android.util.Size;
import androidx.camera.video.Quality;
import java.util.List;

/* carregado de: classes.dex */
final class AutoValue_Quality_ConstantQuality extends Quality.ConstantQuality {
    private final int highSpeedValue;
    private final String name;
    private final List<Size> typicalSizes;
    private final int value;

    AutoValue_Quality_ConstantQuality(int value, int highSpeedValue, String name, List<Size> typicalSizes) {
        this.value = value;
        this.highSpeedValue = highSpeedValue;
        if (name == null) {
            throw new NullPointerException("Null name");
        }
        this.name = name;
        if (typicalSizes == null) {
            throw new NullPointerException("Null typicalSizes");
        }
        this.typicalSizes = typicalSizes;
    }

    @Override // androidx.camera.video.Quality.ConstantQuality
    int getValue() {
        return this.value;
    }

    @Override // androidx.camera.video.Quality.ConstantQuality
    int getHighSpeedValue() {
        return this.highSpeedValue;
    }

    @Override // androidx.camera.video.Quality.ConstantQuality
    public String getName() {
        return this.name;
    }

    @Override // androidx.camera.video.Quality.ConstantQuality
    public List<Size> getTypicalSizes() {
        return this.typicalSizes;
    }

    public String toString() {
        return "ConstantQuality{value=" + this.value + ", highSpeedValue=" + this.highSpeedValue + ", name=" + this.name + ", typicalSizes=" + this.typicalSizes + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Quality.ConstantQuality)) {
            return false;
        }
        Quality.ConstantQuality that = (Quality.ConstantQuality) o;
        return this.value == that.getValue() && this.highSpeedValue == that.getHighSpeedValue() && this.name.equals(that.getName()) && this.typicalSizes.equals(that.getTypicalSizes());
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.value) * 1000003) ^ this.highSpeedValue) * 1000003) ^ this.name.hashCode()) * 1000003) ^ this.typicalSizes.hashCode();
    }
}
