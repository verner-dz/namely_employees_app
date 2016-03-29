Rails.application.routes.draw do
  root to: 'pages#index'

  get '/auth/namely'
  get '/auth/:provider/callback' => 'application#authentication_callback'
  get '/auth/namely/callback' => 'pages#success'

  resources :employees
end
