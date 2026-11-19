package androidx.credentials.playservices.controllers.CreateRestoreCredential;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CreateCredentialResponse;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.exceptions.CreateCredentialException;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* compiled from: CredentialProviderCreateRestoreCredentialController.kt */
@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
final class CredentialProviderCreateRestoreCredentialController$invokePlayServices$2$1 extends Lambda implements Function0<Unit> {
    final /* sintético */ CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException> $callback;
    final /* sintético */ Ref.ObjectRef<CreateCredentialException> $createException;
    final /* sintético */ Executor $executor;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    CredentialProviderCreateRestoreCredentialController$invokePlayServices$2$1(Executor executor, CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException> credentialManagerCallback, Ref.ObjectRef<CreateCredentialException> objectRef) {
        super(0);
        this.$executor = executor;
        this.$callback = credentialManagerCallback;
        this.$createException = objectRef;
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* sintético */ Unit invoke() {
        invoke2();
        return Unit.INSTANCE;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final void invoke$lambda$0(CredentialManagerCallback $callback, Ref.ObjectRef $createException) {
        $callback.onError($createException.element);
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2() {
        Executor executor = this.$executor;
        final CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException> credentialManagerCallback = this.$callback;
        final Ref.ObjectRef<CreateCredentialException> objectRef = this.$createException;
        executor.execute(new Runnable() { // da classe: androidx.credentials.playservices.controllers.CreateRestoreCredential.CredentialProviderCreateRestoreCredentialController$invokePlayServices$2$1$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CredentialProviderCreateRestoreCredentialController$invokePlayServices$2$1.invoke$lambda$0(CredentialManagerCallback.this, objectRef);
            }
        });
    }
}
