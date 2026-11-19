package org.apache.commons.lang.mutable;

import java.io.Serializable;
import org.apache.commons.lang.BooleanUtils;

/* carregado de: classes17.dex */
public class MutableBoolean implements Mutable, Serializable, Comparable {
    private static final long serialVersionUID = -4830728138360036487L;
    private boolean value;

    public MutableBoolean() {
    }

    public MutableBoolean(boolean value) {
        this.value = value;
    }

    public MutableBoolean(Boolean value) {
        this.value = value.booleanValue();
    }

    public boolean booleanValue() {
        return this.value;
    }

    @Override // java.lang.Comparable
    public int compareTo(Object obj) {
        MutableBoolean other = (MutableBoolean) obj;
        boolean anotherVal = other.value;
        if (this.value == anotherVal) {
            return 0;
        }
        return this.value ? 1 : -1;
    }

    public boolean equals(Object obj) {
        return (obj instanceof MutableBoolean) && this.value == ((MutableBoolean) obj).booleanValue();
    }

    @Override // org.apache.commons.lang.mutable.Mutable
    public Object getValue() {
        return BooleanUtils.toBooleanObject(this.value);
    }

    public int hashCode() {
        return (this.value ? Boolean.TRUE : Boolean.FALSE).hashCode();
    }

    public void setValue(boolean value) {
        this.value = value;
    }

    @Override // org.apache.commons.lang.mutable.Mutable
    public void setValue(Object value) {
        setValue(((Boolean) value).booleanValue());
    }

    public String toString() {
        return String.valueOf(this.value);
    }
}
