class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :service
      t.string :name
      t.string :options
      t.decimal :parts_cost, :precision => 8, :scale => 2
      t.decimal :labor_cost, :precision => 8, :scale => 2

      t.timestamps
    end
    add_index :line_items, :service_id
  end
end
