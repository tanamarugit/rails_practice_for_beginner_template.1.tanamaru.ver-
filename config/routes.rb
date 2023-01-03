Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :questions do
    resources :answers, only: [:create, :destory]
  end
  
  resources :users
  
end
