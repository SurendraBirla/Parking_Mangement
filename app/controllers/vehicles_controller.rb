class VehiclesController < ApplicationController
    before_action :authenticate_request
    before_action :find_vehicle, except:[:create, :index]
    before_action :current_user

    def index
        # unless @vehicle = current_user.@vehicle
        #     render json: {errors: @vehicle.errors.full_messages }
        # end
    end

    def new 
    end

    def show 
        render json: @vehicle, status: :ok
    end

    def create
        # debugger
        @vehicle = Vehicle.new(vehicle_params)
        @vehicle.user_id = current_user.id
        if @vehicle.save
            render json: @vehicle, status: :ok
        else
            render json: {errors: @vehicle.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update 
        if @vehicle.update(vehicle_params)
            render json: @vehicle, status: :ok
        else
            render json: {errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        if @vehicle.destroy
            render json: { errors: "Vehicle has been successfully destroyed...!"}, status: :ok
        else
            render json: {errors: @vehicle.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def vehicle_params
        # debugger
        # params.require(:vehicle).permit(:type, :registration_num, :insurance, :user_id)
        params.permit( :registration_num, :insurance, :vehicle_price_id)
    end

    def find_vehicle
        @vehicle = Vehicle.find(params[:id])
    end


end
