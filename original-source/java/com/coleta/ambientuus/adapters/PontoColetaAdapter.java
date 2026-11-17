package com.coleta.ambientuus.adapters;

import android.graphics.Color;
import android.text.SpannableString;
import android.text.style.StyleSpan;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.cardview.widget.CardView;
import androidx.credentials.exceptions.publickeycredential.DomExceptionUtils;
import androidx.exifinterface.media.ExifInterface;
import androidx.recyclerview.widget.RecyclerView;
import com.coleta.ambientuus.R;
import com.coleta.ambientuus.database.managers.PontoColetaTableManager;
import com.coleta.ambientuus.dto.PontoColeta;
import com.coleta.ambientuus.utils.TextStyles;
import java.util.ArrayList;

/* loaded from: classes12.dex */
public class PontoColetaAdapter extends RecyclerView.Adapter<ViewHolder> {
    private OnItemSelectListener onItemSelectListener;
    private final ArrayList<PontoColeta> pontoColetas;
    private int posicaoSelecionada = -1;

    public interface OnItemSelectListener {
        void onItemSelected(PontoColeta pontoColeta);
    }

    public void setOnItemSelectListener(OnItemSelectListener onItemSelectListener) {
        this.onItemSelectListener = onItemSelectListener;
    }

    public PontoColetaAdapter(ArrayList<PontoColeta> pontoColetas) {
        this.pontoColetas = pontoColetas;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        private final View fundoColetaExtra;
        private final View fundoColetaNova;
        private final ImageView iconeColetaExtra;
        private final ImageView iconeColetaNova;
        private final TextView tvDestinador;
        private final TextView tvEndereco;
        private final TextView tvExtra;
        private final TextView tvMtr;
        private final TextView tvNomeCliente;
        private final TextView tvNovo;
        private final TextView tvPeriodicidade;
        private final TextView tvResiduo;
        private final TextView tvVolumes;
        private final TextView tvVolumesLabel;

        public ViewHolder(View view) {
            super(view);
            this.tvNomeCliente = (TextView) view.findViewById(R.id.tvNomeCliente);
            this.tvEndereco = (TextView) view.findViewById(R.id.tvEndereco);
            this.tvMtr = (TextView) view.findViewById(R.id.tvMtr);
            this.tvDestinador = (TextView) view.findViewById(R.id.tvDestinador);
            this.tvResiduo = (TextView) view.findViewById(R.id.tvResiduo);
            this.tvPeriodicidade = (TextView) view.findViewById(R.id.tvPeriodicidade);
            this.fundoColetaExtra = view.findViewById(R.id.fundoColetaExtra);
            this.iconeColetaExtra = (ImageView) view.findViewById(R.id.iconeColetaExtra);
            this.tvExtra = (TextView) view.findViewById(R.id.tvExtra);
            this.fundoColetaNova = view.findViewById(R.id.fundoColetaNova);
            this.iconeColetaNova = (ImageView) view.findViewById(R.id.iconeColetaNova);
            this.tvNovo = (TextView) view.findViewById(R.id.tvNovo);
            this.tvVolumesLabel = (TextView) view.findViewById(R.id.tvVolumesLabel);
            this.tvVolumes = (TextView) view.findViewById(R.id.tvVolumes);
        }
    }

