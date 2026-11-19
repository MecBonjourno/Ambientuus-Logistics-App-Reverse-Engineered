package androidx.credentials.playservices.controllers.GetRestoreCredential;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.exceptions.GetCredentialException;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* compiled from: CredentialProviderGetDigitalCredentialController.kt */
@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
final class CredentialProviderGetDigitalCredentialController$invokePlayServices$2$1 extends Lambda implements Function0<Unit> {
    final /* sintético */ CredentialManagerCallback<GetCredentialResponse, GetCredentialException> $callback;
    final /* sintético */ Executor $executor;
    final /* sintético */ GetCredentialException $getException;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    CredentialProviderGetDigitalCredentialController$invokePlayServices$2$1(Executor executor, CredentialManagerCallback<GetCredentialResponse, GetCredentialException> credentialManagerCallback, GetCredentialException getCredentialException) {
        super(0);
        this.$executor = executor;
        this.$callback = credentialManagerCallback;
        this.$getException = getCredentialException;
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* sintético */ Unit invoke() {
        invoke2();
        return Unit.INSTANCE;
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2() {
        Executor executor = this.$executor;
        final CredentialManagerCallback<GetCredentialResponse, GetCredentialException> credentialManagerCallback = this.$callback;
        final GetCredentialException getCredentialException = this.$getException;
        executor.execute(new Runnable() { // da classe: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetDigitalCredentialController$invokePlayServices$2$1$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CredentialManagerCallback.this.onError(getCredentialException);
            }
        });
    }
}
