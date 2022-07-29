Rails.application.routes.draw do
  resources :diaries
  resources :user_info_details
  resources :user_infos
  resources :users
  resources :angles
  resources :tulpa_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "diaries#index"
end
