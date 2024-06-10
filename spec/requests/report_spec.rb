require 'rails_helper'

RSpec.describe "Reports", type: :request do
    let(:user) { User.create(name: 'user1', email: 'one@gmail.com', password: 'password', mobile_nu: '3857234325', address: 'asdfsdbfvhbd', license_nu: '3473') }
    let(:vehicle_price) { VehiclePrice.create(type_name: "Car", price: "20") }
    let(:token) { JsonWebToken.encode(user_id: user.id) }
    let(:vehicle) { Vehicle.create(registration_num: 'ABC-3212', insurance: true, vehicle_price_id: vehicle_price.id, user: user) }
    let(:parking)  { Parking.create(check_in:Time.now, check_out:Time.now+(60*60*10), user_id:user.id, vehicle_id:vehicle.id)}

    before(:each) do
        post '/auth/login', headers: { "Authorization" => "Bearer #{token}" }, params: { email: "one@gmail.com", password: "password" }
    end

    describe "POST #create" do
    # debugger
      it "it should be create report" do
        post '/report/create', headers: { "Authorization" => "Bearer #{token}" }, params: { parking_id: parking.id }
        expect(response).to have_http_status(302)
      end
    end

    describe "GET #show" do
      let(:report) { Report.create(driver_name: user.name, driver_license_nu: user.license_nu, driver_mobile_nu: user.mobile_nu, vehicle_type: vehicle.vehicle_price.type_name,
      vehicle_registration_nu: vehicle.registration_num, parking_charge: vehicle.vehicle_price.price) }

      it "it should be return report" do
        get '/report/show', headers: { "Authorization" => "Bearer #{token}" }, params: {report_id: report.id }
        expect(response).to have_http_status(200)
      end
    end
end
