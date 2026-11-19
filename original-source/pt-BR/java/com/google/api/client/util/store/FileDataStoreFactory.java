package com.google.api.client.util.store;

import com.google.api.client.util.IOUtils;
import com.google.api.client.util.Maps;
import com.google.api.client.util.Throwables;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.logging.Logger;

/* carregado de: classes16.dex */
public class FileDataStoreFactory extends AbstractDataStoreFactory {
    private static final Logger LOGGER = Logger.getLogger(FileDataStoreFactory.class.getName());
    private final File dataDirectory;

    public FileDataStoreFactory(File dataDirectory) throws IOException {
        File dataDirectory2 = dataDirectory.getCanonicalFile();
        this.dataDirectory = dataDirectory2;
        if (IOUtils.isSymbolicLink(dataDirectory2)) {
            throw new IOException("unable to use a symbolic link: " + dataDirectory2);
        }
        if (!dataDirectory2.exists() && !dataDirectory2.mkdirs()) {
            throw new IOException("unable to create directory: " + dataDirectory2);
        }
        setPermissionsToOwnerOnly(dataDirectory2);
    }

    public final File getDataDirectory() {
        return this.dataDirectory;
    }

    @Override // com.google.api.client.util.store.AbstractDataStoreFactory
    protected <V extends Serializable> DataStore<V> createDataStore(String id) throws IOException {
        return new FileDataStore(this, this.dataDirectory, id);
    }

    static class FileDataStore<V extends Serializable> extends AbstractMemoryDataStore<V> {
        private final File dataFile;

        FileDataStore(FileDataStoreFactory dataStore, File dataDirectory, String id) throws IOException {
            super(dataStore, id);
            this.dataFile = new File(dataDirectory, id);
            if (IOUtils.isSymbolicLink(this.dataFile)) {
                throw new IOException("unable to use a symbolic link: " + this.dataFile);
            }
            if (this.dataFile.createNewFile()) {
                this.keyValueMap = Maps.newHashMap();
                save();
            } else {
                this.keyValueMap = (HashMap) IOUtils.deserialize(new FileInputStream(this.dataFile));
            }
        }

        @Override // com.google.api.client.util.store.AbstractMemoryDataStore
        public void save() throws IOException {
            IOUtils.serialize(this.keyValueMap, new FileOutputStream(this.dataFile));
        }

        @Override // com.google.api.client.util.store.AbstractDataStore, com.google.api.client.util.store.DataStore
        public FileDataStoreFactory getDataStoreFactory() {
            return (FileDataStoreFactory) super.getDataStoreFactory();
        }
    }

    static void setPermissionsToOwnerOnly(File file) throws IOException {
        try {
            Class cls = Boolean.TYPE;
            Method setReadable = File.class.getMethod("setReadable", cls, cls);
            Class cls2 = Boolean.TYPE;
            Method setWritable = File.class.getMethod("setWritable", cls2, cls2);
            Class cls3 = Boolean.TYPE;
            Method setExecutable = File.class.getMethod("setExecutable", cls3, cls3);
            if (!((Boolean) setReadable.invoke(file, false, false)).booleanValue() || !((Boolean) setWritable.invoke(file, false, false)).booleanValue() || !((Boolean) setExecutable.invoke(file, false, false)).booleanValue()) {
                LOGGER.warning("unable to change permissions for everybody: " + file);
            }
            if (!((Boolean) setReadable.invoke(file, true, true)).booleanValue() || !((Boolean) setWritable.invoke(file, true, true)).booleanValue() || !((Boolean) setExecutable.invoke(file, true, true)).booleanValue()) {
                LOGGER.warning("unable to change permissions for owner: " + file);
            }
        } catch (IllegalAccessException e) {
        } catch (IllegalArgumentException e2) {
        } catch (NoSuchMethodException e3) {
            LOGGER.warning("Unable to set permissions for " + file + ", likely because you are running a version of Java prior to 1.6");
        } catch (SecurityException e4) {
        } catch (InvocationTargetException exception) {
            Throwable cause = exception.getCause();
            Throwables.propagateIfPossible(cause, IOException.class);
            throw new RuntimeException(cause);
        }
    }
}
