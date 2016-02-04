class RelatoriosController < ApplicationController
  include ApplicationHelper

  def ranking
    autenticar_admin
    @questionarios = Questionario.all
  end

  def ranking_questionario
    autenticar_admin
    @questionario = Questionario.select(:nome).where(id: params['id']).first
    @lista = ParticipanteAlternativa.joins(:participante, :alternativa => [:pergunta => :questionario]).where('alternativas.correto = true and questionarios.id = ?', params[:id]).group('participantes.nome').order('count_all desc').count
  end

  def ranking_geral
    autenticar_admin
    @questionario = Questionario.select(:nome).where(id: params['id']).first
    @lista = ParticipanteAlternativa.joins(:participante, :alternativa => [:pergunta => :questionario]).where('alternativas.correto = true').group('participantes.nome').order('count_all desc').count
  end

end