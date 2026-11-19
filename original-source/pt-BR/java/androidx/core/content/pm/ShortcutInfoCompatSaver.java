package androidx.core.content.pm;

import java.util.ArrayList;
import java.util.List;

/* carregado de: classes.dex */
public abstract class ShortcutInfoCompatSaver<T> {
    public abstract T addShortcuts(List<ShortcutInfoCompat> list);

    public abstract T removeAllShortcuts();

    public abstract T removeShortcuts(List<String> list);

    public List<ShortcutInfoCompat> getShortcuts() throws Exception {
        return new ArrayList();
    }

    public static class NoopImpl extends ShortcutInfoCompatSaver<Void> {
        @Override // androidx.core.content.pm.ShortcutInfoCompatSaver
        public /* bridge */ /* sintético */ Void addShortcuts(List list) {
            return addShortcuts2((List<ShortcutInfoCompat>) list);
        }

        @Override // androidx.core.content.pm.ShortcutInfoCompatSaver
        public /* bridge */ /* sintético */ Void removeShortcuts(List list) {
            return removeShortcuts2((List<String>) list);
        }

        @Override // androidx.core.content.pm.ShortcutInfoCompatSaver
        /* renomeado de: addShortcuts, motivo: evitar colisão após correção de tipos em outro método */
        public Void addShortcuts2(List<ShortcutInfoCompat> shortcuts) {
            return null;
        }

        @Override // androidx.core.content.pm.ShortcutInfoCompatSaver
        /* renomeado de: removeShortcuts, motivo: evitar colisão após correção de tipos em outro método */
        public Void removeShortcuts2(List<String> shortcutIds) {
            return null;
        }

        @Override // androidx.core.content.pm.ShortcutInfoCompatSaver
        public Void removeAllShortcuts() {
            return null;
        }
    }
}
