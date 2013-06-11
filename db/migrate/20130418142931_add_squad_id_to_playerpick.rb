class AddSquadIdToPlayerpick < ActiveRecord::Migration
  def change
     add_column :playerpicks, :squad_id, :integer
    add_index  :playerpicks, :squad_id
  end
end
