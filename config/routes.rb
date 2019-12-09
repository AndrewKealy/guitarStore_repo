Rails.application.routes.draw do
  root 'static_pages#home'
  get 'cart/index'

  resources :items


  get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'
  
  get '/cart/:id', to: 'cart#add'
  
  get '/cart/remove/:id' => 'cart#remove'

  get 'cart/decrease/:id' => 'cart#decrease'
  
   

   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
