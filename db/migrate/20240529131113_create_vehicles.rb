class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|

      t.boolean :insurance
      t.string :registration_num
      t.references :user, null: false, foreign_key: true
      t.references :vehicle_price, null: false, foreign_key: true

      t.timestamps
    end
  end
end
