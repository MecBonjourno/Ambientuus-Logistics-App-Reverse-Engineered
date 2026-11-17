package org.chromium.base;

import dalvik.system.BaseDexClassLoader;

/* loaded from: classes17.dex */
public class WrappedClassLoader extends ClassLoader {
    private final ClassLoader mPrimaryClassLoader;
    private final ClassLoader mSecondaryClassLoader;

    public WrappedClassLoader(ClassLoader primary, ClassLoader secondary) {
        this.mPrimaryClassLoader = primary;
        this.mSecondaryClassLoader = secondary;
    }

    @Override // java.lang.ClassLoader
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        try {
            return this.mPrimaryClassLoader.loadClass(name);
        } catch (ClassNotFoundException e) {
            try {
                return this.mSecondaryClassLoader.loadClass(name);
            } catch (ClassNotFoundException e2) {
                e.addSuppressed(e2);
                throw e;
            }
        }
    }

    @Override // java.lang.ClassLoader
    public String findLibrary(String name) {
        String path = null;
        if ((this.mPrimaryClassLoader instanceof BaseDexClassLoader) && (path = ((BaseDexClassLoader) this.mPrimaryClassLoader).findLibrary(name)) != null) {
            return path;
        }
        if (this.mSecondaryClassLoader instanceof BaseDexClassLoader) {
            String path2 = ((BaseDexClassLoader) this.mSecondaryClassLoader).findLibrary(name);
            return path2;
        }
        return path;
    }
}
