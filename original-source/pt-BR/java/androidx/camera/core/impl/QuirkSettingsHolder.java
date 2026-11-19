package androidx.camera.core.impl;

import androidx.camera.core.Logger;
import androidx.camera.core.impl.Observable;
import androidx.core.util.Consumer;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

/* carregado de: classes.dex */
public final class QuirkSettingsHolder {
    public static final QuirkSettings DEFAULT = QuirkSettings.withDefaultBehavior();
    private static final QuirkSettingsHolder sInstance = new QuirkSettingsHolder();
    private final MutableStateObservable<QuirkSettings> mObservable = MutableStateObservable.withInitialState(DEFAULT);

    public static QuirkSettingsHolder instance() {
        return sInstance;
    }

    public QuirkSettings get() {
        try {
            return this.mObservable.fetchData().get();
        } catch (InterruptedException | ExecutionException e) {
            throw new AssertionError("Unexpected error in QuirkSettings StateObservable", e);
        }
    }

    public void set(QuirkSettings settings) {
        this.mObservable.setState(settings);
    }

    public void observe(Executor executor, Consumer<QuirkSettings> listener) {
        this.mObservable.addObserver(executor, new ObserverToConsumerAdapter(listener));
    }

    public void reset() {
        this.mObservable.removeObservers();
        this.mObservable.setState(DEFAULT);
    }

    private static class ObserverToConsumerAdapter<T> implements Observable.Observer<T> {
        private static final String TAG = "ObserverToConsumerAdapter";
        private final Consumer<T> mDelegate;

        ObserverToConsumerAdapter(Consumer<T> delegate) {
            this.mDelegate = delegate;
        }

        @Override // androidx.camera.core.impl.Observable.Observer
        public void onNewData(T newValue) {
            this.mDelegate.accept(newValue);
        }

        @Override // androidx.camera.core.impl.Observable.Observer
        public void onError(Throwable t) {
            Logger.e(TAG, "Unexpected error in Observable", t);
        }
    }
}
