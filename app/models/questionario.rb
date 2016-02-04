class Questionario < ActiveRecord::Base
  validates_presence_of :nome
  has_and_belongs_to_many :participantes
  has_many :perguntas
end
