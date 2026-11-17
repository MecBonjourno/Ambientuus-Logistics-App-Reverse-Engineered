package androidx.credentials;

import android.content.ComponentName;
import android.os.Bundle;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.SetsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: GetCustomCredentialOption.kt */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\b\u0016\u0018\u00002\u00020\u0001BA\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000b¢\u0006\u0002\u0010\rBK\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f¢\u0006\u0002\u0010\u0010BK\b\u0000\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u000f¢\u0006\u0002\u0010\u0011¨\u0006\u0012"}, d2 = {"Landroidx/credentials/GetCustomCredentialOption;", "Landroidx/credentials/CredentialOption;", "type", "", "requestData", "Landroid/os/Bundle;", "candidateQueryData", "isSystemProviderRequired", "", "isAutoSelectAllowed", "allowedProviders", "", "Landroid/content/ComponentName;", "(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZZLjava/util/Set;)V", "typePriorityHint", "", "(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZZLjava/util/Set;I)V", "(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;ZZLjava/util/Set;I)V", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public class GetCustomCredentialOption extends CredentialOption {
    public /* synthetic */ GetCustomCredentialOption(Bundle bundle, String str, Bundle bundle2, boolean z, boolean z2, Set set, int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(bundle, str, bundle2, z, (i2 & 16) != 0 ? false : z2, (Set<ComponentName>) ((i2 & 32) != 0 ? SetsKt.emptySet() : set), (i2 & 64) != 0 ? 2000 : i);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GetCustomCredentialOption(Bundle requestData, String type, Bundle candidateQueryData, boolean isSystemProviderRequired, boolean isAutoSelectAllowed, Set<ComponentName> allowedProviders, int typePriorityHint) {
        super(type, requestData, candidateQueryData, isSystemProviderRequired, isAutoSelectAllowed, allowedProviders, typePriorityHint);
        Intrinsics.checkNotNullParameter(requestData, "requestData");
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
        Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
        if (!(type.length() > 0)) {
            throw new IllegalArgumentException("type should not be empty".toString());
        }
        if (typePriorityHint != 100) {
        } else {
            throw new IllegalArgumentException("Custom types should not have passkey level priority.".toString());
        }
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ GetCustomCredentialOption(java.lang.String r8, android.os.Bundle r9, android.os.Bundle r10, boolean r11, boolean r12, java.util.Set r13, int r14, kotlin.jvm.internal.DefaultConstructorMarker r15) {
        /*
            r7 = this;
            r15 = r14 & 16
            if (r15 == 0) goto L7
            r12 = 0
            r5 = r12
            goto L8
        L7:
            r5 = r12
        L8:
            r12 = r14 & 32
            if (r12 == 0) goto L12
            java.util.Set r13 = kotlin.collections.SetsKt.emptySet()
            r6 = r13
            goto L13
        L12:
            r6 = r13
        L13:
            r0 = r7
            r1 = r8
            r2 = r9
            r3 = r10
            r4 = r11
            r0.<init>(r1, r2, r3, r4, r5, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.GetCustomCredentialOption.<init>(java.lang.String, android.os.Bundle, android.os.Bundle, boolean, boolean, java.util.Set, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public GetCustomCredentialOption(String type, Bundle requestData, Bundle candidateQueryData, boolean isSystemProviderRequired, boolean isAutoSelectAllowed, Set<ComponentName> allowedProviders) {
        this(requestData, type, candidateQueryData, isSystemProviderRequired, isAutoSelectAllowed, allowedProviders, 0, 64, (DefaultConstructorMarker) null);
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(requestData, "requestData");
        Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
        Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public GetCustomCredentialOption(String type, Bundle requestData, Bundle candidateQueryData, boolean isSystemProviderRequired) {
        this(type, requestData, candidateQueryData, isSystemProviderRequired, false, null, 48, null);
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(requestData, "requestData");
        Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public GetCustomCredentialOption(String type, Bundle requestData, Bundle candidateQueryData, boolean isSystemProviderRequired, boolean isAutoSelectAllowed) {
        this(type, requestData, candidateQueryData, isSystemProviderRequired, isAutoSelectAllowed, null, 32, null);
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(requestData, "requestData");
        Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
    }

    public /* synthetic */ GetCustomCredentialOption(String str, Bundle bundle, Bundle bundle2, boolean z, boolean z2, Set set, int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, bundle, bundle2, z, (i2 & 16) != 0 ? false : z2, (Set<ComponentName>) ((i2 & 32) != 0 ? SetsKt.emptySet() : set), (i2 & 64) != 0 ? 2000 : i);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public GetCustomCredentialOption(String type, Bundle requestData, Bundle candidateQueryData, boolean isSystemProviderRequired, boolean isAutoSelectAllowed, Set<ComponentName> allowedProviders, int typePriorityHint) {
        this(requestData, type, candidateQueryData, isSystemProviderRequired, isAutoSelectAllowed, allowedProviders, typePriorityHint);
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(requestData, "requestData");
        Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
        Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
    }
}
