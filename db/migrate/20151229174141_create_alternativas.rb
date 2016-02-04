class CreateAlternativas < ActiveRecord::Migration
  def change
    create_table :alternativas do |t|
      t.references :pergunta, index: true, foreign_key: true
      t.string :descricao
      t.boolean :correto

      t.timestamps null: false
    end
  end
end
