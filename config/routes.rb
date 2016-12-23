Rails.application.routes.draw do
  get 'users/:username', to: 'users#show', as: 'user' 
  resources :submissions
  resources :tweets
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
    as :user do
      get "sign_in", to: 'devise/sessions#new'
      delete "sign_out", to: 'devise/sessions#destroy'
      get "sign_up", to: 'devise/registrations#new'
    end
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact_us', to: 'pages#contact_us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
