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
    self.driver_name ||= parking.user.name
    self.driver_license_nu ||= parking.user.license_nu
    self.driver_mobile_nu ||= parking.user.mobile_nu
    self.vehicle_type ||= parking.vehicle.vehicle_price.type_name
    self.vehicle_registration_nu ||= parking.vehicle.registration_num
    self.parking_charge ||= charge_calculate(parking)
   
  end
  
  def charge_calculate(parking)
    # debugger
    curr_price = parking.vehicle.vehicle_price.price
    total_hours = (parking.check_out - parking.check_in) / 3600.00
    actual_price = curr_price * total_hours
  end
end
