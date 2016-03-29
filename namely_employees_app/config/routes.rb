Rails.application.routes.draw do
  root to: 'pages#index'
  get '/namely/auth' => 'namely#auth'
  get '/namely/auth_callback' => 'namely#auth_callback'
  resources :employees
end
