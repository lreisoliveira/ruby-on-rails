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
    respond_to do |format|
      if @pergunta.update(pergunta_params)
        format.html { redirect_to @pergunta, notice: 'Pergunta atualizada!' }
        format.json { render :show, status: :ok, location: @pergunta }
      else
        format.html { render :edit }
        format.json { render json: @pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pergunta.destroy
    respond_to do |format|
      format.html { redirect_to perguntas_url, notice: 'Pergunta excluída!' }
      format.json { head :no_content }
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
