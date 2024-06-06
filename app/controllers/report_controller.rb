class ReportController < ApplicationController
    before_action :authenticate_request

    def show
        @reports = Report.joins(:parking).where(parkings: { user_id: current_user.id })
        render json: @reports, status: :ok
    end

    def create
        # @report = Report.new(report_params)
        parking = Parking.find(params[:parking_id])
        @report = Report.new(report_params)
        @report.set_details(parking)
        # debugger
        if @report.save
            # render json: @report, status: :ok
            redirect_to admin_reports_path
        else
            render json: { errors: @report.errors.full_messages }
        end
    end

    private

    def report_params
        params.permit(:parking_id)
    end

end
