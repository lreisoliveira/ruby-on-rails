class QuestionariosParticipantesController < ApplicationController
  before_action :set_questionario_participante, only: [:show, :edit, :update, :destroy]

  # GET /questionarios_participantes
  # GET /questionarios_participantes.json
  def index
    @questionarios_participantes = QuestionarioParticipante.all
  end

  # GET /questionarios_participantes/1
  # GET /questionarios_participantes/1.json
  def show
  end

  # GET /questionarios_participantes/new
  def new
    @questionario_participante = QuestionarioParticipante.new
  end

  # GET /questionarios_participantes/1/edit
  def edit
  end

  # POST /questionarios_participantes
  # POST /questionarios_participantes.json
  def create
    @questionario_participante = QuestionarioParticipante.new(questionario_participante_params)

    respond_to do |format|
      if @questionario_participante.save
        format.html { redirect_to @questionario_participante, notice: 'Questionario participante was successfully created.' }
        format.json { render :show, status: :created, location: @questionario_participante }
      else
        format.html { render :new }
        format.json { render json: @questionario_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionarios_participantes/1
  # PATCH/PUT /questionarios_participantes/1.json
  def update
    respond_to do |format|
      if @questionario_participante.update(questionario_participante_params)
        format.html { redirect_to @questionario_participante, notice: 'Questionario participante was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionario_participante }
      else
        format.html { render :edit }
        format.json { render json: @questionario_participante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionarios_participantes/1
  # DELETE /questionarios_participantes/1.json
  def destroy
    @questionario_participante.destroy
    respond_to do |format|
      format.html { redirect_to questionarios_participantes_url, notice: 'Questionario participante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionario_participante
      @questionario_participante = QuestionarioParticipante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionario_participante_params
      params.require(:questionario_participante).permit(:questionario_id, :participante_id, :pontuacao)
    end
end
