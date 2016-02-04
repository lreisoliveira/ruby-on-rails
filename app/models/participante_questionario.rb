class ParticipanteQuestionario < ActiveRecord::Base
  belongs_to :questionario
  belongs_to :participante
end