class CreateAdmin < ActiveRecord::Migration
  def change
    create_table :admin do |t|
      t.string :nome
      t.string :login
      t.string :senha
      t.boolean :vigente

      t.timestamps null: false
    end
  end
end

