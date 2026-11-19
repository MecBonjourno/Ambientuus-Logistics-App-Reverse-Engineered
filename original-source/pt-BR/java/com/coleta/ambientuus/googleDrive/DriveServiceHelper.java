package com.coleta.ambientuus.googleDrive;

import android.accounts.Account;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.ui.ProgressDialogHelper;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import com.google.api.client.extensions.android.http.AndroidHttp;
import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential;
import com.google.api.client.googleapis.extensions.android.gms.auth.UserRecoverableAuthIOException;
import com.google.api.client.http.ByteArrayContent;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.FileList;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/* carregado de: classes6.dex */
public class DriveServiceHelper {
    private static final int REQUEST_AUTHORIZATION = 1001;
    public static String TAG = "DriveServiceHelper";
    private final Account account;
    private final Activity activity;
    private final ProgressDialogHelper dialogHelper;
    private final Context mContext;
    private final Drive mDriveService;
    private final Executor mExecutor = Executors.newSingleThreadExecutor();

    public DriveServiceHelper(Drive driveService, Context context, Account account, ProgressDialogHelper dialogHelper, Activity activity) {
        this.mDriveService = driveService;
        this.mContext = context;
        this.account = account;
        this.dialogHelper = dialogHelper;
        this.activity = activity;
    }

    public ByteArrayContent exportDatabase(String dbPath) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        try {
            File dbFile = new File(dbPath);
            FileInputStream fis = new FileInputStream(dbFile);
            byte[] buffer = new byte[1024];
            while (true) {
                int length = fis.read(buffer);
                if (length <= 0) {
                    break;
                }
                outputStream.write(buffer, 0, length);
            }
            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ByteArrayContent("application/x-sqlite3", outputStream.toByteArray());
    }

    private Task<String> createFile(final ByteArrayContent dbExport) {
        final TaskCompletionSource<String> taskCompletionSource = new TaskCompletionSource<>();
        this.mExecutor.execute(new Runnable() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda5
            @Override // java.lang.Runnable
            public final void run() {
                DriveServiceHelper.this.lambda$createFile$0(dbExport, taskCompletionSource);
            }
        });
        return taskCompletionSource.getTask();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$createFile$0(ByteArrayContent dbExport, TaskCompletionSource taskCompletionSource) {
        String timestamp;
        try {
            try {
                String deviceName = Build.MODEL;
                if (deviceName == null || deviceName.trim().isEmpty()) {
                    deviceName = "Device";
                }
                try {
                    timestamp = new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss", Locale.getDefault()).format(new Date());
                } catch (Exception e) {
                    timestamp = String.valueOf(System.currentTimeMillis());
                }
                String filename = String.format("%s_%s.db", deviceName.replaceAll("[^a-zA-Z0-9.-]", "_"), timestamp);
                com.google.api.services.drive.model.File metadata = new com.google.api.services.drive.model.File().setParents(Collections.singletonList("root")).setMimeType("application/x-sqlite3").setName(filename);
                com.google.api.services.drive.model.File googleFile = this.mDriveService.files().create(metadata, dbExport).execute();
                try {
                    googleFile = this.mDriveService.files().create(metadata, dbExport).execute();
                } catch (IOException e2) {
                    taskCompletionSource.setException(e2);
                }
                if (googleFile == null) {
                    taskCompletionSource.setException(new IOException("Null result when requesting file creation."));
                } else {
                    taskCompletionSource.setResult(googleFile.getId());
                }
            } catch (Exception e3) {
                taskCompletionSource.setException(e3);
            }
        } catch (UserRecoverableAuthIOException e4) {
            Log.e("DriveServiceHelper", "Permissão necessária para acessar o Drive.");
            Intent intent = e4.getIntent();
            Context context = this.mContext.getApplicationContext();
            if (context instanceof Activity) {
                ((Activity) context).startActivityForResult(intent, 1001);
            } else {
                Log.e("DriveServiceHelper", "Contexto não é uma Activity. Não foi possível solicitar permissão.");
            }
        }
    }

