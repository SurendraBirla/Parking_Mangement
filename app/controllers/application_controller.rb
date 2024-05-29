
class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_request
  
    attr_reader :current_user
  
    protected
  
    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      decoded = JsonWebToken.decode(header)
      @current_user = User.find(decoded[:user_id]) if decoded
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
end  