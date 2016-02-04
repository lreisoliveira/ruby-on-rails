class QuestionariosRespostasController < ApplicationController
  before_action :set_questionario_resposta, only: [:show, :edit, :update, :destroy]

  # GET /questionarios_respostas
  # GET /questionarios_respostas.json
  def index
    @questionarios_respostas = QuestionarioResposta.all
  end

  # GET /questionarios_respostas/1
  # GET /questionarios_respostas/1.json
  def show
  end

  # GET /questionarios_respostas/new
  def new
    @questionario_resposta = QuestionarioResposta.new
  end

  # GET /questionarios_respostas/1/edit
  def edit
  end

  # POST /questionarios_respostas
  # POST /questionarios_respostas.json
  def create
    @questionario_resposta = QuestionarioResposta.new(questionario_resposta_params)

    respond_to do |format|
      if @questionario_resposta.save
        format.html { redirect_to @questionario_resposta, notice: 'Questionario resposta was successfully created.' }
        format.json { render :show, status: :created, location: @questionario_resposta }
      else
        format.html { render :new }
        format.json { render json: @questionario_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionarios_respostas/1
  # PATCH/PUT /questionarios_respostas/1.json
  def update
    respond_to do |format|
      if @questionario_resposta.update(questionario_resposta_params)
        format.html { redirect_to @questionario_resposta, notice: 'Questionario resposta was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionario_resposta }
      else
        format.html { render :edit }
        format.json { render json: @questionario_resposta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionarios_respostas/1
  # DELETE /questionarios_respostas/1.json
  def destroy
    @questionario_resposta.destroy
    respond_to do |format|
      format.html { redirect_to questionarios_respostas_url, notice: 'Questionario resposta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionario_resposta
      @questionario_resposta = QuestionarioResposta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionario_resposta_params
      params.require(:questionario_resposta).permit(:questionario_id, :participante_id, :pergunta_id, :alternativa_id)
    end
end
