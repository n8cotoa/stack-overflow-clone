Rails.application.routes.draw do
  root :to => 'posts#index'

  resources :users, :except => [:new]
  get '/signup' => 'users#new'

  resources :sessions, :except => [:new, :create, :destroy]
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :posts do
    resources :responses, :only => [:new, :create, :update, :destroy]
  end

  resources :admin do
    put :toggle
  end

end
