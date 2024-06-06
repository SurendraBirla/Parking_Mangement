require 'rails_helper'

RSpec.describe Report, type: :model do

  it 'is valid with all attributes ' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.create(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id, user_id: user.id)
    parking = Parking.create(check_in:Time.now, check_out:Time.now+(60*60*10), user_id:user.id, vehicle_id:vehicle.id)
    report = Report.new(parking: parking)

    expect(report).to be_valid
  end

  # it 'is invalid without a user' do
  #   vehicle_price = VehiclePrice.create(type_name: "car", price: 20)
  #   vehicle = Vehicle.create(registration_num: 'ABC-4857', insurance: '3645', vehicle_price_id: vehicle_price.id)
  #   parking = Parking.create(check_in: Time.now, check_out: Time.now + (60 * 60 * 10), vehicle_id: vehicle.id)
  #   report = Report.new(parking: parking)

  #   expect(report).to_not be_valid
  # end

  # it 'is invalid without vehicle_price ' do
  #   user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
  #   vehicle = Vehicle.create(registration_num:'ABC-4857',insurance:'3645', user_id: user.id)
  #   parking = Parking.create(check_in:Time.now, check_out:Time.now+(60*60*10), user_id:user.id, vehicle_id:vehicle.id)
  #   report = Report.new(parking: parking)

  #   expect(report).to_not be_valid
  # end


end


# report = Report.new(driver_name:parking.user.name, driver_license_nu:parking.user.license_nu,driver_mobile_nu: parking.user.mobile_nu,vehicle_type: parking.vehicle.vehicle_price.type_name,
# vehicle_registration_nu: parking.vehicle.registration_num, parking_charge: charge_calculate(parking) , parking_id: parking.id).save
   