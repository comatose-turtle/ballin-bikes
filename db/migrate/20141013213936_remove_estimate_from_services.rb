class RemoveEstimateFromServices < ActiveRecord::Migration
  def up
    remove_column :services, :estimate
  end

  def down
    add_column :services, :estimate, :boolean
  end
end
