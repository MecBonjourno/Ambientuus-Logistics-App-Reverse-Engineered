package j$.sun.security.action;

import java.security.PrivilegedAction;

/* carregado de: classes15.dex */
public class GetBooleanAction implements PrivilegedAction<Boolean> {
    private String theProp;

    public GetBooleanAction(String theProp) {
        this.theProp = theProp;
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // java.security.PrivilegedAction
    public Boolean run() {
        return Boolean.valueOf(Boolean.getBoolean(this.theProp));
    }
}
