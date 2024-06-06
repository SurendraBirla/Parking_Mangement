require 'rails_helper'

RSpec.describe User, type: :model do

  it 'is not valid without a name' do
    user = User.new(email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473').save
    expect(user).to eq(false)
  end

  it 'is not valid without an license_nu' do
    user = User.new(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd').save    
    expect(user).to eq(false)
  end

  it 'is not valid without an email ' do
    user = User.new(name:'user', password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473').save    
    expect(user).to eq(false)
  end

  it 'is not valid without a password' do 
    user = User.new(name:'user',email:"one@gmail.com",mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473').save    
    expect(user).to eq(false)
  end

  it 'is not valid without a mobile_nu' do
    user = User.new(name:'user',email:"one@gmail.com", password:'123456',address:'asdfsdbfvhbd',license_nu:'3473').save    
    expect(user).to eq(false)
  end

  it 'is not valid without a address' do
    user = User.new(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',license_nu:'3473').save    
    expect(user).to eq(false)
  end

  it 'is valid with valid attribute' do 
    user = User.new(name:'user',email:"one@gmail.com", password:'123456',mobile_nu:'9487583423',address:'asdfsdbfvhbd',license_nu:'3473').save    
    expect(user).to eq(true)
  end
  
end



