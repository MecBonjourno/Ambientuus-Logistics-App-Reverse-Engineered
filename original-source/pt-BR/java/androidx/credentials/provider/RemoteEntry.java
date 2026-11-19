package androidx.credentials.provider;

import android.app.PendingIntent;
import android.app.slice.Slice;
import android.app.slice.SliceItem;
import android.app.slice.SliceSpec;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.google.android.gms.common.internal.BaseGmsClient;
import java.util.Collections;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: RemoteEntry.kt */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\u0018\u0000 \u000e2\u00020\u0001:\u0003\f\r\u000eB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0013\u0010\u0007\u001a\u00020\b2\b\u0010\t\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\b\u0010\n\u001a\u00020\u000bH\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u000f"}, d2 = {"Landroidx/credentials/provider/RemoteEntry;", "", BaseGmsClient.KEY_PENDING_INTENT, "Landroid/app/PendingIntent;", "(Landroid/app/PendingIntent;)V", "getPendingIntent", "()Landroid/app/PendingIntent;", "equals", "", "other", "hashCode", "", "Api34Impl", "Builder", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class RemoteEntry {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    private static final String EXTRA_REMOTE_ENTRY_PENDING_INTENT = "androidx.credentials.provider.extra.REMOTE_ENTRY_PENDING_INTENT";
    private static final int REVISION_ID = 1;
    private static final String SLICE_HINT_PENDING_INTENT = "androidx.credentials.provider.remoteEntry.SLICE_HINT_PENDING_INTENT";
    private static final String SLICE_SPEC_TYPE = "RemoteEntry";
    private static final String TAG = "RemoteEntry";
    private final PendingIntent pendingIntent;

    public RemoteEntry(PendingIntent pendingIntent) {
        Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
        this.pendingIntent = pendingIntent;
    }

    public final PendingIntent getPendingIntent() {
        return this.pendingIntent;
    }

    /* compiled from: RemoteEntry.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0006\u0010\u0005\u001a\u00020\u0006R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0007"}, d2 = {"Landroidx/credentials/provider/RemoteEntry$Builder;", "", BaseGmsClient.KEY_PENDING_INTENT, "Landroid/app/PendingIntent;", "(Landroid/app/PendingIntent;)V", "build", "Landroidx/credentials/provider/RemoteEntry;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Builder {
        private final PendingIntent pendingIntent;

        public Builder(PendingIntent pendingIntent) {
            Intrinsics.checkNotNullParameter(pendingIntent, "pendingIntent");
            this.pendingIntent = pendingIntent;
        }

        public final RemoteEntry build() {
            return new RemoteEntry(this.pendingIntent);
        }
    }

    /* compiled from: RemoteEntry.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007¨\u0006\u0007"}, d2 = {"Landroidx/credentials/provider/RemoteEntry$Api34Impl;", "", "()V", "fromRemoteEntry", "Landroidx/credentials/provider/RemoteEntry;", "remoteEntry", "Landroid/service/credentials/RemoteEntry;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    private static final class Api34Impl {
        public static final Api34Impl INSTANCE = new Api34Impl();

        private Api34Impl() {
        }

        @JvmStatic
        public static final RemoteEntry fromRemoteEntry(android.service.credentials.RemoteEntry remoteEntry) {
            Intrinsics.checkNotNullParameter(remoteEntry, "remoteEntry");
            Slice slice = remoteEntry.getSlice();
            Intrinsics.checkNotNullExpressionValue(slice, "remoteEntry.slice");
            return RemoteEntry.INSTANCE.fromSlice(slice);
        }
    }

    /* compiled from: RemoteEntry.kt */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0012\u0010\n\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\f\u001a\u00020\rH\u0007J\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u000f\u001a\u00020\u0010H\u0007J\u0010\u0010\u0011\u001a\u00020\u00102\u0006\u0010\f\u001a\u00020\u000bH\u0007J\u0019\u0010\u0012\u001a\u00020\u0013*\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u0015H\u0000¢\u0006\u0002\b\u0016J\u0013\u0010\u0017\u001a\u0004\u0018\u00010\u000b*\u00020\u0015H\u0000¢\u0006\u0002\b\u0018R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0019"}, d2 = {"Landroidx/credentials/provider/RemoteEntry$Companion;", "", "()V", "EXTRA_REMOTE_ENTRY_PENDING_INTENT", "", "REVISION_ID", "", "SLICE_HINT_PENDING_INTENT", "SLICE_SPEC_TYPE", "TAG", "fromRemoteEntry", "Landroidx/credentials/provider/RemoteEntry;", "remoteEntry", "Landroid/service/credentials/RemoteEntry;", "fromSlice", "slice", "Landroid/app/slice/Slice;", "toSlice", "marshall", "", "bundle", "Landroid/os/Bundle;", "marshall$credentials_release", "unmarshallRemoteEntry", "unmarshallRemoteEntry$credentials_release", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final Slice toSlice(RemoteEntry remoteEntry) {
            Intrinsics.checkNotNullParameter(remoteEntry, "remoteEntry");
            PendingIntent pendingIntent = remoteEntry.getPendingIntent();
            Slice.Builder sliceBuilder = new Slice.Builder(Uri.EMPTY, new SliceSpec("RemoteEntry", 1));
            sliceBuilder.addAction(pendingIntent, new Slice.Builder(sliceBuilder).addHints(Collections.singletonList(RemoteEntry.SLICE_HINT_PENDING_INTENT)).build(), null);
            Slice build = sliceBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "sliceBuilder.build()");
            return build;
        }

        @JvmStatic
        public final RemoteEntry fromSlice(Slice slice) {
            Intrinsics.checkNotNullParameter(slice, "slice");
            PendingIntent pendingIntent = null;
            Iterable items = slice.getItems();
            Intrinsics.checkNotNullExpressionValue(items, "slice.items");
            Iterable $this$forEach$iv = items;
            for (Object element$iv : $this$forEach$iv) {
                SliceItem it = (SliceItem) element$iv;
                if (it.hasHint(RemoteEntry.SLICE_HINT_PENDING_INTENT)) {
                    pendingIntent = it.getAction();
                }
            }
            try {
                Intrinsics.checkNotNull(pendingIntent);
                return new RemoteEntry(pendingIntent);
            } catch (Exception e) {
                Log.i("RemoteEntry", "fromSlice failed with: " + e.getMessage());
                return null;
            }
        }

        @JvmStatic
        public final RemoteEntry fromRemoteEntry(android.service.credentials.RemoteEntry remoteEntry) {
            Intrinsics.checkNotNullParameter(remoteEntry, "remoteEntry");
            if (Build.VERSION.SDK_INT >= 34) {
                return Api34Impl.fromRemoteEntry(remoteEntry);
            }
            return null;
        }

        public final void marshall$credentials_release(RemoteEntry $this$marshall, Bundle bundle) {
            Intrinsics.checkNotNullParameter($this$marshall, "<this>");
            Intrinsics.checkNotNullParameter(bundle, "bundle");
            bundle.putParcelable(RemoteEntry.EXTRA_REMOTE_ENTRY_PENDING_INTENT, $this$marshall.getPendingIntent());
        }

        public final RemoteEntry unmarshallRemoteEntry$credentials_release(Bundle $this$unmarshallRemoteEntry) {
            Intrinsics.checkNotNullParameter($this$unmarshallRemoteEntry, "<this>");
            PendingIntent pendingIntent = (PendingIntent) $this$unmarshallRemoteEntry.getParcelable(RemoteEntry.EXTRA_REMOTE_ENTRY_PENDING_INTENT);
            if (pendingIntent == null) {
                return null;
            }
            return new RemoteEntry(pendingIntent);
        }
    }

    @JvmStatic
    public static final Slice toSlice(RemoteEntry remoteEntry) {
        return INSTANCE.toSlice(remoteEntry);
    }

    @JvmStatic
    public static final RemoteEntry fromSlice(Slice slice) {
        return INSTANCE.fromSlice(slice);
    }

    @JvmStatic
    public static final RemoteEntry fromRemoteEntry(android.service.credentials.RemoteEntry remoteEntry) {
        return INSTANCE.fromRemoteEntry(remoteEntry);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (other instanceof RemoteEntry) {
            return Intrinsics.areEqual(this.pendingIntent, ((RemoteEntry) other).pendingIntent);
        }
        return false;
    }

    public int hashCode() {
        return this.pendingIntent.hashCode();
    }
}
