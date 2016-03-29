Rails.application.routes.draw do
  root to: 'pages#index'
  get '/namely/auth' => 'namely#auth'
  get '/namely/auth_callback' => 'namely#auth_callback'
  get '/employees/sort_employees' => 'employees#sort_employees'
  resources :employees
end
