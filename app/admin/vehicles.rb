ActiveAdmin.register Vehicle do

  permit_params :name, :insurance, :license, :registration_num, :user_id
  
end
