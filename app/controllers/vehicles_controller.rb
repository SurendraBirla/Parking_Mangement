class VehiclesController < ApplicationController
    before_action :authenticate_request
    before_action :find_vehicle, except:[:create]

    def show 
        render json: { vehicle: VehicleSerializer.new(@vehicle)}, status: :ok
    end

    def create
        # debugger
        @vehicle = Vehicle.new(vehicle_params)
        @vehicle.user_id = current_user.id
        if @vehicle.save
            # render json: @vehicle, status: :created
            render json: { vehicle: VehicleSerializer.new(@vehicle)}, status: :created
        else
            render json: {errors: @vehicle.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update 
        # debugger
        if @vehicle.update(vehicle_params)
            render json: { vehicle: VehicleSerializer.new(@vehicle)}, status: :ok
        else
            render json: {errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        # debugger
        if @vehicle.destroy
            render json: { errors: "Vehicle has been successfully destroyed...!"}, status: :ok
        else
            render json: {errors: @vehicle.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def vehicle_params
        params.permit( :registration_num, :insurance, :vehicle_price_id)
    end

    def find_vehicle
        # debugger
        @vehicle = current_user.vehicles.find_by(id: params[:id])
        render json: { errors: 'Its not yours...' }, status: :not_found unless @vehicle
    end

end
