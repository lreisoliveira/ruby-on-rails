class CreateParticipantesAlternativas < ActiveRecord::Migration
  def change
    create_table :participantes_alternativas do |t|
      t.references :participante, index: true, foreign_key: true
      t.references :alternativa, index: true, foreign_key: true
    end
  end
end

