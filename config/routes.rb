Rails.application.routes.draw do
  root 'tops#home'
  get 'home/about' =>'tops#about'
  devise_for :users, :controllers =>{
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions',
  	:passwords => 'users/passwords'
  }
  get "users/:id"=>"users#show",as: :mypage
  get "search" => "users#search"
  post "books/:id"=>"book_comments#create"
  resources :users,only: [:edit,:index,:show,:update] do
    member do
      get :following
      get :followers
    end
  end
  resources :relationships, only: [:create,:destroy]
  resources :books,only: [:index,:show,:edit,:update,:create,:destroy] do
    resources :book_comments,only: [:edit,:update,:destroy]
    resource :favorites,only: [:create,:destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
