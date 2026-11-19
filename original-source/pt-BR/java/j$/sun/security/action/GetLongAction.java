package j$.sun.security.action;

import java.security.PrivilegedAction;

/* carregado de: classes15.dex */
public class GetLongAction implements PrivilegedAction<Long> {
    private boolean defaultSet;
    private long defaultVal;
    private String theProp;

    public GetLongAction(String theProp) {
        this.defaultSet = false;
        this.theProp = theProp;
    }

    public GetLongAction(String theProp, long defaultVal) {
        this.defaultSet = false;
        this.theProp = theProp;
        this.defaultVal = defaultVal;
        this.defaultSet = true;
    }

    /* JADX WARN: não é possível renomear o método para resolver a colisão */
    @Override // java.security.PrivilegedAction
    public Long run() {
        Long value = Long.getLong(this.theProp);
        if (value == null && this.defaultSet) {
            return Long.valueOf(this.defaultVal);
        }
        return value;
    }
}
