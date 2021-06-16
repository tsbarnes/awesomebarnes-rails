Rails.application.routes.draw do
  resources :projects
  root 'root#index'
end
