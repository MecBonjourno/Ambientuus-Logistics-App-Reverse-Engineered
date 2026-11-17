package androidx.credentials;

import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.text.TextUtils;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.internal.FrameworkClassParsingException;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: CreateCredentialRequest.kt */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000f\b&\u0018\u0000 \u00182\u00020\u0001:\u0002\u0018\u0019BI\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\b\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\r\u001a\u00020\b¢\u0006\u0002\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0010R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\t\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\u0014R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\u0014R\u0013\u0010\f\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0013\u0010\r\u001a\u00020\b8\u0007¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u0014R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0016¨\u0006\u001a"}, d2 = {"Landroidx/credentials/CreateCredentialRequest;", "", "type", "", "credentialData", "Landroid/os/Bundle;", "candidateQueryData", "isSystemProviderRequired", "", "isAutoSelectAllowed", "displayInfo", "Landroidx/credentials/CreateCredentialRequest$DisplayInfo;", "origin", "preferImmediatelyAvailableCredentials", "(Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;ZZLandroidx/credentials/CreateCredentialRequest$DisplayInfo;Ljava/lang/String;Z)V", "getCandidateQueryData", "()Landroid/os/Bundle;", "getCredentialData", "getDisplayInfo", "()Landroidx/credentials/CreateCredentialRequest$DisplayInfo;", "()Z", "getOrigin", "()Ljava/lang/String;", "getType", "Companion", "DisplayInfo", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public abstract class CreateCredentialRequest {
    public static final String BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED = "androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED";
    public static final String BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS = "androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS";

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private final Bundle candidateQueryData;
    private final Bundle credentialData;
    private final DisplayInfo displayInfo;
    private final boolean isAutoSelectAllowed;
    private final boolean isSystemProviderRequired;
    private final String origin;
    private final boolean preferImmediatelyAvailableCredentials;
    private final String type;

    public CreateCredentialRequest(String type, Bundle credentialData, Bundle candidateQueryData, boolean isSystemProviderRequired, boolean isAutoSelectAllowed, DisplayInfo displayInfo, String origin, boolean preferImmediatelyAvailableCredentials) {
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(credentialData, "credentialData");
        Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
        Intrinsics.checkNotNullParameter(displayInfo, "displayInfo");
        this.type = type;
        this.credentialData = credentialData;
        this.candidateQueryData = candidateQueryData;
        this.isSystemProviderRequired = isSystemProviderRequired;
        this.isAutoSelectAllowed = isAutoSelectAllowed;
        this.displayInfo = displayInfo;
        this.origin = origin;
        this.preferImmediatelyAvailableCredentials = preferImmediatelyAvailableCredentials;
        this.credentialData.putBoolean("androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", this.isAutoSelectAllowed);
        this.credentialData.putBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS", this.preferImmediatelyAvailableCredentials);
        this.candidateQueryData.putBoolean("androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", this.isAutoSelectAllowed);
    }

    public final String getType() {
        return this.type;
    }

    public final Bundle getCredentialData() {
        return this.credentialData;
    }

    public final Bundle getCandidateQueryData() {
        return this.candidateQueryData;
    }

    /* renamed from: isSystemProviderRequired, reason: from getter */
    public final boolean getIsSystemProviderRequired() {
        return this.isSystemProviderRequired;
    }

    /* renamed from: isAutoSelectAllowed, reason: from getter */
    public final boolean getIsAutoSelectAllowed() {
        return this.isAutoSelectAllowed;
    }

    public final DisplayInfo getDisplayInfo() {
        return this.displayInfo;
    }

    public final String getOrigin() {
        return this.origin;
    }

    /* renamed from: preferImmediatelyAvailableCredentials, reason: from getter */
    public final boolean getPreferImmediatelyAvailableCredentials() {
        return this.preferImmediatelyAvailableCredentials;
    }

    /* compiled from: CreateCredentialRequest.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\u001b\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0005B#\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0002\u0010\bB-\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\t\u001a\u0004\u0018\u00010\n\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0002\u0010\u000bJ\b\u0010\u0013\u001a\u00020\u0014H\u0007R\u0015\u0010\t\u001a\u0004\u0018\u00010\n8\u0007¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u00078\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011¨\u0006\u0016"}, d2 = {"Landroidx/credentials/CreateCredentialRequest$DisplayInfo;", "", "userId", "", "userDisplayName", "(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V", "preferDefaultProvider", "", "(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;)V", "credentialTypeIcon", "Landroid/graphics/drawable/Icon;", "(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/drawable/Icon;Ljava/lang/String;)V", "getCredentialTypeIcon", "()Landroid/graphics/drawable/Icon;", "getPreferDefaultProvider", "()Ljava/lang/String;", "getUserDisplayName", "()Ljava/lang/CharSequence;", "getUserId", "toBundle", "Landroid/os/Bundle;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class DisplayInfo {
        public static final String BUNDLE_KEY_CREDENTIAL_TYPE_ICON = "androidx.credentials.BUNDLE_KEY_CREDENTIAL_TYPE_ICON";
        public static final String BUNDLE_KEY_DEFAULT_PROVIDER = "androidx.credentials.BUNDLE_KEY_DEFAULT_PROVIDER";
        public static final String BUNDLE_KEY_REQUEST_DISPLAY_INFO = "androidx.credentials.BUNDLE_KEY_REQUEST_DISPLAY_INFO";
        public static final String BUNDLE_KEY_USER_DISPLAY_NAME = "androidx.credentials.BUNDLE_KEY_USER_DISPLAY_NAME";
        public static final String BUNDLE_KEY_USER_ID = "androidx.credentials.BUNDLE_KEY_USER_ID";

        /* renamed from: Companion, reason: from kotlin metadata */
        public static final Companion INSTANCE = new Companion(null);
        private final Icon credentialTypeIcon;
        private final String preferDefaultProvider;
        private final CharSequence userDisplayName;
        private final CharSequence userId;

        public DisplayInfo(CharSequence userId, CharSequence userDisplayName, Icon credentialTypeIcon, String preferDefaultProvider) {
            Intrinsics.checkNotNullParameter(userId, "userId");
            this.userId = userId;
            this.userDisplayName = userDisplayName;
            this.credentialTypeIcon = credentialTypeIcon;
            this.preferDefaultProvider = preferDefaultProvider;
            if (!(this.userId.length() > 0)) {
                throw new IllegalArgumentException("userId should not be empty".toString());
            }
        }

        public final CharSequence getUserId() {
            return this.userId;
        }

        public final CharSequence getUserDisplayName() {
            return this.userDisplayName;
        }

        public final Icon getCredentialTypeIcon() {
            return this.credentialTypeIcon;
        }

        public final String getPreferDefaultProvider() {
            return this.preferDefaultProvider;
        }

        public /* synthetic */ DisplayInfo(CharSequence charSequence, CharSequence charSequence2, int i, DefaultConstructorMarker defaultConstructorMarker) {
            this(charSequence, (i & 2) != 0 ? null : charSequence2);
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        public DisplayInfo(CharSequence userId, CharSequence userDisplayName) {
            this(userId, userDisplayName, (Icon) null, (String) null);
            Intrinsics.checkNotNullParameter(userId, "userId");
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        public DisplayInfo(CharSequence userId) {
            this(userId, (CharSequence) null, 2, (DefaultConstructorMarker) (0 == true ? 1 : 0));
            Intrinsics.checkNotNullParameter(userId, "userId");
        }

        /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
        public DisplayInfo(CharSequence userId, CharSequence userDisplayName, String preferDefaultProvider) {
            this(userId, userDisplayName, (Icon) null, preferDefaultProvider);
            Intrinsics.checkNotNullParameter(userId, "userId");
        }

        public final Bundle toBundle() {
            Bundle bundle = new Bundle();
            bundle.putCharSequence(BUNDLE_KEY_USER_ID, this.userId);
            if (!TextUtils.isEmpty(this.userDisplayName)) {
                bundle.putCharSequence(BUNDLE_KEY_USER_DISPLAY_NAME, this.userDisplayName);
            }
            if (!TextUtils.isEmpty(this.preferDefaultProvider)) {
                bundle.putString(BUNDLE_KEY_DEFAULT_PROVIDER, this.preferDefaultProvider);
            }
            return bundle;
        }

        /* compiled from: CreateCredentialRequest.kt */
        @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0007R\u0010\u0010\u0003\u001a\u00020\u00048\u0006X\u0087T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00048\u0006X\u0087T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u00020\u00048\u0006X\u0087T¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Landroidx/credentials/CreateCredentialRequest$DisplayInfo$Companion;", "", "()V", "BUNDLE_KEY_CREDENTIAL_TYPE_ICON", "", "BUNDLE_KEY_DEFAULT_PROVIDER", "BUNDLE_KEY_REQUEST_DISPLAY_INFO", "BUNDLE_KEY_USER_DISPLAY_NAME", "BUNDLE_KEY_USER_ID", "createFrom", "Landroidx/credentials/CreateCredentialRequest$DisplayInfo;", TypedValues.TransitionType.S_FROM, "Landroid/os/Bundle;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
        public static final class Companion {
            public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
                this();
            }

            private Companion() {
            }

            @JvmStatic
            public final DisplayInfo createFrom(Bundle from) {
                Intrinsics.checkNotNullParameter(from, "from");
                try {
                    Bundle displayInfoBundle = from.getBundle(DisplayInfo.BUNDLE_KEY_REQUEST_DISPLAY_INFO);
                    Intrinsics.checkNotNull(displayInfoBundle);
                    CharSequence userId = displayInfoBundle.getCharSequence(DisplayInfo.BUNDLE_KEY_USER_ID);
                    CharSequence displayName = displayInfoBundle.getCharSequence(DisplayInfo.BUNDLE_KEY_USER_DISPLAY_NAME);
                    Icon icon = (Icon) displayInfoBundle.getParcelable(DisplayInfo.BUNDLE_KEY_CREDENTIAL_TYPE_ICON);
                    String defaultProvider = displayInfoBundle.getString(DisplayInfo.BUNDLE_KEY_DEFAULT_PROVIDER);
                    Intrinsics.checkNotNull(userId);
                    return new DisplayInfo(userId, displayName, icon, defaultProvider);
                } catch (Exception e) {
                    throw new IllegalArgumentException(e);
                }
            }
        }

        @JvmStatic
        public static final DisplayInfo createFrom(Bundle from) {
            return INSTANCE.createFrom(from);
        }
    }

    /* compiled from: CreateCredentialRequest.kt */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0007J4\u0010\u0006\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0004H\u0007R\u0010\u0010\u0003\u001a\u00020\u00048\u0006X\u0087T¢\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u00020\u00048\u0006X\u0087T¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Landroidx/credentials/CreateCredentialRequest$Companion;", "", "()V", "BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", "", "BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS", "createFrom", "Landroidx/credentials/CreateCredentialRequest;", "request", "Landroid/credentials/CreateCredentialRequest;", "type", "credentialData", "Landroid/os/Bundle;", "candidateQueryData", "requireSystemProvider", "", "origin", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final CreateCredentialRequest createFrom(android.credentials.CreateCredentialRequest request) {
            Intrinsics.checkNotNullParameter(request, "request");
            String type = request.getType();
            Intrinsics.checkNotNullExpressionValue(type, "request.type");
            Bundle credentialData = request.getCredentialData();
            Intrinsics.checkNotNullExpressionValue(credentialData, "request.credentialData");
            Bundle candidateQueryData = request.getCandidateQueryData();
            Intrinsics.checkNotNullExpressionValue(candidateQueryData, "request.candidateQueryData");
            return createFrom(type, credentialData, candidateQueryData, request.isSystemProviderRequired(), request.getOrigin());
        }

        public static /* synthetic */ CreateCredentialRequest createFrom$default(Companion companion, String str, Bundle bundle, Bundle bundle2, boolean z, String str2, int i, Object obj) {
            String str3;
            if ((i & 16) == 0) {
                str3 = str2;
            } else {
                str3 = null;
            }
            return companion.createFrom(str, bundle, bundle2, z, str3);
        }

        /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
        java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
        	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
        	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
         */
        @JvmStatic
        public final CreateCredentialRequest createFrom(String type, Bundle credentialData, Bundle candidateQueryData, boolean requireSystemProvider, String origin) {
            CreatePublicKeyCredentialRequest createFrom$credentials_release;
            Intrinsics.checkNotNullParameter(type, "type");
            Intrinsics.checkNotNullParameter(credentialData, "credentialData");
            Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
            try {
                if (Intrinsics.areEqual(type, PasswordCredential.TYPE_PASSWORD_CREDENTIAL)) {
                    createFrom$credentials_release = CreatePasswordRequest.INSTANCE.createFrom$credentials_release(credentialData, origin, candidateQueryData);
                } else {
                    if (Intrinsics.areEqual(type, PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL)) {
                        String string = credentialData.getString(PublicKeyCredential.BUNDLE_KEY_SUBTYPE);
                        if (string != null) {
                            switch (string.hashCode()) {
                                case 589054771:
                                    if (string.equals(CreatePublicKeyCredentialRequest.BUNDLE_VALUE_SUBTYPE_CREATE_PUBLIC_KEY_CREDENTIAL_REQUEST)) {
                                        createFrom$credentials_release = CreatePublicKeyCredentialRequest.INSTANCE.createFrom$credentials_release(credentialData, origin, candidateQueryData);
                                        break;
                                    }
                                    break;
                            }
                        }
                        throw new FrameworkClassParsingException();
                    }
                    throw new FrameworkClassParsingException();
                }
                return createFrom$credentials_release;
            } catch (FrameworkClassParsingException e) {
                return new CreateCustomCredentialRequest(type, credentialData, candidateQueryData, requireSystemProvider, DisplayInfo.INSTANCE.createFrom(credentialData), credentialData.getBoolean("androidx.credentials.BUNDLE_KEY_IS_AUTO_SELECT_ALLOWED", false), origin, credentialData.getBoolean("androidx.credentials.BUNDLE_KEY_PREFER_IMMEDIATELY_AVAILABLE_CREDENTIALS", false));
            }
        }

        @JvmStatic
        public final CreateCredentialRequest createFrom(String type, Bundle credentialData, Bundle candidateQueryData, boolean requireSystemProvider) {
            Intrinsics.checkNotNullParameter(type, "type");
            Intrinsics.checkNotNullParameter(credentialData, "credentialData");
            Intrinsics.checkNotNullParameter(candidateQueryData, "candidateQueryData");
            return createFrom$default(this, type, credentialData, candidateQueryData, requireSystemProvider, null, 16, null);
        }
    }

    @JvmStatic
    public static final CreateCredentialRequest createFrom(android.credentials.CreateCredentialRequest request) {
        return INSTANCE.createFrom(request);
    }

    @JvmStatic
    public static final CreateCredentialRequest createFrom(String type, Bundle credentialData, Bundle candidateQueryData, boolean requireSystemProvider) {
        return INSTANCE.createFrom(type, credentialData, candidateQueryData, requireSystemProvider);
    }

    @JvmStatic
    public static final CreateCredentialRequest createFrom(String type, Bundle credentialData, Bundle candidateQueryData, boolean requireSystemProvider, String origin) {
        return INSTANCE.createFrom(type, credentialData, candidateQueryData, requireSystemProvider, origin);
    }
}
