package androidx.camera.core.impl.utils;

import androidx.camera.core.FocusMeteringAction;
import androidx.camera.core.impl.SessionProcessor;
import java.util.ArrayList;
import java.util.List;

/* carregado de: classes.dex */
public final class SessionProcessorUtil {
    private SessionProcessorUtil() {
    }

    public static boolean isOperationSupported(SessionProcessor sessionProcessor, int... operations) {
        if (sessionProcessor == null) {
            return true;
        }
        List<Integer> operationList = new ArrayList<>(operations.length);
        for (int operation : operations) {
            operationList.add(Integer.valueOf(operation));
        }
        return sessionProcessor.getSupportedCameraOperations().containsAll(operationList);
    }

    public static FocusMeteringAction getModifiedFocusMeteringAction(SessionProcessor sessionProcessor, FocusMeteringAction action) {
        if (sessionProcessor == null) {
            return action;
        }
        boolean shouldModify = false;
        FocusMeteringAction.Builder builder = new FocusMeteringAction.Builder(action);
        if (!action.getMeteringPointsAf().isEmpty() && !isOperationSupported(sessionProcessor, 1, 2)) {
            shouldModify = true;
            builder.removePoints(1);
        }
        if (!action.getMeteringPointsAe().isEmpty() && !isOperationSupported(sessionProcessor, 3)) {
            shouldModify = true;
            builder.removePoints(2);
        }
        if (!action.getMeteringPointsAwb().isEmpty() && !isOperationSupported(sessionProcessor, 4)) {
            shouldModify = true;
            builder.removePoints(4);
        }
        if (!shouldModify) {
            return action;
        }
        FocusMeteringAction modifyAction = builder.build();
        if (modifyAction.getMeteringPointsAf().isEmpty() && modifyAction.getMeteringPointsAe().isEmpty() && modifyAction.getMeteringPointsAwb().isEmpty()) {
            return null;
        }
        return builder.build();
    }
}
