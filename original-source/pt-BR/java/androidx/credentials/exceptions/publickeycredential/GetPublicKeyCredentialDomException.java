package androidx.credentials.exceptions.publickeycredential;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.app.NotificationCompat;
import androidx.credentials.exceptions.GetCredentialCustomException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.domerrors.AbortError;
import androidx.credentials.exceptions.domerrors.ConstraintError;
import androidx.credentials.exceptions.domerrors.DataCloneError;
import androidx.credentials.exceptions.domerrors.DataError;
import androidx.credentials.exceptions.domerrors.DomError;
import androidx.credentials.exceptions.domerrors.EncodingError;
import androidx.credentials.exceptions.domerrors.HierarchyRequestError;
import androidx.credentials.exceptions.domerrors.InUseAttributeError;
import androidx.credentials.exceptions.domerrors.InvalidCharacterError;
import androidx.credentials.exceptions.domerrors.InvalidModificationError;
import androidx.credentials.exceptions.domerrors.InvalidNodeTypeError;
import androidx.credentials.exceptions.domerrors.InvalidStateError;
import androidx.credentials.exceptions.domerrors.NamespaceError;
import androidx.credentials.exceptions.domerrors.NetworkError;
import androidx.credentials.exceptions.domerrors.NoModificationAllowedError;
import androidx.credentials.exceptions.domerrors.NotAllowedError;
import androidx.credentials.exceptions.domerrors.NotFoundError;
import androidx.credentials.exceptions.domerrors.NotReadableError;
import androidx.credentials.exceptions.domerrors.NotSupportedError;
import androidx.credentials.exceptions.domerrors.OperationError;
import androidx.credentials.exceptions.domerrors.OptOutError;
import androidx.credentials.exceptions.domerrors.QuotaExceededError;
import androidx.credentials.exceptions.domerrors.ReadOnlyError;
import androidx.credentials.exceptions.domerrors.SecurityError;
import androidx.credentials.exceptions.domerrors.SyntaxError;
import androidx.credentials.exceptions.domerrors.TimeoutError;
import androidx.credentials.exceptions.domerrors.TransactionInactiveError;
import androidx.credentials.exceptions.domerrors.UnknownError;
import androidx.credentials.exceptions.domerrors.VersionError;
import androidx.credentials.exceptions.domerrors.WrongDocumentError;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import androidx.credentials.internal.FrameworkClassParsingException;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* compiled from: GetPublicKeyCredentialDomException.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0002\b\u0005\u0018\u0000 \t2\u00020\u0001:\u0001\tB\u001b\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\n"}, d2 = {"Landroidx/credentials/exceptions/publickeycredential/GetPublicKeyCredentialDomException;", "Landroidx/credentials/exceptions/publickeycredential/GetPublicKeyCredentialException;", "domError", "Landroidx/credentials/exceptions/domerrors/DomError;", "errorMessage", "", "(Landroidx/credentials/exceptions/domerrors/DomError;Ljava/lang/CharSequence;)V", "getDomError", "()Landroidx/credentials/exceptions/domerrors/DomError;", "Companion", "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
/* carregado de: classes.dex */
public final class GetPublicKeyCredentialDomException extends GetPublicKeyCredentialException {

    /* renomeado de: Companion, motivo: de metadados do Kotlin */
    public static final Companion INSTANCE = new Companion(null);
    public static final String TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION = "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION";
    private final DomError domError;

    /* JADX WARN: chamada 'this' movida para o topo do método (pode alterar a semântica do código) */
    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    public GetPublicKeyCredentialDomException(DomError domError) {
        this(domError, null, 2, 0 == true ? 1 : 0);
        Intrinsics.checkNotNullParameter(domError, "domError");
    }

    public /* sintético */ GetPublicKeyCredentialDomException(DomError domError, CharSequence charSequence, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this(domError, (i & 2) != 0 ? null : charSequence);
    }

    public final DomError getDomError() {
        return this.domError;
    }

