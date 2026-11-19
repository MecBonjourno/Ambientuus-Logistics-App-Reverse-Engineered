package androidx.credentials.playservices.controllers.CreatePublicKeyCredential;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CreateCredentialResponse;
import androidx.credentials.CredentialManagerCallback;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* compiled from: CredentialProviderCreatePublicKeyCredentialController.kt */
@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
final class CredentialProviderCreatePublicKeyCredentialController$handleResponse$5 extends Lambda implements Function0<Unit> {
    final /* sintético */ CreateCredentialResponse $response;
    final /* sintético */ CredentialProviderCreatePublicKeyCredentialController this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    CredentialProviderCreatePublicKeyCredentialController$handleResponse$5(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, CreateCredentialResponse createCredentialResponse) {
        super(0);
        this.this$0 = credentialProviderCreatePublicKeyCredentialController;
        this.$response = createCredentialResponse;
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* sintético */ Unit invoke() {
        invoke2();
        return Unit.INSTANCE;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final void invoke$lambda$0(CredentialProviderCreatePublicKeyCredentialController this$0, CreateCredentialResponse $response) {
        CredentialManagerCallback credentialManagerCallback;
        credentialManagerCallback = this$0.callback;
        if (credentialManagerCallback == null) {
            Intrinsics.throwUninitializedPropertyAccessException("callback");
            credentialManagerCallback = null;
        }
        credentialManagerCallback.onResult($response);
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2() {
        Executor executor;
        executor = this.this$0.executor;
        if (executor == null) {
            Intrinsics.throwUninitializedPropertyAccessException("executor");
            executor = null;
        }
        final CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController = this.this$0;
        final CreateCredentialResponse createCredentialResponse = this.$response;
        executor.execute(new Runnable() { // da classe: androidx.credentials.playservices.controllers.CreatePublicKeyCredential.CredentialProviderCreatePublicKeyCredentialController$handleResponse$5$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CredentialProviderCreatePublicKeyCredentialController$handleResponse$5.invoke$lambda$0(CredentialProviderCreatePublicKeyCredentialController.this, createCredentialResponse);
            }
        });
    }
}
