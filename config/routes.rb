Rails.application.routes.draw do
  resources :people
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :projects
  root 'root#index'
end
