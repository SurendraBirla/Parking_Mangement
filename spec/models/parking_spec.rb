require 'rails_helper'

RSpec.describe Parking, type: :model do
  it 'it is valid with all attributes ' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.create(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id, user_id: user.id)
    parking = Parking.new(check_in:Time.now, check_out:Time.now+(60*60*10), user_id:user.id, vehicle_id:vehicle.id).save
    expect(parking).to eq(true)
  end

  it 'it is not valid without  check_in ' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.create(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id, user_id: user.id)
    parking = Parking.new(check_out:Time.now+(60*60*10), user_id:user.id, vehicle_id:vehicle.id).save
    expect(parking).to eq(true)
  end

  it 'it is not valid without  check_out ' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.create(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id, user_id: user.id)
    parking = Parking.new(check_in:Time.now, user_id:user.id, vehicle_id:vehicle.id).save
    expect(parking).to eq(true)
  end

  it 'it is not valid without user_id ' do
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.create(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id)
    parking = Parking.new(check_in:Time.now, check_out:Time.now+(60*60*10), vehicle_id:vehicle.id).save
    expect(parking).to eq(false)
  end

  it 'it is not valid without vehicle_id ' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.create(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id, user_id: user.id)
    parking = Parking.new(check_in:Time.now, check_out:Time.now+(60*60*10), user_id:user.id).save
    expect(parking).to eq(false)
  end

end
