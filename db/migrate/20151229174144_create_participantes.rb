class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.integer :re
      t.string :nome

      t.timestamps null: false
    end
  end
end
