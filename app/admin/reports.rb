ActiveAdmin.register Report do
  permit_params :driver_name, :driver_license_nu, :driver_mobile_nu, :vehicle_type, :vehicle_registration_nu, :parking_charge, :parking_id
end
