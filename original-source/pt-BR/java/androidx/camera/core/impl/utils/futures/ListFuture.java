package androidx.camera.core.impl.utils.futures;

import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicInteger;

/* carregado de: classes.dex */
class ListFuture<V> implements ListenableFuture<List<V>> {
    private final boolean mAllMustSucceed;
    List<? extends ListenableFuture<? extends V>> mFutures;
    private final AtomicInteger mRemaining;
    private final ListenableFuture<List<V>> mResult = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver<List<V>>() { // da classe: androidx.camera.core.impl.utils.futures.ListFuture.1
        @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
        public Object attachCompleter(CallbackToFutureAdapter.Completer<List<V>> completer) {
            Preconditions.checkState(ListFuture.this.mResultNotifier == null, "The result can only set once!");
            ListFuture.this.mResultNotifier = completer;
            return "ListFuture[" + this + "]";
        }
    });
    CallbackToFutureAdapter.Completer<List<V>> mResultNotifier;
    List<V> mValues;

    ListFuture(List<? extends ListenableFuture<? extends V>> futures, boolean allMustSucceed, Executor listenerExecutor) {
        this.mFutures = (List) Preconditions.checkNotNull(futures);
        this.mValues = new ArrayList(futures.size());
        this.mAllMustSucceed = allMustSucceed;
        this.mRemaining = new AtomicInteger(futures.size());
        init(listenerExecutor);
    }

    private void init(Executor listenerExecutor) {
        addListener(new Runnable() { // da classe: androidx.camera.core.impl.utils.futures.ListFuture.2
            @Override // java.lang.Runnable
            public void run() {
                ListFuture.this.mValues = null;
                ListFuture.this.mFutures = null;
            }
        }, CameraXExecutors.directExecutor());
        if (this.mFutures.isEmpty()) {
            this.mResultNotifier.set(new ArrayList(this.mValues));
            return;
        }
        for (int i = 0; i < this.mFutures.size(); i++) {
            this.mValues.add(null);
        }
        List<? extends ListenableFuture<? extends V>> localFutures = this.mFutures;
        for (int i2 = 0; i2 < localFutures.size(); i2++) {
            final ListenableFuture<? extends V> listenable = localFutures.get(i2);
            final int index = i2;
            listenable.addListener(new Runnable() { // da classe: androidx.camera.core.impl.utils.futures.ListFuture.3
                @Override // java.lang.Runnable
                public void run() {
                    ListFuture.this.setOneValue(index, listenable);
                }
            }, listenerExecutor);
        }
    }

    void setOneValue(int i, Future<? extends V> future) {
        CallbackToFutureAdapter.Completer<List<V>> completer;
        ArrayList arrayList;
        int decrementAndGet;
        List<V> list = this.mValues;
        if (isDone() || list == null) {
            Preconditions.checkState(this.mAllMustSucceed, "Future was done before all dependencies completed");
            return;
        }
        try {
            try {
                try {
                    Preconditions.checkState(future.isDone(), "Tried to set value from future which is not done");
                    list.set(i, Futures.getUninterruptibly(future));
                    decrementAndGet = this.mRemaining.decrementAndGet();
                    Preconditions.checkState(decrementAndGet >= 0, "Less than 0 remaining futures");
                } catch (CancellationException e) {
                    if (this.mAllMustSucceed) {
                        cancel(false);
                    }
                    int decrementAndGet2 = this.mRemaining.decrementAndGet();
                    Preconditions.checkState(decrementAndGet2 >= 0, "Less than 0 remaining futures");
                    if (decrementAndGet2 != 0) {
                        return;
                    }
                    List<V> list2 = this.mValues;
                    if (list2 != null) {
                        completer = this.mResultNotifier;
                        arrayList = new ArrayList(list2);
                    }
                } catch (ExecutionException e2) {
                    if (this.mAllMustSucceed) {
                        this.mResultNotifier.setException(e2.getCause());
                    }
                    int decrementAndGet3 = this.mRemaining.decrementAndGet();
                    Preconditions.checkState(decrementAndGet3 >= 0, "Less than 0 remaining futures");
                    if (decrementAndGet3 != 0) {
                        return;
                    }
                    List<V> list3 = this.mValues;
                    if (list3 != null) {
                        completer = this.mResultNotifier;
                        arrayList = new ArrayList(list3);
                    }
                }
            } catch (Error e3) {
                this.mResultNotifier.setException(e3);
                int decrementAndGet4 = this.mRemaining.decrementAndGet();
                Preconditions.checkState(decrementAndGet4 >= 0, "Less than 0 remaining futures");
                if (decrementAndGet4 != 0) {
                    return;
                }
                List<V> list4 = this.mValues;
                if (list4 != null) {
                    completer = this.mResultNotifier;
                    arrayList = new ArrayList(list4);
                }
            } catch (RuntimeException e4) {
                if (this.mAllMustSucceed) {
                    this.mResultNotifier.setException(e4);
                }
                int decrementAndGet5 = this.mRemaining.decrementAndGet();
                Preconditions.checkState(decrementAndGet5 >= 0, "Less than 0 remaining futures");
                if (decrementAndGet5 != 0) {
                    return;
                }
                List<V> list5 = this.mValues;
                if (list5 != null) {
                    completer = this.mResultNotifier;
                    arrayList = new ArrayList(list5);
                }
            }
            if (decrementAndGet == 0) {
                List<V> list6 = this.mValues;
                if (list6 != null) {
                    completer = this.mResultNotifier;
                    arrayList = new ArrayList(list6);
                    completer.set(arrayList);
                    return;
                }
                Preconditions.checkState(isDone());
            }
        } catch (Throwable th) {
            int decrementAndGet6 = this.mRemaining.decrementAndGet();
            Preconditions.checkState(decrementAndGet6 >= 0, "Less than 0 remaining futures");
            if (decrementAndGet6 == 0) {
                List<V> list7 = this.mValues;
                if (list7 != null) {
                    this.mResultNotifier.set(new ArrayList(list7));
                } else {
                    Preconditions.checkState(isDone());
                }
            }
            throw th;
        }
    }

    @Override // com.google.common.util.concurrent.ListenableFuture
    public void addListener(Runnable listener, Executor executor) {
        this.mResult.addListener(listener, executor);
    }

    @Override // java.util.concurrent.Future
    public boolean cancel(boolean mayInterruptIfRunning) {
        if (this.mFutures != null) {
            for (ListenableFuture<? extends V> f : this.mFutures) {
                f.cancel(mayInterruptIfRunning);
            }
        }
        return this.mResult.cancel(mayInterruptIfRunning);
    }

    @Override // java.util.concurrent.Future
    public boolean isCancelled() {
        return this.mResult.isCancelled();
    }

    @Override // java.util.concurrent.Future
    public boolean isDone() {
        return this.mResult.isDone();
    }

    @Override // java.util.concurrent.Future
    public List<V> get() throws InterruptedException, ExecutionException {
        callAllGets();
        return this.mResult.get();
    }

    @Override // java.util.concurrent.Future
    public List<V> get(long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
        return this.mResult.get(timeout, unit);
    }

    private void callAllGets() throws InterruptedException {
        List<? extends ListenableFuture<? extends V>> oldFutures = this.mFutures;
        if (oldFutures != null && !isDone()) {
            for (ListenableFuture<? extends V> future : oldFutures) {
                while (!future.isDone()) {
                    try {
                        future.get();
                    } catch (Error e) {
                        throw e;
                    } catch (InterruptedException e2) {
                        throw e2;
                    } catch (Throwable th) {
                        if (this.mAllMustSucceed) {
                            return;
                        }
                    }
                }
            }
        }
    }
}
