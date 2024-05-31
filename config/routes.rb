Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :admin do
    get 'vehicles_for_user', to: 'custom#vehicles_for_user'
  end

  post 'auth/signup', to: 'authentication#signup'
  post 'auth/login', to: 'authentication#login'
  delete 'auth/logout', to: 'authentication#logout'
  resources :vehicles, only:[:show, :create, :update, :destroy]
end
