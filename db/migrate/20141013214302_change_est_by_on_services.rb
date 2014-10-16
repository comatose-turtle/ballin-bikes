class ChangeEstByOnServices < ActiveRecord::Migration
  def up
    change_column :services, :est_by, :date
  end

  def down
    change_column :services, :est_by, :string
  end
end
