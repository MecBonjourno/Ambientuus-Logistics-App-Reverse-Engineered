package androidx.camera.core.impl;

import android.os.SystemClock;
import androidx.camera.core.impl.LiveDataObservable;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.Observer;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class LiveDataObservable<T> implements Observable<T> {
    private Observer<Result<T>> mLiveDataObserver;
    final MutableLiveData<Result<T>> mLiveData = new MutableLiveData<>();
    private final Map<Observable.Observer<? super T>, Executor> mObservers = new HashMap();

    public void postValue(T value) {
        this.mLiveData.postValue(Result.fromValue(value));
    }

    public void postError(Throwable error) {
        this.mLiveData.postValue(Result.fromError(error));
    }

    public LiveData<Result<T>> getLiveData() {
        return this.mLiveData;
    }

    @Override // androidx.camera.core.impl.Observable
    public ListenableFuture<T> fetchData() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda5
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return LiveDataObservable.this.m195lambda$fetchData$1$androidxcameracoreimplLiveDataObservable(completer);
            }
        });
    }

    /* renamed from: lambda$fetchData$1$androidx-camera-core-impl-LiveDataObservable, reason: not valid java name */
    /* synthetic */ Object m195lambda$fetchData$1$androidxcameracoreimplLiveDataObservable(final CallbackToFutureAdapter.Completer completer) throws Exception {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                LiveDataObservable.this.m194lambda$fetchData$0$androidxcameracoreimplLiveDataObservable(completer);
            }
        });
        return this + " [fetch@" + SystemClock.uptimeMillis() + "]";
    }

    /* renamed from: lambda$fetchData$0$androidx-camera-core-impl-LiveDataObservable, reason: not valid java name */
    /* synthetic */ void m194lambda$fetchData$0$androidxcameracoreimplLiveDataObservable(CallbackToFutureAdapter.Completer completer) {
        Result<T> result = this.mLiveData.getValue();
        if (result == null) {
            completer.setException(new IllegalStateException("Observable has not yet been initialized with a value."));
        } else if (result.completedSuccessfully()) {
            completer.set(result.getValue());
        } else {
            Preconditions.checkNotNull(result.getError());
            completer.setException(result.getError());
        }
    }

    @Override // androidx.camera.core.impl.Observable
    public void addObserver(Executor executor, final Observable.Observer<? super T> observer) {
        synchronized (this.mObservers) {
            boolean wasEmpty = this.mObservers.isEmpty();
            this.mObservers.put(observer, executor);
            if (wasEmpty) {
                enableInternalObserver();
            } else {
                executor.execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda2
                    @Override // java.lang.Runnable
                    public final void run() {
                        LiveDataObservable.this.m190xb97b3ef8(observer);
                    }
                });
            }
        }
    }

    /* renamed from: lambda$addObserver$2$androidx-camera-core-impl-LiveDataObservable, reason: not valid java name */
    /* synthetic */ void m190xb97b3ef8(Observable.Observer observer) {
        Result<T> result = this.mLiveData.getValue();
        if (result == null) {
            return;
        }
        if (result.completedSuccessfully()) {
            observer.onNewData(result.getValue());
        } else {
            Preconditions.checkNotNull(result.getError());
            observer.onError(result.getError());
        }
    }

    @Override // androidx.camera.core.impl.Observable
    public void removeObserver(Observable.Observer<? super T> observer) {
        synchronized (this.mObservers) {
            this.mObservers.remove(observer);
            if (this.mObservers.isEmpty()) {
                disableInternalObserver();
            }
        }
    }

    private void enableInternalObserver() {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                LiveDataObservable.this.m193x649dea1c();
            }
        });
    }

    /* renamed from: lambda$enableInternalObserver$5$androidx-camera-core-impl-LiveDataObservable, reason: not valid java name */
    /* synthetic */ void m193x649dea1c() {
        if (this.mLiveDataObserver == null) {
            this.mLiveDataObserver = new Observer() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda0
                @Override // androidx.lifecycle.Observer
                public final void onChanged(Object obj) {
                    LiveDataObservable.this.m192xab265c7d((LiveDataObservable.Result) obj);
                }
            };
        }
        this.mLiveData.observeForever(this.mLiveDataObserver);
    }

    /* renamed from: lambda$enableInternalObserver$4$androidx-camera-core-impl-LiveDataObservable, reason: not valid java name */
    /* synthetic */ void m192xab265c7d(final Result result) {
        Map<Observable.Observer<? super T>, Executor> observersCopy;
        synchronized (this.mObservers) {
            observersCopy = new HashMap<>(this.mObservers);
        }
        for (final Map.Entry<Observable.Observer<? super T>, Executor> entry : observersCopy.entrySet()) {
            entry.getValue().execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda4
                @Override // java.lang.Runnable
                public final void run() {
                    LiveDataObservable.lambda$enableInternalObserver$3(entry, result);
                }
            });
        }
    }

    static /* synthetic */ void lambda$enableInternalObserver$3(Map.Entry entry, Result result) {
        Observable.Observer<? super T> observer = (Observable.Observer) entry.getKey();
        if (result.completedSuccessfully()) {
            observer.onNewData(result.getValue());
        } else {
            Preconditions.checkNotNull(result.getError());
            observer.onError(result.getError());
        }
    }

    private void disableInternalObserver() {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                LiveDataObservable.this.m191xd8d57c50();
            }
        });
    }

    /* renamed from: lambda$disableInternalObserver$6$androidx-camera-core-impl-LiveDataObservable, reason: not valid java name */
    /* synthetic */ void m191xd8d57c50() {
        if (this.mLiveDataObserver != null) {
            this.mLiveData.removeObserver(this.mLiveDataObserver);
        }
    }

    public static final class Result<T> {
        private final Throwable mError;
        private final T mValue;

        private Result(T value, Throwable error) {
            this.mValue = value;
            this.mError = error;
        }

        static <T> Result<T> fromValue(T value) {
            return new Result<>(value, null);
        }

        static <T> Result<T> fromError(Throwable error) {
            return new Result<>(null, (Throwable) Preconditions.checkNotNull(error));
        }

        public boolean completedSuccessfully() {
            return this.mError == null;
        }

        public T getValue() {
            if (!completedSuccessfully()) {
                throw new IllegalStateException("Result contains an error. Does not contain a value.");
            }
            return this.mValue;
        }

        public Throwable getError() {
            return this.mError;
        }

        public String toString() {
            return "[Result: <" + (completedSuccessfully() ? "Value: " + this.mValue : "Error: " + this.mError) + ">]";
        }
    }
}
