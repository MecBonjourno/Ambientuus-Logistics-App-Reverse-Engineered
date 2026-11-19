package androidx.camera.view;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MediatorLiveData;
import androidx.lifecycle.Observer;

/* carregado de: classes.dex */
final class ForwardingLiveData<T> extends MediatorLiveData<T> {
    private LiveData<T> mLiveDataSource;

    ForwardingLiveData() {
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    void setSource(LiveData<T> liveData) {
        if (this.mLiveDataSource != null) {
            super.removeSource(this.mLiveDataSource);
        }
        this.mLiveDataSource = liveData;
        super.addSource(liveData, new Observer() { // da classe: androidx.camera.view.ForwardingLiveData$$ExternalSyntheticLambda0
            @Override // androidx.lifecycle.Observer
            public final void onChanged(Object obj) {
                ForwardingLiveData.this.setValue(obj);
            }
        });
    }

    @Override // androidx.lifecycle.LiveData
    public T getValue() {
        if (this.mLiveDataSource == null) {
            return null;
        }
        return this.mLiveDataSource.getValue();
    }
}
