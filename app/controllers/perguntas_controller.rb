class PerguntasController < ApplicationController

  # before_action :set_pergunta, only: [:show, :edit, :update, :destroy]

  include ApplicationHelper

  def index
    if params[:questionario_id]
      @perguntas = Pergunta.where(questionario_id: params[:questionario_id])
    else
      @perguntas = Pergunta.all
    end
    render json: @perguntas, status: :not_found
  end

  # GET /perguntas/1
  # GET /perguntas/1.json
  def show
    if params[:questionario_id]
      @perguntas = Pergunta.where(questionario_id: params[:questionario_id], id: params[:id])
    else
      @perguntas = Pergunta.find(params[:id])
    end
    render json: @perguntas, status: :not_found
  end

  # GET /perguntas/new
  def new
    # autenticar_admin
    @pergunta = Pergunta.new
    @questionarios = Questionario.all
  end

  # GET /perguntas/1/edit
  def edit
    # autenticar_admin
    @questionarios = Questionario.all
    @questionario_pergunta  = Pergunta.select(:questionario_id).where(id: params[:id]).first
  end

  # POST /perguntas
  # POST /perguntas.json
  def create
    autenticar_admin
    @pergunta = Pergunta.new(pergunta_params)

    respond_to do |format|
      if @pergunta.save
        format.html { redirect_to @pergunta, notice: 'Pergunta criada!' }
        format.json { render :show, status: :created, location: @pergunta }
      else
        format.html { render :new }
        format.json { render json: @pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perguntas/1
  # PATCH/PUT /perguntas/1.json
  def update
    autenticar_admin
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

  # DELETE /perguntas/1
  # DELETE /perguntas/1.json
  def destroy
    # autenticar_admin
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
    end
end
