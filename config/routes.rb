Rails.application.routes.draw do
  
    root to: 'sessions#welcome'

    resources :users, only: [:new, :create, :homepage, :profile]

    
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
  
    get '/signup' => 'users#new' 
    post '/signup' => 'users#create'
   

    get '/biaslist', to: 'biaslists#mybias', as: "my_bias"

    match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]

   

    resources :groups, only: [:index, :show] 
   
    resources :kpopidols, only: [:index, :show] do
      resources :biaslists
    end

    
    
    

    
    




    
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
