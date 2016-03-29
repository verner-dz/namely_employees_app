Rails.application.routes.draw do
  root to: 'pages#index'
  get '/namely/auth' => 'namely#auth'
  get '/namely/auth_callback' => 'namely#auth_callback'

  get '/auth/:provider/callback' => 'application#authentication_callback'


  resources :employees
end
