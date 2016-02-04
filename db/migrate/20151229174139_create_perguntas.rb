class CreatePerguntas < ActiveRecord::Migration
  def change
    create_table :perguntas do |t|
      t.references :questionario, index: true, foreign_key: true
      t.string :descricao
      t.string :video
      t.boolean :vigente

      t.timestamps null: false
    end
  end
end
