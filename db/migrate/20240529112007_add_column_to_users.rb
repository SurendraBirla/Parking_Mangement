class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_nu, :string
    add_column :users, :address, :string
  end
end
