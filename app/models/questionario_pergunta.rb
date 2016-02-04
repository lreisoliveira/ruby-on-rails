class QuestionarioPergunta < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :pergunta
end
