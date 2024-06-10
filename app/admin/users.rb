ActiveAdmin.register User do
  permit_params :name, :mobile_nu, :address, :email, :password_digest, :license_nu  
end
