json.array!(@questionarios_participantes) do |questionario_participante|
  json.extract! questionario_participante, :id, :questionario_id, :participante_id, :pontuacao
  json.url questionario_participante_url(questionario_participante, format: :json)
end
