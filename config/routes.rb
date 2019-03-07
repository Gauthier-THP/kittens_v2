Rails.application.routes.draw do

  devise_for :users
  
  resources :items, param: :title, only: [:index, :show, :new, :create] do
  	resources :cartitems, only: [:create]
  end
  
  resources :carts, except: [:index, :new, :destroy] do
    resources :cartitems, only: [:destroy]
  end

  resources :orders
  resources :users, only: [:show]
  resources :orders do
    resources :charges, only: [:new, :create], path_names: { new: 'payment', create: 'mypayment' }
  end

	root "items#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
