package androidx.credentials.playservices.controllers.GetRestoreCredential;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* compiled from: CredentialProviderGetDigitalCredentialController.kt */
@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
final class CredentialProviderGetDigitalCredentialController$handleResponse$5 extends Lambda implements Function0<Unit> {
    final /* sintético */ GetCredentialException $providerException;
    final /* sintético */ CredentialProviderGetDigitalCredentialController this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    CredentialProviderGetDigitalCredentialController$handleResponse$5(CredentialProviderGetDigitalCredentialController credentialProviderGetDigitalCredentialController, GetCredentialException getCredentialException) {
        super(0);
        this.this$0 = credentialProviderGetDigitalCredentialController;
        this.$providerException = getCredentialException;
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* sintético */ Unit invoke() {
        invoke2();
        return Unit.INSTANCE;
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2() {
        Executor executor = this.this$0.getExecutor();
        final CredentialProviderGetDigitalCredentialController credentialProviderGetDigitalCredentialController = this.this$0;
        final GetCredentialException getCredentialException = this.$providerException;
        executor.execute(new Runnable() { // da classe: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetDigitalCredentialController$handleResponse$5$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CredentialProviderGetDigitalCredentialController$handleResponse$5.invoke$lambda$0(CredentialProviderGetDigitalCredentialController.this, getCredentialException);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final void invoke$lambda$0(CredentialProviderGetDigitalCredentialController this$0, GetCredentialException $providerException) {
        GetCredentialUnknownException getCredentialUnknownException;
        CredentialManagerCallback<GetCredentialResponse, GetCredentialException> callback = this$0.getCallback();
        if ($providerException != null) {
            getCredentialUnknownException = $providerException;
        } else {
            getCredentialUnknownException = new GetCredentialUnknownException("Unexpected configuration error");
        }
        callback.onError(getCredentialUnknownException);
    }
}
