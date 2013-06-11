class AddChooseToMatchpicks < ActiveRecord::Migration
  def change
      add_column :matchpicks, :choose, :string
  end
end
