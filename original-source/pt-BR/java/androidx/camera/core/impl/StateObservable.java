package androidx.camera.core.impl;

import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import j$.util.Objects;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* carregado de: classes.dex */
public abstract class StateObservable<T> implements Observable<T> {
    private static final int INITIAL_VERSION = 0;
    private final AtomicReference<Object> mState;
    private final Object mLock = new Object();
    private int mVersion = 0;
    private boolean mUpdating = false;
    private final Map<Observable.Observer<? super T>, ObserverWrapper<T>> mWrapperMap = new HashMap();
    private final CopyOnWriteArraySet<ObserverWrapper<T>> mNotifySet = new CopyOnWriteArraySet<>();

    StateObservable(Object initialState, boolean isError) {
        if (isError) {
            Preconditions.checkArgument(initialState instanceof Throwable, "Initial errors must be Throwable");
            this.mState = new AtomicReference<>(ErrorWrapper.wrap((Throwable) initialState));
        } else {
            this.mState = new AtomicReference<>(initialState);
        }
    }

    void updateState(T state) {
        updateStateInternal(state);
    }

    void updateStateAsError(Throwable error) {
        updateStateInternal(ErrorWrapper.wrap(error));
    }

    private void updateStateInternal(Object newState) {
        synchronized (this.mLock) {
            Object oldState = this.mState.getAndSet(newState);
            if (Objects.equals(oldState, newState)) {
                return;
            }
            int currentVersion = this.mVersion + 1;
            this.mVersion = currentVersion;
            if (this.mUpdating) {
                return;
            }
            this.mUpdating = true;
            Iterator<ObserverWrapper<T>> notifyIter = this.mNotifySet.iterator();
            while (true) {
                if (notifyIter.hasNext()) {
                    notifyIter.next().update(currentVersion);
                } else {
                    synchronized (this.mLock) {
                        if (this.mVersion == currentVersion) {
                            this.mUpdating = false;
                            return;
                        } else {
                            notifyIter = this.mNotifySet.iterator();
                            currentVersion = this.mVersion;
                        }
                    }
                }
            }
        }
    }

    @Override // androidx.camera.core.impl.Observable
    public ListenableFuture<T> fetchData() {
        Object state = this.mState.get();
        if (state instanceof ErrorWrapper) {
            return Futures.immediateFailedFuture(((ErrorWrapper) state).getError());
        }
        return Futures.immediateFuture(state);
    }

    @Override // androidx.camera.core.impl.Observable
    public void addObserver(Executor executor, Observable.Observer<? super T> observer) {
        ObserverWrapper<T> wrapper;
        synchronized (this.mLock) {
            removeObserverLocked(observer);
            wrapper = new ObserverWrapper<>(this.mState, executor, observer);
            this.mWrapperMap.put(observer, wrapper);
            this.mNotifySet.add(wrapper);
        }
        wrapper.update(0);
    }

    @Override // androidx.camera.core.impl.Observable
    public void removeObserver(Observable.Observer<? super T> observer) {
        synchronized (this.mLock) {
            removeObserverLocked(observer);
        }
    }

    public void removeObservers() {
        synchronized (this.mLock) {
            Iterator it = new HashSet(this.mWrapperMap.keySet()).iterator();
            while (it.hasNext()) {
                Observable.Observer<? super T> observer = (Observable.Observer) it.next();
                removeObserverLocked(observer);
            }
        }
    }

    private void removeObserverLocked(Observable.Observer<? super T> observer) {
        ObserverWrapper<T> wrapper = this.mWrapperMap.remove(observer);
        if (wrapper != null) {
            wrapper.close();
            this.mNotifySet.remove(wrapper);
        }
    }

    private static final class ObserverWrapper<T> implements Runnable {
        private static final Object NOT_SET = new Object();
        private static final int NO_VERSION = -1;
        private final Executor mExecutor;
        private final Observable.Observer<? super T> mObserver;
        private final AtomicReference<Object> mStateRef;
        private final AtomicBoolean mActive = new AtomicBoolean(true);
        private Object mLastState = NOT_SET;
        private int mLatestSignalledVersion = -1;
        private boolean mWrapperUpdating = false;

        ObserverWrapper(AtomicReference<Object> stateRef, Executor executor, Observable.Observer<? super T> observer) {
            this.mStateRef = stateRef;
            this.mExecutor = executor;
            this.mObserver = observer;
        }

        @Override // java.lang.Runnable
        public void run() {
            synchronized (this) {
                if (!this.mActive.get()) {
                    this.mWrapperUpdating = false;
                    return;
                }
                Object newState = this.mStateRef.get();
                int currentVersion = this.mLatestSignalledVersion;
                while (true) {
                    if (!Objects.equals(this.mLastState, newState)) {
                        this.mLastState = newState;
                        if (newState instanceof ErrorWrapper) {
                            this.mObserver.onError(((ErrorWrapper) newState).getError());
                        } else {
                            this.mObserver.onNewData(newState);
                        }
                    }
                    synchronized (this) {
                        if (currentVersion == this.mLatestSignalledVersion || !this.mActive.get()) {
                            break;
                        }
                        newState = this.mStateRef.get();
                        currentVersion = this.mLatestSignalledVersion;
                    }
                }
                this.mWrapperUpdating = false;
            }
        }

        void update(int version) {
            synchronized (this) {
                if (!this.mActive.get()) {
                    return;
                }
                if (version <= this.mLatestSignalledVersion) {
                    return;
                }
                this.mLatestSignalledVersion = version;
                if (this.mWrapperUpdating) {
                    return;
                }
                this.mWrapperUpdating = true;
                try {
                    this.mExecutor.execute(this);
                } finally {
                }
            }
        }

        void close() {
            this.mActive.set(false);
        }
    }

    static abstract class ErrorWrapper {
        public abstract Throwable getError();

        ErrorWrapper() {
        }

        static ErrorWrapper wrap(Throwable error) {
            return new AutoValue_StateObservable_ErrorWrapper(error);
        }
    }
}
