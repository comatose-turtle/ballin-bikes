class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :customer
      t.string :item_description
      t.decimal :est_dollar, :precision => 8, :scale => 2
      t.string :est_by
      t.boolean :save_old_parts
      t.integer :number_of_items
      t.string :status
      t.string :color
      t.string :model
      t.string :make
      t.datetime :due_date
      t.text :completion_signature
      t.date :ready_and_notified_date
      t.string :work_performed_by
      t.boolean :estimate
      t.text :customer_comments
      t.text :authorized
      t.decimal :call_customer_if_repair_exceeds_amount, :precision => 8, :scale => 2
      t.text :mechanics_comments_and_recommendations
      t.text :safety_warning_signature
      t.date :safety_warning_date
      t.boolean :safety_warning_listed
      t.boolean :safety_warning_accepted
      t.decimal :parts_total, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :labor_total, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :tax, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :total, :precision => 8, :scale => 2, :default => 0.0, :null => false

      t.timestamps
    end
    add_index :services, :customer_id
  end
end
