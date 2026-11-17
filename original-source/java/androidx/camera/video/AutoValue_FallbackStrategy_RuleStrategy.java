package androidx.camera.video;

import androidx.camera.video.FallbackStrategy;

/* loaded from: classes.dex */
final class AutoValue_FallbackStrategy_RuleStrategy extends FallbackStrategy.RuleStrategy {
    private final Quality fallbackQuality;
    private final int fallbackRule;

    AutoValue_FallbackStrategy_RuleStrategy(Quality fallbackQuality, int fallbackRule) {
        if (fallbackQuality == null) {
            throw new NullPointerException("Null fallbackQuality");
        }
        this.fallbackQuality = fallbackQuality;
        this.fallbackRule = fallbackRule;
    }

    @Override // androidx.camera.video.FallbackStrategy.RuleStrategy
    Quality getFallbackQuality() {
        return this.fallbackQuality;
    }

    @Override // androidx.camera.video.FallbackStrategy.RuleStrategy
    int getFallbackRule() {
        return this.fallbackRule;
    }

    public String toString() {
        return "RuleStrategy{fallbackQuality=" + this.fallbackQuality + ", fallbackRule=" + this.fallbackRule + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof FallbackStrategy.RuleStrategy)) {
            return false;
        }
        FallbackStrategy.RuleStrategy that = (FallbackStrategy.RuleStrategy) o;
        return this.fallbackQuality.equals(that.getFallbackQuality()) && this.fallbackRule == that.getFallbackRule();
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((h$ ^ this.fallbackQuality.hashCode()) * 1000003) ^ this.fallbackRule;
    }
}
