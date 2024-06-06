class RemoveColumnFromParking < ActiveRecord::Migration[7.1]
  def change
    remove_column :parkings, :status, :string
  end
end
