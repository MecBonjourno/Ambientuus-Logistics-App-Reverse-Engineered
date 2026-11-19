package com.google.android.material.stateful;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.collection.SimpleArrayMap;
import androidx.customview.view.AbsSavedState;

/* carregado de: classes16.dex */
public class ExtendableSavedState extends AbsSavedState {
    public static final Parcelable.Creator<ExtendableSavedState> CREATOR = new Parcelable.ClassLoaderCreator<ExtendableSavedState>() { // da classe: com.google.android.material.stateful.ExtendableSavedState.1
        /* JADX WARN: não é possível renomear o método para resolver a colisão */
        @Override // android.os.Parcelable.ClassLoaderCreator
        public ExtendableSavedState createFromParcel(Parcel in, ClassLoader loader) {
            return new ExtendableSavedState(in, loader);
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @Override // android.os.Parcelable.Creator
        public ExtendableSavedState createFromParcel(Parcel parcel) {
            return new ExtendableSavedState(parcel, null);
        }

        @Override // android.os.Parcelable.Creator
        public ExtendableSavedState[] newArray(int size) {
            return new ExtendableSavedState[size];
        }
    };
    public final SimpleArrayMap<String, Bundle> extendableStates;

    public ExtendableSavedState(Parcelable superState) {
        super(superState);
        this.extendableStates = new SimpleArrayMap<>();
    }

    private ExtendableSavedState(Parcel in, ClassLoader loader) {
        super(in, loader);
        int size = in.readInt();
        String[] keys = new String[size];
        in.readStringArray(keys);
        Bundle[] states = new Bundle[size];
        in.readTypedArray(states, Bundle.CREATOR);
        this.extendableStates = new SimpleArrayMap<>(size);
        for (int i = 0; i < size; i++) {
            this.extendableStates.put(keys[i], states[i]);
        }
    }

    @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        super.writeToParcel(out, flags);
        int size = this.extendableStates.getSize();
        out.writeInt(size);
        String[] keys = new String[size];
        Bundle[] states = new Bundle[size];
        for (int i = 0; i < size; i++) {
            keys[i] = this.extendableStates.keyAt(i);
            states[i] = this.extendableStates.valueAt(i);
        }
        out.writeStringArray(keys);
        out.writeTypedArray(states, 0);
    }

    public String toString() {
        return "ExtendableSavedState{" + Integer.toHexString(System.identityHashCode(this)) + " states=" + this.extendableStates + "}";
    }
}