    private SpannableString getTextWithBoldPrefix(String base, String text) {
        SpannableString spannable = new SpannableString(base + text);
        spannable.setSpan(new StyleSpan(1), 0, base.length(), 33);
        return spannable;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_ponto_coleta, parent, false);
        return new ViewHolder(view);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder holder, int position) {
        final PontoColeta pontoColeta = this.pontoColetas.get(position);
        final int posicao = holder.getAdapterPosition();
        setStatusBackground(holder, pontoColeta.getStatus());
        setTextsData(holder, pontoColeta);
        displayBottomRightBadge(holder, pontoColeta);
        CardView item = (CardView) holder.itemView;
        if (posicao == this.posicaoSelecionada) {
            holder.itemView.setSelected(true);
            item.setCardElevation(8.0f);
        } else {
            holder.itemView.setSelected(false);
            item.setCardElevation(4.0f);
        }
        holder.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.coleta.ambientuus.adapters.PontoColetaAdapter$$ExternalSyntheticLambda0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                PontoColetaAdapter.this.lambda$onBindViewHolder$0(posicao, pontoColeta, view);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$onBindViewHolder$0(int posicao, PontoColeta pontoColeta, View v) {
        int previousSelected = this.posicaoSelecionada;
        this.posicaoSelecionada = posicao;
        notifyItemChanged(previousSelected);
        notifyItemChanged(this.posicaoSelecionada);
        if (this.onItemSelectListener != null) {
            this.onItemSelectListener.onItemSelected(pontoColeta);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.pontoColetas.size();
    }

    public void setTextsData(ViewHolder holder, PontoColeta pontoColeta) {
        holder.tvNomeCliente.setText(getTextWithBoldPrefix("Cliente: ", pontoColeta.getCodCliente() + " - " + pontoColeta.getRazaoSocial()));
        holder.tvEndereco.setText(getTextWithBoldPrefix("Endereço: ", pontoColeta.getEndereco()));
        if ("N".equals(pontoColeta.getClienteEmiteMtr())) {
            String numeroManifesto = pontoColeta.getNumeroManifesto();
            if (!numeroManifesto.contains("DC")) {
                holder.tvMtr.setText(getTextWithBoldPrefix("MTR: ", numeroManifesto));
            } else {
                holder.tvMtr.setText(getTextWithBoldPrefix("DC: ", numeroManifesto.replace("DC", "")));
            }
        } else {
            holder.tvMtr.setText(TextStyles.getTextBold("Cliente MTR"));
        }
        holder.tvDestinador.setText(getTextWithBoldPrefix("Destinador: ", pontoColeta.getDestino()));
        holder.tvPeriodicidade.setText(getTextWithBoldPrefix("Periodicidade: ", pontoColeta.getPeriodicidade()));
        String tipoResiduo = pontoColeta.getTipoResiduo();
        String volumes = tipoResiduo.substring(tipoResiduo.indexOf(DomExceptionUtils.SEPARATOR) + 1).replaceAll(",", "\n");
        holder.tvResiduo.setText(getTextWithBoldPrefix("Resíduo: ", tipoResiduo.substring(0, tipoResiduo.indexOf(DomExceptionUtils.SEPARATOR))));
        holder.tvVolumes.setText(volumes);
    }

    public void displayBottomRightBadge(ViewHolder holder, PontoColeta pontoColeta) {
        holder.fundoColetaExtra.setVisibility(ExifInterface.LATITUDE_SOUTH.equalsIgnoreCase(pontoColeta.getColetaExtra()) ? 0 : 8);
        holder.iconeColetaExtra.setVisibility(ExifInterface.LATITUDE_SOUTH.equalsIgnoreCase(pontoColeta.getColetaExtra()) ? 0 : 8);
        holder.tvExtra.setVisibility(ExifInterface.LATITUDE_SOUTH.equalsIgnoreCase(pontoColeta.getColetaExtra()) ? 0 : 8);
        holder.fundoColetaNova.setVisibility(ExifInterface.LATITUDE_SOUTH.equalsIgnoreCase(pontoColeta.getClienteNovo()) ? 0 : 8);
        holder.iconeColetaNova.setVisibility(ExifInterface.LATITUDE_SOUTH.equalsIgnoreCase(pontoColeta.getClienteNovo()) ? 0 : 8);
        holder.tvNovo.setVisibility(ExifInterface.LATITUDE_SOUTH.equalsIgnoreCase(pontoColeta.getClienteNovo()) ? 0 : 8);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void setStatusBackground(ViewHolder holder, String status) {
        char c;
        CardView item = (CardView) holder.itemView;
        switch (status.hashCode()) {
            case 47664:
                if (status.equals(PontoColetaTableManager.STATUS_PENDENTE)) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case 48625:
                if (status.equals(PontoColetaTableManager.STATUS_EDITAVEL)) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                item.setCardBackgroundColor(Color.parseColor("#DFF6EC"));
                holder.tvNomeCliente.setTextColor(Color.parseColor("#0a8a71"));
                holder.tvEndereco.setTextColor(Color.parseColor("#0a8a71"));
                holder.tvMtr.setTextColor(Color.parseColor("#0a8a71"));
                holder.tvDestinador.setTextColor(Color.parseColor("#0a8a71"));
                holder.tvResiduo.setTextColor(Color.parseColor("#0a8a71"));
                holder.tvPeriodicidade.setTextColor(Color.parseColor("#0a8a71"));
                holder.tvVolumesLabel.setTextColor(Color.parseColor("#0a8a71"));
                holder.tvVolumes.setTextColor(Color.parseColor("#0a8a71"));
                break;
            case 1:
                item.setCardBackgroundColor(Color.parseColor("#FFF9E5"));
                holder.tvNomeCliente.setTextColor(Color.parseColor("#B07C00"));
                holder.tvEndereco.setTextColor(Color.parseColor("#B07C00"));
                holder.tvMtr.setTextColor(Color.parseColor("#B07C00"));
                holder.tvDestinador.setTextColor(Color.parseColor("#B07C00"));
                holder.tvResiduo.setTextColor(Color.parseColor("#B07C00"));
                holder.tvPeriodicidade.setTextColor(Color.parseColor("#B07C00"));
                holder.tvVolumesLabel.setTextColor(Color.parseColor("#B07C00"));
                holder.tvVolumes.setTextColor(Color.parseColor("#B07C00"));
                break;
            default:
                item.setCardBackgroundColor(Color.parseColor("#F0F0F0"));
                holder.tvNomeCliente.setTextColor(Color.parseColor("#6E6E6E"));
                holder.tvEndereco.setTextColor(Color.parseColor("#6E6E6E"));
                holder.tvMtr.setTextColor(Color.parseColor("#6E6E6E"));
                holder.tvDestinador.setTextColor(Color.parseColor("#6E6E6E"));
                holder.tvResiduo.setTextColor(Color.parseColor("#6E6E6E"));
                holder.tvPeriodicidade.setTextColor(Color.parseColor("#6E6E6E"));
                holder.tvVolumesLabel.setTextColor(Color.parseColor("#6E6E6E"));
                holder.tvVolumes.setTextColor(Color.parseColor("#6E6E6E"));
                break;
        }
    }
}
