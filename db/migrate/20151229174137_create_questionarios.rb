class CreateQuestionarios < ActiveRecord::Migration
  def change
    create_table :questionarios do |t|
      t.string :nome
      t.date :vigencia_inicio
      t.date :vigencia_fim

      t.timestamps null: false
    end
  end
end
