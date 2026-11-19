package androidx.camera.core.impl;

import android.view.Surface;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeoutException;

/* carregado de: classes.dex */
public final class DeferrableSurfaces {
    private DeferrableSurfaces() {
    }

    public static ListenableFuture<List<Surface>> surfaceListWithTimeout(final Collection<DeferrableSurface> deferrableSurfaces, final boolean removeNullSurfaces, long timeoutMillis, final Executor executor, ScheduledExecutorService scheduledExecutorService) {
        List<ListenableFuture<Surface>> list = new ArrayList<>();
        for (DeferrableSurface surface : deferrableSurfaces) {
            list.add(Futures.nonCancellationPropagating(surface.getSurface()));
        }
        final ListenableFuture<List<Surface>> listenableFuture = Futures.makeTimeoutFuture(timeoutMillis, scheduledExecutorService, Futures.successfulAsList(list));
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // da classe: androidx.camera.core.impl.DeferrableSurfaces$$ExternalSyntheticLambda1
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return DeferrableSurfaces.lambda$surfaceListWithTimeout$1(ListenableFuture.this, executor, removeNullSurfaces, deferrableSurfaces, completer);
            }
        });
    }

    static /* sintético */ Object lambda$surfaceListWithTimeout$1(final ListenableFuture listenableFuture, Executor executor, final boolean removeNullSurfaces, Collection deferrableSurfaces, final CallbackToFutureAdapter.Completer completer) throws Exception {
        completer.addCancellationListener(new Runnable() { // da classe: androidx.camera.core.impl.DeferrableSurfaces$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                ListenableFuture.this.cancel(true);
            }
        }, executor);
        Futures.addCallback(listenableFuture, new FutureCallback<List<Surface>>() { // da classe: androidx.camera.core.impl.DeferrableSurfaces.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(List<Surface> result) {
                Preconditions.checkNotNull(result);
                ArrayList arrayList = new ArrayList(result);
                if (removeNullSurfaces) {
                    arrayList.removeAll(Collections.singleton(null));
                }
                completer.set(arrayList);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                if (t instanceof TimeoutException) {
                    completer.setException(t);
                } else {
                    completer.set(Collections.emptyList());
                }
            }
        }, executor);
        return "surfaceList[" + deferrableSurfaces + "]";
    }

    public static boolean tryIncrementAll(List<DeferrableSurface> surfaceList) {
        try {
            incrementAll(surfaceList);
            return true;
        } catch (DeferrableSurface.SurfaceClosedException e) {
            return false;
        }
    }

    public static void incrementAll(List<DeferrableSurface> surfaceList) throws DeferrableSurface.SurfaceClosedException {
        if (!surfaceList.isEmpty()) {
            int i = 0;
            do {
                try {
                    surfaceList.get(i).incrementUseCount();
                    i++;
                } catch (DeferrableSurface.SurfaceClosedException e) {
                    for (int i2 = i - 1; i2 >= 0; i2--) {
                        surfaceList.get(i2).decrementUseCount();
                    }
                    throw e;
                }
            } while (i < surfaceList.size());
        }
    }

    public static void decrementAll(List<DeferrableSurface> surfaceList) {
        for (DeferrableSurface surface : surfaceList) {
            surface.decrementUseCount();
        }
    }
}
