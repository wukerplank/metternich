Metternich::Application.routes.draw do
  
  resources :users

  resources :hosts do
    resources :pings
    
    collection do
      post 'ping'
    end
  end
  
  post   '/auth/:provider/callback' => 'sessions#create'
  post   '/auth/failure'            => 'sessions#oauth_failure'
  delete '/logout' => 'sessions#destroy'
  
  get '/welcome' => 'welcome#index', as: 'welcome'
  
  root 'hosts#index'
  
end
