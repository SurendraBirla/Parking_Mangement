require 'rails_helper'

RSpec.describe "Vehicles", type: :request do
  let(:user) { User.create(name: 'user1', email: 'one@gmail.com', password: 'password', mobile_nu: '3857234325', address: 'asdfsdbfvhbd', license_nu: '3473') }
  let(:vehicle_price) { VehiclePrice.create(type_name: "Car", price: "20") }
  let(:token) { JsonWebToken.encode(user_id: user.id) }
  let(:vehicle) { Vehicle.create(registration_num: 'ABC-3212', insurance: true, vehicle_price_id: vehicle_price.id, user: user) }


  before(:each) do
    post '/auth/login', headers: { "Authorization" => "Bearer #{token}" }, params: { email: "one@gmail.com", password: "password" }
  end

  describe "POST #create" do
    it "it should be create vehicle" do
      post '/vehicles', headers: { "Authorization" => "Bearer #{token}" }, params: { registration_num: 'ABC-3212', insurance: true, vehicle_price_id: vehicle_price.id }
      expect(response).to have_http_status(201)
    end

    it "it should not be create vehicle" do
      post '/vehicles',headers: { "Authorization" => "Bearer #{token}" }, params: { registration_num: 'ABC-3212', vehicle_price_id: vehicle_price.id }
      expect(response).to have_http_status(422)
    end

  end

  describe "PUT #update" do
    it 'it should be updates a vehicle' do
      regis_num = 'XYZ-0000'
      put "/vehicles/#{vehicle.id}", headers: { "Authorization" => "Bearer #{token}" }, params: { registration_num: regis_num }
      expect(JSON.parse(response.body)["registration_num"]).to eq(regis_num)
      expect(response).to have_http_status(200)
    end

    it 'it should be not updates a vehicle beacuse of parameter' do
      regis_num = ''
      put "/vehicles/#{vehicle.id}", headers: { "Authorization" => "Bearer #{token}" }, params: { registration_num: regis_num }
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE #destroy" do
    it 'it should be destroy a vehicle' do
      delete "/vehicles/#{vehicle.id}", headers: { "Authorization" => "Bearer #{token}" }
      expect(response).to have_http_status(200)
    end

    it 'it should not be destroy a vehicle because of id ' do
      delete "/vehicles", headers: { "Authorization" => "Bearer #{token}" }
      expect(response).to have_http_status(404)
    end
  end

end

