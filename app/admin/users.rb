ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :mobile_nu, :address, :email, :password_digest, :license_nu
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :password_digest, :name, :mobile_nu, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
