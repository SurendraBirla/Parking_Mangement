ActiveAdmin.register Parking do
  permit_params :user_id, :vehicle_id, :check_in, :check_out, :status  

  index do
    selectable_column
    id_column
    column :user
    column :vehicle
    column :check_in
    column :check_out
    column "Report" do |parking|
      # byebug
      # link_to "GENERATE", report_create_path(parking), method: :post
      link_to "GENERATE", report_create_path(parking_id: parking.id), method: :post
    end
    actions
  end

  form do |f|
    f.inputs 'Parking Details' do
      f.input :user, as: :select, collection: User.all.collect { |user| [user.name, user.id] }, include_blank: true, input_html: { id: 'user_select' }
      f.input :vehicle, as: :select, collection: [], input_html: { id: 'vehicle_select' }
      f.input :check_out
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :vehicle
      row :check_in
      row :check_out
    end
    active_admin_comments
  end

  # controller do
  #   def vehicles_for_user
  #     user = User.find(params[:user_id])
  #     vehicles = user.vehicles.select(:id, :registration_num) 
  #     render json: vehicles.map { |vehicle| { id: vehicle.id, name: vehicle.registration_num } }
  #   end
  # end

end



