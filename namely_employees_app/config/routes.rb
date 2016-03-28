Rails.application.routes.draw do
  root :controller => 'home', :action => 'welcome'
  resources :employees
end
