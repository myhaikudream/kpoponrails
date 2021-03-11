Rails.application.routes.draw do
  
    root to: 'sessions#welcome'
  
    get '/auth/facebook/callback' => 'sessions#create'

    
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
  
    get '/signup' => 'users#new' 
    post '/signup' => 'users#create'
   

    resources :groups, only: [:index, :show]
    resources :kpopidols, only: [:index, :show]
    resources :biaslists
    resources :checkout_lists
    resources :users

    get '/kpopidols' => 'kpopidols#index'
    get '/kpopidols/:id' => 'kpopidols#show'
    

    get '/groups' => 'groups#index'
    get '/groups/:id' => 'groups#show'

    get '/biaslists' => 'biaslists#index'
    get '/kpopidols/:id/biaslists' => 'biaslists#new'
    post '/kpopidols/:kpopidol_id/biaslists' => 'biaslists#create'
    get '/kpopidols/:kpopidol_id/biaslists/:id' => 'biaslists#edit'
    patch '/kpopidols/:kpopidol_id/biaslists/:id' => 'biaslists#update'
    delete  '/kpopidols/:kpopidol_id/bialists/:id' => 'biaslists#destroy'

    get '/checkoutlists' => 'checkoutlists#index'
    get '/groups/:id/checkoutlists' => 'checkoutlists#new'
    post '/groups/:group_id/checkoutlists' => 'checkoutlists#create'
    get '/groups/:group_id/checkoutlists/:id' => 'checkoutlists#edit'
    patch '/groups/:group_id/checkoutlists/:id' => 'checkoutlists#update'
    delete  '/groups/:group_id/checkoutlists/:id' => 'checkoutlists#destroy'


    
    




    match '*path' => 'application_controller#fallback', via: [:all] 
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
