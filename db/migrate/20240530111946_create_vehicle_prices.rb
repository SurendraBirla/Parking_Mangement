class CreateVehiclePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicle_prices do |t|
      t.string :type_name
      t.integer :price

      t.timestamps
    end
  end
end
