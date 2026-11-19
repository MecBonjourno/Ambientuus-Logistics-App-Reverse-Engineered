package androidx.credentials.playservices.controllers.CreatePublicKeyCredential;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.exceptions.domerrors.UnknownError;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* compiled from: CredentialProviderCreatePublicKeyCredentialController.kt */
@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
final class CredentialProviderCreatePublicKeyCredentialController$handleResponse$7 extends Lambda implements Function0<Unit> {
    final /* sintético */ Throwable $t;
    final /* sintético */ CredentialProviderCreatePublicKeyCredentialController this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    CredentialProviderCreatePublicKeyCredentialController$handleResponse$7(CredentialProviderCreatePublicKeyCredentialController credentialProviderCreatePublicKeyCredentialController, Throwable th) {
        super(0);
        this.this$0 = credentialProviderCreatePublicKeyCredentialController;
        this.$t = th;
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* sintético */ Unit invoke() {
        invoke2();
        return Unit.INSTANCE;
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
        final Throwable th = this.$t;
        executor.execute(new Runnable() { // da classe: androidx.credentials.playservices.controllers.CreatePublicKeyCredential.CredentialProviderCreatePublicKeyCredentialController$handleResponse$7$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CredentialProviderCreatePublicKeyCredentialController$handleResponse$7.invoke$lambda$0(CredentialProviderCreatePublicKeyCredentialController.this, th);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public static final void invoke$lambda$0(CredentialProviderCreatePublicKeyCredentialController this$0, Throwable $t) {
        CredentialManagerCallback credentialManagerCallback;
        credentialManagerCallback = this$0.callback;
        if (credentialManagerCallback == null) {
            Intrinsics.throwUninitializedPropertyAccessException("callback");
            credentialManagerCallback = null;
        }
        credentialManagerCallback.onError(new CreatePublicKeyCredentialDomException(new UnknownError(), $t.getMessage()));
    }
}