    private void performBackup(DriveServiceHelper driveHelper) {
        this.dialogHelper.updateMessage("Exportando banco de dados");
        ByteArrayContent dbExport = driveHelper.exportDatabase(this.mContext.getDatabasePath(DatabaseHelper.DATABASE_NAME).toString());
        this.dialogHelper.updateMessage("Iniciando criação do arquivo no Drive");
        driveHelper.createFile(dbExport).addOnFailureListener(new OnFailureListener() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda0
            @Override // com.google.android.gms.tasks.OnFailureListener
            public final void onFailure(Exception exc) {
                Log.e(DriveServiceHelper.TAG, "Não foi possivel criar arquivo.", exc);
            }
        });
    }

    public Task<FileList> listFiles() {
        final TaskCompletionSource<FileList> taskCompletionSource = new TaskCompletionSource<>();
        this.mExecutor.execute(new Runnable() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                DriveServiceHelper.this.lambda$listFiles$3(taskCompletionSource);
            }
        });
        return taskCompletionSource.getTask();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$listFiles$3(TaskCompletionSource taskCompletionSource) {
        try {
            FileList result = this.mDriveService.files().list().setSpaces("drive").setFields2("files(createdTime,id,name)").execute();
            taskCompletionSource.setResult(result);
        } catch (UserRecoverableAuthIOException urae) {
            final Intent intent = urae.getIntent();
            this.activity.runOnUiThread(new Runnable() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda6
                @Override // java.lang.Runnable
                public final void run() {
                    DriveServiceHelper.this.lambda$listFiles$2(intent);
                }
            });
        } catch (IOException e) {
            taskCompletionSource.setException(e);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$listFiles$2(Intent intent) {
        this.activity.startActivityForResult(intent, 1001);
    }

    public Task<Void> deleteFile(final String fileID) throws IOException {
        final TaskCompletionSource<Void> taskCompletionSource = new TaskCompletionSource<>();
        this.mExecutor.execute(new Runnable() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                DriveServiceHelper.this.lambda$deleteFile$4(fileID, taskCompletionSource);
            }
        });
        return taskCompletionSource.getTask();
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$deleteFile$4(String fileID, TaskCompletionSource taskCompletionSource) {
        try {
            this.mDriveService.files().delete(fileID).execute();
            taskCompletionSource.setResult(null);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteFilesSequentially(final DriveServiceHelper driveHelper, final List<String> fileIds, final int index) throws IOException {
        if (index >= fileIds.size()) {
            return;
        }
        final String fileId = fileIds.get(index);
        driveHelper.deleteFile(fileId).addOnSuccessListener(new OnSuccessListener() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda7
            @Override // com.google.android.gms.tasks.OnSuccessListener
            public final void onSuccess(Object obj) {
                DriveServiceHelper.this.lambda$deleteFilesSequentially$5(fileId, driveHelper, fileIds, index, (Void) obj);
            }
        }).addOnFailureListener(new OnFailureListener() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda8
            @Override // com.google.android.gms.tasks.OnFailureListener
            public final void onFailure(Exception exc) {
                DriveServiceHelper.this.lambda$deleteFilesSequentially$6(fileId, driveHelper, fileIds, index, exc);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$deleteFilesSequentially$5(String fileId, DriveServiceHelper driveHelper, List fileIds, int index, Void aVoid) {
        Log.d(TAG, "Arquivo deletado: " + fileId);
        try {
            deleteFilesSequentially(driveHelper, fileIds, index + 1);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$deleteFilesSequentially$6(String fileId, DriveServiceHelper driveHelper, List fileIds, int index, Exception e) {
        Log.e(TAG, "Falha ao deletar arquivo: " + fileId, e);
        try {
            deleteFilesSequentially(driveHelper, fileIds, index + 1);
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }

    public void cleanOldFiles(final DriveServiceHelper driveHelper) {
        driveHelper.listFiles().addOnSuccessListener(new OnSuccessListener() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda1
            @Override // com.google.android.gms.tasks.OnSuccessListener
            public final void onSuccess(Object obj) {
                DriveServiceHelper.this.lambda$cleanOldFiles$7(driveHelper, (FileList) obj);
            }
        }).addOnFailureListener(new OnFailureListener() { // da classe: com.coleta.ambientuus.googleDrive.DriveServiceHelper$$ExternalSyntheticLambda2
            @Override // com.google.android.gms.tasks.OnFailureListener
            public final void onFailure(Exception exc) {
                Log.e(DriveServiceHelper.TAG, "Erro ao listar arquivos", exc);
            }
        });
    }

    /* JADX INFO: modificadores de acesso alterados de: private */
    public /* sintético */ void lambda$cleanOldFiles$7(DriveServiceHelper driveHelper, FileList fileList) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        int today = Integer.parseInt(dateFormat.format(new Date()));
        List<String> filesToDelete = new ArrayList<>();
        for (com.google.api.services.drive.model.File file : fileList.getFiles()) {
            try {
                String createdDateStr = file.getCreatedTime().toString().substring(0, 10);
                int fileDate = Integer.parseInt(createdDateStr.replace("-", ""));
                if (today - fileDate >= 30) {
                    filesToDelete.add(file.getId());
                }
            } catch (Exception e) {
                Log.e(TAG, "Erro ao processar data do arquivo", e);
            }
        }
        try {
            deleteFilesSequentially(driveHelper, filesToDelete, 0);
        } catch (IOException e2) {
            throw new RuntimeException(e2);
        }
    }

    public void backupDatabase() {
        GoogleAccountCredential credential = GoogleAccountCredential.usingOAuth2(this.mContext, Collections.singleton("https://www.googleapis.com/auth/drive.file"));
        credential.setSelectedAccount(this.account);
        Drive googleDriveService = new Drive.Builder(AndroidHttp.newCompatibleTransport(), new GsonFactory(), credential).setApplicationName("Coleta Ambientus").build();
        DriveServiceHelper driveHelper = new DriveServiceHelper(googleDriveService, this.mContext, this.account, this.dialogHelper, this.activity);
        performBackup(driveHelper);
        this.dialogHelper.updateMessage("Limpando arquivos antigos");
        cleanOldFiles(driveHelper);
    }
}
