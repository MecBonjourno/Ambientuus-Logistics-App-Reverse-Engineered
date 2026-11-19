package androidx.credentials.playservices.controllers.GetRestoreCredential;

import android.content.Context;
import android.os.CancellationSignal;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.credentials.Credential;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.CredentialOption;
import androidx.credentials.GetCredentialRequest;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.GetRestoreCredentialOption;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.exceptions.NoCredentialException;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import androidx.credentials.playservices.controllers.CredentialProviderController;
import com.google.android.gms.auth.blockstore.restorecredential.GetRestoreCredentialRequest;
import com.google.android.gms.auth.blockstore.restorecredential.GetRestoreCredentialResponse;
import com.google.android.gms.auth.blockstore.restorecredential.RestoreCredential;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import java.util.Iterator;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;

/* compiled from: CredentialProviderGetRestoreCredentialController.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002 \u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0001B\r\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\tJ\u0010\u0010\n\u001a\u00020\u00032\u0006\u0010\u000b\u001a\u00020\u0002H\u0016J\u0010\u0010\f\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u0004H\u0016J6\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u000b\u001a\u00020\u00022\u0012\u0010\u0010\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u00112\u0006\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015H\u0016R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Landroidx/credentials/playservices/controllers/GetRestoreCredential/CredentialProviderGetRestoreCredentialController;", "Landroidx/credentials/playservices/controllers/CredentialProviderController;", "Landroidx/credentials/GetCredentialRequest;", "Lcom/google/android/gms/auth/blockstore/restorecredential/GetRestoreCredentialRequest;", "Lcom/google/android/gms/auth/blockstore/restorecredential/GetRestoreCredentialResponse;", "Landroidx/credentials/GetCredentialResponse;", "Landroidx/credentials/exceptions/GetCredentialException;", "context", "Landroid/content/Context;", "(Landroid/content/Context;)V", "convertRequestToPlayServices", "request", "convertResponseToCredentialManager", "response", "invokePlayServices", "", "callback", "Landroidx/credentials/CredentialManagerCallback;", "executor", "Ljava/util/concurrent/Executor;", "cancellationSignal", "Landroid/os/CancellationSignal;", "credentials-play-services-auth_release"}, k = 1, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class CredentialProviderGetRestoreCredentialController extends CredentialProviderController<GetCredentialRequest, GetRestoreCredentialRequest, GetRestoreCredentialResponse, GetCredentialResponse, GetCredentialException> {
    private final Context context;

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public CredentialProviderGetRestoreCredentialController(Context context) {
        super(context);
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public void invokePlayServices(GetCredentialRequest request, final CredentialManagerCallback<GetCredentialResponse, GetCredentialException> callback, final Executor executor, final CancellationSignal cancellationSignal) {
        Intrinsics.checkNotNullParameter(request, "request");
        Intrinsics.checkNotNullParameter(callback, "callback");
        Intrinsics.checkNotNullParameter(executor, "executor");
        if (CredentialProviderPlayServicesImpl.INSTANCE.cancellationReviewer$credentials_play_services_auth_release(cancellationSignal)) {
            return;
        }
        GetRestoreCredentialRequest convertedRequest = convertRequestToPlayServices(request);
        Task<GetRestoreCredentialResponse> restoreCredential = RestoreCredential.getRestoreCredentialClient(this.context).getRestoreCredential(convertedRequest);
        final Function1<GetRestoreCredentialResponse, Unit> function1 = new Function1<GetRestoreCredentialResponse, Unit>() { // da classe: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1
            /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* sintético */ Unit invoke(GetRestoreCredentialResponse getRestoreCredentialResponse) {
                invoke2(getRestoreCredentialResponse);
                return Unit.INSTANCE;
            }

            /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
            public final void invoke2(GetRestoreCredentialResponse it) {
                try {
                    CredentialProviderGetRestoreCredentialController credentialProviderGetRestoreCredentialController = CredentialProviderGetRestoreCredentialController.this;
                    Intrinsics.checkNotNull(it);
                    GetCredentialResponse response = credentialProviderGetRestoreCredentialController.convertResponseToCredentialManager(it);
                    CredentialProviderController.Companion companion = CredentialProviderController.INSTANCE;
                    CredentialProviderController.cancelOrCallbackExceptionOrResult(cancellationSignal, new AnonymousClass1(executor, callback, response));
                } catch (Exception e) {
                    CredentialProviderController.Companion companion2 = CredentialProviderController.INSTANCE;
                    CredentialProviderController.cancelOrCallbackExceptionOrResult(cancellationSignal, new AnonymousClass2(executor, callback, e));
                }
            }

            /* compiled from: CredentialProviderGetRestoreCredentialController.kt */
            @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
            /* renomeado de: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$1, motivo: nome de classe inválido */
            static final class AnonymousClass1 extends Lambda implements Function0<Unit> {
                final /* sintético */ CredentialManagerCallback<GetCredentialResponse, GetCredentialException> $callback;
                final /* sintético */ Executor $executor;
                final /* sintético */ GetCredentialResponse $response;

                /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
                AnonymousClass1(Executor executor, CredentialManagerCallback<GetCredentialResponse, GetCredentialException> credentialManagerCallback, GetCredentialResponse getCredentialResponse) {
                    super(0);
                    this.$executor = executor;
                    this.$callback = credentialManagerCallback;
                    this.$response = getCredentialResponse;
                }

                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* sintético */ Unit invoke() {
                    invoke2();
                    return Unit.INSTANCE;
                }

                /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
                public final void invoke2() {
                    Executor executor = this.$executor;
                    final CredentialManagerCallback<GetCredentialResponse, GetCredentialException> credentialManagerCallback = this.$callback;
                    final GetCredentialResponse getCredentialResponse = this.$response;
                    executor.execute(
                    /*  JADX ERROR: Method code generation error
                        jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x000b: INVOKE 
                          (r0v0 'executor' java.util.concurrent.Executor)
                          (wrap:java.lang.Runnable:0x0008: CONSTRUCTOR 
                          (r1v0 'credentialManagerCallback' androidx.credentials.CredentialManagerCallback<androidx.credentials.GetCredentialResponse, androidx.credentials.exceptions.GetCredentialException> A[DONT_INLINE])
                          (r2v0 'getCredentialResponse' androidx.credentials.GetCredentialResponse A[DONT_INLINE])
                         A[MD:(androidx.credentials.CredentialManagerCallback, androidx.credentials.GetCredentialResponse):void (m), WRAPPED] call: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$1$$ExternalSyntheticLambda0.<init>(androidx.credentials.CredentialManagerCallback, androidx.credentials.GetCredentialResponse):void type: CONSTRUCTOR)
                         INTERFACE call: java.util.concurrent.Executor.execute(java.lang.Runnable):void A[MD:(java.lang.Runnable):void (c)] in method: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1.1.invoke():void, file: classes.dex
                        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:310)
                        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:273)
                        	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:94)
                        	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:66)
                        	at jadx.core.dex.regions.Region.generate(Region.java:35)
                        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:66)
                        	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:297)
                        	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:276)
                        	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:406)
                        	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:335)
                        	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$3(ClassGen.java:301)
                        	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:184)
                        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1596)
                        	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
                        	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:261)
                        Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Expected class to be processed at this point, class: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$1$$ExternalSyntheticLambda0, state: NOT_LOADED
                        	at jadx.core.dex.nodes.ClassNode.ensureProcessed(ClassNode.java:305)
                        	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:807)
                        	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:730)
                        	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:418)
                        	at jadx.core.codegen.InsnGen.addWrappedArg(InsnGen.java:145)
                        	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:121)
                        	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:108)
                        	at jadx.core.codegen.InsnGen.generateMethodArguments(InsnGen.java:1143)
                        	at jadx.core.codegen.InsnGen.makeInvoke(InsnGen.java:910)
                        	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:422)
                        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:303)
                        	... 15 more
                        */
                    /*
                        this = this;
                        java.util.concurrent.Executor r0 = r4.$executor
                        androidx.credentials.CredentialManagerCallback<androidx.credentials.GetCredentialResponse, androidx.credentials.exceptions.GetCredentialException> r1 = r4.$callback
                        androidx.credentials.GetCredentialResponse r2 = r4.$response
                        androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$1$$ExternalSyntheticLambda0 r3 = new androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$1$$ExternalSyntheticLambda0
                        r3.<init>(r1, r2)
                        r0.execute(r3)
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1.AnonymousClass1.invoke2():void");
                }
            }

            /* compiled from: CredentialProviderGetRestoreCredentialController.kt */
            @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n¢\u0006\u0002\b\u0002"}, d2 = {"<anonymous>", "", "invoke"}, k = 3, mv = {1, 9, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
            /* renomeado de: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$2, motivo: nome de classe inválido */
            static final class AnonymousClass2 extends Lambda implements Function0<Unit> {
                final /* sintético */ CredentialManagerCallback<GetCredentialResponse, GetCredentialException> $callback;
                final /* sintético */ Exception $e;
                final /* sintético */ Executor $executor;

                /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
                AnonymousClass2(Executor executor, CredentialManagerCallback<GetCredentialResponse, GetCredentialException> credentialManagerCallback, Exception exc) {
                    super(0);
                    this.$executor = executor;
                    this.$callback = credentialManagerCallback;
                    this.$e = exc;
                }

                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* sintético */ Unit invoke() {
                    invoke2();
                    return Unit.INSTANCE;
                }

                /* renomeado de: invoke, motivo: evitar colisão após correção de tipos em outro método */
                public final void invoke2() {
                    Executor executor = this.$executor;
                    final CredentialManagerCallback<GetCredentialResponse, GetCredentialException> credentialManagerCallback = this.$callback;
                    final Exception exc = this.$e;
                    executor.execute(
                    /*  JADX ERROR: Method code generation error
                        jadx.core.utils.exceptions.CodegenException: Error generate insn: 0x000b: INVOKE 
                          (r0v0 'executor' java.util.concurrent.Executor)
                          (wrap:java.lang.Runnable:0x0008: CONSTRUCTOR 
                          (r1v0 'credentialManagerCallback' androidx.credentials.CredentialManagerCallback<androidx.credentials.GetCredentialResponse, androidx.credentials.exceptions.GetCredentialException> A[DONT_INLINE])
                          (r2v0 'exc' java.lang.Exception A[DONT_INLINE])
                         A[MD:(androidx.credentials.CredentialManagerCallback, java.lang.Exception):void (m), WRAPPED] call: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$2$$ExternalSyntheticLambda0.<init>(androidx.credentials.CredentialManagerCallback, java.lang.Exception):void type: CONSTRUCTOR)
                         INTERFACE call: java.util.concurrent.Executor.execute(java.lang.Runnable):void A[MD:(java.lang.Runnable):void (c)] in method: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1.2.invoke():void, file: classes.dex
                        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:310)
                        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:273)
                        	at jadx.core.codegen.RegionGen.makeSimpleBlock(RegionGen.java:94)
                        	at jadx.core.dex.nodes.IBlock.generate(IBlock.java:15)
                        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:66)
                        	at jadx.core.dex.regions.Region.generate(Region.java:35)
                        	at jadx.core.codegen.RegionGen.makeRegion(RegionGen.java:66)
                        	at jadx.core.codegen.MethodGen.addRegionInsns(MethodGen.java:297)
                        	at jadx.core.codegen.MethodGen.addInstructions(MethodGen.java:276)
                        	at jadx.core.codegen.ClassGen.addMethodCode(ClassGen.java:406)
                        	at jadx.core.codegen.ClassGen.addMethod(ClassGen.java:335)
                        	at jadx.core.codegen.ClassGen.lambda$addInnerClsAndMethods$3(ClassGen.java:301)
                        	at java.base/java.util.stream.ForEachOps$ForEachOp$OfRef.accept(ForEachOps.java:184)
                        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1596)
                        	at java.base/java.util.stream.SortedOps$RefSortingSink.end(SortedOps.java:395)
                        	at java.base/java.util.stream.Sink$ChainedReference.end(Sink.java:261)
                        Caused by: jadx.core.utils.exceptions.JadxRuntimeException: Expected class to be processed at this point, class: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$2$$ExternalSyntheticLambda0, state: NOT_LOADED
                        	at jadx.core.dex.nodes.ClassNode.ensureProcessed(ClassNode.java:305)
                        	at jadx.core.codegen.InsnGen.inlineAnonymousConstructor(InsnGen.java:807)
                        	at jadx.core.codegen.InsnGen.makeConstructor(InsnGen.java:730)
                        	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:418)
                        	at jadx.core.codegen.InsnGen.addWrappedArg(InsnGen.java:145)
                        	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:121)
                        	at jadx.core.codegen.InsnGen.addArg(InsnGen.java:108)
                        	at jadx.core.codegen.InsnGen.generateMethodArguments(InsnGen.java:1143)
                        	at jadx.core.codegen.InsnGen.makeInvoke(InsnGen.java:910)
                        	at jadx.core.codegen.InsnGen.makeInsnBody(InsnGen.java:422)
                        	at jadx.core.codegen.InsnGen.makeInsn(InsnGen.java:303)
                        	... 15 more
                        */
                    /*
                        this = this;
                        java.util.concurrent.Executor r0 = r4.$executor
                        androidx.credentials.CredentialManagerCallback<androidx.credentials.GetCredentialResponse, androidx.credentials.exceptions.GetCredentialException> r1 = r4.$callback
                        java.lang.Exception r2 = r4.$e
                        androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$2$$ExternalSyntheticLambda0 r3 = new androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1$2$$ExternalSyntheticLambda0
                        r3.<init>(r1, r2)
                        r0.execute(r3)
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$invokePlayServices$1.AnonymousClass2.invoke2():void");
                }

                /* JADX INFO: modificadores de acesso alterados de: private */
                public static final void invoke$lambda$0(CredentialManagerCallback $callback, Exception $e) {
                    $callback.onError($e instanceof NoCredentialException ? (GetCredentialException) $e : (GetCredentialException) new GetCredentialUnknownException($e.getMessage()));
                }
            }
        };
        restoreCredential.addOnSuccessListener(new OnSuccessListener() { // da classe: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$$ExternalSyntheticLambda0
            @Override // com.google.android.gms.tasks.OnSuccessListener
            public final void onSuccess(Object obj) {
                Function1.this.invoke(obj);
            }
        }).addOnFailureListener(new OnFailureListener() { // da classe: androidx.credentials.playservices.controllers.GetRestoreCredential.CredentialProviderGetRestoreCredentialController$$ExternalSyntheticLambda1
            @Override // com.google.android.gms.tasks.OnFailureListener
            public final void onFailure(Exception exc) {
                CredentialProviderGetRestoreCredentialController.invokePlayServices$lambda$1(cancellationSignal, executor, callback, exc);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    /* JADX WARN: falha na inferência de tipo para: r1v0, types: [T, androidx.credentials.exceptions.GetCredentialUnknownException] */
    /* JADX WARN: falha na inferência de tipo para: r1v8, types: [T, androidx.credentials.exceptions.GetCredentialUnknownException] */
    /* JADX WARN: falha na inferência de tipo para: r1v9, types: [T, androidx.credentials.exceptions.GetCredentialUnknownException] */
    public static final void invokePlayServices$lambda$1(CancellationSignal $cancellationSignal, Executor $executor, CredentialManagerCallback $callback, Exception e) {
        Intrinsics.checkNotNullParameter(e, "e");
        Ref.ObjectRef getException = new Ref.ObjectRef();
        getException.element = new GetCredentialUnknownException("Get restore credential failed for unknown reason, failure: " + e.getMessage());
        if (e instanceof ApiException) {
            if (((ApiException) e).getStatusCode() == 40201) {
                getException.element = new GetCredentialUnknownException("The restore credential internal service had a failure, failure: " + e.getMessage());
            } else {
                getException.element = new GetCredentialUnknownException("The restore credential service failed with unsupported status code, failure: " + e.getMessage() + ", status code: " + ((ApiException) e).getStatusCode());
            }
        }
        CredentialProviderController.Companion companion = CredentialProviderController.INSTANCE;
        CredentialProviderController.cancelOrCallbackExceptionOrResult($cancellationSignal, new CredentialProviderGetRestoreCredentialController$invokePlayServices$2$1($executor, $callback, getException));
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public GetRestoreCredentialRequest convertRequestToPlayServices(GetCredentialRequest request) {
        GetRestoreCredentialOption getRestoreCredentialOption;
        Intrinsics.checkNotNullParameter(request, "request");
        GetRestoreCredentialOption credentialOption = null;
        Iterator<CredentialOption> it = request.getCredentialOptions().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            CredentialOption option = it.next();
            if (option instanceof GetRestoreCredentialOption) {
                credentialOption = (GetRestoreCredentialOption) option;
                break;
            }
        }
        if (credentialOption == null) {
            Intrinsics.throwUninitializedPropertyAccessException("credentialOption");
            getRestoreCredentialOption = null;
        } else {
            getRestoreCredentialOption = credentialOption;
        }
        return new GetRestoreCredentialRequest(getRestoreCredentialOption.getRequestData());
    }

    @Override // androidx.credentials.playservices.controllers.CredentialProviderController
    public GetCredentialResponse convertResponseToCredentialManager(GetRestoreCredentialResponse response) {
        Intrinsics.checkNotNullParameter(response, "response");
        return new GetCredentialResponse(Credential.INSTANCE.createFrom(androidx.credentials.RestoreCredential.TYPE_RESTORE_CREDENTIAL, response.getResponseBundle()));
    }
}
