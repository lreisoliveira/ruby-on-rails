json.array!(@questionarios_respostas) do |questionario_resposta|
  json.extract! questionario_resposta, :id, :questionario_id, :participante_id, :pergunta_id, :alternativa_id
  json.url questionario_resposta_url(questionario_resposta, format: :json)
end
