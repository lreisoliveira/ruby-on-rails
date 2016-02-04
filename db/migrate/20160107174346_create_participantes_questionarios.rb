class CreateParticipantesQuestionarios < ActiveRecord::Migration
  def change
    create_table :participantes_questionarios do |t|
      t.references :participante, index: true, foreign_key: true
      t.references :questionario, index: true, foreign_key: true
    end
  end
end
