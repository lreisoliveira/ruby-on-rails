class QuestionarioResposta < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :participante
  belongs_to :pergunta
  belongs_to :alternativa
end
