class AlternativasController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_alternativa, only: [:show, :edit, :update, :destroy]

  def index
    render json: Alternativa.all, status: :ok
  end

  def show
    render json: Alternativa.find(params[:id]), status: :ok
  end

  def create
    @alternativa = Alternativa.create(alternativa_params)
    render json: @alternativa, status: :ok
  end

  def update
    @alternativa = Alternativa.update(params[:id],alternativa_params)
    render json: @alternativa, status: :ok
  end

  def destroy
    @perguntas = Alternativa.delete(params[:id])
    render json: @alternativa, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alternativa
      @alternativa = Alternativa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alternativa_params
      # params.require(:alternativa).permit(:pergunta_id, :descricao, :correto)
      params.permit(:pergunta_id, :descricao, :correto)
    end
end