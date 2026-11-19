package androidx.credentials.provider.utils;

import android.app.slice.Slice;
import android.content.pm.SigningInfo;
import android.os.Bundle;
import android.service.credentials.BeginCreateCredentialResponse;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.provider.BeginCreateCredentialRequest;
import androidx.credentials.provider.CallingAppInfo;
import androidx.credentials.provider.CreateEntry;
import androidx.credentials.provider.RemoteEntry;
import androidx.credentials.provider.utils.BeginCreateCredentialUtil;
import j$.util.Collection;
import j$.util.function.Function$CC;
import j$.util.function.Predicate$CC;
import j$.util.stream.Collectors;
import j$.util.stream.Stream;
import java.util.List;
import java.util.function.Function;
import java.util.function.Predicate;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: BeginCreateCredentialUtil.kt */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0000\u0018\u0000 \u00032\u00020\u0001:\u0001\u0003B\u0005¢\u0006\u0002\u0010\u0002¨\u0006\u0004"}, d2 = {"Landroidx/credentials/provider/utils/BeginCreateCredentialUtil;", "", "()V", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class BeginCreateCredentialUtil {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);

    /* compiled from: BeginCreateCredentialUtil.kt */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0007J\u0015\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0001¢\u0006\u0002\b\fJ\u0010\u0010\r\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\bH\u0007J\u001e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014H\u0003J\u001a\u0010\u0016\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\b\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0003¨\u0006\u0019"}, d2 = {"Landroidx/credentials/provider/utils/BeginCreateCredentialUtil$Companion;", "", "()V", "convertToFrameworkRequest", "Landroid/service/credentials/BeginCreateCredentialRequest;", "request", "Landroidx/credentials/provider/BeginCreateCredentialRequest;", "convertToFrameworkResponse", "Landroid/service/credentials/BeginCreateCredentialResponse;", "response", "Landroidx/credentials/provider/BeginCreateCredentialResponse;", "convertToJetpackRequest", "convertToJetpackRequest$credentials_release", "convertToJetpackResponse", "frameworkResponse", "populateCreateEntries", "", "frameworkBuilder", "Landroid/service/credentials/BeginCreateCredentialResponse$Builder;", "createEntries", "", "Landroidx/credentials/provider/CreateEntry;", "populateRemoteEntry", "remoteEntry", "Landroidx/credentials/provider/RemoteEntry;", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final BeginCreateCredentialRequest convertToJetpackRequest$credentials_release(android.service.credentials.BeginCreateCredentialRequest request) {
            CallingAppInfo callingAppInfo;
            Intrinsics.checkNotNullParameter(request, "request");
            BeginCreateCredentialRequest.Companion companion = BeginCreateCredentialRequest.INSTANCE;
            String type = request.getType();
            Intrinsics.checkNotNullExpressionValue(type, "request.type");
            Bundle data = request.getData();
            Intrinsics.checkNotNullExpressionValue(data, "request.data");
            android.service.credentials.CallingAppInfo it = request.getCallingAppInfo();
            if (it != null) {
                CallingAppInfo.Companion companion2 = CallingAppInfo.INSTANCE;
                String packageName = it.getPackageName();
                Intrinsics.checkNotNullExpressionValue(packageName, "it.packageName");
                SigningInfo signingInfo = it.getSigningInfo();
                Intrinsics.checkNotNullExpressionValue(signingInfo, "it.signingInfo");
                callingAppInfo = companion2.create(packageName, signingInfo, it.getOrigin());
            } else {
                callingAppInfo = null;
            }
            return companion.createFrom$credentials_release(type, data, callingAppInfo);
        }

        public final BeginCreateCredentialResponse convertToFrameworkResponse(androidx.credentials.provider.BeginCreateCredentialResponse response) {
            Intrinsics.checkNotNullParameter(response, "response");
            BeginCreateCredentialResponse.Builder frameworkBuilder = new BeginCreateCredentialResponse.Builder();
            populateCreateEntries(frameworkBuilder, response.getCreateEntries());
            populateRemoteEntry(frameworkBuilder, response.getRemoteEntry());
            BeginCreateCredentialResponse build = frameworkBuilder.build();
            Intrinsics.checkNotNullExpressionValue(build, "frameworkBuilder.build()");
            return build;
        }

        private final void populateRemoteEntry(BeginCreateCredentialResponse.Builder frameworkBuilder, RemoteEntry remoteEntry) {
            if (remoteEntry == null) {
                return;
            }
            frameworkBuilder.setRemoteCreateEntry(new android.service.credentials.RemoteEntry(RemoteEntry.INSTANCE.toSlice(remoteEntry)));
        }

        private final void populateCreateEntries(BeginCreateCredentialResponse.Builder frameworkBuilder, List<CreateEntry> createEntries) {
            List<CreateEntry> $this$forEach$iv = createEntries;
            for (Object element$iv : $this$forEach$iv) {
                CreateEntry it = (CreateEntry) element$iv;
                Slice entrySlice = CreateEntry.INSTANCE.toSlice(it);
                if (entrySlice != null) {
                    frameworkBuilder.addCreateEntry(new android.service.credentials.CreateEntry(entrySlice));
                }
            }
        }

        public final android.service.credentials.BeginCreateCredentialRequest convertToFrameworkRequest(BeginCreateCredentialRequest request) {
            Intrinsics.checkNotNullParameter(request, "request");
            android.service.credentials.CallingAppInfo callingAppInfo = null;
            if (request.getCallingAppInfo() != null) {
                callingAppInfo = new android.service.credentials.CallingAppInfo(request.getCallingAppInfo().getPackageName(), request.getCallingAppInfo().getSigningInfo(), request.getCallingAppInfo().getOrigin());
            }
            return new android.service.credentials.BeginCreateCredentialRequest(request.getType(), request.getCandidateQueryData(), callingAppInfo);
        }

        public final androidx.credentials.provider.BeginCreateCredentialResponse convertToJetpackResponse(BeginCreateCredentialResponse frameworkResponse) {
            RemoteEntry remoteEntry;
            Intrinsics.checkNotNullParameter(frameworkResponse, "frameworkResponse");
            Stream stream = Collection.EL.stream(frameworkResponse.getCreateEntries());
            final BeginCreateCredentialUtil$Companion$convertToJetpackResponse$1 beginCreateCredentialUtil$Companion$convertToJetpackResponse$1 = new Function1<android.service.credentials.CreateEntry, CreateEntry>() { // da classe: androidx.credentials.provider.utils.BeginCreateCredentialUtil$Companion$convertToJetpackResponse$1
                @Override // kotlin.jvm.functions.Function1
                public final CreateEntry invoke(android.service.credentials.CreateEntry entry) {
                    CreateEntry.Companion companion = CreateEntry.INSTANCE;
                    Slice slice = entry.getSlice();
                    Intrinsics.checkNotNullExpressionValue(slice, "entry.slice");
                    return companion.fromSlice(slice);
                }
            };
            Stream map = stream.map(new Function() { // da classe: androidx.credentials.provider.utils.BeginCreateCredentialUtil$Companion$$ExternalSyntheticLambda0
                @Override // java.util.function.Function
                public /* sintético */ Function andThen(Function function) {
                    return Function$CC.$default$andThen(this, function);
                }

                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    CreateEntry convertToJetpackResponse$lambda$2;
                    convertToJetpackResponse$lambda$2 = BeginCreateCredentialUtil.Companion.convertToJetpackResponse$lambda$2(Function1.this, obj);
                    return convertToJetpackResponse$lambda$2;
                }

                @Override // java.util.function.Function
                public /* sintético */ Function compose(Function function) {
                    return Function$CC.$default$compose(this, function);
                }
            });
            final BeginCreateCredentialUtil$Companion$convertToJetpackResponse$2 beginCreateCredentialUtil$Companion$convertToJetpackResponse$2 = new Function1<CreateEntry, Boolean>() { // da classe: androidx.credentials.provider.utils.BeginCreateCredentialUtil$Companion$convertToJetpackResponse$2
                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(CreateEntry entry) {
                    return Boolean.valueOf(entry != null);
                }
            };
            Stream filter = map.filter(new Predicate() { // da classe: androidx.credentials.provider.utils.BeginCreateCredentialUtil$Companion$$ExternalSyntheticLambda1
                @Override // java.util.function.Predicate
                public /* sintético */ Predicate and(Predicate predicate) {
                    return Predicate$CC.$default$and(this, predicate);
                }

                @Override // java.util.function.Predicate
                public /* sintético */ Predicate negate() {
                    return Predicate$CC.$default$negate(this);
                }

                @Override // java.util.function.Predicate
                public /* sintético */ Predicate or(Predicate predicate) {
                    return Predicate$CC.$default$or(this, predicate);
                }

                @Override // java.util.function.Predicate
                public final boolean test(Object obj) {
                    boolean convertToJetpackResponse$lambda$3;
                    convertToJetpackResponse$lambda$3 = BeginCreateCredentialUtil.Companion.convertToJetpackResponse$lambda$3(Function1.this, obj);
                    return convertToJetpackResponse$lambda$3;
                }
            });
            final BeginCreateCredentialUtil$Companion$convertToJetpackResponse$3 beginCreateCredentialUtil$Companion$convertToJetpackResponse$3 = new Function1<CreateEntry, CreateEntry>() { // da classe: androidx.credentials.provider.utils.BeginCreateCredentialUtil$Companion$convertToJetpackResponse$3
                @Override // kotlin.jvm.functions.Function1
                public final CreateEntry invoke(CreateEntry entry) {
                    Intrinsics.checkNotNull(entry);
                    return entry;
                }
            };
            Object collect = filter.map(new Function() { // da classe: androidx.credentials.provider.utils.BeginCreateCredentialUtil$Companion$$ExternalSyntheticLambda2
                @Override // java.util.function.Function
                public /* sintético */ Function andThen(Function function) {
                    return Function$CC.$default$andThen(this, function);
                }

                @Override // java.util.function.Function
                public final Object apply(Object obj) {
                    CreateEntry convertToJetpackResponse$lambda$4;
                    convertToJetpackResponse$lambda$4 = BeginCreateCredentialUtil.Companion.convertToJetpackResponse$lambda$4(Function1.this, obj);
                    return convertToJetpackResponse$lambda$4;
                }

                @Override // java.util.function.Function
                public /* sintético */ Function compose(Function function) {
                    return Function$CC.$default$compose(this, function);
                }
            }).collect(Collectors.toList());
            Intrinsics.checkNotNullExpressionValue(collect, "frameworkResponse.create…lect(Collectors.toList())");
            List list = (List) collect;
            android.service.credentials.RemoteEntry it = frameworkResponse.getRemoteCreateEntry();
            if (it != null) {
                RemoteEntry.Companion companion = RemoteEntry.INSTANCE;
                Slice slice = it.getSlice();
                Intrinsics.checkNotNullExpressionValue(slice, "it.slice");
                remoteEntry = companion.fromSlice(slice);
            } else {
                remoteEntry = null;
            }
            return new androidx.credentials.provider.BeginCreateCredentialResponse(list, remoteEntry);
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public static final CreateEntry convertToJetpackResponse$lambda$2(Function1 $tmp0, Object p0) {
            return (CreateEntry) $tmp0.invoke(p0);
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public static final boolean convertToJetpackResponse$lambda$3(Function1 $tmp0, Object p0) {
            return ((Boolean) $tmp0.invoke(p0)).booleanValue();
        }

        /* JADX INFO: modificadores de acesso alterados de: private */
        public static final CreateEntry convertToJetpackResponse$lambda$4(Function1 $tmp0, Object p0) {
            return (CreateEntry) $tmp0.invoke(p0);
        }
    }
}
