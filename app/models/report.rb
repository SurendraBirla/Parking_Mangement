class Report < ApplicationRecord
  belongs_to :parking
  # before_validation :set_details, on: :create

  def self.ransackable_associations(auth_object = nil)
    ["parking"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "driver_license_nu", "driver_mobile_nu", "driver_name", "id", "id_value", "parking_charge", "parking_id", "status", "updated_at", "vehicle_registration_nu", "vehicle_type"]
  end

  # private 

  def set_details(parking)
    # self.parking_id ||= parking.id
    self.driver_name ||= parking.user.name
    self.driver_license_nu ||= parking.user.license_nu
    self.driver_mobile_nu ||= parking.user.mobile_nu
    self.vehicle_type ||= parking.vehicle.vehicle_price.type_name
    self.vehicle_registration_nu ||= parking.vehicle.registration_num
    self.status ||= parking.status
    self.parking_charge ||= parking.vehicle.vehicle_price.price
   
  end

    # driver_name
    # driver_license_nu
    # driver_mobile_nu
    # vehicle_type
    # vehicle_registration_nu
    # status
    # parking_charge
    # parking_id
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false
    # t.index ["parking_id"], name: "index_reports_on_parking_id"


end
