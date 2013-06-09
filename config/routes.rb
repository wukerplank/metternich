Metternich::Application.routes.draw do
  
  resources :users

  resources :hosts do
    resources :pings
    
    collection do
      post 'ping'
    end
  end
  
  match  '/auth/:provider/callback' => 'sessions#create',  via: [:get, :post]
  match  '/auth/failure'            => 'sessions#failure', via: [:get, :post]
  delete '/logout' => 'sessions#destroy'
  
  get '/welcome' => 'welcome#index', as: 'welcome'
  
  root 'hosts#index'
  
end
