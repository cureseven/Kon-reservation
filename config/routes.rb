Rails.application.routes.draw do
  resources :reserves
  resources :users

  get '/login_form', to: 'users#login_form'
  get '/login', to: 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

