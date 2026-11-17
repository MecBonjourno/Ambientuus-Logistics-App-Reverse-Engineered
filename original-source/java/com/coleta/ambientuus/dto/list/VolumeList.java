package com.coleta.ambientuus.dto.list;

import com.coleta.ambientuus.dto.Volume;
import java.util.List;

/* loaded from: classes10.dex */
public class VolumeList {
    private String MSG;
    private List<Volume> VOLUMES;

    public VolumeList() {
    }

    public VolumeList(List<Volume> volume, String msg) {
        this.VOLUMES = volume;
        this.MSG = msg;
    }

    public List<Volume> getVOLUMES() {
        return this.VOLUMES;
    }

    public void setVOLUMES(List<Volume> vOLUMES) {
        this.VOLUMES = vOLUMES;
    }

    public String getMSG() {
        return this.MSG;
    }

    public void setMSG(String mSG) {
        this.MSG = mSG;
    }
}
