package com.coleta.ambientuus.ws.Services;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.widget.Toast;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.coleta.ambientuus.dto.list.MovimentoBombonaList;
import com.google.api.client.http.HttpMethods;
import com.google.common.net.HttpHeaders;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

/* carregado de: classes6.dex */
public class BFJsonMovimentoBombona extends AsyncTask<List<MovimentoBombona>, Void, Void> {
    private static final String URL_JSON_MOVIMENTO_BOMBONA = "http://ambientuus-tipartner.ddns.com.br:8085/ords/portalcliente/appcoleta/inseriMovimentoBombona";
    private Context context;
    private ProgressDialog dialog;
    private List<MovimentoBombona> movtos;

    public BFJsonMovimentoBombona(Context context, List<MovimentoBombona> movtos) {
        this.context = context;
        this.movtos = movtos;
    }

    @Override // android.os.AsyncTask
    protected void onPreExecute() {
        this.dialog = ProgressDialog.show(this.context, "Atualizando dados!", "Por favor aguarde....", true);
    }

    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // android.os.AsyncTask
    public Void doInBackground(List<MovimentoBombona>... lists) {
        HttpURLConnection con = null;
        try {
            try {
                MovimentoBombonaList BOMBONAS = new MovimentoBombonaList();
                BOMBONAS.setBOMBONAS(this.movtos);
                String jsonInputString = new Gson().toJson(BOMBONAS);
                URL url = new URL(URL_JSON_MOVIMENTO_BOMBONA);
                con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod(HttpMethods.POST);
                con.setRequestProperty(HttpHeaders.CONTENT_TYPE, "application/json; utf-8");
                con.setRequestProperty(HttpHeaders.ACCEPT, "application/json");
                con.setDoOutput(true);
                OutputStream os = con.getOutputStream();
                try {
                    byte[] input = jsonInputString.getBytes("utf-8");
                    os.write(input, 0, input.length);
                    if (os != null) {
                        os.close();
                    }
                    BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
                    try {
                        StringBuilder response = new StringBuilder();
                        while (true) {
                            String responseLine = br.readLine();
                            if (responseLine == null) {
                                break;
                            }
                            response.append(responseLine.trim());
                        }
                        br.close();
                        if (con == null) {
                            return null;
                        }
                    } catch (Throwable th) {
                        try {
                            br.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                        throw th;
                    }
                } catch (Throwable th3) {
                    if (os != null) {
                        try {
                            os.close();
                        } catch (Throwable th4) {
                            th3.addSuppressed(th4);
                        }
                    }
                    throw th3;
                }
            } catch (Exception e) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                e.printStackTrace(pw);
                String message = sw.toString();
                error(message);
                if (0 == 0) {
                    return null;
                }
            }
            con.disconnect();
            return null;
        } catch (Throwable th5) {
            if (0 != 0) {
                con.disconnect();
            }
            throw th5;
        }
    }

    /* JADX INFO: modificadores de acesso alterados de: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(Void aVoid) {
        this.dialog.dismiss();
        Toast.makeText(this.context, "Dados enviados com sucesso!", 1).show();
    }

    private static void error(String log) {
        System.out.println(log);
    }
}
