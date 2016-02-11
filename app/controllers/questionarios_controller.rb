class QuestionariosController < ApplicationController
  before_action :set_questionario, only: [:index, :show, :create, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    render json: @questionarios, status: :ok
  end

  def show
    render json: @questionarios, status: :ok
  end

  def create
    @questionario = Questionario.create(questionario_params)
    render json: @questionario, status: :ok
  end

  def update
    @questionario = Questionario.update(params[:id], questionario_params)
    render json: @questionario, status: :ok
  end

  def destroy
    perguntas  = Pergunta.where(questionario_id: params[:id]).count
    if perguntas == 0
      @questionario = Questionario.delete(params[:id])
      render json: @questionario, status: :ok
    else
      render json: {mensagem: 'Não foi possível excluir a questão pois há perguntas relacionadas'}, status: :ok
    end
  end

  # def listar
  #   if !params[:re].nil?
  #     funcionario = Apdata.get('cd_solicitante=' + params[:re].to_s)
  #     if funcionario.count == 0
  #       @mensagem = 'Colaborador não encontrado. Verifique se o RE informado está correto'
  #     end
  #   end
  #
  #   @acesso = nil
  #
  #   unless funcionario.nil? || funcionario.count == 0
  #     @participante_re   = session[:participante_re]
  #     @participante_nome = session[:participante_nome]
  #     @questionarios     = Questionario.all.where('"' + Time.now.strftime("%Y-%m-%d") + '" between vigencia_inicio and vigencia_fim and id not in (?)', ParticipanteQuestionario.select('questionario_id').where(participante_id: session[:participante_id]))
  #   end
  # end

  # def responder
  #   autenticar_funcionario
  #   @participante_id        = session[:participante_id]
  #   @participante_re        = session[:participante_re]
  #   @participante_nome      = session[:participante_nome]
  #   @respondeu_questionario = ParticipanteQuestionario.where(participante_id: @participante_id, questionario_id: params[:id]).count
  #
  #   if @respondeu_questionario == 0
  #     # se parametro da pergunta id não for informado, busca a primeira questão a ser mostrada
  #     if params[:pergunta_id].nil?
  #       @questionario_pergunta = Pergunta.where(questionario_id: params[:id]).first
  #     else
  #       # se parâmetro da pergunta id for informado, significa que participante respondeu pergunta anterior
  #       # então grava-se essa resposta e busca a próxima pergunta para ser exibida (se existir)
  #       gravar_resposta(params)
  #       @questionario_pergunta = proxima_questao(params)
  #       validar_sequencia(params, @questionario_pergunta)
  #     end
  #   else
  #     @mensagem = 'Este questionário já foi respondido'
  #   end
  # end
  #
  # def gravar_resposta(params)
  #   respondeu = ParticipanteAlternativa.joins(:alternativa => [:pergunta]).where('participante_id = ? and perguntas.id = ?', params[:participante_id], params[:pergunta_id]).first
  #   if respondeu.nil?
  #     ParticipanteAlternativa.create({participante_id: params[:participante_id], alternativa_id: params[:alternativa]})
  #   else
  #     ParticipanteAlternativa.update(respondeu.id, {alternativa_id:  params[:alternativa]})
  #   end
  # end
  #
  # def proxima_questao(params)
  #   Pergunta.where('questionario_id = ? and id > ?', params[:id], params[:pergunta_id]).first
  # end
  #
  # def validar_sequencia(params, questionario_pergunta)
  #   if questionario_pergunta.nil?
  #     ParticipanteQuestionario.create({participante_id: session[:participante_id],questionario_id: params[:questionario_id]})
  #     reset_session
  #   end
  # end

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
      params.permit(:nome, :vigencia_inicio, :vigencia_fim)
      # @questionario = Opportunity.find(params[:questionario_id])
      # @link = @opportunity.links.find(link_params)
      # params.require(:questionario).permit(:nome, :vigencia_inicio, :vigencia_fim)
    end
end