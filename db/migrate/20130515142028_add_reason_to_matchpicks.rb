class AddReasonToMatchpicks < ActiveRecord::Migration
  def change
        add_column :matchpicks, :reason, :string
  end
end
