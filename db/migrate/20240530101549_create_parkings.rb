class CreateParkings < ActiveRecord::Migration[7.1]
  def change
    create_table :parkings do |t|

      t.datetime :check_in
      t.datetime :check_out
      t.string :status
      t.references :vehicle, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
