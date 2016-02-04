class Alternativa < ActiveRecord::Base
  belongs_to :pergunta
  validates_presence_of :descricao, :pergunta
end
