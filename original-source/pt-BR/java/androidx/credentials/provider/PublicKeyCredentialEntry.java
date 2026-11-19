package androidx.credentials.provider;

import android.app.PendingIntent;
import android.app.slice.Slice;
import android.app.slice.SliceItem;
import android.app.slice.SliceSpec;
import android.content.Context;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.CredentialOption;
import androidx.credentials.PublicKeyCredential;
import androidx.credentials.R;
import androidx.credentials.provider.BeginGetPublicKeyCredentialOption;
import androidx.credentials.provider.utils.CryptoObjectUtils;
import com.google.android.gms.common.internal.BaseGmsClient;
import j$.time.Instant;
import java.util.Collections;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: PublicKeyCredentialEntry.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u001c\b\u0007\u0018\u0000 12\u00020\u0001:\u000523451B\u0097\u0001\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\r\u001a\u00020\f\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\u0006\u0010\u0010\u001a\u00020\f\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\b\b\u0002\u0010\u0015\u001a\u00020\f\u0012\b\b\u0002\u0010\u0016\u001a\u00020\f\u0012\b\b\u0002\u0010\u0017\u001a\u00020\f¢\u0006\u0004\b\u0018\u0010\u0019B_\b\u0016\u0012\u0006\u0010\u001b\u001a\u00020\u001a\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\r\u001a\u00020\f\u0012\b\b\u0002\u0010\u0010\u001a\u00020\f¢\u0006\u0004\b\u0018\u0010\u001cBk\b\u0017\u0012\u0006\u0010\u001b\u001a\u00020\u001a\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\r\u001a\u00020\f\u0012\b\b\u0002\u0010\u0010\u001a\u00020\f\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013¢\u0006\u0004\b\u0018\u0010\u001dBU\b\u0017\u0012\u0006\u0010\u001b\u001a\u00020\u001a\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u000f\u001a\u00020\u000e\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0002\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u0018\u0010\u001eR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001f\u001a\u0004\b \u0010!R\u0019\u0010\u0004\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001f\u001a\u0004\b\"\u0010!R\u0017\u0010\u0005\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001f\u001a\u0004\b#\u0010!R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010$\u001a\u0004\b%\u0010&R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010'\u001a\u0004\b(\u0010)R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006¢\u0006\f\n\u0004\b\u000b\u0010*\u001a\u0004\b+\u0010,R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010-\u001a\u0004\b\r\u0010.R\u0014\u0010\u0016\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010-R\u0014\u0010\u0017\u001a\u00020\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010-R\u0017\u0010/\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b/\u0010-\u001a\u0004\b/\u0010.R\u0011\u00100\u001a\u00020\f8G¢\u0006\u0006\u001a\u0004\b0\u0010.¨\u00066"}, d2 = {"Landroidx/credentials/provider/PublicKeyCredentialEntry;", "Landroidx/credentials/provider/CredentialEntry;", "", "username", "displayName", "typeDisplayName", "Landroid/app/PendingIntent;", BaseGmsClient.KEY_PENDING_INTENT, "Landroid/graphics/drawable/Icon;", "icon", "j$/time/Instant", "lastUsedTime", "", "isAutoSelectAllowed", "Landroidx/credentials/provider/BeginGetPublicKeyCredentialOption;", "beginGetPublicKeyCredentialOption", "isDefaultIconPreferredAsSingleProvider", "entryGroupId", "affiliatedDomain", "Landroidx/credentials/provider/BiometricPromptData;", "biometricPromptData", "autoSelectAllowedFromOption", "isCreatedFromSlice", "isDefaultIconFromSlice", "<init>", "(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/graphics/drawable/Icon;Lj$/time/Instant;ZLandroidx/credentials/provider/BeginGetPublicKeyCredentialOption;ZLjava/lang/CharSequence;Ljava/lang/CharSequence;Landroidx/credentials/provider/BiometricPromptData;ZZZ)V", "Landroid/content/Context;", "context", "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetPublicKeyCredentialOption;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;ZZ)V", "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetPublicKeyCredentialOption;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;ZZLandroidx/credentials/provider/BiometricPromptData;)V", "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetPublicKeyCredentialOption;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;Z)V", "Ljava/lang/CharSequence;", "getUsername", "()Ljava/lang/CharSequence;", "getDisplayName", "getTypeDisplayName", "Landroid/app/PendingIntent;", "getPendingIntent", "()Landroid/app/PendingIntent;", "Landroid/graphics/drawable/Icon;", "getIcon", "()Landroid/graphics/drawable/Icon;", "Lj$/time/Instant;", "getLastUsedTime", "()Lj$/time/Instant;", "Z", "()Z", "isAutoSelectAllowedFromOption", "hasDefaultIcon", "Companion", "Api28Impl", "Api34Impl", "Api35Impl", "Builder", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class PublicKeyCredentialEntry extends CredentialEntry {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "PublicKeyCredEntry";
    private final CharSequence displayName;
    private final Icon icon;
    private final boolean isAutoSelectAllowed;
    private final boolean isAutoSelectAllowedFromOption;
    private final boolean isCreatedFromSlice;
    private final boolean isDefaultIconFromSlice;
    private final Instant lastUsedTime;
    private final PendingIntent pendingIntent;
    private final CharSequence typeDisplayName;
    private final CharSequence username;

    public /* sintético */ PublicKeyCredentialEntry(CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, PendingIntent pendingIntent, Icon icon, Instant instant, boolean z, BeginGetPublicKeyCredentialOption beginGetPublicKeyCredentialOption, boolean z2, CharSequence charSequence4, CharSequence charSequence5, BiometricPromptData biometricPromptData, boolean z3, boolean z4, boolean z5, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(charSequence, charSequence2, charSequence3, pendingIntent, icon, instant, z, beginGetPublicKeyCredentialOption, z2, (i & 512) != 0 ? charSequence : charSequence4, (i & 1024) != 0 ? null : charSequence5, (i & 2048) != 0 ? null : biometricPromptData, (i & 4096) != 0 ? CredentialOption.INSTANCE.extractAutoSelectValue$credentials_release(beginGetPublicKeyCredentialOption.getCandidateQueryData()) : z3, (i & 8192) != 0 ? false : z4, (i & 16384) != 0 ? false : z5);
    }

    public final CharSequence getUsername() {
        return this.username;
    }

    public final CharSequence getDisplayName() {
        return this.displayName;
    }

    public final CharSequence getTypeDisplayName() {
        return this.typeDisplayName;
    }

    public final PendingIntent getPendingIntent() {
        return this.pendingIntent;
    }

    public final Icon getIcon() {
        return this.icon;
    }

    public final Instant getLastUsedTime() {
        return this.lastUsedTime;
    }

    /* renomeado de: isAutoSelectAllowed, motivo: de getter */
    public final boolean getIsAutoSelectAllowed() {
        return this.isAutoSelectAllowed;
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public PublicKeyCredentialEntry(CharSequence username, CharSequence displayName, CharSequence typeDisplayName, PendingIntent pendingIntent, Icon icon, Instant lastUsedTime, boolean isAutoSelectAllowed, BeginGetPublicKeyCredentialOption beginGetPublicKeyCredentialOption, boolean isDefaultIconPreferredAsSingleProvider, CharSequence entryGroupId, CharSequence affiliatedDomain, BiometricPromptData biometricPromptData, boolean autoSelectAllowedFromOption, boolean isCreatedFromSlice, boolean isDefaultIconFromSlice) {
        super(PublicKeyCredential.TYPE_PUBLIC_KEY_CREDENTIAL, beginGetPublicKeyCredentialOption, entryGroupId == null ? username : entryGroupId, isDefaultIconPreferredAsSingleProvider, affiliatedDomain, biometricPromptData);
        Intrinsics.checkNotNullParameter(username, "username");
        Intrinsics.checkNotNullParameter(typeDisplayName, "typeDisplayName");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
        Intrinsics.checkNotNullParameter(icon, "icon");
        Intrinsics.checkNotNullParameter(beginGetPublicKeyCredentialOption, "beginGetPublicKeyCredentialOption");
        this.username = username;
        this.displayName = displayName;
        this.typeDisplayName = typeDisplayName;
        this.pendingIntent = pendingIntent;
        this.icon = icon;
        this.lastUsedTime = lastUsedTime;
        this.isAutoSelectAllowed = isAutoSelectAllowed;
        this.isCreatedFromSlice = isCreatedFromSlice;
        this.isDefaultIconFromSlice = isDefaultIconFromSlice;
        this.isAutoSelectAllowedFromOption = autoSelectAllowedFromOption;
        if (!(this.username.length() > 0)) {
            throw new IllegalArgumentException("username must not be empty".toString());
        }
        if (!(this.typeDisplayName.length() > 0)) {
            throw new IllegalArgumentException("typeDisplayName must not be empty".toString());
        }
    }

    /* renomeado de: isAutoSelectAllowedFromOption, motivo: de getter */
    public final boolean getIsAutoSelectAllowedFromOption() {
        return this.isAutoSelectAllowedFromOption;
    }

    public final boolean hasDefaultIcon() {
        if (Build.VERSION.SDK_INT >= 28) {
            return Api28Impl.isDefaultIcon(this);
        }
        return false;
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* sintético */ PublicKeyCredentialEntry(android.content.Context r2, java.lang.CharSequence r3, android.app.PendingIntent r4, androidx.credentials.provider.BeginGetPublicKeyCredentialOption r5, java.lang.CharSequence r6, j$.time.Instant r7, android.graphics.drawable.Icon r8, boolean r9, boolean r10, int r11, kotlin.jvm.internal.DefaultConstructorMarker r12) {
        /*
            r1 = this;
            r12 = r11 & 16
            r0 = 0
            if (r12 == 0) goto L6
            r6 = r0
        L6:
            r12 = r11 & 32
            if (r12 == 0) goto Lb
            r7 = r0
        Lb:
            r12 = r11 & 64
            if (r12 == 0) goto L1a
            int r8 = androidx.credentials.R.drawable.ic_passkey
            android.graphics.drawable.Icon r8 = android.graphics.drawable.Icon.createWithResource(r2, r8)
            java.lang.String r12 = "createWithResource(context, R.drawable.ic_passkey)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r8, r12)
        L1a:
            r12 = r11 & 128(0x80, float:1.8E-43)
            r0 = 0
            if (r12 == 0) goto L20
            r9 = r0
        L20:
            r11 = r11 & 256(0x100, float:3.59E-43)
            if (r11 == 0) goto L26
            r11 = r0
            goto L27
        L26:
            r11 = r10
        L27:
            r10 = r9
            r9 = r8
            r8 = r7
            r7 = r6
            r6 = r5
            r5 = r4
            r4 = r3
            r3 = r2
            r2 = r1
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.PublicKeyCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetPublicKeyCredentialOption, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, boolean, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public PublicKeyCredentialEntry(android.content.Context r21, java.lang.CharSequence r22, android.app.PendingIntent r23, androidx.credentials.provider.BeginGetPublicKeyCredentialOption r24, java.lang.CharSequence r25, j$.time.Instant r26, android.graphics.drawable.Icon r27, boolean r28, boolean r29) {
        /*
            r20 = this;
            r0 = r21
            java.lang.String r1 = "context"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r0, r1)
            java.lang.String r1 = "username"
            r3 = r22
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r3, r1)
            java.lang.String r1 = "pendingIntent"
            r6 = r23
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r6, r1)
            java.lang.String r1 = "beginGetPublicKeyCredentialOption"
            r10 = r24
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r10, r1)
            java.lang.String r1 = "icon"
            r7 = r27
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r7, r1)
            int r1 = androidx.credentials.R.string.androidx_credentials_TYPE_PUBLIC_KEY_CREDENTIAL
            java.lang.String r1 = r0.getString(r1)
            java.lang.String r2 = "context.getString(R.stri…PE_PUBLIC_KEY_CREDENTIAL)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
            r5 = r1
            java.lang.CharSequence r5 = (java.lang.CharSequence) r5
            r18 = 32256(0x7e00, float:4.52E-41)
            r19 = 0
            r12 = 0
            r13 = 0
            r14 = 0
            r15 = 0
            r16 = 0
            r17 = 0
            r2 = r20
            r4 = r25
            r8 = r26
            r9 = r28
            r11 = r29
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.PublicKeyCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetPublicKeyCredentialOption, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, boolean):void");
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* sintético */ PublicKeyCredentialEntry(android.content.Context r3, java.lang.CharSequence r4, android.app.PendingIntent r5, androidx.credentials.provider.BeginGetPublicKeyCredentialOption r6, java.lang.CharSequence r7, j$.time.Instant r8, android.graphics.drawable.Icon r9, boolean r10, boolean r11, androidx.credentials.provider.BiometricPromptData r12, int r13, kotlin.jvm.internal.DefaultConstructorMarker r14) {
        /*
            r2 = this;
            r14 = r13 & 16
            r0 = 0
            if (r14 == 0) goto L6
            r7 = r0
        L6:
            r14 = r13 & 32
            if (r14 == 0) goto Lb
            r8 = r0
        Lb:
            r14 = r13 & 64
            if (r14 == 0) goto L1a
            int r9 = androidx.credentials.R.drawable.ic_passkey
            android.graphics.drawable.Icon r9 = android.graphics.drawable.Icon.createWithResource(r3, r9)
            java.lang.String r14 = "createWithResource(context, R.drawable.ic_passkey)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r9, r14)
        L1a:
            r14 = r13 & 128(0x80, float:1.8E-43)
            r1 = 0
            if (r14 == 0) goto L20
            r10 = r1
        L20:
            r14 = r13 & 256(0x100, float:3.59E-43)
            if (r14 == 0) goto L25
            r11 = r1
        L25:
            r13 = r13 & 512(0x200, float:7.17E-43)
            if (r13 == 0) goto L2b
            r13 = r0
            goto L2c
        L2b:
            r13 = r12
        L2c:
            r12 = r11
            r11 = r10
            r10 = r9
            r9 = r8
            r8 = r7
            r7 = r6
            r6 = r5
            r5 = r4
            r4 = r3
            r3 = r2
            r3.<init>(r4, r5, r6, r7, r8, r9, r10, r11, r12, r13)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.PublicKeyCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetPublicKeyCredentialOption, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, boolean, androidx.credentials.provider.BiometricPromptData, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public PublicKeyCredentialEntry(android.content.Context r21, java.lang.CharSequence r22, android.app.PendingIntent r23, androidx.credentials.provider.BeginGetPublicKeyCredentialOption r24, java.lang.CharSequence r25, j$.time.Instant r26, android.graphics.drawable.Icon r27, boolean r28, boolean r29, androidx.credentials.provider.BiometricPromptData r30) {
        /*
            r20 = this;
            r0 = r21
            java.lang.String r1 = "context"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r0, r1)
            java.lang.String r1 = "username"
            r3 = r22
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r3, r1)
            java.lang.String r1 = "pendingIntent"
            r6 = r23
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r6, r1)
            java.lang.String r1 = "beginGetPublicKeyCredentialOption"
            r10 = r24
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r10, r1)
            java.lang.String r1 = "icon"
            r7 = r27
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r7, r1)
            int r1 = androidx.credentials.R.string.androidx_credentials_TYPE_PUBLIC_KEY_CREDENTIAL
            java.lang.String r1 = r0.getString(r1)
            java.lang.String r2 = "context.getString(R.stri…PE_PUBLIC_KEY_CREDENTIAL)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
            r5 = r1
            java.lang.CharSequence r5 = (java.lang.CharSequence) r5
            r18 = 30208(0x7600, float:4.233E-41)
            r19 = 0
            r12 = 0
            r13 = 0
            r15 = 0
            r16 = 0
            r17 = 0
            r2 = r20
            r4 = r25
            r8 = r26
            r9 = r28
            r11 = r29
            r14 = r30
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.PublicKeyCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetPublicKeyCredentialOption, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, boolean, androidx.credentials.provider.BiometricPromptData):void");
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* sintético */ PublicKeyCredentialEntry(android.content.Context r2, java.lang.CharSequence r3, android.app.PendingIntent r4, androidx.credentials.provider.BeginGetPublicKeyCredentialOption r5, java.lang.CharSequence r6, j$.time.Instant r7, android.graphics.drawable.Icon r8, boolean r9, int r10, kotlin.jvm.internal.DefaultConstructorMarker r11) {
        /*
            r1 = this;
            r11 = r10 & 16
            r0 = 0
            if (r11 == 0) goto L6
            r6 = r0
        L6:
            r11 = r10 & 32
            if (r11 == 0) goto Lb
            r7 = r0
        Lb:
            r11 = r10 & 64
            if (r11 == 0) goto L1a
            int r8 = androidx.credentials.R.drawable.ic_passkey
            android.graphics.drawable.Icon r8 = android.graphics.drawable.Icon.createWithResource(r2, r8)
            java.lang.String r11 = "createWithResource(context, R.drawable.ic_passkey)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r8, r11)
        L1a:
            r10 = r10 & 128(0x80, float:1.8E-43)
            if (r10 == 0) goto L21
            r9 = 0
            r10 = r9
            goto L22
        L21:
            r10 = r9
        L22:
            r9 = r8
            r8 = r7
            r7 = r6
            r6 = r5
            r5 = r4
            r4 = r3
            r3 = r2
            r2 = r1
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.PublicKeyCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetPublicKeyCredentialOption, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* JADX WARN: instruções ilegais antes da chamada do construtor */
    @kotlin.Deprecated(level = kotlin.DeprecationLevel.HIDDEN, message = "Use the constructor with all parameters dependent on API levels", replaceWith = @kotlin.ReplaceWith(expression = "PublicKeyCredentialEntry(context, username, pendingIntent,beginGetPublicKeyCredentialOption, displayName, lastUsedTime, icon, isAutoSelectAllowed, isDefaultIconPreferredAsSingleProvider, biometricPromptData)", imports = {}))
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* sintético */ PublicKeyCredentialEntry(android.content.Context r21, java.lang.CharSequence r22, android.app.PendingIntent r23, androidx.credentials.provider.BeginGetPublicKeyCredentialOption r24, java.lang.CharSequence r25, j$.time.Instant r26, android.graphics.drawable.Icon r27, boolean r28) {
        /*
            r20 = this;
            r0 = r21
            java.lang.String r1 = "context"
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r0, r1)
            java.lang.String r1 = "username"
            r3 = r22
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r3, r1)
            java.lang.String r1 = "pendingIntent"
            r6 = r23
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r6, r1)
            java.lang.String r1 = "beginGetPublicKeyCredentialOption"
            r10 = r24
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r10, r1)
            java.lang.String r1 = "icon"
            r7 = r27
            kotlin.jvm.internal.Intrinsics.checkNotNullParameter(r7, r1)
            int r1 = androidx.credentials.R.string.androidx_credentials_TYPE_PUBLIC_KEY_CREDENTIAL
            java.lang.String r1 = r0.getString(r1)
            java.lang.String r2 = "context.getString(R.stri…PE_PUBLIC_KEY_CREDENTIAL)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r2)
            r5 = r1
            java.lang.CharSequence r5 = (java.lang.CharSequence) r5
            r18 = 32256(0x7e00, float:4.52E-41)
            r19 = 0
            r11 = 0
            r12 = 0
            r13 = 0
            r14 = 0
            r15 = 0
            r16 = 0
            r17 = 0
            r2 = r20
            r4 = r25
            r8 = r26
            r9 = r28
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17, r18, r19)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.PublicKeyCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetPublicKeyCredentialOption, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean):void");
    }

    /* compiled from: PublicKeyCredentialEntry.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u0007"}, d2 = {"Landroidx/credentials/provider/PublicKeyCredentialEntry$Api34Impl;", "", "()V", "fromCredentialEntry", "Landroidx/credentials/provider/PublicKeyCredentialEntry;", "credentialEntry", "Landroid/service/credentials/CredentialEntry;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api34Impl {
        public static final Api34Impl INSTANCE = new Api34Impl();

        private Api34Impl() {
        }

        @JvmStatic
        public static final PublicKeyCredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
            Intrinsics.checkNotNullParameter(credentialEntry, "credentialEntry");
            Slice slice = credentialEntry.getSlice();
            Intrinsics.checkNotNullExpressionValue(slice, "credentialEntry.slice");
            return PublicKeyCredentialEntry.INSTANCE.fromSlice(slice);
        }
    }

    /* compiled from: PublicKeyCredentialEntry.kt */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u0012\u0010\t\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0010\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\r"}, d2 = {"Landroidx/credentials/provider/PublicKeyCredentialEntry$Api35Impl;", "", "()V", "addToSlice", "", "entry", "Landroidx/credentials/provider/PublicKeyCredentialEntry;", "sliceBuilder", "Landroid/app/slice/Slice$Builder;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api35Impl {
        public static final Api35Impl INSTANCE = new Api35Impl();

        private Api35Impl() {
        }

        @JvmStatic
        public static final Slice toSlice(PublicKeyCredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            String type = entry.getType();
            Slice.Builder sliceBuilder = new Slice.Builder(Uri.EMPTY, new SliceSpec(type, 1));
            Api28Impl.INSTANCE.addToSlice(entry, sliceBuilder);
            INSTANCE.addToSlice(entry, sliceBuilder);
            Slice build = sliceBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "sliceBuilder.build()");
            return build;
        }

        public final void addToSlice(PublicKeyCredentialEntry entry, Slice.Builder sliceBuilder) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            Intrinsics.checkNotNullParameter(sliceBuilder, "sliceBuilder");
            BiometricPromptData biometricPromptData = entry.getBiometricPromptData();
            if (biometricPromptData != null) {
                sliceBuilder.addInt(biometricPromptData.getAllowedAuthenticators(), null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_ALLOWED_AUTHENTICATORS));
                if (biometricPromptData.getCryptoObject() != null) {
                    sliceBuilder.addLong(CryptoObjectUtils.INSTANCE.getOperationHandle(biometricPromptData.getCryptoObject()), null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_CRYPTO_OP_ID));
                }
                Bundle biometricBundle = BiometricPromptData.INSTANCE.toBundle(biometricPromptData);
                sliceBuilder.addBundle(biometricBundle, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_BIOMETRIC_PROMPT_DATA));
            }
        }

        @JvmStatic
        public static final PublicKeyCredentialEntry fromSlice(Slice slice) {
            BiometricPromptData biometricPromptData;
            Intrinsics.checkNotNullParameter(slice, "slice");
            PublicKeyCredentialEntry publicKeyCredentialEntry = Api28Impl.fromSlice(slice);
            if (publicKeyCredentialEntry == null) {
                return null;
            }
            Iterable items = slice.getItems();
            Intrinsics.checkNotNullExpressionValue(items, "slice.items");
            Iterable $this$forEach$iv = items;
            Bundle bundle = null;
            for (Object element$iv : $this$forEach$iv) {
                SliceItem it = (SliceItem) element$iv;
                if (it.hasHint(CredentialEntry.SLICE_HINT_BIOMETRIC_PROMPT_DATA)) {
                    bundle = it.getBundle();
                }
            }
            try {
                CharSequence username = publicKeyCredentialEntry.getUsername();
                CharSequence displayName = publicKeyCredentialEntry.getDisplayName();
                CharSequence typeDisplayName = publicKeyCredentialEntry.getTypeDisplayName();
                PendingIntent pendingIntent = publicKeyCredentialEntry.getPendingIntent();
                Icon icon = publicKeyCredentialEntry.getIcon();
                Instant lastUsedTime = publicKeyCredentialEntry.getLastUsedTime();
                boolean isAutoSelectAllowed = publicKeyCredentialEntry.getIsAutoSelectAllowed();
                BeginGetCredentialOption beginGetCredentialOption = publicKeyCredentialEntry.getBeginGetCredentialOption();
                Intrinsics.checkNotNull(beginGetCredentialOption, "null cannot be cast to non-null type androidx.credentials.provider.BeginGetPublicKeyCredentialOption");
                BeginGetPublicKeyCredentialOption beginGetPublicKeyCredentialOption = (BeginGetPublicKeyCredentialOption) beginGetCredentialOption;
                CharSequence entryGroupId = publicKeyCredentialEntry.getEntryGroupId();
                boolean isDefaultIconPreferredAsSingleProvider = publicKeyCredentialEntry.getIsDefaultIconPreferredAsSingleProvider();
                CharSequence affiliatedDomain = publicKeyCredentialEntry.getAffiliatedDomain();
                boolean isAutoSelectAllowedFromOption = publicKeyCredentialEntry.getIsAutoSelectAllowedFromOption();
                boolean z = publicKeyCredentialEntry.isDefaultIconFromSlice;
                if (bundle != null) {
                    biometricPromptData = BiometricPromptData.INSTANCE.fromBundle(bundle);
                } else {
                    biometricPromptData = null;
                }
                return new PublicKeyCredentialEntry(username, displayName, typeDisplayName, pendingIntent, icon, lastUsedTime, isAutoSelectAllowed, beginGetPublicKeyCredentialOption, isDefaultIconPreferredAsSingleProvider, entryGroupId, affiliatedDomain, biometricPromptData, isAutoSelectAllowedFromOption, true, z);
            } catch (Exception e) {
                Log.i(PublicKeyCredentialEntry.TAG, "fromSlice failed with: " + e.getMessage());
                return null;
            }
        }
    }

    /* compiled from: PublicKeyCredentialEntry.kt */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u0012\u0010\t\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0010\u0010\f\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007J\u0010\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u000f"}, d2 = {"Landroidx/credentials/provider/PublicKeyCredentialEntry$Api28Impl;", "", "()V", "addToSlice", "", "entry", "Landroidx/credentials/provider/PublicKeyCredentialEntry;", "sliceBuilder", "Landroid/app/slice/Slice$Builder;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "isDefaultIcon", "", "toSlice", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api28Impl {
        public static final Api28Impl INSTANCE = new Api28Impl();

        private Api28Impl() {
        }

        @JvmStatic
        public static final boolean isDefaultIcon(PublicKeyCredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            if (entry.isCreatedFromSlice) {
                return entry.isDefaultIconFromSlice;
            }
            return entry.getIcon().getType() == 2 && entry.getIcon().getResId() == R.drawable.ic_passkey;
        }

        @JvmStatic
        public static final Slice toSlice(PublicKeyCredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            String type = entry.getType();
            Slice.Builder sliceBuilder = new Slice.Builder(Uri.EMPTY, new SliceSpec(type, 1));
            INSTANCE.addToSlice(entry, sliceBuilder);
            Slice build = sliceBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "sliceBuilder.build()");
            return build;
        }

        public final void addToSlice(PublicKeyCredentialEntry entry, Slice.Builder sliceBuilder) {
            String isUsingDefaultIcon;
            Intrinsics.checkNotNullParameter(entry, "entry");
            Intrinsics.checkNotNullParameter(sliceBuilder, "sliceBuilder");
            BeginGetCredentialOption beginGetCredentialOption = entry.getBeginGetCredentialOption();
            CharSequence entryGroupId = entry.getEntryGroupId();
            boolean isDefaultIconPreferredAsSingleProvider = entry.getIsDefaultIconPreferredAsSingleProvider();
            CharSequence affiliatedDomain = entry.getAffiliatedDomain();
            String str = CredentialEntry.TRUE_STRING;
            if (isDefaultIconPreferredAsSingleProvider) {
                isUsingDefaultIcon = CredentialEntry.TRUE_STRING;
            } else {
                isUsingDefaultIcon = CredentialEntry.FALSE_STRING;
            }
            sliceBuilder.addText(beginGetCredentialOption.getId(), null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_OPTION_ID)).addText(entryGroupId, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_DEDUPLICATION_ID)).addText(isUsingDefaultIcon, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_IS_DEFAULT_ICON_PREFERRED)).addText(affiliatedDomain, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_AFFILIATED_DOMAIN));
            CharSequence title = entry.getUsername();
            CharSequence subtitle = entry.getDisplayName();
            PendingIntent pendingIntent = entry.getPendingIntent();
            CharSequence typeDisplayName = entry.getTypeDisplayName();
            Instant lastUsedTime = entry.getLastUsedTime();
            Icon icon = entry.getIcon();
            boolean isAutoSelectAllowed = entry.getIsAutoSelectAllowed();
            if (!isAutoSelectAllowed) {
                str = CredentialEntry.FALSE_STRING;
            }
            String autoSelectAllowed = str;
            sliceBuilder.addText(typeDisplayName, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_TYPE_DISPLAY_NAME)).addText(title, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_TITLE)).addText(subtitle, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_SUBTITLE)).addText(autoSelectAllowed, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_AUTO_ALLOWED)).addIcon(icon, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_ICON));
            try {
                if (entry.hasDefaultIcon()) {
                    sliceBuilder.addInt(1, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_DEFAULT_ICON_RES_ID));
                }
            } catch (IllegalStateException e) {
            }
            if (entry.getIsAutoSelectAllowedFromOption()) {
                sliceBuilder.addInt(1, null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_AUTO_SELECT_FROM_OPTION));
            }
            if (lastUsedTime != null) {
                sliceBuilder.addLong(lastUsedTime.toEpochMilli(), null, CollectionsKt.listOf(CredentialEntry.SLICE_HINT_LAST_USED_TIME_MILLIS));
            }
            sliceBuilder.addAction(pendingIntent, new Slice.Builder(sliceBuilder).addHints(Collections.singletonList(CredentialEntry.SLICE_HINT_PENDING_INTENT)).build(), null);
        }

        @JvmStatic
        public static final PublicKeyCredentialEntry fromSlice(Slice slice) {
            Intrinsics.checkNotNullParameter(slice, "slice");
            Object beginGetCredentialOptionId = null;
            Iterable items = slice.getItems();
            Intrinsics.checkNotNullExpressionValue(items, "slice.items");
            Iterable $this$forEach$iv = items;
            CharSequence charSequence = null;
            CharSequence charSequence2 = null;
            boolean isDefaultIconPreferredAsSingleProvider = false;
            CharSequence charSequence3 = null;
            CharSequence charSequence4 = null;
            CharSequence charSequence5 = null;
            Icon icon = null;
            PendingIntent pendingIntent = null;
            Instant instant = null;
            boolean autoSelectAllowed = false;
            boolean autoSelectAllowedFromOption = false;
            boolean isDefaultIcon = false;
            for (Object element$iv : $this$forEach$iv) {
                SliceItem it = (SliceItem) element$iv;
                if (it.hasHint(CredentialEntry.SLICE_HINT_OPTION_ID)) {
                    beginGetCredentialOptionId = it.getText();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_DEDUPLICATION_ID)) {
                    charSequence = it.getText();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_IS_DEFAULT_ICON_PREFERRED)) {
                    CharSequence defaultIconValue = it.getText();
                    if (Intrinsics.areEqual(defaultIconValue, CredentialEntry.TRUE_STRING)) {
                        isDefaultIconPreferredAsSingleProvider = true;
                    }
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_AFFILIATED_DOMAIN)) {
                    charSequence2 = it.getText();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_TYPE_DISPLAY_NAME)) {
                    charSequence3 = it.getText();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_TITLE)) {
                    charSequence4 = it.getText();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_SUBTITLE)) {
                    charSequence5 = it.getText();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_ICON)) {
                    icon = it.getIcon();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_PENDING_INTENT)) {
                    pendingIntent = it.getAction();
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_LAST_USED_TIME_MILLIS)) {
                    instant = Instant.ofEpochMilli(it.getLong());
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_AUTO_ALLOWED)) {
                    CharSequence autoSelectValue = it.getText();
                    if (Intrinsics.areEqual(autoSelectValue, CredentialEntry.TRUE_STRING)) {
                        autoSelectAllowed = true;
                    }
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_AUTO_SELECT_FROM_OPTION)) {
                    autoSelectAllowedFromOption = true;
                } else if (it.hasHint(CredentialEntry.SLICE_HINT_DEFAULT_ICON_RES_ID)) {
                    isDefaultIcon = true;
                }
            }
            try {
                Intrinsics.checkNotNull(charSequence4);
                Intrinsics.checkNotNull(charSequence3);
                Intrinsics.checkNotNull(pendingIntent);
                Intrinsics.checkNotNull(icon);
                BeginGetPublicKeyCredentialOption.Companion companion = BeginGetPublicKeyCredentialOption.INSTANCE;
                Bundle bundle = new Bundle();
                Intrinsics.checkNotNull(beginGetCredentialOptionId);
                return new PublicKeyCredentialEntry(charSequence4, charSequence5, charSequence3, pendingIntent, icon, instant, autoSelectAllowed, companion.createFromEntrySlice$credentials_release(bundle, beginGetCredentialOptionId.toString()), isDefaultIconPreferredAsSingleProvider, charSequence, charSequence2, null, autoSelectAllowedFromOption, true, isDefaultIcon, 2048, null);
            } catch (Exception e) {
                Log.i(PublicKeyCredentialEntry.TAG, "fromSlice failed with: " + e.getMessage());
                return null;
            }
        }
    }

    /* compiled from: PublicKeyCredentialEntry.kt */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0007J\u0012\u0010\t\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0012\u0010\f\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\r\u001a\u00020\u0006H\u0007J\u001f\u0010\u000e\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0000¢\u0006\u0002\b\u0013J!\u0010\u0014\u001a\u00020\u0015*\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0000¢\u0006\u0002\b\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0017"}, d2 = {"Landroidx/credentials/provider/PublicKeyCredentialEntry$Companion;", "", "()V", "TAG", "", "fromCredentialEntry", "Landroidx/credentials/provider/PublicKeyCredentialEntry;", "credentialEntry", "Landroid/service/credentials/CredentialEntry;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "entry", "unmarshall", "bundle", "Landroid/os/Bundle;", "index", "", "unmarshall$credentials_release", "marshall", "", "marshall$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final Slice toSlice(PublicKeyCredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            if (Build.VERSION.SDK_INT >= 35) {
                return Api35Impl.toSlice(entry);
            }
            if (Build.VERSION.SDK_INT >= 28) {
                return Api28Impl.toSlice(entry);
            }
            return null;
        }

        @JvmStatic
        public final PublicKeyCredentialEntry fromSlice(Slice slice) {
            Intrinsics.checkNotNullParameter(slice, "slice");
            if (Build.VERSION.SDK_INT >= 35) {
                return Api35Impl.fromSlice(slice);
            }
            if (Build.VERSION.SDK_INT >= 28) {
                return Api28Impl.fromSlice(slice);
            }
            return null;
        }

        @JvmStatic
        public final PublicKeyCredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
            Intrinsics.checkNotNullParameter(credentialEntry, "credentialEntry");
            if (Build.VERSION.SDK_INT >= 34) {
                return Api34Impl.fromCredentialEntry(credentialEntry);
            }
            return null;
        }

        public final void marshall$credentials_release(PublicKeyCredentialEntry $this$marshall, Bundle bundle, int index) {
            Instant it;
            Intrinsics.checkNotNullParameter($this$marshall, "<this>");
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            CredentialEntry.INSTANCE.marshallCommonProperties$credentials_release($this$marshall, bundle, index);
            bundle.putParcelable(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_PENDING_INTENT_PREFIX + index, $this$marshall.getPendingIntent());
            bundle.putBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_PREFIX + index, $this$marshall.getIsAutoSelectAllowed());
            bundle.putBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_FROM_OPTION_PREFIX + index, $this$marshall.getIsAutoSelectAllowedFromOption());
            bundle.putBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_HAS_DEFAULT_ICON_PREFIX + index, $this$marshall.hasDefaultIcon());
            bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TITLE_PREFIX + index, $this$marshall.getUsername());
            bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TYPE_DISPLAY_NAME_PREFIX + index, $this$marshall.getTypeDisplayName());
            bundle.putParcelable(CredentialEntry.EXTRA_CREDENTIAL_TYPE_ICON_PREFIX + index, $this$marshall.getIcon());
            CharSequence it2 = $this$marshall.getDisplayName();
            if (it2 != null) {
                bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_SUBTITLE_PREFIX + index, it2);
            }
            if (Build.VERSION.SDK_INT >= 26 && (it = $this$marshall.getLastUsedTime()) != null) {
                bundle.putSerializable(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_LAST_USED_TIME_PREFIX + index, it);
            }
        }

        public final PublicKeyCredentialEntry unmarshall$credentials_release(Bundle bundle, int index) {
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            try {
                String optionId = bundle.getString(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_OPTION_ID_PREFIX + index);
                Intrinsics.checkNotNull(optionId);
                Bundle optionData = bundle.getBundle(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_OPTION_DATA_PREFIX + index);
                Intrinsics.checkNotNull(optionData);
                CharSequence entryGroupId = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_ENTRY_GROUP_ID_PREFIX + index);
                boolean isDefaultIconPreferredAsSingleProvider = bundle.getBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_DEFAULT_ICON_PREFERRED_AS_SINGLE_PROV_PREFIX + index, false);
                CharSequence affiliatedDomain = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_AFFILIATED_DOMAIN_PREFIX + index);
                Parcelable parcelable = bundle.getParcelable(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_PENDING_INTENT_PREFIX + index);
                Intrinsics.checkNotNull(parcelable);
                PendingIntent pendingIntent = (PendingIntent) parcelable;
                boolean isAutoSelectAllowed = bundle.getBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_PREFIX + index, false);
                boolean isAutoSelectAllowedFromOption = bundle.getBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_FROM_OPTION_PREFIX + index, false);
                boolean hasDefaultIcon = bundle.getBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_HAS_DEFAULT_ICON_PREFIX + index, false);
                CharSequence username = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TITLE_PREFIX + index);
                Intrinsics.checkNotNull(username);
                CharSequence typeDisplayName = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TYPE_DISPLAY_NAME_PREFIX + index);
                Intrinsics.checkNotNull(typeDisplayName);
                Parcelable parcelable2 = bundle.getParcelable(CredentialEntry.EXTRA_CREDENTIAL_TYPE_ICON_PREFIX + index);
                Intrinsics.checkNotNull(parcelable2);
                Icon icon = (Icon) parcelable2;
                CharSequence displayName = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_SUBTITLE_PREFIX + index);
                if (Build.VERSION.SDK_INT < 26) {
                    return new PublicKeyCredentialEntry(username, displayName, typeDisplayName, pendingIntent, icon, null, isAutoSelectAllowed, BeginGetPublicKeyCredentialOption.INSTANCE.createFrom$credentials_release(optionData, optionId), isDefaultIconPreferredAsSingleProvider, entryGroupId, affiliatedDomain, null, isAutoSelectAllowedFromOption, true, hasDefaultIcon, 2048, null);
                }
                Instant lastUsedTime = (Instant) bundle.getSerializable(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_LAST_USED_TIME_PREFIX + index);
                return new PublicKeyCredentialEntry(username, displayName, typeDisplayName, pendingIntent, icon, lastUsedTime, isAutoSelectAllowed, BeginGetPublicKeyCredentialOption.INSTANCE.createFrom$credentials_release(optionData, optionId), isDefaultIconPreferredAsSingleProvider, entryGroupId, affiliatedDomain, null, isAutoSelectAllowedFromOption, true, hasDefaultIcon, 2048, null);
            } catch (Exception e) {
                return null;
            }
        }
    }

    @JvmStatic
    public static final Slice toSlice(PublicKeyCredentialEntry entry) {
        return INSTANCE.toSlice(entry);
    }

    @JvmStatic
    public static final PublicKeyCredentialEntry fromSlice(Slice slice) {
        return INSTANCE.fromSlice(slice);
    }

    @JvmStatic
    public static final PublicKeyCredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
        return INSTANCE.fromCredentialEntry(credentialEntry);
    }

    /* compiled from: PublicKeyCredentialEntry.kt */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u0017\u0010\r\u001a\u00020\u00002\b\u0010\f\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\r\u0010\u000eJ\u0015\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0011\u0010\u0012J\u0019\u0010\u0015\u001a\u00020\u00002\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0007¢\u0006\u0004\b\u0015\u0010\u0016J\u0015\u0010\u0019\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u0019\u0010\u001aJ\u0017\u0010\u001d\u001a\u00020\u00002\b\u0010\u001c\u001a\u0004\u0018\u00010\u001b¢\u0006\u0004\b\u001d\u0010\u001eJ\u0015\u0010 \u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0017¢\u0006\u0004\b \u0010\u001aJ\r\u0010\"\u001a\u00020!¢\u0006\u0004\b\"\u0010#R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010$R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010%R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010&R\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010'R\u0018\u0010\f\u001a\u0004\u0018\u00010\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\f\u0010%R\u0018\u0010\u001c\u001a\u0004\u0018\u00010\u001b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001c\u0010(R\u0018\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0010\u0010)R\u0016\u0010\u0018\u001a\u00020\u00178\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0018\u0010*R\u0016\u0010\u001f\u001a\u00020\u00178\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001f\u0010*R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0014\u0010+¨\u0006,"}, d2 = {"Landroidx/credentials/provider/PublicKeyCredentialEntry$Builder;", "", "Landroid/content/Context;", "context", "", "username", "Landroid/app/PendingIntent;", BaseGmsClient.KEY_PENDING_INTENT, "Landroidx/credentials/provider/BeginGetPublicKeyCredentialOption;", "beginGetPublicKeyCredentialOption", "<init>", "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetPublicKeyCredentialOption;)V", "displayName", "setDisplayName", "(Ljava/lang/CharSequence;)Landroidx/credentials/provider/PublicKeyCredentialEntry$Builder;", "Landroid/graphics/drawable/Icon;", "icon", "setIcon", "(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/PublicKeyCredentialEntry$Builder;", "Landroidx/credentials/provider/BiometricPromptData;", "biometricPromptData", "setBiometricPromptData", "(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/PublicKeyCredentialEntry$Builder;", "", "autoSelectAllowed", "setAutoSelectAllowed", "(Z)Landroidx/credentials/provider/PublicKeyCredentialEntry$Builder;", "j$/time/Instant", "lastUsedTime", "setLastUsedTime", "(Lj$/time/Instant;)Landroidx/credentials/provider/PublicKeyCredentialEntry$Builder;", "isDefaultIconPreferredAsSingleProvider", "setDefaultIconPreferredAsSingleProvider", "Landroidx/credentials/provider/PublicKeyCredentialEntry;", "build", "()Landroidx/credentials/provider/PublicKeyCredentialEntry;", "Landroid/content/Context;", "Ljava/lang/CharSequence;", "Landroid/app/PendingIntent;", "Landroidx/credentials/provider/BeginGetPublicKeyCredentialOption;", "Lj$/time/Instant;", "Landroid/graphics/drawable/Icon;", "Z", "Landroidx/credentials/provider/BiometricPromptData;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Builder {
        private boolean autoSelectAllowed;
        private final BeginGetPublicKeyCredentialOption beginGetPublicKeyCredentialOption;
        private BiometricPromptData biometricPromptData;
        private final Context context;
        private CharSequence displayName;
        private Icon icon;
        private boolean isDefaultIconPreferredAsSingleProvider;
        private Instant lastUsedTime;
        private final PendingIntent pendingIntent;
        private final CharSequence username;

        public Builder(Context context, CharSequence username, PendingIntent pendingIntent, BeginGetPublicKeyCredentialOption beginGetPublicKeyCredentialOption) {
            Intrinsics.checkNotNullParameter(context, "context");
            Intrinsics.checkNotNullParameter(username, "username");
            Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
            Intrinsics.checkNotNullParameter(beginGetPublicKeyCredentialOption, "beginGetPublicKeyCredentialOption");
            this.context = context;
            this.username = username;
            this.pendingIntent = pendingIntent;
            this.beginGetPublicKeyCredentialOption = beginGetPublicKeyCredentialOption;
        }

        public final Builder setDisplayName(CharSequence displayName) {
            this.displayName = displayName;
            return this;
        }

        public final Builder setIcon(Icon icon) {
            Intrinsics.checkNotNullParameter(icon, "icon");
            this.icon = icon;
            return this;
        }

        public final Builder setBiometricPromptData(BiometricPromptData biometricPromptData) {
            this.biometricPromptData = biometricPromptData;
            return this;
        }

        public final Builder setAutoSelectAllowed(boolean autoSelectAllowed) {
            this.autoSelectAllowed = autoSelectAllowed;
            return this;
        }

        public final Builder setLastUsedTime(Instant lastUsedTime) {
            this.lastUsedTime = lastUsedTime;
            return this;
        }

        public final Builder setDefaultIconPreferredAsSingleProvider(boolean isDefaultIconPreferredAsSingleProvider) {
            this.isDefaultIconPreferredAsSingleProvider = isDefaultIconPreferredAsSingleProvider;
            return this;
        }

        public final PublicKeyCredentialEntry build() {
            if (this.icon == null) {
                this.icon = Icon.createWithResource(this.context, R.drawable.ic_passkey);
            }
            String typeDisplayName = this.context.getString(R.string.androidx_credentials_TYPE_PUBLIC_KEY_CREDENTIAL);
            Intrinsics.checkNotNullExpressionValue(typeDisplayName, "context.getString(R.stri…PE_PUBLIC_KEY_CREDENTIAL)");
            PendingIntent pendingIntent = this.pendingIntent;
            Icon icon = this.icon;
            Intrinsics.checkNotNull(icon);
            return new PublicKeyCredentialEntry(this.username, this.displayName, typeDisplayName, pendingIntent, icon, this.lastUsedTime, this.autoSelectAllowed, this.beginGetPublicKeyCredentialOption, this.isDefaultIconPreferredAsSingleProvider, null, null, this.biometricPromptData, false, false, false, 30208, null);
        }
    }
}
