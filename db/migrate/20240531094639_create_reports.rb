class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :driver_name
      t.string :driver_license_nu
      t.string :driver_mobile_nu
      t.string :vehicle_type
      t.string :vehicle_registration_nu
      t.string :status
      t.integer :parking_charge
      t.references :parking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
