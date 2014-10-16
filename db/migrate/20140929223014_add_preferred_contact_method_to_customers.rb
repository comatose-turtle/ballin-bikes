class AddPreferredContactMethodToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :preferred_contact_method, :string
  end
end
