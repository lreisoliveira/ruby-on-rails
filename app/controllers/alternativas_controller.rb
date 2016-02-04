class AlternativasController < ApplicationController
  before_action :set_alternativa, only: [:show, :edit, :update, :destroy]

  def index
    if params[:pergunta_id]
      @alternativas = Alternativa.where(pergunta_id: params[:pergunta_id])
    else
      @alternativas = Alternativa.all
    end
    render json: @alternativas, status: :ok
  end

  def show
    if params[:pergunta_id]
      @alternativas = Alternativa.where(pergunta_id: params[:pergunta_id], id: params[:id])
    else
      @alternativas = Alternativa.all
    end
    render json: @alternativas, status: :not_found
  end

  # GET /alternativas/new
  def new
    @perguntas = Pergunta.all.where(vigente: true)
    @alternativa = Alternativa.new
  end

  # GET /alternativas/1/edit
  def edit
    @perguntas = Pergunta.all.where(vigente: true)
  end

  # POST /alternativas
  # POST /alternativas.json
  def create
    @perguntas = Pergunta.all.where(vigente: true)
    @alternativa = Alternativa.new(alternativa_params)

    respond_to do |format|
      if @alternativa.save
        format.html { redirect_to @alternativa, notice: 'Alternativa criada!' }
        format.json { render :show, status: :created, location: @alternativa }
      else
        format.html { render :new }
        format.json { render json: @alternativa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alternativas/1
  # PATCH/PUT /alternativas/1.json
  def update
    autenticar_admin
    @perguntas = Pergunta.all.where(vigente: true)
    respond_to do |format|
      if @alternativa.update(alternativa_params)
        format.html { redirect_to @alternativa, notice: 'Alternativa alterada!' }
        format.json { render :show, status: :ok, location: @alternativa }
      else
        format.html { render :edit }
        format.json { render json: @alternativa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alternativas/1
  # DELETE /alternativas/1.json
  def destroy
    @perguntas = Pergunta.all.where(vigente: true)
    @alternativa.destroy
    respond_to do |format|
      format.html { redirect_to alternativas_url, notice: 'Alternativa excluída!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alternativa
      @alternativa = Alternativa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alternativa_params
      params.require(:alternativa).permit(:pergunta_id, :descricao, :correto)
    end
end