    /* JADX WARN: chamada 'super' movida para o topo do método (pode alterar a semântica do código) */
    public GetPublicKeyCredentialDomException(DomError domError, CharSequence errorMessage) {
        super("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + domError.getType(), errorMessage);
        Intrinsics.checkNotNullParameter(domError, "domError");
        this.domError = domError;
    }

    /* compiled from: GetPublicKeyCredentialDomException.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u001a\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00042\b\u0010\b\u001a\u0004\u0018\u00010\u0004H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0080T¢\u0006\u0002\n\u0000¨\u0006\t"}, d2 = {"Landroidx/credentials/exceptions/publickeycredential/GetPublicKeyCredentialDomException$Companion;", "", "()V", "TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION", "", "createFrom", "Landroidx/credentials/exceptions/GetCredentialException;", "type", NotificationCompat.CATEGORY_MESSAGE, "credentials_release"}, k = 1, mv = {1, 8, 0}, xi = ConstraintLayout.LayoutParams.Table.LAYOUT_CONSTRAINT_VERTICAL_CHAINSTYLE)
    public static final class Companion {
        public /* sintético */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
        @JvmStatic
        public final GetCredentialException createFrom(String type, String msg) {
            Object generateException;
            Intrinsics.checkNotNullParameter(type, "type");
            try {
                DomExceptionUtils.Companion companion = DomExceptionUtils.INSTANCE;
                GetPublicKeyCredentialDomException getPublicKeyCredentialDomException = new GetPublicKeyCredentialDomException(new UnknownError(), null, 2, 0 == true ? 1 : 0);
                if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + AbortError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_ABORT_ERROR)) {
                    if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + ConstraintError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_CONSTRAINT_ERROR)) {
                        if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + DataCloneError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DATA_CLONE_ERROR)) {
                            if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + DataError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DATA_ERROR)) {
                                if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + EncodingError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_ENCODING_ERROR)) {
                                    generateException = companion.generateException(new EncodingError(), msg, getPublicKeyCredentialDomException);
                                } else if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + HierarchyRequestError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_HIERARCHY_REQUEST_ERROR)) {
                                    generateException = companion.generateException(new HierarchyRequestError(), msg, getPublicKeyCredentialDomException);
                                } else if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + InUseAttributeError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_IN_USE_ATTRIBUTE_ERROR)) {
                                    generateException = companion.generateException(new InUseAttributeError(), msg, getPublicKeyCredentialDomException);
                                } else if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + InvalidCharacterError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_INVALID_CHARACTER_ERROR)) {
                                    generateException = companion.generateException(new InvalidCharacterError(), msg, getPublicKeyCredentialDomException);
                                } else if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + InvalidModificationError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_INVALID_MODIFICATION_ERROR)) {
                                    generateException = companion.generateException(new InvalidModificationError(), msg, getPublicKeyCredentialDomException);
                                } else if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + InvalidNodeTypeError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_INVALID_NODE_TYPE_ERROR)) {
                                    if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + InvalidStateError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_INVALID_STATE_ERROR)) {
                                        if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + NamespaceError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_NAMESPACE_ERROR)) {
                                            if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + NetworkError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_NETWORK_ERROR)) {
                                                generateException = companion.generateException(new NetworkError(), msg, getPublicKeyCredentialDomException);
                                            } else if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + NoModificationAllowedError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_NO_MODIFICATION_ALLOWED_ERROR)) {
                                                if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + NotAllowedError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_NOT_ALLOWED_ERROR)) {
                                                    if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + NotFoundError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_NOT_FOUND_ERROR)) {
                                                        if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + NotReadableError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_NOT_READABLE_ERROR)) {
                                                            if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + NotSupportedError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_NOT_SUPPORTED_ERROR)) {
                                                                if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + OperationError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_OPERATION_ERROR)) {
                                                                    if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + OptOutError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_OPT_OUT_ERROR)) {
                                                                        generateException = companion.generateException(new OptOutError(), msg, getPublicKeyCredentialDomException);
                                                                    } else if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + QuotaExceededError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_QUOTA_EXCEEDED_ERROR)) {
                                                                        if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + ReadOnlyError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_READ_ONLY_ERROR)) {
                                                                            if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + SecurityError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_SECURITY_ERROR)) {
                                                                                if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + SyntaxError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_SYNTAX_ERROR)) {
                                                                                    if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + TimeoutError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_TIMEOUT_ERROR)) {
                                                                                        generateException = companion.generateException(new TimeoutError(), msg, getPublicKeyCredentialDomException);
                                                                                    } else if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + TransactionInactiveError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_TRANSACTION_INACTIVE_ERROR)) {
                                                                                        if (!Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + UnknownError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_UNKNOWN_ERROR)) {
                                                                                            if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + VersionError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_VERSION_ERROR)) {
                                                                                                generateException = companion.generateException(new VersionError(), msg, getPublicKeyCredentialDomException);
                                                                                            } else if (Intrinsics.areEqual(type, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/" + WrongDocumentError.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_WRONG_DOCUMENT_ERROR)) {
                                                                                                generateException = companion.generateException(new WrongDocumentError(), msg, getPublicKeyCredentialDomException);
                                                                                            } else {
                                                                                                throw new FrameworkClassParsingException();
                                                                                            }
                                                                                        } else {
                                                                                            generateException = companion.generateException(new UnknownError(), msg, getPublicKeyCredentialDomException);
                                                                                        }
                                                                                    } else {
                                                                                        generateException = companion.generateException(new TransactionInactiveError(), msg, getPublicKeyCredentialDomException);
                                                                                    }
                                                                                } else {
                                                                                    generateException = companion.generateException(new SyntaxError(), msg, getPublicKeyCredentialDomException);
                                                                                }
                                                                            } else {
                                                                                generateException = companion.generateException(new SecurityError(), msg, getPublicKeyCredentialDomException);
                                                                            }
                                                                        } else {
                                                                            generateException = companion.generateException(new ReadOnlyError(), msg, getPublicKeyCredentialDomException);
                                                                        }
                                                                    } else {
                                                                        generateException = companion.generateException(new QuotaExceededError(), msg, getPublicKeyCredentialDomException);
                                                                    }
                                                                } else {
                                                                    generateException = companion.generateException(new OperationError(), msg, getPublicKeyCredentialDomException);
                                                                }
                                                            } else {
                                                                generateException = companion.generateException(new NotSupportedError(), msg, getPublicKeyCredentialDomException);
                                                            }
                                                        } else {
                                                            generateException = companion.generateException(new NotReadableError(), msg, getPublicKeyCredentialDomException);
                                                        }
                                                    } else {
                                                        generateException = companion.generateException(new NotFoundError(), msg, getPublicKeyCredentialDomException);
                                                    }
                                                } else {
                                                    generateException = companion.generateException(new NotAllowedError(), msg, getPublicKeyCredentialDomException);
                                                }
                                            } else {
                                                generateException = companion.generateException(new NoModificationAllowedError(), msg, getPublicKeyCredentialDomException);
                                            }
                                        } else {
                                            generateException = companion.generateException(new NamespaceError(), msg, getPublicKeyCredentialDomException);
                                        }
                                    } else {
                                        generateException = companion.generateException(new InvalidStateError(), msg, getPublicKeyCredentialDomException);
                                    }
                                } else {
                                    generateException = companion.generateException(new InvalidNodeTypeError(), msg, getPublicKeyCredentialDomException);
                                }
                            } else {
                                generateException = companion.generateException(new DataError(), msg, getPublicKeyCredentialDomException);
                            }
                        } else {
                            generateException = companion.generateException(new DataCloneError(), msg, getPublicKeyCredentialDomException);
                        }
                    } else {
                        generateException = companion.generateException(new ConstraintError(), msg, getPublicKeyCredentialDomException);
                    }
                } else {
                    generateException = companion.generateException(new AbortError(), msg, getPublicKeyCredentialDomException);
                }
                return (GetCredentialException) generateException;
            } catch (FrameworkClassParsingException e) {
                return new GetCredentialCustomException(type, msg);
            }
        }
    }

    @JvmStatic
    public static final GetCredentialException createFrom(String type, String msg) {
        return INSTANCE.createFrom(type, msg);
    }
}
