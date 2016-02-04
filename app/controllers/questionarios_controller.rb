class QuestionariosController < ApplicationController
  before_action :set_questionario, only: [:index, :show, :edit, :update, :destroy]

  include ApplicationHelper

  # GET /questionarios
  # GET /questionarios.json
  def index
    render json: @questionarios, status: :not_found
  end

  # GET /questionarios/1
  # GET /questionarios/1.json
  def show
    render json: @questionarios, status: :not_found
  end

  # GET /questionarios/new
  def new
    autenticar_admin
    @questionario = Questionario.new
  end

  # GET /questionarios/1/edit
  def edit
  end

  # POST /questionarios
  # POST /questionarios.json
  def create
    autenticar_admin
    @questionario = Questionario.new(questionario_params)

    respond_to do |format|
      if @questionario.save
        format.html { redirect_to @questionario, notice: 'Questionário criado!' }
        format.json { render :show, status: :created, location: @questionario }
      else
        format.html { render :new }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionarios/1
  # PATCH/PUT /questionarios/1.json
  def update
    autenticar_admin
    respond_to do |format|
      if @questionario.update(questionario_params)
        format.html { redirect_to @questionario, notice: 'Questionário atualizado!' }
        format.json { render :show, status: :ok, location: @questionario }
      else
        format.html { render :edit }
        format.json { render json: @questionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionarios/1
  # DELETE /questionarios/1.json
  def destroy
    autenticar_admin
    @questionario.destroy
    respond_to do |format|
      format.html { redirect_to questionarios_url, notice: 'Questionário excluído!' }
      format.json { head :no_content }
    end
  end

  def validar_acesso(funcionario)
    validacao = funcionario[0]['situacao']['id'] == 1 && funcionario[0]['cargo'] != 'Estagiario' ? true : false
    if validacao
      participante = Participante.where(re: funcionario[0]['re']).first
      if participante.nil?
        participante = Participante.create({re: funcionario[0]['re'], nome: funcionario[0]['nome']})
      end
      session[:participante_id]   = participante.id
      session[:participante_re]   = participante.re
      session[:participante_nome] = participante.nome
      return true
    end
    return false
  end

  def listar
    if !params[:re].nil?
      funcionario = Apdata.get('cd_solicitante=' + params[:re].to_s)
      if funcionario.count == 0
        @mensagem = 'Colaborador não encontrado. Verifique se o RE informado está correto'
      end
    end

    @acesso = nil

    unless funcionario.nil? || funcionario.count == 0
      @acesso = validar_acesso(funcionario)
      unless @acesso
        @mensagem = 'Colaborador não habilitado para acessar o questionário'
      end
      @participante_re   = session[:participante_re]
      @participante_nome = session[:participante_nome]
      @questionarios     = Questionario.all.where('"' + Time.now.strftime("%Y-%m-%d") + '" between vigencia_inicio and vigencia_fim and id not in (?)', ParticipanteQuestionario.select('questionario_id').where(participante_id: session[:participante_id]))
    end
  end

  def responder
    autenticar_funcionario
    @participante_id        = session[:participante_id]
    @participante_re        = session[:participante_re]
    @participante_nome      = session[:participante_nome]
    @respondeu_questionario = ParticipanteQuestionario.where(participante_id: @participante_id, questionario_id: params[:id]).count

    if @respondeu_questionario == 0
      # se parametro da pergunta id não for informado, busca a primeira questão a ser mostrada
      if params[:pergunta_id].nil?
        @questionario_pergunta = Pergunta.where(questionario_id: params[:id]).first
      else
        # se parâmetro da pergunta id for informado, significa que participante respondeu pergunta anterior
        # então grava-se essa resposta e busca a próxima pergunta para ser exibida (se existir)
        gravar_resposta(params)
        @questionario_pergunta = proxima_questao(params)
        validar_sequencia(params, @questionario_pergunta)
      end
    else
      @mensagem = 'Este questionário já foi respondido'
    end
  end

  def gravar_resposta(params)
    respondeu = ParticipanteAlternativa.joins(:alternativa => [:pergunta]).where('participante_id = ? and perguntas.id = ?', params[:participante_id], params[:pergunta_id]).first
    if respondeu.nil?
      ParticipanteAlternativa.create({participante_id: params[:participante_id], alternativa_id: params[:alternativa]})
    else
      ParticipanteAlternativa.update(respondeu.id, {alternativa_id:  params[:alternativa]})
    end
  end

  def proxima_questao(params)
    Pergunta.where('questionario_id = ? and id > ?', params[:id], params[:pergunta_id]).first
  end

  def validar_sequencia(params, questionario_pergunta)
    if questionario_pergunta.nil?
      ParticipanteQuestionario.create({participante_id: session[:participante_id],questionario_id: params[:questionario_id]})
      reset_session
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionario
      if params[:id]
        @questionarios = Questionario.find(params[:id])
      else
        @questionarios = Questionario.all
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionario_params
      params.require(:questionario).permit(:nome, :vigencia_inicio, :vigencia_fim)
    end
end
