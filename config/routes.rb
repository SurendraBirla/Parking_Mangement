Rails.application.routes.draw do
  post 'auth/signup', to: 'authentication#signup'
  post 'auth/login', to: 'authentication#login'
end
