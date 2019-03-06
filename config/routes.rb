Rails.application.routes.draw do

  devise_for :users
  
  resources :items, only: [:index, :show] do
  	resources :cartitems, only: [:create]
  end
  
  resources :carts, except: [:index, :new, :destroy] do
    resources :cartitems, only: [:destroy]
  end

  resources :orders do
    resources :charges, only: [:new, :create]
  end

	root "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
