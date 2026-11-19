package androidx.credentials;

import android.os.Build;
import android.view.View;
import androidx.constraintlayout.widget.ConstraintLayout;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: CredentialManagerViewHandler.kt */
@Metadata(d1 = {"\u0000\u0016\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"2\u0010\u0004\u001a\u0004\u0018\u00010\u0003*\u00020\u00052\b\u0010\u0002\u001a\u0004\u0018\u00010\u00038F@FX\u0086\u000e¢\u0006\u0012\u0012\u0004\b\u0006\u0010\u0007\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"TAG", "", "value", "Landroidx/credentials/PendingGetCredentialRequest;", "pendingGetCredentialRequest", "Landroid/view/View;", "getPendingGetCredentialRequest$annotations", "(Landroid/view/View;)V", "getPendingGetCredentialRequest", "(Landroid/view/View;)Landroidx/credentials/PendingGetCredentialRequest;", "setPendingGetCredentialRequest", "(Landroid/view/View;Landroidx/credentials/PendingGetCredentialRequest;)V", "credentials_release"}, k = 2, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class CredentialManagerViewHandler {
    private static final String TAG = "ViewHandler";

    public static /* sintético */ void getPendingGetCredentialRequest$annotations(View view) {
    }

    public static final PendingGetCredentialRequest getPendingGetCredentialRequest(View $this$pendingGetCredentialRequest) {
        Intrinsics.checkNotNullParameter($this$pendingGetCredentialRequest, "<this>");
        Object tag = $this$pendingGetCredentialRequest.getTag(R.id.androidx_credential_pendingCredentialRequest);
        if (tag instanceof PendingGetCredentialRequest) {
            return (PendingGetCredentialRequest) tag;
        }
        return null;
    }

    public static final void setPendingGetCredentialRequest(View $this$pendingGetCredentialRequest, PendingGetCredentialRequest value) {
        Intrinsics.checkNotNullParameter($this$pendingGetCredentialRequest, "<this>");
        $this$pendingGetCredentialRequest.setTag(R.id.androidx_credential_pendingCredentialRequest, value);
        if (value != null) {
            if (Build.VERSION.SDK_INT >= 35 || (Build.VERSION.SDK_INT == 34 && Build.VERSION.PREVIEW_SDK_INT > 0)) {
                Api35Impl.INSTANCE.setPendingGetCredentialRequest($this$pendingGetCredentialRequest, value.getRequest(), value.getCallback());
                return;
            }
            return;
        }
        if (Build.VERSION.SDK_INT >= 35 || (Build.VERSION.SDK_INT == 34 && Build.VERSION.PREVIEW_SDK_INT > 0)) {
            Api35Impl.INSTANCE.clearPendingGetCredentialRequest($this$pendingGetCredentialRequest);
        }
    }
}
