class QuestionariosPerguntasController < ApplicationController

  before_action :set_questionario_pergunta, only: [:index, :show, :edit, :update, :destroy]

  include ApplicationHelper

  # GET /questionarios_perguntas
  # GET /questionarios_perguntas.json
  def index
    # autenticar_admin
    @questionarios_perguntas = Pergunta.all.where('questionario_id in (?)', params[:id])
    @questionario = Questionario.find(params[:id])
    session[:questionario_id] = params[:id]
  end

  # GET /questionarios_perguntas/1
  # GET /questionarios_perguntas/1.json
  def show
    # autenticar_admin
    @questionario = params[:id]
  end

  # GET /questionarios_perguntas/new
  def new
    # autenticar_admin
    @questionario_pergunta = Pergunta.new

    perguntas_adicionadas = Pergunta.select('id').where('questionario_id in (?)', params[:id])
    @perguntas = Pergunta.all.where('vigente = true and id not in (?)', perguntas_adicionadas)

    @questionario_id = params[:id]
  end

  # GET /questionarios_perguntas/1/edit
  def edit
  end

  # POST /questionarios_perguntas
  # POST /questionarios_perguntas.json
  def create
    autenticar_admin
    @questionario_pergunta = QuestionarioPergunta.new(questionario_pergunta_params)
    respond_to do |format|
      if @questionario_pergunta.save
        format.html { redirect_to @questionario_pergunta, notice: 'A pergunta foi adicionada ao questionário!' }
        format.json { render :show, status: :created, location: @questionario_pergunta }
      else
        format.html { render :new }
        format.json { render json: @questionario_pergunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionarios_perguntas/1
  # PATCH/PUT /questionarios_perguntas/1.json
  # def update
  #   autenticar_admin
  #   respond_to do |format|
  #     if @questionario_pergunta.update(questionario_pergunta_params)
  #       format.html { redirect_to @questionario_pergunta, notice: 'Questionario pergunta was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @questionario_pergunta }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @questionario_pergunta.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /questionarios_perguntas/1
  # DELETE /questionarios_perguntas/1.json
  def destroy
    # autenticar_admin
    @questionario_pergunta.destroy
    respond_to do |format|
      format.html { redirect_to "/questionarios/#{session[:questionario_id]}/perguntas", notice: 'A  pergunta foi desvinculada do questionário!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionario_pergunta
      @questionario_pergunta = QuestionarioPergunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionario_pergunta_params
      params.require(:questionario_pergunta).permit(:questionario_id, :pergunta_id)
    end
end
