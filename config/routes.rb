Rails.application.routes.draw do
  
    root to: 'sessions#welcome'
  
    
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
  
    get '/signup' => 'users#new' 
    post '/signup' => 'users#create'
   

    resources :groups, only: [:index, :show] do
      resources :checkout_lists
    end

   
    resources :kpopidols, only: [:index, :show] do
      resources :biaslists
    end

    resources :biaslists
    resources :checkout_lists
    resources :users

    

    
    




    match '*path' => 'application_controller#fallback', via: [:all] 
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
