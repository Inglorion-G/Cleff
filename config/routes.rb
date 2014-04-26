Rails.application.routes.draw do
 
  resources :users
  resource :session
  
  resources :bands do
    resources :albums, only: [:index, :new, :create, :destroy]
  end
  
  resources :albums, only: [:edit, :update, :show] do
    resources :tracks, only: [:index, :new, :create, :destroy]
  end
  
  resources :tracks, only: [:edit, :update, :show] do
    resources :notes, only: [:index, :new, :create, :destroy]
  end
  
  resources :notes, only: [:edit, :update, :show]
    
  root to: "bands#index"
 
end
