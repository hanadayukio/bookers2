Rails.application.routes.draw do

  root to: "homes#top"
  get "homes/about" => "homes#about",as: "about"
  devise_for :users
  resources :books, only: [:new, :edit, :create, :index, :show, :destroy]
  resources :users, only: [:edit, :update, :index, :show, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
