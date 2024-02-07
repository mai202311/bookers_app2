Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users

  resources :books, only: [:new, :index,:show, :edit,:update,:destroy]
  resources :users, only: [:index,:show, :edit,:update]


  
  #get 'books' => 'books#index' , as: 'books'
  #get 'users' => 'users#index' , as: 'usesrs'
  post 'books' => 'books#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
