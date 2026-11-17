package org.chromium.base.task;

/* loaded from: classes17.dex */
public abstract class BackgroundOnlyAsyncTask<Result> extends AsyncTask<Result> {
    static final /* synthetic */ boolean $assertionsDisabled = false;

    @Override // org.chromium.base.task.AsyncTask
    protected final void onPostExecute(Result result) {
        throw new AssertionError();
    }
}
