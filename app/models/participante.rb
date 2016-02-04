class Participante < ActiveRecord::Base
  has_and_belongs_to_many :questionarios
  has_and_belongs_to_many :alternativas

end
