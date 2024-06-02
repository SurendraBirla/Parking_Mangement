class ReportController < ApplicationController
    def show

    end

    def create
        
        # @report = Report.new(report_params)
        parking = Parking.find(params[:parking_id])
        @report = Report.new(report_params)
        @report.set_details(parking)
        # debugger
        if @report.save
            render json: @report, status: :ok
        else
            render json: { errors: @report.errors.full_messages }
        end
    end

    private

    def report_params
        # params.permit(:driver_name, :driver_license_nu, :driver_mobile_nu, :vehicle_type, 
        # :vehicle_registration_nu, :status, :parking_charge, :parking_id)
        params.permit(:parking_id)
    end

end
