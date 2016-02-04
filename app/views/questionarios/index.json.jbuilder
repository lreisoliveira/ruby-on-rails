json.array!(@questionarios) do |questionario|
  json.extract! questionario, :id, :descricao, :vigencia_inicio, :vigencia_fim
  json.url questionario_url(questionario, format: :json)
end
