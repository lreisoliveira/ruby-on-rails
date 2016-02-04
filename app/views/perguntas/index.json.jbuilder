json.array!(@perguntas) do |pergunta|
  json.extract! pergunta, :id, :questionario_id, :descricao, :video, :vigente
  json.url pergunta_url(pergunta, format: :json)
end
