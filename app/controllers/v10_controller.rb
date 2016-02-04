class V10Controller < ApplicationController

  # GET /questionarios/
  # GET /questionarios/id
  # GET /questionarios/id.json
  def show
    if params[:id]
      @questionario = Questionario.find(params[:id])
    else
      @questionario = Questionario.all
    end
    render json: @questionario, status: :ok
  end

  # GET /questionarios/id/perguntas/
  # GET /questionarios/id/perguntas/id_pergunta
  def perguntas
    if params[:id_pergunta]
      @perguntas = Pergunta.where(questionario_id: params[:id], id: params[:id_pergunta])
    else
      @perguntas = Pergunta.where(questionario_id: params[:id])
    end
    render json: @perguntas, status: :ok
  end

end