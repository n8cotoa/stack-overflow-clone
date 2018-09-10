Rails.application.routes.draw do

  resources :users, :except => [:new]
  get '/signup' => 'users#new'

  resources :sessions, :except => [:new, :create, :destroy]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
