Rails.application.routes.draw do
  root 'tops#home'
  get 'home/about' =>'tops#about'
  devise_for :users, :controllers =>{
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions',
  	:passwords => 'users/passwords'
  }
  get "users/:id"=>"users#show",as: :mypage
  resources :users,only: [:edit,:index,:show,:update]
  resources :books,only: [:index,:show,:edit,:update,:create,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
