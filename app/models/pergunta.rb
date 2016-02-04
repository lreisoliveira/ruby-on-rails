class Pergunta < ActiveRecord::Base
  validates_presence_of :descricao

  belongs_to :questionario
  has_many :alternativa
end
