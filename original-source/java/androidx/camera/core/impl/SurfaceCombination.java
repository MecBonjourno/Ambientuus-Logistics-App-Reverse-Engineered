package androidx.camera.core.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public final class SurfaceCombination {
    private final List<SurfaceConfig> mSurfaceConfigList = new ArrayList();

    public SurfaceCombination() {
    }

    public SurfaceCombination(SurfaceConfig... surfaceConfigs) {
        Collections.addAll(this.mSurfaceConfigList, surfaceConfigs);
    }

    private static void generateArrangements(List<int[]> arrangementsResultList, int n, int[] result, int index) {
        if (index >= result.length) {
            arrangementsResultList.add((int[]) result.clone());
            return;
        }
        for (int i = 0; i < n; i++) {
            boolean included = false;
            int j = 0;
            while (true) {
                if (j >= index) {
                    break;
                }
                if (i != result[j]) {
                    j++;
                } else {
                    included = true;
                    break;
                }
            }
            if (!included) {
                result[index] = i;
                generateArrangements(arrangementsResultList, n, result, index + 1);
            }
        }
    }

    public boolean addSurfaceConfig(SurfaceConfig surfaceConfig) {
        return this.mSurfaceConfigList.add(surfaceConfig);
    }

    public boolean removeSurfaceConfig(SurfaceConfig surfaceConfig) {
        return this.mSurfaceConfigList.remove(surfaceConfig);
    }

    public List<SurfaceConfig> getSurfaceConfigList() {
        return this.mSurfaceConfigList;
    }

    public List<SurfaceConfig> getOrderedSupportedSurfaceConfigList(List<SurfaceConfig> configList) {
        boolean isSupported = false;
        if (configList.isEmpty()) {
            return new ArrayList();
        }
        if (configList.size() != this.mSurfaceConfigList.size()) {
            return null;
        }
        List<int[]> elementsArrangements = getElementsArrangements(this.mSurfaceConfigList.size());
        SurfaceConfig[] surfaceConfigArray = new SurfaceConfig[configList.size()];
        Iterator<int[]> it = elementsArrangements.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            int[] elementsArrangement = it.next();
            boolean checkResult = true;
            for (int index = 0; index < this.mSurfaceConfigList.size(); index++) {
                if (elementsArrangement[index] < configList.size()) {
                    checkResult &= this.mSurfaceConfigList.get(index).isSupported(configList.get(elementsArrangement[index]));
                    if (!checkResult) {
                        break;
                    }
                    surfaceConfigArray[elementsArrangement[index]] = this.mSurfaceConfigList.get(index);
                }
            }
            if (checkResult) {
                isSupported = true;
                break;
            }
        }
        if (isSupported) {
            return Arrays.asList(surfaceConfigArray);
        }
        return null;
    }

    private List<int[]> getElementsArrangements(int n) {
        List<int[]> arrangementsResultList = new ArrayList<>();
        generateArrangements(arrangementsResultList, n, new int[n], 0);
        return arrangementsResultList;
    }
}
