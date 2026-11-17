package androidx.camera.core.impl;

import android.util.Log;
import androidx.camera.core.CameraIdentifier;
import androidx.camera.core.impl.Observable;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public abstract class AbstractCameraPresenceSource implements Observable<List<CameraIdentifier>> {
    private static final String TAG = "CameraPresenceSrc";
    private List<CameraIdentifier> mCurrentData;
    private Throwable mCurrentError;
    private boolean mIsActive;
    private final Object mLock;
    private final List<ObserverWrapper> mObservers;

    @Override // androidx.camera.core.impl.Observable
    public abstract ListenableFuture<List<CameraIdentifier>> fetchData();

    protected abstract void startMonitoring();

    protected abstract void stopMonitoring();

    public AbstractCameraPresenceSource() {
        this(Collections.emptyList());
    }

    public AbstractCameraPresenceSource(List<String> cameraIds) {
        this.mLock = new Object();
        this.mObservers = new CopyOnWriteArrayList();
        this.mCurrentError = null;
        this.mIsActive = false;
        ArrayList<CameraIdentifier> identifiers = new ArrayList<>();
        for (String id : cameraIds) {
            identifiers.add(CameraIdentifier.create(id));
        }
        this.mCurrentData = identifiers;
    }

    /* JADX INFO: Access modifiers changed from: private */
    static class ObserverWrapper {
        final Executor mExecutor;
        final Observable.Observer<? super List<CameraIdentifier>> mObserver;

        ObserverWrapper(Executor executor, Observable.Observer<? super List<CameraIdentifier>> observer) {
            this.mExecutor = executor;
            this.mObserver = observer;
        }
    }

    protected void updateData(List<CameraIdentifier> newData) {
        updateState(newData, null);
    }

    protected void updateError(Throwable error) {
        updateState(null, error);
    }

    private void updateState(List<CameraIdentifier> newData, Throwable error) {
        boolean shouldNotify;
        List<CameraIdentifier> dataSnapshot;
        Throwable errorSnapshot;
        synchronized (this.mLock) {
            if (error != null) {
                if (this.mCurrentError != null && this.mCurrentData.isEmpty()) {
                    shouldNotify = false;
                    this.mCurrentError = error;
                    this.mCurrentData = Collections.emptyList();
                }
                shouldNotify = true;
                this.mCurrentError = error;
                this.mCurrentData = Collections.emptyList();
            } else {
                Preconditions.checkNotNull(newData);
                if (this.mCurrentError == null && this.mCurrentData.equals(newData)) {
                    shouldNotify = false;
                    this.mCurrentError = null;
                    this.mCurrentData = newData;
                }
                shouldNotify = true;
                this.mCurrentError = null;
                this.mCurrentData = newData;
            }
            dataSnapshot = DesugarCollections.unmodifiableList(this.mCurrentData);
            errorSnapshot = this.mCurrentError;
        }
        if (shouldNotify) {
            Log.d(TAG, "Data changed. Notifying " + this.mObservers.size() + " observers. Error: " + (errorSnapshot != null));
            for (ObserverWrapper wrapper : this.mObservers) {
                notifyObserver(wrapper, dataSnapshot, errorSnapshot);
            }
        }
    }

    private void notifyObserver(final ObserverWrapper wrapper, final List<CameraIdentifier> data, final Throwable error) {
        wrapper.mExecutor.execute(new Runnable() { // from class: androidx.camera.core.impl.AbstractCameraPresenceSource$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                AbstractCameraPresenceSource.lambda$notifyObserver$0(error, wrapper, data);
            }
        });
    }

    static /* synthetic */ void lambda$notifyObserver$0(Throwable error, ObserverWrapper wrapper, List data) {
        if (error != null) {
            wrapper.mObserver.onError(error);
        } else {
            wrapper.mObserver.onNewData(data);
        }
    }

    @Override // androidx.camera.core.impl.Observable
    public void addObserver(Executor executor, Observable.Observer<? super List<CameraIdentifier>> observer) {
        List<CameraIdentifier> dataSnapshot;
        Throwable errorSnapshot;
        Preconditions.checkNotNull(executor);
        Preconditions.checkNotNull(observer);
        this.mObservers.add(new ObserverWrapper(executor, observer));
        synchronized (this.mLock) {
            if (!this.mIsActive && !this.mObservers.isEmpty()) {
                Log.i(TAG, "First observer added. Starting monitoring.");
                this.mIsActive = true;
                startMonitoring();
            }
            dataSnapshot = DesugarCollections.unmodifiableList(this.mCurrentData);
            errorSnapshot = this.mCurrentError;
        }
        notifyObserver(new ObserverWrapper(executor, observer), dataSnapshot, errorSnapshot);
    }

    @Override // androidx.camera.core.impl.Observable
    public void removeObserver(Observable.Observer<? super List<CameraIdentifier>> observerToRemove) {
        Preconditions.checkNotNull(observerToRemove);
        ObserverWrapper wrapperToRemove = null;
        Iterator<ObserverWrapper> it = this.mObservers.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            ObserverWrapper wrapper = it.next();
            if (wrapper.mObserver.equals(observerToRemove)) {
                wrapperToRemove = wrapper;
                break;
            }
        }
        if (wrapperToRemove != null) {
            this.mObservers.remove(wrapperToRemove);
        }
        synchronized (this.mLock) {
            if (this.mIsActive && this.mObservers.isEmpty()) {
                Log.i(TAG, "Last observer removed. Stopping monitoring.");
                this.mIsActive = false;
                stopMonitoring();
            }
        }
    }
}
