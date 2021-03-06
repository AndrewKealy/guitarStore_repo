Rails.application.routes.draw do
  resources :comments
  root  'static_pages#home'
  resources :orders do 
    resources :orderitems
  end
  
  
  
  devise_for :users do
    resources :orders
  end  
  
  get 'checkout' => 'cart#createOrder'
  get 'empty' => 'cart#emptyCart'
  post '/search' => 'items#search'
  get 'cart/index'
  
  get '/paid/:id' => 'static_pages#paid'
  
  get '/paypalPayment/:id' => 'static_pages#paypalPayment'

  resources :items
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  
  get '/brands' => 'static_pages#brands'
  get '/categories' => 'static_pages#categories'
  get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'
  
  get '/cart/:id', to: 'cart#add' 
  
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  get 'items/brand/:brand' => 'items#brandResults'
    get 'items/categories/:category' => 'items#categoryResults'

  root :to => 'site#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
