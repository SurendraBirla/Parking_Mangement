require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'is not valid without a insurance' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.new(registration_num:'ABC-4857',vehicle_price_id:vehicle_price.id, user_id:user.id ).save
    expect(vehicle).to eq(false)
  end

  it 'is not valid without an registration_num' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.new(insurance:'3645',vehicle_price_id:vehicle_price.id, user_id:user.id ).save
    expect(vehicle).to eq(false)
  end

  it 'it is valid with all attributes ' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.new(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id, user_id: user.id).save
    expect(vehicle).to eq(true)
  end

  it 'is not valid without a user_id' do 
    vehicle_price = VehiclePrice.create(type_name:"car",price:20)
    vehicle = Vehicle.new(registration_num:'ABC-4857',insurance:'3645',vehicle_price_id:vehicle_price.id).save
    expect(vehicle).to eq(false)
  end

  it 'is not valid without a vehicle_price_id' do
    user = User.create(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473')
    vehicle = Vehicle.new(registration_num:'ABC-4857',insurance:'3645', user_id:user.id ).save
    expect(vehicle).to eq(false)
  end

 
end
