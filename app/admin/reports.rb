ActiveAdmin.register Report do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :driver_name, :driver_license_nu, :driver_mobile_nu, :vehicle_type, :vehicle_registration_nu, :parking_charge, :parking_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:driver_name, :driver_license_nu, :driver_mobile_nu, :vehicle_type, :vehicle_registration_nu, :status, :parking_charge, :parking_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
