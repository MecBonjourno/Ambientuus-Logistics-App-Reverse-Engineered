package androidx.credentials.playservices;

import android.util.Log;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.exceptions.ClearCredentialException;
import androidx.credentials.exceptions.ClearCredentialUnknownException;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* compiled from: CredentialProviderPlayServicesImpl.kt */
@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
final class CredentialProviderPlayServicesImpl$onClearCredential$5$1$1 extends Lambda implements Function0<Unit> {
    final /* sintético */ CredentialManagerCallback<Void, ClearCredentialException> $callback;
    final /* sintético */ Exception $e;
    final /* sintético */ Executor $executor;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    CredentialProviderPlayServicesImpl$onClearCredential$5$1$1(Exception exc, Executor executor, CredentialManagerCallback<Void, ClearCredentialException> credentialManagerCallback) {
        super(0);
        this.$e = exc;
        this.$executor = executor;
        this.$callback = credentialManagerCallback;
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* sintético */ Unit invoke() {
        invoke2();
        return Unit.INSTANCE;
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2() {
        Log.w("PlayServicesImpl", "During clear credential sign out failed with " + this.$e);
        Executor executor = this.$executor;
        final CredentialManagerCallback<Void, ClearCredentialException> credentialManagerCallback = this.$callback;
        final Exception exc = this.$e;
        executor.execute(new Runnable() { // da classe: androidx.credentials.playservices.CredentialProviderPlayServicesImpl$onClearCredential$5$1$1$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CredentialProviderPlayServicesImpl$onClearCredential$5$1$1.invoke$lambda$0(CredentialManagerCallback.this, exc);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final void invoke$lambda$0(CredentialManagerCallback $callback, Exception $e) {
        $callback.onError(new ClearCredentialUnknownException($e.getMessage()));
    }
}
