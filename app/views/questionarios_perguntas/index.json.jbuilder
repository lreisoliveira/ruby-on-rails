json.array!(@questionarios_perguntas) do |questionario_pergunta|
  json.extract! questionario_pergunta, :id, :questionario_id, :pergunta_id
  json.url questionario_pergunta_url(questionario_pergunta, format: :json)
end
