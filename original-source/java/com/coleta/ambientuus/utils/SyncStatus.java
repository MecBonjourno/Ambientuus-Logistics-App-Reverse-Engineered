package com.coleta.ambientuus.utils;

import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import com.coleta.ambientuus.domain.model.SyncState;

/* loaded from: classes5.dex */
public class SyncStatus {
    private static final MutableLiveData<SyncState> status = new MutableLiveData<>(SyncState.IDLE);

    public static LiveData<SyncState> getStatus() {
        return status;
    }

    public static void setStatus(SyncState value) {
        status.postValue(value);
    }

    public static void clearObservars(LifecycleOwner owner) {
        status.removeObservers(owner);
    }
}
