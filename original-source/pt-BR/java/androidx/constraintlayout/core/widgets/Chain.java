package androidx.constraintlayout.core.widgets;

import androidx.constraintlayout.core.LinearSystem;
import java.util.ArrayList;

/* carregado de: classes.dex */
public class Chain {
    private static final boolean DEBUG = false;
    public static final boolean USE_CHAIN_OPTIMIZATION = false;

    public static void applyChainConstraints(ConstraintWidgetContainer constraintWidgetContainer, LinearSystem system, ArrayList<ConstraintWidget> widgets, int orientation) {
        int offset;
        int chainsSize;
        ChainHead[] chainsArray;
        if (orientation == 0) {
            offset = 0;
            chainsSize = constraintWidgetContainer.mHorizontalChainsSize;
            chainsArray = constraintWidgetContainer.mHorizontalChainsArray;
        } else {
            offset = 2;
            chainsSize = constraintWidgetContainer.mVerticalChainsSize;
            chainsArray = constraintWidgetContainer.mVerticalChainsArray;
        }
        for (int i = 0; i < chainsSize; i++) {
            ChainHead first = chainsArray[i];
            first.define();
            if (widgets == null || widgets.contains(first.mFirst)) {
                applyChainConstraints(constraintWidgetContainer, system, orientation, offset, first);
            }
        }
    }

    /* JADX WARN: falha na inferência de tipos de múltiplas variáveis */
    /* JADX WARN: região duplicada removida para o bloco: B:206:0x0615  */
    /* JADX WARN: região duplicada removida para o bloco: B:209:0x0620  */
    /* JADX WARN: região duplicada removida para o bloco: B:212:0x062a  */
    /* JADX WARN: região duplicada removida para o bloco: B:214:0x0632  */
    /* JADX WARN: região duplicada removida para o bloco: B:219:0x064c  */
    /* JADX WARN: região duplicada removida para o bloco: B:226:0x0658  */
    /* JADX WARN: região duplicada removida para o bloco: B:228:0x0649  */
    /* JADX WARN: região duplicada removida para o bloco: B:229:0x062f  */
    /* JADX WARN: região duplicada removida para o bloco: B:230:0x0625  */
    /* JADX WARN: falha na inferência de tipo para: r4v6 */
    /* JADX WARN: falha na inferência de tipo para: r4v7 */
    /* JADX WARN: falha na inferência de tipo para: r4v8 */
    /* JADX WARN: falha na inferência de tipo para: r4v86 */
    /* JADX WARN: falha na inferência de tipo para: r4v87 */
    /* JADX WARN: falha na inferência de tipo para: r4v88 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void applyChainConstraints(androidx.constraintlayout.core.widgets.ConstraintWidgetContainer r41, androidx.constraintlayout.core.LinearSystem r42, int r43, int r44, androidx.constraintlayout.core.widgets.ChainHead r45) {
        /*
            Method dump skipped, instructions count: 1654
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.core.widgets.Chain.applyChainConstraints(androidx.constraintlayout.core.widgets.ConstraintWidgetContainer, androidx.constraintlayout.core.LinearSystem, int, int, androidx.constraintlayout.core.widgets.ChainHead):void");
    }
}
