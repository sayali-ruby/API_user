Rails.application.routes.draw do
  root "users#home"
  get "about",to: "users#about"
  # resources :articles, only: [:show]
  # resources :users, only: [:create,:index,:show,:destroy,]
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

