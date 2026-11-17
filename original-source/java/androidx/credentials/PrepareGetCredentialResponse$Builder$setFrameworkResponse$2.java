package androidx.credentials;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.PrepareGetCredentialResponse;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* compiled from: PrepareGetCredentialResponse.kt */
@Metadata(k = 3, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
/* synthetic */ class PrepareGetCredentialResponse$Builder$setFrameworkResponse$2 extends FunctionReferenceImpl implements Function0<Boolean> {
    PrepareGetCredentialResponse$Builder$setFrameworkResponse$2(Object obj) {
        super(0, obj, PrepareGetCredentialResponse.Builder.class, "hasAuthenticationResults", "hasAuthenticationResults()Z", 0);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // kotlin.jvm.functions.Function0
    public final Boolean invoke() {
        boolean hasAuthenticationResults;
        hasAuthenticationResults = ((PrepareGetCredentialResponse.Builder) this.receiver).hasAuthenticationResults();
        return Boolean.valueOf(hasAuthenticationResults);
    }
}
