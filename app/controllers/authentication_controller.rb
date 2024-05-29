class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request, only: [:login, :signup]
  
    
    def signup
      @user = User.new(signup_params)
      if @user.save
        token = JsonWebToken.encode(user_id: @user.id)
        render json: { user: @user, token: token }, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
   
    def login
      @user = User.find_by(email: login_params[:email])
      if @user&.authenticate(login_params[:password])
        token = JsonWebToken.encode(user_id: @user.id)
        render json: { token: token }, status: :ok
      else
        render json: { errors: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def signup_params
      params.permit(:email, :password, :password_confirmation)
    end
  
    def login_params
      params.permit(:email, :password)
    end
  end
  