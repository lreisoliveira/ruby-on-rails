class ParticipantesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_participante, only: [:show, :edit, :update, :destroy]

  def index
    if params[:alternativa_id]
      render json: ParticipanteAlternativa.where(alternativa_id: params[:alternativa_id]).map{|alternativa| alternativa.participante}, status: :ok
    else
      render json: Participante.all, status: :ok
    end
  end

  def show
    render json: Participante.find(params[:id]), status: :ok
  end

  def create
    @participante = Participante.create(participante_params)
    render json: @participante, status: :ok
  end

  def update
    @participante = Participante.update(params[:id],participante_params)
    render json: @participante, status: :ok
  end

  def destroy
    @participante = Participante.delete(params[:id])
    render json: @participante, status: :ok
  end

  def gravar_resposta
    respondeu = ParticipanteAlternativa.where(participante_id: params[:participante_id], alternativa_id: params[:id]).first
    if respondeu.nil?
      @resposta = ParticipanteAlternativa.create({participante_id: params[:participante_id], alternativa_id: params[:id]})
    else
      @resposta = ParticipanteAlternativa.update(respondeu.id, {alternativa_id:  params[:id]})
    end
    render json: @resposta, status: :ok
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participante
      @participante = Participante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participante_params
      # params.require(:participante).permit(:re, :nome)
      params.permit(:re, :nome)
    end
end
