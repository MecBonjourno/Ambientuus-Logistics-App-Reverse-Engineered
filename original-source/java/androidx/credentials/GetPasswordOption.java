package androidx.credentials;

import android.content.ComponentName;
import android.os.Bundle;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.ArrayList;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.collections.SetsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: GetPasswordOption.kt */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0005\u0018\u0000 \u00122\u00020\u0001:\u0001\u0012B1\b\u0017\u0012\u000e\b\u0002\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0003¢\u0006\u0002\u0010\tBE\b\u0002\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0003\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\b\b\u0002\u0010\r\u001a\u00020\u000e¢\u0006\u0002\u0010\u000fR\u0017\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u0013"}, d2 = {"Landroidx/credentials/GetPasswordOption;", "Landroidx/credentials/CredentialOption;", "allowedUserIds", "", "", "isAutoSelectAllowed", "", "allowedProviders", "Landroid/content/ComponentName;", "(Ljava/util/Set;ZLjava/util/Set;)V", "requestData", "Landroid/os/Bundle;", "candidateQueryData", "typePriorityHint", "", "(Ljava/util/Set;ZLjava/util/Set;Landroid/os/Bundle;Landroid/os/Bundle;I)V", "getAllowedUserIds", "()Ljava/util/Set;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class GetPasswordOption extends CredentialOption {
    public static final String BUNDLE_KEY_ALLOWED_USER_IDS = "androidx.credentials.BUNDLE_KEY_ALLOWED_USER_IDS";

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private final Set<String> allowedUserIds;

    public /* synthetic */ GetPasswordOption(Set set, boolean z, Set set2, Bundle bundle, Bundle bundle2, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(set, z, set2, bundle, bundle2, i);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    /* synthetic */ GetPasswordOption(java.util.Set r8, boolean r9, java.util.Set r10, android.os.Bundle r11, android.os.Bundle r12, int r13, int r14, kotlin.jvm.internal.DefaultConstructorMarker r15) {
        /*
            r7 = this;
            r14 = r14 & 32
            if (r14 == 0) goto L8
            r13 = 1000(0x3e8, float:1.401E-42)
            r6 = r13
            goto L9
        L8:
            r6 = r13
        L9:
            r0 = r7
            r1 = r8
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
            r0.<init>(r1, r2, r3, r4, r5, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.GetPasswordOption.<init>(java.util.Set, boolean, java.util.Set, android.os.Bundle, android.os.Bundle, int, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    public final Set<String> getAllowedUserIds() {
        return this.allowedUserIds;
    }

    private GetPasswordOption(Set<String> set, boolean isAutoSelectAllowed, Set<ComponentName> set2, Bundle requestData, Bundle candidateQueryData, int typePriorityHint) {
        super(PasswordCredential.TYPE_PASSWORD_CREDENTIAL, requestData, candidateQueryData, false, isAutoSelectAllowed, set2, typePriorityHint);
        this.allowedUserIds = set;
    }

    public /* synthetic */ GetPasswordOption(Set set, boolean z, Set set2, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? SetsKt.emptySet() : set, (i & 2) != 0 ? false : z, (i & 4) != 0 ? SetsKt.emptySet() : set2);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public GetPasswordOption(Set<String> allowedUserIds, boolean isAutoSelectAllowed, Set<ComponentName> allowedProviders) {
        this(allowedUserIds, isAutoSelectAllowed, allowedProviders, INSTANCE.toBundle$credentials_release(allowedUserIds), INSTANCE.toBundle$credentials_release(allowedUserIds), 0, 32, null);
        Intrinsics.checkNotNullParameter(allowedUserIds, "allowedUserIds");
        Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
    }

    public GetPasswordOption() {
        this(null, false, null, 7, null);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public GetPasswordOption(Set<String> allowedUserIds) {
        this(allowedUserIds, false, null, 6, null);
        Intrinsics.checkNotNullParameter(allowedUserIds, "allowedUserIds");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public GetPasswordOption(Set<String> allowedUserIds, boolean isAutoSelectAllowed) {
        this(allowedUserIds, isAutoSelectAllowed, null, 4, null);
        Intrinsics.checkNotNullParameter(allowedUserIds, "allowedUserIds");
    }

    /* compiled from: GetPasswordOption.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J+\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\f\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\n2\u0006\u0010\f\u001a\u00020\bH\u0001¢\u0006\u0002\b\rJ\u001b\u0010\u000e\u001a\u00020\b2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00040\nH\u0001¢\u0006\u0002\b\u0010R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Landroidx/credentials/GetPasswordOption$Companion;", "", "()V", "BUNDLE_KEY_ALLOWED_USER_IDS", "", "createFrom", "Landroidx/credentials/GetPasswordOption;", "data", "Landroid/os/Bundle;", "allowedProviders", "", "Landroid/content/ComponentName;", "candidateQueryData", "createFrom$credentials_release", "toBundle", "allowUserIds", "toBundle$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final GetPasswordOption createFrom$credentials_release(Bundle data, Set<ComponentName> allowedProviders, Bundle candidateQueryData) {
            Set emptySet;
            Intrinsics.checkNotNullParameter(data, "data");
            Intrinsics.checkNotNullParameter(allowedProviders, "allowedProviders");
            Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
            ArrayList allowUserIdList = data.getStringArrayList(GetPasswordOption.BUNDLE_KEY_ALLOWED_USER_IDS);
            if (allowUserIdList == null || (emptySet = CollectionsKt.toSet(allowUserIdList)) == null) {
                emptySet = SetsKt.emptySet();
            }
            return new GetPasswordOption(emptySet, data.getBoolean("androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", false), allowedProviders, data, candidateQueryData, data.getInt(CredentialOption.BUNDLE_KEY_TYPE_PRIORITY_VALUE, 1000), null);
        }

        @JvmStatic
        public final Bundle toBundle$credentials_release(Set<String> allowUserIds) {
            Intrinsics.checkNotNullParameter(allowUserIds, "allowUserIds");
            Bundle bundle = new Bundle();
            bundle.putStringArrayList(GetPasswordOption.BUNDLE_KEY_ALLOWED_USER_IDS, new ArrayList<>(allowUserIds));
            return bundle;
        }
    }
}
