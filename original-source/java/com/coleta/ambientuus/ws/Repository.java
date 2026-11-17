package com.coleta.ambientuus.ws;

import android.app.Activity;
import android.content.Context;
import com.coleta.ambientuus.database.DatabaseHelper;
import com.coleta.ambientuus.database.managers.BombonaTableManager;
import com.coleta.ambientuus.database.managers.ClienteMTRTableManager;
import com.coleta.ambientuus.database.managers.ManifestoTableManager;
import com.coleta.ambientuus.database.managers.MotoristaTableManager;
import com.coleta.ambientuus.database.managers.PlacasTableManager;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.database.managers.RotaTableManager;
import com.coleta.ambientuus.database.managers.TelasTableManager;
import com.coleta.ambientuus.database.managers.TerceiroTableManager;
import com.coleta.ambientuus.database.managers.TipoResiduoTableManager;
import com.coleta.ambientuus.database.managers.VolumeTableManager;
import com.coleta.ambientuus.domain.model.ModoSincronizacao;
import com.coleta.ambientuus.dto.Coleta;
import com.coleta.ambientuus.dto.MovimentoBombona;
import com.coleta.ambientuus.utils.ConsultaEtiquetaCallback;
import com.coleta.ambientuus.ws.Services.BombonasService;
import com.coleta.ambientuus.ws.Services.ClientesMTRService;
import com.coleta.ambientuus.ws.Services.ColetasService;
import com.coleta.ambientuus.ws.Services.ConsultaEtiquetaService;
import com.coleta.ambientuus.ws.Services.ManifestoService;
import com.coleta.ambientuus.ws.Services.MotoristasService;
import com.coleta.ambientuus.ws.Services.MovimentoBombonaService;
import com.coleta.ambientuus.ws.Services.PlacasService;
import com.coleta.ambientuus.ws.Services.PontoColetaService;
import com.coleta.ambientuus.ws.Services.RotasService;
import com.coleta.ambientuus.ws.Services.TelasService;
import com.coleta.ambientuus.ws.Services.TerceirosService;
import com.coleta.ambientuus.ws.Services.TipoResiduoService;
import com.coleta.ambientuus.ws.Services.VolumeService;
import java.io.IOException;
import java.util.List;

/* loaded from: classes4.dex */
public class Repository {
    private BombonasService bombonasService;
    private ClientesMTRService clientesMTRService;
    private ColetasService coletasService;
    private ConsultaEtiquetaService consultaEtiquetaService;
    private final DatabaseHelper db;
    private ManifestoService manifestoService;
    private MotoristasService motoristasService;
    private MovimentoBombonaService movimentoBombonaService;
    private PlacasService placasService;
    private PontoColetaService pontoColetaService;
    private RotasService rotasService;
    private TelasService telasService;
    private TerceirosService terceirosService;
    private TipoResiduoService tipoResiduoService;
    private VolumeService volumeService;

    public Repository(Context context, ModoSincronizacao modo, Integer idRota, String dataColeta, List<Coleta> coletas, List<MovimentoBombona> movimentos, Activity activity, String etiqueta) {
        this.db = new DatabaseHelper(context);
        switch (modo) {
            case COMPLETO:
                this.volumeService = new VolumeService();
                this.terceirosService = new TerceirosService();
                this.rotasService = new RotasService();
                this.placasService = new PlacasService();
                this.bombonasService = new BombonasService();
                this.motoristasService = new MotoristasService();
                this.clientesMTRService = new ClientesMTRService();
                this.telasService = new TelasService();
                this.tipoResiduoService = new TipoResiduoService();
                break;
            case POR_ROTA:
                this.manifestoService = new ManifestoService(idRota, dataColeta);
                this.pontoColetaService = new PontoColetaService(idRota, dataColeta);
                break;
            case ENVIO:
                this.coletasService = new ColetasService(context, coletas, activity);
                this.movimentoBombonaService = new MovimentoBombonaService(context, movimentos, activity);
                break;
            case CONSULTA:
                this.consultaEtiquetaService = new ConsultaEtiquetaService(etiqueta);
                break;
        }
    }

    public void sincronizarVolumes() throws IOException {
        this.volumeService.sincronizar(new VolumeTableManager(this.db.getDatabase()));
    }

    public void sincronizarTerceiros() throws IOException {
        this.terceirosService.sincronizar(new TerceiroTableManager(this.db.getDatabase()));
    }

    public void sincronizarRotas() throws IOException {
        this.rotasService.sincronizar(new RotaTableManager(this.db.getDatabase()));
    }

    public void sincronizarPlacas() throws IOException {
        this.placasService.sincronizar(new PlacasTableManager(this.db.getDatabase()));
    }

    public void sincronizarClientes() throws IOException {
        this.clientesMTRService.sincronizar(new ClienteMTRTableManager(this.db.getDatabase()));
    }

    public void sincronizarBombonas() throws IOException {
        this.bombonasService.sincronizar(new BombonaTableManager(this.db.getDatabase()));
    }

    public void sincronizarMotoristas() throws IOException {
        this.motoristasService.sincronizar(new MotoristaTableManager(this.db.getDatabase()));
    }

    public void sincronizarManifesto() throws IOException {
        this.manifestoService.sincronizar(new ManifestoTableManager(this.db.getDatabase()));
    }

    public void sincronizarTelas() throws IOException {
        this.telasService.sincronizar(new TelasTableManager(this.db.getDatabase()));
    }

    public void enviarMovimentos() throws IOException {
        this.movimentoBombonaService.enviarMovimentos();
    }

    public void enviarColetas() throws IOException {
        this.coletasService.enviarColetas();
    }

    public void sincronizarPontosColetas(Context context) throws IOException {
        this.pontoColetaService.sincronizar(new PontoColetaTableManager(this.db.getDatabase()), context);
    }

    public void sincronizarTipoResiduo() throws IOException {
        this.tipoResiduoService.sincronizar(new TipoResiduoTableManager(this.db.getDatabase()));
    }

    public void consultarEtiquetas(ConsultaEtiquetaCallback callback) {
        this.consultaEtiquetaService.consultar(callback);
    }
}
