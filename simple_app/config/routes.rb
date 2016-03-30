Rails.application.routes.draw do
  root to: 'pages#index'
  get '/namely/auth' => 'pages#auth'
  get '/namely/auth_callback' => 'pages#auth_callback'
  get '/namely/employees' => 'pages#employees'
end
