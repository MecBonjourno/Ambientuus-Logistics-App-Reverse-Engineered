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
import androidx.credentials.R;
import androidx.credentials.provider.utils.CryptoObjectUtils;
import com.google.android.gms.common.internal.BaseGmsClient;
import j$.time.Instant;
import java.util.Collections;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: CustomCredentialEntry.kt */
@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u001f\b\u0007\u0018\u0000 62\u00020\u0001:\u0005789:6B¡\u0001\b\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\r\u001a\u00020\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\u0006\u0010\u0012\u001a\u00020\b\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\b\b\u0002\u0010\u0017\u001a\u00020\b\u0012\b\b\u0002\u0010\u0018\u001a\u00020\b\u0012\b\b\u0002\u0010\u0019\u001a\u00020\b¢\u0006\u0004\b\u001a\u0010\u001bBa\b\u0017\u0012\u0006\u0010\u001d\u001a\u00020\u001c\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\b\u0002\u0010\r\u001a\u00020\f\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u001a\u0010\u001eB\u0081\u0001\b\u0017\u0012\u0006\u0010\u001d\u001a\u00020\u001c\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\b\u0002\u0010\r\u001a\u00020\f\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0012\u001a\u00020\b\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015¢\u0006\u0004\b\u001a\u0010\u001fBu\b\u0016\u0012\u0006\u0010\u001d\u001a\u00020\u001c\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0011\u001a\u00020\u0010\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0004\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\b\b\u0002\u0010\r\u001a\u00020\f\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0012\u001a\u00020\b¢\u0006\u0004\b\u001a\u0010 R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010!\u001a\u0004\b\"\u0010#R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010$\u001a\u0004\b%\u0010&R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010'\u001a\u0004\b(\u0010)R\u0017\u0010\t\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b\t\u0010*\u001a\u0004\b\t\u0010+R\u0019\u0010\n\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\n\u0010$\u001a\u0004\b,\u0010&R\u0019\u0010\u000b\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u000b\u0010$\u001a\u0004\b-\u0010&R\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010.\u001a\u0004\b/\u00100R\u0019\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006¢\u0006\f\n\u0004\b\u000f\u00101\u001a\u0004\b2\u00103R\u0016\u0010\u0018\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0018\u0010*R\u0016\u0010\u0019\u001a\u00020\b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0019\u0010*R\u0017\u00104\u001a\u00020\b8\u0006¢\u0006\f\n\u0004\b4\u0010*\u001a\u0004\b4\u0010+R\u0011\u00105\u001a\u00020\b8G¢\u0006\u0006\u001a\u0004\b5\u0010+¨\u0006;"}, d2 = {"Landroidx/credentials/provider/CustomCredentialEntry;", "Landroidx/credentials/provider/CredentialEntry;", "", "type", "", "title", "Landroid/app/PendingIntent;", BaseGmsClient.KEY_PENDING_INTENT, "", "isAutoSelectAllowed", "subtitle", "typeDisplayName", "Landroid/graphics/drawable/Icon;", "icon", "j$/time/Instant", "lastUsedTime", "Landroidx/credentials/provider/BeginGetCredentialOption;", "beginGetCredentialOption", "isDefaultIconPreferredAsSingleProvider", "entryGroupId", "affiliatedDomain", "Landroidx/credentials/provider/BiometricPromptData;", "biometricPromptData", "autoSelectAllowedFromOption", "isCreatedFromSlice", "isDefaultIconFromSlice", "<init>", "(Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/PendingIntent;ZLjava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/graphics/drawable/Icon;Lj$/time/Instant;Landroidx/credentials/provider/BeginGetCredentialOption;ZLjava/lang/CharSequence;Ljava/lang/CharSequence;Landroidx/credentials/provider/BiometricPromptData;ZZZ)V", "Landroid/content/Context;", "context", "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetCredentialOption;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;Z)V", "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetCredentialOption;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;ZLjava/lang/CharSequence;ZLandroidx/credentials/provider/BiometricPromptData;)V", "(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetCredentialOption;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Lj$/time/Instant;Landroid/graphics/drawable/Icon;ZLjava/lang/CharSequence;Z)V", "Ljava/lang/String;", "getType", "()Ljava/lang/String;", "Ljava/lang/CharSequence;", "getTitle", "()Ljava/lang/CharSequence;", "Landroid/app/PendingIntent;", "getPendingIntent", "()Landroid/app/PendingIntent;", "Z", "()Z", "getSubtitle", "getTypeDisplayName", "Landroid/graphics/drawable/Icon;", "getIcon", "()Landroid/graphics/drawable/Icon;", "Lj$/time/Instant;", "getLastUsedTime", "()Lj$/time/Instant;", "isAutoSelectAllowedFromOption", "hasDefaultIcon", "Companion", "Api28Impl", "Api34Impl", "Api35Impl", "Builder", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* loaded from: classes.dex */
public final class CustomCredentialEntry extends CredentialEntry {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "CredentialEntry";
    private final Icon icon;
    private final boolean isAutoSelectAllowed;
    private final boolean isAutoSelectAllowedFromOption;
    private boolean isCreatedFromSlice;
    private boolean isDefaultIconFromSlice;
    private final Instant lastUsedTime;
    private final PendingIntent pendingIntent;
    private final CharSequence subtitle;
    private final CharSequence title;
    private final String type;
    private final CharSequence typeDisplayName;

    public /* synthetic */ CustomCredentialEntry(String str, CharSequence charSequence, PendingIntent pendingIntent, boolean z, CharSequence charSequence2, CharSequence charSequence3, Icon icon, Instant instant, BeginGetCredentialOption beginGetCredentialOption, boolean z2, CharSequence charSequence4, CharSequence charSequence5, BiometricPromptData biometricPromptData, boolean z3, boolean z4, boolean z5, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, charSequence, pendingIntent, z, charSequence2, charSequence3, icon, instant, beginGetCredentialOption, z2, (i & 1024) != 0 ? charSequence : charSequence4, (i & 2048) != 0 ? null : charSequence5, (i & 4096) != 0 ? null : biometricPromptData, (i & 8192) != 0 ? CredentialOption.INSTANCE.extractAutoSelectValue$credentials_release(beginGetCredentialOption.getCandidateQueryData()) : z3, (i & 16384) != 0 ? false : z4, (i & 32768) != 0 ? false : z5);
    }

    @Override // androidx.credentials.provider.CredentialEntry
    public String getType() {
        return this.type;
    }

    public final CharSequence getTitle() {
        return this.title;
    }

    public final PendingIntent getPendingIntent() {
        return this.pendingIntent;
    }

    /* renamed from: isAutoSelectAllowed, reason: from getter */
    public final boolean getIsAutoSelectAllowed() {
        return this.isAutoSelectAllowed;
    }

    public final CharSequence getSubtitle() {
        return this.subtitle;
    }

    public final CharSequence getTypeDisplayName() {
        return this.typeDisplayName;
    }

    public final Icon getIcon() {
        return this.icon;
    }

    public final Instant getLastUsedTime() {
        return this.lastUsedTime;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CustomCredentialEntry(String type, CharSequence title, PendingIntent pendingIntent, boolean isAutoSelectAllowed, CharSequence subtitle, CharSequence typeDisplayName, Icon icon, Instant lastUsedTime, BeginGetCredentialOption beginGetCredentialOption, boolean isDefaultIconPreferredAsSingleProvider, CharSequence entryGroupId, CharSequence affiliatedDomain, BiometricPromptData biometricPromptData, boolean autoSelectAllowedFromOption, boolean isCreatedFromSlice, boolean isDefaultIconFromSlice) {
        super(type, beginGetCredentialOption, entryGroupId == null ? title : entryGroupId, isDefaultIconPreferredAsSingleProvider, affiliatedDomain, biometricPromptData);
        Intrinsics.checkNotNullParameter(type, "type");
        Intrinsics.checkNotNullParameter(title, "title");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
        Intrinsics.checkNotNullParameter(icon, "icon");
        Intrinsics.checkNotNullParameter(beginGetCredentialOption, "beginGetCredentialOption");
        this.type = type;
        this.title = title;
        this.pendingIntent = pendingIntent;
        this.isAutoSelectAllowed = isAutoSelectAllowed;
        this.subtitle = subtitle;
        this.typeDisplayName = typeDisplayName;
        this.icon = icon;
        this.lastUsedTime = lastUsedTime;
        this.isCreatedFromSlice = isCreatedFromSlice;
        this.isDefaultIconFromSlice = isDefaultIconFromSlice;
        this.isAutoSelectAllowedFromOption = autoSelectAllowedFromOption;
        if (!(getType().length() > 0)) {
            throw new IllegalArgumentException("type must not be empty".toString());
        }
        if (!(this.title.length() > 0)) {
            throw new IllegalArgumentException("title must not be empty".toString());
        }
    }

    /* renamed from: isAutoSelectAllowedFromOption, reason: from getter */
    public final boolean getIsAutoSelectAllowedFromOption() {
        return this.isAutoSelectAllowedFromOption;
    }

    public final boolean hasDefaultIcon() {
        if (Build.VERSION.SDK_INT >= 28) {
            return Api28Impl.isDefaultIcon(this);
        }
        return false;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ CustomCredentialEntry(android.content.Context r2, java.lang.CharSequence r3, android.app.PendingIntent r4, androidx.credentials.provider.BeginGetCredentialOption r5, java.lang.CharSequence r6, java.lang.CharSequence r7, j$.time.Instant r8, android.graphics.drawable.Icon r9, boolean r10, int r11, kotlin.jvm.internal.DefaultConstructorMarker r12) {
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
            if (r12 == 0) goto L10
            r8 = r0
        L10:
            r12 = r11 & 128(0x80, float:1.8E-43)
            if (r12 == 0) goto L1f
            int r9 = androidx.credentials.R.drawable.ic_other_sign_in
            android.graphics.drawable.Icon r9 = android.graphics.drawable.Icon.createWithResource(r2, r9)
            java.lang.String r12 = "createWithResource(conte…rawable.ic_other_sign_in)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r9, r12)
        L1f:
            r11 = r11 & 256(0x100, float:3.59E-43)
            if (r11 == 0) goto L26
            r10 = 0
            r11 = r10
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
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.CustomCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetCredentialOption, java.lang.CharSequence, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Use the constructor that allows setting all parameters.", replaceWith = @ReplaceWith(expression = "CustomCredentialEntry(context, title, pendingIntent,beginGetCredentialOption, subtitle, typeDisplayName, lastUsedTime, icon, isAutoSelectAllowed, entryGroupId, isDefaultIconPreferredAsSingleProvider,biometricPromptData)", imports = {}))
    public /* synthetic */ CustomCredentialEntry(Context context, CharSequence title, PendingIntent pendingIntent, BeginGetCredentialOption beginGetCredentialOption, CharSequence subtitle, CharSequence typeDisplayName, Instant lastUsedTime, Icon icon, boolean isAutoSelectAllowed) {
        this(beginGetCredentialOption.getType(), title, pendingIntent, isAutoSelectAllowed, subtitle, typeDisplayName, icon, lastUsedTime, beginGetCredentialOption, false, null, null, null, false, false, false, 64512, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(title, "title");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
        Intrinsics.checkNotNullParameter(beginGetCredentialOption, "beginGetCredentialOption");
        Intrinsics.checkNotNullParameter(icon, "icon");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ CustomCredentialEntry(android.content.Context r17, java.lang.CharSequence r18, android.app.PendingIntent r19, androidx.credentials.provider.BeginGetCredentialOption r20, java.lang.CharSequence r21, java.lang.CharSequence r22, j$.time.Instant r23, android.graphics.drawable.Icon r24, boolean r25, java.lang.CharSequence r26, boolean r27, androidx.credentials.provider.BiometricPromptData r28, int r29, kotlin.jvm.internal.DefaultConstructorMarker r30) {
        /*
            r16 = this;
            r0 = r29
            r1 = r0 & 16
            r2 = 0
            if (r1 == 0) goto L9
            r8 = r2
            goto Lb
        L9:
            r8 = r21
        Lb:
            r1 = r0 & 32
            if (r1 == 0) goto L11
            r9 = r2
            goto L13
        L11:
            r9 = r22
        L13:
            r1 = r0 & 64
            if (r1 == 0) goto L19
            r10 = r2
            goto L1b
        L19:
            r10 = r23
        L1b:
            r1 = r0 & 128(0x80, float:1.8E-43)
            if (r1 == 0) goto L2e
            int r1 = androidx.credentials.R.drawable.ic_other_sign_in
            r4 = r17
            android.graphics.drawable.Icon r1 = android.graphics.drawable.Icon.createWithResource(r4, r1)
            java.lang.String r3 = "createWithResource(conte…rawable.ic_other_sign_in)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r1, r3)
            r11 = r1
            goto L32
        L2e:
            r4 = r17
            r11 = r24
        L32:
            r1 = r0 & 256(0x100, float:3.59E-43)
            r3 = 0
            if (r1 == 0) goto L39
            r12 = r3
            goto L3b
        L39:
            r12 = r25
        L3b:
            r1 = r0 & 512(0x200, float:7.17E-43)
            if (r1 == 0) goto L42
            r13 = r18
            goto L44
        L42:
            r13 = r26
        L44:
            r1 = r0 & 1024(0x400, float:1.435E-42)
            if (r1 == 0) goto L4a
            r14 = r3
            goto L4c
        L4a:
            r14 = r27
        L4c:
            r0 = r0 & 2048(0x800, float:2.87E-42)
            if (r0 == 0) goto L52
            r15 = r2
            goto L54
        L52:
            r15 = r28
        L54:
            r3 = r16
            r5 = r18
            r6 = r19
            r7 = r20
            r3.<init>(r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.CustomCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetCredentialOption, java.lang.CharSequence, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, java.lang.CharSequence, boolean, androidx.credentials.provider.BiometricPromptData, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public CustomCredentialEntry(Context context, CharSequence title, PendingIntent pendingIntent, BeginGetCredentialOption beginGetCredentialOption, CharSequence subtitle, CharSequence typeDisplayName, Instant lastUsedTime, Icon icon, boolean isAutoSelectAllowed, CharSequence entryGroupId, boolean isDefaultIconPreferredAsSingleProvider, BiometricPromptData biometricPromptData) {
        this(beginGetCredentialOption.getType(), title, pendingIntent, isAutoSelectAllowed, subtitle, typeDisplayName, icon, lastUsedTime, beginGetCredentialOption, isDefaultIconPreferredAsSingleProvider, entryGroupId.length() == 0 ? title : entryGroupId, null, biometricPromptData, false, false, false, 59392, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(title, "title");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
        Intrinsics.checkNotNullParameter(beginGetCredentialOption, "beginGetCredentialOption");
        Intrinsics.checkNotNullParameter(icon, "icon");
        Intrinsics.checkNotNullParameter(entryGroupId, "entryGroupId");
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ CustomCredentialEntry(android.content.Context r2, java.lang.CharSequence r3, android.app.PendingIntent r4, androidx.credentials.provider.BeginGetCredentialOption r5, java.lang.CharSequence r6, java.lang.CharSequence r7, j$.time.Instant r8, android.graphics.drawable.Icon r9, boolean r10, java.lang.CharSequence r11, boolean r12, int r13, kotlin.jvm.internal.DefaultConstructorMarker r14) {
        /*
            r1 = this;
            r14 = r13 & 16
            r0 = 0
            if (r14 == 0) goto L6
            r6 = r0
        L6:
            r14 = r13 & 32
            if (r14 == 0) goto Lb
            r7 = r0
        Lb:
            r14 = r13 & 64
            if (r14 == 0) goto L10
            r8 = r0
        L10:
            r14 = r13 & 128(0x80, float:1.8E-43)
            if (r14 == 0) goto L1f
            int r9 = androidx.credentials.R.drawable.ic_other_sign_in
            android.graphics.drawable.Icon r9 = android.graphics.drawable.Icon.createWithResource(r2, r9)
            java.lang.String r14 = "createWithResource(conte…rawable.ic_other_sign_in)"
            kotlin.jvm.internal.Intrinsics.checkNotNullExpressionValue(r9, r14)
        L1f:
            r14 = r13 & 256(0x100, float:3.59E-43)
            r0 = 0
            if (r14 == 0) goto L25
            r10 = r0
        L25:
            r14 = r13 & 512(0x200, float:7.17E-43)
            if (r14 == 0) goto L2a
            r11 = r3
        L2a:
            r13 = r13 & 1024(0x400, float:1.435E-42)
            if (r13 == 0) goto L30
            r13 = r0
            goto L31
        L30:
            r13 = r12
        L31:
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
            r2 = r1
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.CustomCredentialEntry.<init>(android.content.Context, java.lang.CharSequence, android.app.PendingIntent, androidx.credentials.provider.BeginGetCredentialOption, java.lang.CharSequence, java.lang.CharSequence, j$.time.Instant, android.graphics.drawable.Icon, boolean, java.lang.CharSequence, boolean, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public CustomCredentialEntry(Context context, CharSequence title, PendingIntent pendingIntent, BeginGetCredentialOption beginGetCredentialOption, CharSequence subtitle, CharSequence typeDisplayName, Instant lastUsedTime, Icon icon, boolean isAutoSelectAllowed, CharSequence entryGroupId, boolean isDefaultIconPreferredAsSingleProvider) {
        this(beginGetCredentialOption.getType(), title, pendingIntent, isAutoSelectAllowed, subtitle, typeDisplayName, icon, lastUsedTime, beginGetCredentialOption, isDefaultIconPreferredAsSingleProvider, entryGroupId.length() == 0 ? title : entryGroupId, null, null, false, false, false, 63488, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(title, "title");
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
        Intrinsics.checkNotNullParameter(beginGetCredentialOption, "beginGetCredentialOption");
        Intrinsics.checkNotNullParameter(icon, "icon");
        Intrinsics.checkNotNullParameter(entryGroupId, "entryGroupId");
    }

    /* compiled from: CustomCredentialEntry.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u0007"}, d2 = {"Landroidx/credentials/provider/CustomCredentialEntry$Api34Impl;", "", "()V", "fromCredentialEntry", "Landroidx/credentials/provider/CustomCredentialEntry;", "credentialEntry", "Landroid/service/credentials/CredentialEntry;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api34Impl {
        public static final Api34Impl INSTANCE = new Api34Impl();

        private Api34Impl() {
        }

        @JvmStatic
        public static final CustomCredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
            Intrinsics.checkNotNullParameter(credentialEntry, "credentialEntry");
            Slice slice = credentialEntry.getSlice();
            Intrinsics.checkNotNullExpressionValue(slice, "credentialEntry.slice");
            return CustomCredentialEntry.INSTANCE.fromSlice(slice);
        }
    }

    /* compiled from: CustomCredentialEntry.kt */
    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u0012\u0010\t\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0010\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\r"}, d2 = {"Landroidx/credentials/provider/CustomCredentialEntry$Api35Impl;", "", "()V", "addToSlice", "", "entry", "Landroidx/credentials/provider/CustomCredentialEntry;", "sliceBuilder", "Landroid/app/slice/Slice$Builder;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api35Impl {
        public static final Api35Impl INSTANCE = new Api35Impl();

        private Api35Impl() {
        }

        @JvmStatic
        public static final Slice toSlice(CustomCredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            String type = entry.getType();
            Slice.Builder sliceBuilder = new Slice.Builder(Uri.EMPTY, new SliceSpec(type, 1));
            Api28Impl.INSTANCE.addToSlice(entry, sliceBuilder);
            INSTANCE.addToSlice(entry, sliceBuilder);
            Slice build = sliceBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "sliceBuilder.build()");
            return build;
        }

        public final void addToSlice(CustomCredentialEntry entry, Slice.Builder sliceBuilder) {
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
        public static final CustomCredentialEntry fromSlice(Slice slice) {
            BiometricPromptData biometricPromptData;
            Intrinsics.checkNotNullParameter(slice, "slice");
            CustomCredentialEntry customCredentialEntry = Api28Impl.fromSlice(slice);
            if (customCredentialEntry == null) {
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
                String type = customCredentialEntry.getType();
                CharSequence title = customCredentialEntry.getTitle();
                PendingIntent pendingIntent = customCredentialEntry.getPendingIntent();
                boolean isAutoSelectAllowed = customCredentialEntry.getIsAutoSelectAllowed();
                CharSequence subtitle = customCredentialEntry.getSubtitle();
                CharSequence typeDisplayName = customCredentialEntry.getTypeDisplayName();
                Icon icon = customCredentialEntry.getIcon();
                Instant lastUsedTime = customCredentialEntry.getLastUsedTime();
                BeginGetCredentialOption beginGetCredentialOption = customCredentialEntry.getBeginGetCredentialOption();
                boolean isDefaultIconPreferredAsSingleProvider = customCredentialEntry.getIsDefaultIconPreferredAsSingleProvider();
                CharSequence entryGroupId = customCredentialEntry.getEntryGroupId();
                CharSequence affiliatedDomain = customCredentialEntry.getAffiliatedDomain();
                boolean isAutoSelectAllowedFromOption = customCredentialEntry.getIsAutoSelectAllowedFromOption();
                boolean z = customCredentialEntry.isDefaultIconFromSlice;
                if (bundle != null) {
                    biometricPromptData = BiometricPromptData.INSTANCE.fromBundle(bundle);
                } else {
                    biometricPromptData = null;
                }
                return new CustomCredentialEntry(type, title, pendingIntent, isAutoSelectAllowed, subtitle, typeDisplayName, icon, lastUsedTime, beginGetCredentialOption, isDefaultIconPreferredAsSingleProvider, entryGroupId, affiliatedDomain, biometricPromptData, isAutoSelectAllowedFromOption, true, z);
            } catch (Exception e) {
                Log.i(CustomCredentialEntry.TAG, "fromSlice failed with: " + e.getMessage());
                return null;
            }
        }
    }

    /* compiled from: CustomCredentialEntry.kt */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bJ\u0012\u0010\t\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0010\u0010\f\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007J\u0010\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u000f"}, d2 = {"Landroidx/credentials/provider/CustomCredentialEntry$Api28Impl;", "", "()V", "addToSlice", "", "entry", "Landroidx/credentials/provider/CustomCredentialEntry;", "sliceBuilder", "Landroid/app/slice/Slice$Builder;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "isDefaultIcon", "", "toSlice", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api28Impl {
        public static final Api28Impl INSTANCE = new Api28Impl();

        private Api28Impl() {
        }

        @JvmStatic
        public static final boolean isDefaultIcon(CustomCredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            if (entry.isCreatedFromSlice) {
                return entry.isDefaultIconFromSlice;
            }
            return entry.getIcon().getType() == 2 && entry.getIcon().getResId() == R.drawable.ic_other_sign_in;
        }

        @JvmStatic
        public static final Slice toSlice(CustomCredentialEntry entry) {
            Intrinsics.checkNotNullParameter(entry, "entry");
            String type = entry.getType();
            Slice.Builder sliceBuilder = new Slice.Builder(Uri.EMPTY, new SliceSpec(type, 1));
            INSTANCE.addToSlice(entry, sliceBuilder);
            Slice build = sliceBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "sliceBuilder.build()");
            return build;
        }

        public final void addToSlice(CustomCredentialEntry entry, Slice.Builder sliceBuilder) {
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
            CharSequence title = entry.getTitle();
            CharSequence subtitle = entry.getSubtitle();
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

        /* JADX WARN: Incorrect condition in loop: B:3:0x0054 */
        @kotlin.jvm.JvmStatic
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public static final androidx.credentials.provider.CustomCredentialEntry fromSlice(android.app.slice.Slice r23) {
            /*
                Method dump skipped, instructions count: 437
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.provider.CustomCredentialEntry.Api28Impl.fromSlice(android.app.slice.Slice):androidx.credentials.provider.CustomCredentialEntry");
        }
    }

    /* compiled from: CustomCredentialEntry.kt */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0007J\u0012\u0010\t\u001a\u0004\u0018\u00010\u00062\u0006\u0010\n\u001a\u00020\u000bH\u0007J\u0012\u0010\f\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\r\u001a\u00020\u0006H\u0007J'\u0010\u000e\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0004H\u0000¢\u0006\u0002\b\u0014J!\u0010\u0015\u001a\u00020\u0016*\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0000¢\u0006\u0002\b\u0017R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Landroidx/credentials/provider/CustomCredentialEntry$Companion;", "", "()V", "TAG", "", "fromCredentialEntry", "Landroidx/credentials/provider/CustomCredentialEntry;", "credentialEntry", "Landroid/service/credentials/CredentialEntry;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "entry", "unmarshall", "bundle", "Landroid/os/Bundle;", "index", "", "type", "unmarshall$credentials_release", "marshall", "", "marshall$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final Slice toSlice(CustomCredentialEntry entry) {
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
        public final CustomCredentialEntry fromSlice(Slice slice) {
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
        public final CustomCredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
            Intrinsics.checkNotNullParameter(credentialEntry, "credentialEntry");
            if (Build.VERSION.SDK_INT >= 34) {
                return Api34Impl.fromCredentialEntry(credentialEntry);
            }
            return null;
        }

        public final void marshall$credentials_release(CustomCredentialEntry $this$marshall, Bundle bundle, int index) {
            Instant it;
            Intrinsics.checkNotNullParameter($this$marshall, "<this>");
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            CredentialEntry.INSTANCE.marshallCommonProperties$credentials_release($this$marshall, bundle, index);
            bundle.putParcelable(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_PENDING_INTENT_PREFIX + index, $this$marshall.getPendingIntent());
            bundle.putBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_PREFIX + index, $this$marshall.getIsAutoSelectAllowed());
            bundle.putBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_IS_AUTO_SELECT_ALLOWED_FROM_OPTION_PREFIX + index, $this$marshall.getIsAutoSelectAllowedFromOption());
            bundle.putBoolean(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_HAS_DEFAULT_ICON_PREFIX + index, $this$marshall.hasDefaultIcon());
            bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TITLE_PREFIX + index, $this$marshall.getTitle());
            bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TYPE_DISPLAY_NAME_PREFIX + index, $this$marshall.getTypeDisplayName());
            bundle.putParcelable(CredentialEntry.EXTRA_CREDENTIAL_TYPE_ICON_PREFIX + index, $this$marshall.getIcon());
            CharSequence it2 = $this$marshall.getSubtitle();
            if (it2 != null) {
                bundle.putCharSequence(CredentialEntry.EXTRA_CREDENTIAL_SUBTITLE_PREFIX + index, it2);
            }
            if (Build.VERSION.SDK_INT >= 26 && (it = $this$marshall.getLastUsedTime()) != null) {
                bundle.putSerializable(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_LAST_USED_TIME_PREFIX + index, it);
            }
        }

        public final CustomCredentialEntry unmarshall$credentials_release(Bundle bundle, int index, String type) {
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            Intrinsics.checkNotNullParameter(type, "type");
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
                CharSequence title = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TITLE_PREFIX + index);
                Intrinsics.checkNotNull(title);
                CharSequence typeDisplayName = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_TYPE_DISPLAY_NAME_PREFIX + index);
                Parcelable parcelable2 = bundle.getParcelable(CredentialEntry.EXTRA_CREDENTIAL_TYPE_ICON_PREFIX + index);
                Intrinsics.checkNotNull(parcelable2);
                Icon icon = (Icon) parcelable2;
                CharSequence subtitle = bundle.getCharSequence(CredentialEntry.EXTRA_CREDENTIAL_SUBTITLE_PREFIX + index);
                if (Build.VERSION.SDK_INT >= 26) {
                    Instant lastUsedTime = (Instant) bundle.getSerializable(CredentialEntry.EXTRA_CREDENTIAL_ENTRY_LAST_USED_TIME_PREFIX + index);
                    return new CustomCredentialEntry(type, title, pendingIntent, isAutoSelectAllowed, subtitle, typeDisplayName, icon, lastUsedTime, new BeginGetCustomCredentialOption(optionId, type, optionData), isDefaultIconPreferredAsSingleProvider, entryGroupId, affiliatedDomain, null, isAutoSelectAllowedFromOption, true, hasDefaultIcon);
                }
                return new CustomCredentialEntry(type, title, pendingIntent, isAutoSelectAllowed, subtitle, typeDisplayName, icon, null, new BeginGetCustomCredentialOption(optionId, type, optionData), isDefaultIconPreferredAsSingleProvider, entryGroupId, affiliatedDomain, null, isAutoSelectAllowedFromOption, true, hasDefaultIcon);
            } catch (Exception e) {
                return null;
            }
        }
    }

    @JvmStatic
    public static final Slice toSlice(CustomCredentialEntry entry) {
        return INSTANCE.toSlice(entry);
    }

    @JvmStatic
    public static final CustomCredentialEntry fromSlice(Slice slice) {
        return INSTANCE.fromSlice(slice);
    }

    @JvmStatic
    public static final CustomCredentialEntry fromCredentialEntry(android.service.credentials.CredentialEntry credentialEntry) {
        return INSTANCE.fromCredentialEntry(credentialEntry);
    }

    /* compiled from: CustomCredentialEntry.kt */
    @Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\f\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u0017\u0010\u000f\u001a\u00020\u00002\b\u0010\u000e\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u000f\u0010\u0010J\u0017\u0010\u0012\u001a\u00020\u00002\b\u0010\u0011\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b\u0012\u0010\u0010J\u0015\u0010\u0015\u001a\u00020\u00002\u0006\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\u0015\u0010\u0016J\u0019\u0010\u0019\u001a\u00020\u00002\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017H\u0007¢\u0006\u0004\b\u0019\u0010\u001aJ\u0015\u0010\u001d\u001a\u00020\u00002\u0006\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b\u001d\u0010\u001eJ\u0015\u0010 \u001a\u00020\u00002\u0006\u0010\u001f\u001a\u00020\u0006¢\u0006\u0004\b \u0010\u0010J\u0017\u0010#\u001a\u00020\u00002\b\u0010\"\u001a\u0004\u0018\u00010!¢\u0006\u0004\b#\u0010$J\u0015\u0010&\u001a\u00020\u00002\u0006\u0010%\u001a\u00020\u001b¢\u0006\u0004\b&\u0010\u001eJ\r\u0010(\u001a\u00020'¢\u0006\u0004\b(\u0010)R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010*R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010+R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010,R\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010-R\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010.R\u0018\u0010\u000e\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u000e\u0010,R\u0018\u0010\"\u001a\u0004\u0018\u00010!8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\"\u0010/R\u0018\u0010\u0011\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0011\u0010,R\u0018\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0014\u00100R\u0016\u0010\u001c\u001a\u00020\u001b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001c\u00101R\u0016\u0010\u001f\u001a\u00020\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u001f\u0010,R\u0016\u0010%\u001a\u00020\u001b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b%\u00101R\u0018\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0018\u00102¨\u00063"}, d2 = {"Landroidx/credentials/provider/CustomCredentialEntry$Builder;", "", "Landroid/content/Context;", "context", "", "type", "", "title", "Landroid/app/PendingIntent;", BaseGmsClient.KEY_PENDING_INTENT, "Landroidx/credentials/provider/BeginGetCredentialOption;", "beginGetCredentialOption", "<init>", "(Landroid/content/Context;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/PendingIntent;Landroidx/credentials/provider/BeginGetCredentialOption;)V", "subtitle", "setSubtitle", "(Ljava/lang/CharSequence;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;", "typeDisplayName", "setTypeDisplayName", "Landroid/graphics/drawable/Icon;", "icon", "setIcon", "(Landroid/graphics/drawable/Icon;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;", "Landroidx/credentials/provider/BiometricPromptData;", "biometricPromptData", "setBiometricPromptData", "(Landroidx/credentials/provider/BiometricPromptData;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;", "", "autoSelectAllowed", "setAutoSelectAllowed", "(Z)Landroidx/credentials/provider/CustomCredentialEntry$Builder;", "entryGroupId", "setEntryGroupId", "j$/time/Instant", "lastUsedTime", "setLastUsedTime", "(Lj$/time/Instant;)Landroidx/credentials/provider/CustomCredentialEntry$Builder;", "isDefaultIconPreferredAsSingleProvider", "setDefaultIconPreferredAsSingleProvider", "Landroidx/credentials/provider/CustomCredentialEntry;", "build", "()Landroidx/credentials/provider/CustomCredentialEntry;", "Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/CharSequence;", "Landroid/app/PendingIntent;", "Landroidx/credentials/provider/BeginGetCredentialOption;", "Lj$/time/Instant;", "Landroid/graphics/drawable/Icon;", "Z", "Landroidx/credentials/provider/BiometricPromptData;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Builder {
        private boolean autoSelectAllowed;
        private final BeginGetCredentialOption beginGetCredentialOption;
        private BiometricPromptData biometricPromptData;
        private final Context context;
        private CharSequence entryGroupId;
        private Icon icon;
        private boolean isDefaultIconPreferredAsSingleProvider;
        private Instant lastUsedTime;
        private final PendingIntent pendingIntent;
        private CharSequence subtitle;
        private final CharSequence title;
        private final String type;
        private CharSequence typeDisplayName;

        public Builder(Context context, String type, CharSequence title, PendingIntent pendingIntent, BeginGetCredentialOption beginGetCredentialOption) {
            Intrinsics.checkNotNullParameter(context, "context");
            Intrinsics.checkNotNullParameter(type, "type");
            Intrinsics.checkNotNullParameter(title, "title");
            Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
            Intrinsics.checkNotNullParameter(beginGetCredentialOption, "beginGetCredentialOption");
            this.context = context;
            this.type = type;
            this.title = title;
            this.pendingIntent = pendingIntent;
            this.beginGetCredentialOption = beginGetCredentialOption;
            this.entryGroupId = this.title;
        }

        public final Builder setSubtitle(CharSequence subtitle) {
            this.subtitle = subtitle;
            return this;
        }

        public final Builder setTypeDisplayName(CharSequence typeDisplayName) {
            this.typeDisplayName = typeDisplayName;
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

        public final Builder setEntryGroupId(CharSequence entryGroupId) {
            Intrinsics.checkNotNullParameter(entryGroupId, "entryGroupId");
            if (!(entryGroupId.length() > 0)) {
                throw new IllegalArgumentException("entryGroupId must not be empty".toString());
            }
            this.entryGroupId = entryGroupId;
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

        public final CustomCredentialEntry build() {
            if (this.icon == null) {
                this.icon = Icon.createWithResource(this.context, R.drawable.ic_other_sign_in);
            }
            String str = this.type;
            CharSequence charSequence = this.title;
            PendingIntent pendingIntent = this.pendingIntent;
            boolean z = this.autoSelectAllowed;
            CharSequence charSequence2 = this.subtitle;
            CharSequence charSequence3 = this.typeDisplayName;
            Icon icon = this.icon;
            Intrinsics.checkNotNull(icon);
            return new CustomCredentialEntry(str, charSequence, pendingIntent, z, charSequence2, charSequence3, icon, this.lastUsedTime, this.beginGetCredentialOption, this.isDefaultIconPreferredAsSingleProvider, this.entryGroupId, null, this.biometricPromptData, false, false, false, 59392, null);
        }
    }
}
