Metternich::Application.routes.draw do
  
  resources :hosts do
    resources :pings
    
    collection do
      post 'ping'
    end
  end
  
  root 'hosts#index'
  
end
