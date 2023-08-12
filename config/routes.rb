Rails.application.routes.draw do
  
  get 'search', to: "weathers#search"

  get 'show', to: 'weathers#show'

  resources :users
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'


  resources :weathers do
    resource :averages, only: [:create, :destroy]
  end
end
