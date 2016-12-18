Rails.application.routes.draw do
  resources :tweets
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
    as :user do
      get "sign_in" => 'devise/sessions#new'
      delete "sign_out" => 'devise/sessions#destroy'
      get "sign_up" => 'devise/registrations#new'
    end
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact_us' => 'pages#contact_us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
