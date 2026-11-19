package androidx.transition;

import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PointF;
import android.util.Property;

/* carregado de: classes.dex */
class PathProperty<T> extends Property<T, Float> {
    private float mCurrentFraction;
    private final float mPathLength;
    private final PathMeasure mPathMeasure;
    private final PointF mPointF;
    private final float[] mPosition;
    private final Property<T, PointF> mProperty;

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // android.util.Property
    public /* bridge */ /* sintético */ Float get(Object obj) {
        return get((PathProperty<T>) obj);
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    @Override // android.util.Property
    public /* bridge */ /* sintético */ void set(Object obj, Float f) {
        set2((PathProperty<T>) obj, f);
    }

    PathProperty(Property<T, PointF> property, Path path) {
        super(Float.class, property.getName());
        this.mPosition = new float[2];
        this.mPointF = new PointF();
        this.mProperty = property;
        this.mPathMeasure = new PathMeasure(path, false);
        this.mPathLength = this.mPathMeasure.getLength();
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // android.util.Property
    public Float get(T object) {
        return Float.valueOf(this.mCurrentFraction);
    }

    /* renomeado de: set, motivo: evitar colisão após correção de tipos em outro método */
    public void set2(T target, Float fraction) {
        this.mCurrentFraction = fraction.floatValue();
        this.mPathMeasure.getPosTan(this.mPathLength * fraction.floatValue(), this.mPosition, null);
        this.mPointF.x = this.mPosition[0];
        this.mPointF.y = this.mPosition[1];
        this.mProperty.set(target, this.mPointF);
    }
}
