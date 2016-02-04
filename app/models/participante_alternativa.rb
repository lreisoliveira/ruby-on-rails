class ParticipanteAlternativa < ActiveRecord::Base
  belongs_to :participante
  belongs_to :alternativa
end