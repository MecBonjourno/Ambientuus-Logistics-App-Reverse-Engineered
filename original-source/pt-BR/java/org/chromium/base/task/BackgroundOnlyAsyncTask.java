package org.chromium.base.task;

/* carregado de: classes17.dex */
public abstract class BackgroundOnlyAsyncTask<Result> extends AsyncTask<Result> {
    static final /* sintético */ boolean $assertionsDisabled = false;

    @Override // org.chromium.base.task.AsyncTask
    protected final void onPostExecute(Result result) {
        throw new AssertionError();
    }
}
