class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.string :name
      t.integer :age
      t.integer :weight
      t.integer :height
      t.string :country
      t.integer :position
      t.string :position_strg
      t.string :group

      t.timestamps
    end
  end
end
