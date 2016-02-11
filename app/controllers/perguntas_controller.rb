class PerguntasController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before_action :set_pergunta, only: [:show, :edit, :update, :destroy]

  include ApplicationHelper

  def index
    render json: Pergunta.all, status: :ok
  end

  def show
    render json: Pergunta.find(params[:id]), status: :ok
  end

  def create
    @pergunta = Pergunta.create(pergunta_params)
    render json: @pergunta, status: :ok
 end

  def update
    @pergunta = Pergunta.update(params[:id], pergunta_params)
    render json: @pergunta, status: :ok
  end

  def destroy
    alternativas = Alternativa.where(pergunta_id: params[:id]).count
    if alternativas == 0
      @pergunta = Pergunta.delete(params[:id])
      render json: @pergunta, status: :ok
    else
      render json: {mensagem: 'Não foi possível excluir a pergunta pois há alternativas relacionadas'}, status: :ok
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pergunta
      # @pergunta = Pergunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pergunta_params
      # @questionarios = Questionario.all
      # params.require(:pergunta).permit(:questionario_id, :descricao, :video, :vigente)
      params.permit(:questionario_id, :descricao, :video, :vigente)
    end
  end
