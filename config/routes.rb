Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :questions do
    member do
      post 'solve'
    end

    collection do
      get 'solved'
      get 'unsolved'
    end

    resources :answers, only: [:create, :destory]
  end
  
  resources :users
  
end
