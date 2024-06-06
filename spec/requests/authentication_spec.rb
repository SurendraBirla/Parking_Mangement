require 'rails_helper'

RSpec.describe "Authentication", type: :request do

  describe "POST #signup" do
    it 'return a created user object' do
      post '/auth/signup', params: { name:'user',email:"one@gmail.com",password: 'password',password_confirmation: 'password',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473'}
      expect(response).to have_http_status(201)
    end

    it 'should not be return a user object' do
      post '/auth/signup', params: { name:'user',email:"one@gmail.com",password: 'password',password_confirmation: 'password',address:'asdfsdbfvhbd',license_nu:'3473'}
      expect(response).to have_http_status(422)
    end
  end

  describe "POST #login" do
    it 'return a login token' do 
      user = User.create(name:'user1',email:"one@gmail.com", password:'password',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473') 
      # debugger
      token = JsonWebToken.encode(user_id: user.id)
      post '/auth/login',headers: { "Authorization" => "Bearer #{token}" } ,params: {email: "one@gmail.com", password: "password"}
      expect(response).to have_http_status(200)
    end

    it 'should not be return a login token' do 
      post '/auth/login', params: {email: "abc@gmail.com", password: "password"}
      expect(response).to have_http_status(401)
    end

  end

end

