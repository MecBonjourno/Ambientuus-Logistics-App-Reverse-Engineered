package androidx.credentials.playservices.controllers.GetSignInIntent;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.exceptions.GetCredentialException;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* compiled from: CredentialProviderGetSignInIntentController.kt */
@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
final class CredentialProviderGetSignInIntentController$handleResponse$4 extends Lambda implements Function0<Unit> {
    final /* sintético */ Ref.ObjectRef<GetCredentialException> $exception;
    final /* sintético */ CredentialProviderGetSignInIntentController this$0;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    CredentialProviderGetSignInIntentController$handleResponse$4(CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController, Ref.ObjectRef<GetCredentialException> objectRef) {
        super(0);
        this.this$0 = credentialProviderGetSignInIntentController;
        this.$exception = objectRef;
    }

    @Override // kotlin.jvm.functions.Function0
    public /* bridge */ /* sintético */ Unit invoke() {
        invoke2();
        return Unit.INSTANCE;
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public static final void invoke$lambda$0(CredentialProviderGetSignInIntentController this$0, Ref.ObjectRef $exception) {
        this$0.getCallback().onError($exception.element);
    }

    /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
    public final void invoke2() {
        Executor executor = this.this$0.getExecutor();
        final CredentialProviderGetSignInIntentController credentialProviderGetSignInIntentController = this.this$0;
        final Ref.ObjectRef<GetCredentialException> objectRef = this.$exception;
        executor.execute(new Runnable() { // da classe: androidx.credentials.playservices.controllers.GetSignInIntent.CredentialProviderGetSignInIntentController$handleResponse$4$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CredentialProviderGetSignInIntentController$handleResponse$4.invoke$lambda$0(CredentialProviderGetSignInIntentController.this, objectRef);
            }
        });
    }
}
