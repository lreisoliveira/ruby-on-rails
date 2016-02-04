json.array!(@alternativas) do |alternativa|
  json.extract! alternativa, :id, :pergunta_id, :descricao, :correto
  json.url alternativa_url(alternativa, format: :json)
end
