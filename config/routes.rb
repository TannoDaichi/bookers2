Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :new, :create]
  resources :books, only: [:index, :show, :edit, :update, :new, :create, :destroy]
root to: "homes#top"
get '/home/about' => 'homes#about',as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


  #resources :users, only: [:index, :show, :edit, :update]
  #resources :books, only: [:index, :show, :edit, :update, :new, :create]