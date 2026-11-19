package com.karumi.dexter.listener;

/* carregado de: classes16.dex */
public final class PermissionRequest {
    private final String name;

    public PermissionRequest(String str) {
        this.name = str;
    }

    public String getName() {
        return this.name;
    }

    public String toString() {
        return "Permission name: " + this.name;
    }
}
