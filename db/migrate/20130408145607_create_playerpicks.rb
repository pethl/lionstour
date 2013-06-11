class CreatePlayerpicks < ActiveRecord::Migration
  def change
    create_table :playerpicks do |t|
      t.integer :matchpick_id
      t.string :name
      t.boolean :selected

      t.timestamps
    end
  end
end
