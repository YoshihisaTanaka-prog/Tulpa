Rails.application.routes.draw do
  resources :images
  resources :diaries
  resources :user_info_details
  resources :user_infos
  resources :users
  resources :angles
  resources :tulpa_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "test", to: "apis#test"
  # Defines the root path route ("/")

  get "tulpa-main", to: "tulpas#main"
  root "tulpas#dummy"
end
