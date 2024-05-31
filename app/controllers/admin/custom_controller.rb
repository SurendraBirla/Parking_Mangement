module Admin
    class CustomController < ApplicationController
    #   before_action :authenticate_user! # Ensure only authenticated users access this
  
      def vehicles_for_user
        # byebug
        user = User.find(params[:user_id])
        vehicles = user.vehicles.select(:id, :registration_num) # Adjust the attributes as necessary
        render json: vehicles.map { |vehicle| { id: vehicle.id, name: vehicle.registration_num } }
      end
    end
  end
  